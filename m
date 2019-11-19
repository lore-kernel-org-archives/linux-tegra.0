From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 02/29] dt-bindings: memory: tegra20: emc: Document new
 interconnect property
Date: Tue, 19 Nov 2019 19:57:22 +0300
Message-ID: <bbe612b6-fc07-fb7f-0f13-bca2c0864d73@gmail.com>
References: <20191118200247.3567-1-digetx@gmail.com>
 <20191118200247.3567-3-digetx@gmail.com> <20191119062156.GB2462695@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191119062156.GB2462695@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

19.11.2019 09:21, Thierry Reding пишет:
> On Mon, Nov 18, 2019 at 11:02:20PM +0300, Dmitry Osipenko wrote:
>> External memory controller is interconnected with memory controller and
>> with external memory. Document new interconnect property which designates
>> external memory controller as interconnect provider.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  .../bindings/memory-controllers/nvidia,tegra20-emc.txt        | 4 ++++
>>  1 file changed, 4 insertions(+)
> 
> Do we really want to describe this particular connection? It's pretty
> static and the only real connection here is the EMC frequency, so the
> whole interconnect infrastructure seems a bit overkill.
> 
> Sounds to me like we could piggyback on top of the existing
> nvidia,memory-controller property of the EMC to make the connection.

Ultimately each memory client talks to EMEM through MC and EMC, although
it should be okay to ignore the EMEM from a driver's / software perspective.

[snip]
