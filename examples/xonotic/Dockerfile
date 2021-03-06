# Copyright 2017 Google Inc. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM debian:stretch

RUN apt-get update && apt-get install -y unzip curl wget net-tools vim
RUN useradd -m xonotic

WORKDIR /home/xonotic
RUN wget https://github.com/GoogleCloudPlatform/agones/releases/download/v0.4.0/agonessdk-server-0.4.0.zip && \
	unzip agonessdk-server-0.4.0.zip && rm -f agonessdk-server-0.4.0.zip sdk-server.darwin.amd64 sdk-server.windows.amd64.exe
RUN curl -o xonotic.zip http://dl.xonotic.org/xonotic-0.8.2.zip && \
    unzip xonotic.zip && rm xonotic.zip

#
# To learn about setting up a Xonotic dedicated server, read the `readme.txt` in the
# `server` directory after downloading the archive from xonotic.org
#

RUN mkdir -p ./.xonotic/data && mv /home/xonotic/Xonotic/server/server_linux.sh /home/xonotic/Xonotic/
COPY ./bin/wrapper .
COPY startup.sh .
RUN chown -R xonotic:xonotic . && chmod +x startup.sh
COPY server.cfg ./.xonotic/data
RUN chown -R xonotic:xonotic . && chmod +x wrapper

USER xonotic
ENTRYPOINT /home/xonotic/startup.sh
