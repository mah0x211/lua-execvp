--
-- Copyright (C) 2022 Masatoshi Fukunaga
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
--
--- @class exec.process
--- @field private ep exec.pid
--- @field private pid integer
--- @field private stdin file*
--- @field private stdout file*
--- @field private stderr file*
local Process = {}

--- init
--- @param ep exec.pid
--- @return exec.process
function Process:init(ep)
    self.ep = ep
    self.stdin = ep:stdin()
    self.stdout = ep:stdout()
    self.stderr = ep:stderr()
    self.pid = ep:getpid()
    return self
end

--- kill
--- @param sig number
--- @return boolean ok
--- @return any err
function Process:kill(sig)
    return self.ep:kill(sig)
end

--- waitpid
--- @param ... string
--- @return table|nil res
--- @return any err
--- @return boolean again
function Process:waitpid(...)
    return self.ep:waitpid(...)
end

Process = require('metamodule').new(Process)

return Process
