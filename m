From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 08/29] dt-bindings: interconnect: tegra: Add initial
 IDs
Date: Thu, 28 Nov 2019 23:06:05 +0300
Message-ID: <a3c16696-8ecf-ac7f-4f8a-2dd3221e5334@gmail.com>
References: <20191118200247.3567-1-digetx@gmail.com>
 <20191118200247.3567-9-digetx@gmail.com> <20191119062535.GC2462695@ulmo>
 <8cff3af3-42c7-3312-5f98-cd5eb98b7b7a@gmail.com>
 <f0f36176-8070-08a6-a61f-77221d916f04@gmail.com>
 <20191125113218.GK1409040@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191125113218.GK1409040@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

25.11.2019 14:32, Thierry Reding пишет:
> On Thu, Nov 21, 2019 at 08:14:35PM +0300, Dmitry Osipenko wrote:
>> 19.11.2019 19:56, Dmitry Osipenko пишет:
>>> 19.11.2019 09:25, Thierry Reding пишет:
>>>> On Mon, Nov 18, 2019 at 11:02:26PM +0300, Dmitry Osipenko wrote:
>>>>> Define interconnect IDs for memory controller (MC), external memory
>>>>> controller (EMC), external memory (EMEM) and memory clients of display
>>>>> controllers (DC).
>>>>>
>>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>>>> ---
>>>>>  include/dt-bindings/interconnect/tegra-icc.h | 11 +++++++++++
>>>>>  1 file changed, 11 insertions(+)
>>>>>  create mode 100644 include/dt-bindings/interconnect/tegra-icc.h
>>>
>>>
>>> Hello Thierry,
>>>
>>>> There was a bit of discussion regarding this for a recent patch that I
>>>> was working on, see:
>>>>
>>>> 	http://patchwork.ozlabs.org/project/linux-tegra/list/?series=140318
>>>
>>> Thank you very much for the link.
>>>
>>>> I'd rather not use an additional set of definitions for this. The memory
>>>> controller already has a set of native IDs for memory clients that I
>>>> think we can reuse for this.
>>>
>>> I missed that it's fine to have multiple ICC connections defined
>>> per-path, at quick glance looks like indeed it should be fine to re-use
>>> MC IDs.
>>
>> Well, it is not quite correct to have multiple connections per-path.
>>
>> Please take look at interconnect's binding and core.c:
>>
>>   1. there should be one src->dst connection per-path
>>   2. each connection should comprise of one source and one destination nodes
>>
>>>> I've only added these client IDs for Tegra194 because that's where we
>>>> need it to actually describe a specific hardware quirk, but I can come
>>>> up with the equivalent for older chips as well.
>>>
>>> Older Tegra SoCs have hardware units connected to MC through AHB bus,
>>> like USB for example. These units do not have MC client IDs and there is
>>> no MC ID defined for the AHB bus either, but probably it won't be a
>>> problem to define IDs for them if will be necessary.
>>>
>>
>> Since interconnect binding requires to define both source and
>> destination nodes for the path, then MC IDs are not enough in order to
>> define interconnect path because these IDs represent only the source
>> nodes. Destination node should be either EMC or EMEM.
> 
> This doesn't really map well to Tegra. The source of the path is always
> the device and the destination is always the memory controller. We also
> can have multiple paths between a device and the memory controller. The
> typical case is to have at least a read and a write path, but there are
> a number of devices that have multiple read and/or multiple write paths
> to the memory controller.
> 
> Or perhaps I'm looking at this the wrong way, and what we really ought
> to describe is the paths with MC sitting in the middle. So it'd be
> something like:
> 
> 	MC ID --- source ---> MC --- destination ---> EMC

Yes, this should be correct.

> for write paths and:
> 
> 	EMC --- source ---> MC --- destination ---> MC ID

Both write and read paths have the same direction in terms of
interconnect API. The source node requests bandwidth from the
destination node, where source is memory client and destination is EMC/EMEM.

> for read paths. I have no idea what would be a good connection ID for
> EMC, since I don't think MC really differentiates at that level. Perhaps
> #interconnect-cells = <0> for EMC would be appropriate.

It should be fine to define ICC ID for EMC that doesn't overlap with the
memory client IDs, say #1000.

> This would make the bindings look more like this, taking a random sample
> from the above series:
> 
> 	ethernet@2490000 {
> 		...
> 		interconnects = <&emc &mc TEGRA194_MEMORY_CLIENT_EQOSR>,
> 				<&mc TEGRA194_MEMORY_CLIENT_EQOSW &emc>;
> 		interconnect-names = "dma-mem", "dma-mem";
> 		...
> 	};
> 
> In words, the above would mean that for the ethernet device there is one
> path (a read slave interface) where data flows from the EMC through the
> MC to the device with memory client ID TEGRA194_MEMORY_CLIENT_EQOSR. The
> second path (a write slave interface) describes data flowing from the
> device (with memory client ID TEGRA194_MEMORY_CLIENT_EQOSW) through the
> MC and towards the EMC.
> 
> Irrespective of the above, I think we definitely need to keep separate
> IDs for read and write paths because each of them have separate controls
> for arbitration and latency allowance. So each of those may need to be
> separately configurable.
> 
> Does that make sense?

I'll try to update this series to use ICC-path per display plane and see
how it goes.

In general, looks like should be fine to have ICC paths defined per
memory client.
