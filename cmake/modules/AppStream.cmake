#=======================================================================================================
# BSD 3-Clause License
#
# Copyright (c) 2023, Andrea Zanellato <redtid3@gmail.com>
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice, this
#    list of conditions and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright notice,
#    this list of conditions and the following disclaimer in the documentation
#    and/or other materials provided with the distribution.
#
# 3. Neither the name of the copyright holder nor the names of its
#    contributors may be used to endorse or promote products derived from
#    this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#=======================================================================================================
# AppStream.cmake
#
# Converts a domain string to a compatible AppStream ID
#
# E.G.: org.7-zip.7zip become org._7_zip._7zip
#
# See https://freedesktop.org/software/appstream/docs/chap-Metadata.html#tag-id-generic
#=======================================================================================================
macro(to_appstream_id INPUT OUTPUT)
    set(temp_ "${INPUT}")
    string(REPLACE "-" "_" temp_ ${temp_})
    string(REPLACE "." ";" temp_ ${temp_})
    foreach(section_ ${temp_})
        string(MAKE_C_IDENTIFIER "${section_}" parsed_section_)
        list(APPEND result_ "${parsed_section_}")
    endforeach()
    string(REPLACE ";" "." result_ "${result_}")
    set("${OUTPUT}" "${result_}")
    unset(temp_)
    unset(result_)
endmacro()
