module NMax
    class Scanner
        def initialize(io, content_regexp = /\d/, block_size=16384)
            @io = io
            @content_regexp = content_regexp
            @block_size = block_size
            @buffer = ''
            @eof = false
        end

        def scan
            return false if @eof
            @buffer = ''
            begin
                while (line = @io.readpartial(@block_size))
                    last_digit = line.rindex(@content_regexp)
                    next if last_digit.nil? && @buffer.empty?

                    if last_digit == line.length - 1 || line.length < @block_size
                        @buffer.concat(line) && next
                    end

                    if last_digit.nil?
                        last_digit = 0
                    else
                        last_digit += 1
                    end

                    @buffer.concat(line[0...last_digit])
                    return true
                end
            rescue EOFError
                @eof = true
            end
            
            return true
        end

        def text
            @buffer
        end
    end
end