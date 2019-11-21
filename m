From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 12/29] interconnect: Add memory interconnection
 providers for NVIDIA Tegra SoCs
Date: Thu, 21 Nov 2019 20:33:58 +0300
Message-ID: <a9bbe36e-8082-8cab-7377-f71f2489fb30@gmail.com>
References: <20191118200247.3567-1-digetx@gmail.com>
 <20191118200247.3567-13-digetx@gmail.com> <20191119063002.GE2462695@ulmo>
 <a16b54bf-a881-84d0-4437-993dc275487c@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a16b54bf-a881-84d0-4437-993dc275487c@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

19.11.2019 19:58, Dmitry Osipenko пишет:
> 19.11.2019 09:30, Thierry Reding пишет:
>> On Mon, Nov 18, 2019 at 11:02:30PM +0300, Dmitry Osipenko wrote:
>>> All NVIDIA Tegra SoCs have identical topology in regards to memory
>>> interconnection between memory clients and memory controllers.
>>> The memory controller (MC) and external memory controller (EMC) are
>>> providing memory clients with required memory bandwidth. The memory
>>> controller performs arbitration between memory clients, while the
>>> external memory controller transfers data from/to DRAM and pipes that
>>> data from/to memory controller. Memory controller interconnect provider
>>> aggregates bandwidth requests from memory clients and sends the aggregated
>>> request to EMC provider that scales DRAM frequency in order to satisfy the
>>> bandwidth requirement. Memory controller provider could adjust hardware
>>> configuration for a more optimal arbitration depending on bandwidth
>>> requirements from memory clients, but this is unimplemented for now.
>>>
>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>> ---
>>>  drivers/interconnect/Kconfig               |   1 +
>>>  drivers/interconnect/Makefile              |   1 +
>>>  drivers/interconnect/tegra/Kconfig         |   6 +
>>>  drivers/interconnect/tegra/Makefile        |   4 +
>>>  drivers/interconnect/tegra/tegra-icc-emc.c | 138 +++++++++++++++++++++
>>>  drivers/interconnect/tegra/tegra-icc-mc.c  | 130 +++++++++++++++++++
>>>  include/soc/tegra/mc.h                     |  26 ++++
>>>  7 files changed, 306 insertions(+)
>>>  create mode 100644 drivers/interconnect/tegra/Kconfig
>>>  create mode 100644 drivers/interconnect/tegra/Makefile
>>>  create mode 100644 drivers/interconnect/tegra/tegra-icc-emc.c
>>>  create mode 100644 drivers/interconnect/tegra/tegra-icc-mc.c
>>
>> Why does this have to be separate from the memory controller driver in
>> drivers/memory/tegra? It seems like this requires a bunch of boilerplate
>> just so that this code can live in the drivers/interconnect directory.
> 
> It fits with the IOMMU separation. To me that it's a bit nicer to have
> the separation for the ICC as well, but having ICC within memory
> controller driver also will be fine.
> 
> Indeed it looks like there is not much in the MC's provider code right
> now, but maybe more stuff will be added later on.
> 
>> If Georgi doesn't insist, I'd prefer if we carried this code directly in
>> the drivers/memory/tegra directory so that we don't have so many
>> indirections.
>>
>> Also, and I already briefly mentioned this in another reply, I think we
>> don't need two providers here. The only one we're really interested in
>> is the memory-client to memory-controller paths. The MC to EMC path is
>> static.
> 
> Perhaps it is fine to drop EMC path, I'll revisit it.
> 
> [snip]

One advantage of having both MC and EMC as ICC providers is that there
won't be a need to mess with a custom coupling of MC-EMC drivers
together because interconnect API naturally takes care of the coupling
for us by telling ICC users to defer until both providers are registered.

I'll take another look at this over the weekend, but for now my v1
variant looks appropriate in terms of a better hardware description and
implementation in the code.
