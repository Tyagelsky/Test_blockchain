module Blockchain
  def genezis_block(name)
    genezis = { index: 0,
                prev_hash: 0,
                timestamp: Time.now,
                data: { user: 'MobiDev', value: 'Rocks!'}}
    genezis[:hash] = calc_hash(genezis[:index],
                               genezis[:prev_hash],
                               genezis[:data][:user],
                               genezis[:data][:value],
                               genezis[:timestamp])
    push_to_file(name, genezis)
  end

  def calc_hash(index, prev_hash, user, value, timestamp)
    hash = Digest::SHA256.hexdigest("#{index}#{prev_hash}#{user}#{value}#{timestamp}")
  end

  def make_block(user, value, name)
    blockchain_data = parse_from_file(name)
    block = { index: blockchain_data.size,
              prev_hash: blockchain_data.last['hash'],
              timestamp: Time.now,
              data: { user: user, value: value } }
    block[:hash] = calc_hash(block[:index],
                             block[:prev_hash],
                             block[:data][:user],
                             block[:data][:value],
                             block[:timestamp])
    block
  end

  def print_blocks(name)
     data = parse_from_file(name)
     puts JSON.pretty_generate(data).green
  end

  def validate_blockchain(name)
    blocks = parse_from_file(name)
    if blocks.each_cons(2).all? { |a, b| a['hash'] == b['prev_hash'] }
      puts "The blockchain is valid!".green
    else
      blocks.select do |block|
        if block['hash'] != calc_hash(block['index'],
                                      block['prev_hash'],
                                      block['data']['user'],
                                      block['data']['value'],
                                      block['timestamp'])
          puts " Invalid block with id: #{block['index']}".red
        end
      end
    end
  end

  def parse_from_file(name)
    unless File.exist?(name)
      f = File.open(name, 'a+')
      f.write([].to_json)
      f.close
    end

    data = File.open(name, 'a+').read
    json_data = JSON.parse(data)
  end

  def push_to_file(name, data)
    unless File.exist?(name)
      f = File.open(name, 'a+')
      f.write([].to_json)
      f.close
    end
    old_data = File.open(name, 'a+').read
    old_json_data = JSON.parse(old_data)
    new_json_data = (old_json_data << data).to_json

    File.open(name, 'w') do |f|
      f.write(new_json_data)
    end
  end
end
