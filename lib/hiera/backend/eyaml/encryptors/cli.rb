require 'Open3'

class Hiera
    module Backend
      module Eyaml
        module Encryptors
            class Cli < Encryptor
                self.tag = 'cli'

                self.options = {
                    encrypt_command: {
                        desc: 'Command to run to encrypt data (takes data on stdin)',
                        type: :string
                    },
                    decrypt_command: {
                        desc: 'Command to run to decrypt data (takes data on stdin)',
                        type: :string
                    }
                }

                          
                def self.encrypt_command
                    encrypt_command = option :encrypt_command
                    if encrypt_command.nil? || encrypt_command.empty?
                        raise ArgumentError, 'No encryption command configured!'
                    end
                    encrypt_command
                end

                def self.decrypt_command
                    decrypt_command = option :decrypt_command
                    if decrypt_command.nil? || decrypt_command.empty?
                        raise ArgumentError, 'No decryption command configured!'
                    end
                    decrypt_command
                end

                def self.encrypt(plaintext)
                    out, status = Open3.capture2(self.encrypt_command, :stdin_data=>plaintext)
                    if status != 0
                        raise 'Call to encrypt subcommand failed'
                    end
                    out
                end

                def self.decrypt(ciphertext)
                    out, status = Open3.capture2(self.decrypt_command, :stdin_data=>ciphertext)
                    if status != 0
                        raise 'Call to decrypt subcommand failed'
                    end
                    out
                end
                
                def self.create_keys
                    STDERR.puts 'This encryptor does not support creation of keys'
                end

            end
          end
        end
      end
    end