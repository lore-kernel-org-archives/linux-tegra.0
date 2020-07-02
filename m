From: Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 28/37] memory: tegra: Register as interconnect provider
Date: Thu, 2 Jul 2020 15:36:07 +0300
Message-ID: <05cb459d-fc10-1537-eaea-df06f7566b6a@linaro.org>
References: <20200609131404.17523-1-digetx@gmail.com>
 <20200609131404.17523-29-digetx@gmail.com>
 <aec831a6-a7ad-6bcc-4e15-c44582f7568e@linaro.org>
 <82d27a47-f189-6609-a584-c9ca1b35a76c@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <82d27a47-f189-6609-a584-c9ca1b35a76c-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Dmitry,

On 7/2/20 02:36, Dmitry Osipenko wrote:
> 01.07.2020 20:12, Georgi Djakov пишет:
>> Hi Dmitry,
>>
>> Thank you for updating the patches!
> 
> Hello, Georgi!
> 
> Thank you for the review!
> 
>> On 6/9/20 16:13, Dmitry Osipenko wrote:
>>> Now memory controller is a memory interconnection provider. This allows us
>>> to use interconnect API in order to change memory configuration.
>>>
>>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> ---
>>>  drivers/memory/tegra/Kconfig |   1 +
>>>  drivers/memory/tegra/mc.c    | 114 +++++++++++++++++++++++++++++++++++
>>>  drivers/memory/tegra/mc.h    |   8 +++
>>>  include/soc/tegra/mc.h       |   3 +
>>>  4 files changed, 126 insertions(+)
>>>
>>> diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kconfig
>>> index 5bf75b316a2f..7055fdef2c32 100644
>>> --- a/drivers/memory/tegra/Kconfig
>>> +++ b/drivers/memory/tegra/Kconfig
>>> @@ -3,6 +3,7 @@ config TEGRA_MC
>>>  	bool "NVIDIA Tegra Memory Controller support"
>>>  	default y
>>>  	depends on ARCH_TEGRA
>>> +	select INTERCONNECT
>>>  	help
>>>  	  This driver supports the Memory Controller (MC) hardware found on
>>>  	  NVIDIA Tegra SoCs.
>>> diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
>>> index 772aa021b5f6..7ef7ac9e103e 100644
>>> --- a/drivers/memory/tegra/mc.c
>>> +++ b/drivers/memory/tegra/mc.c
>>> @@ -594,6 +594,118 @@ static __maybe_unused irqreturn_t tegra20_mc_irq(int irq, void *data)
>>>  	return IRQ_HANDLED;
>>>  }
>>>  
>>> +static int tegra_mc_icc_set(struct icc_node *src, struct icc_node *dst)
>>> +{
>>> +	return 0;
>>> +}
>>> +
>>> +static int tegra_mc_icc_aggregate(struct icc_node *node,
>>> +				  u32 tag, u32 avg_bw, u32 peak_bw,
>>> +				  u32 *agg_avg, u32 *agg_peak)
>>> +{
>>> +	*agg_avg = min((u64)avg_bw + (*agg_avg), (u64)U32_MAX);
>>> +	*agg_peak = max(*agg_peak, peak_bw);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +/*
>>> + * Memory Controller (MC) has few Memory Clients that are issuing memory
>>> + * bandwidth allocation requests to the MC interconnect provider. The MC
>>> + * provider aggregates the requests and then sends the aggregated request
>>> + * up to the External Memory Controller (EMC) interconnect provider which
>>> + * re-configures hardware interface to External Memory (EMEM) in accordance
>>> + * to the required bandwidth. Each MC interconnect node represents an
>>> + * individual Memory Client.
>>> + *
>>> + * Memory interconnect topology:
>>> + *
>>> + *               +----+
>>> + * +--------+    |    |
>>> + * | TEXSRD +--->+    |
>>> + * +--------+    |    |
>>> + *               |    |    +-----+    +------+
>>> + *    ...        | MC +--->+ EMC +--->+ EMEM |
>>> + *               |    |    +-----+    +------+
>>> + * +--------+    |    |
>>> + * | DISP.. +--->+    |
>>> + * +--------+    |    |
>>> + *               +----+
>>> + */
>>> +static int tegra_mc_interconnect_setup(struct tegra_mc *mc)
>>> +{
>>> +	struct icc_onecell_data *data;
>>> +	struct icc_node *node;
>>> +	unsigned int num_nodes;
>>> +	unsigned int i;
>>> +	int err;
>>> +
>>> +	/* older device-trees don't have interconnect properties */
>>> +	if (!of_find_property(mc->dev->of_node, "#interconnect-cells", NULL))
>>> +		return 0;
>>> +
>>> +	num_nodes = mc->soc->num_clients;
>>> +
>>> +	data = devm_kzalloc(mc->dev, struct_size(data, nodes, num_nodes),
>>> +			    GFP_KERNEL);
>>> +	if (!data)
>>> +		return -ENOMEM;
>>> +
>>> +	mc->provider.dev = mc->dev;
>>> +	mc->provider.set = tegra_mc_icc_set;
>>
>> Hmm, maybe the core should not require a set() implementation and we can
>> just make it optional instead. Then the dummy function would not be needed.
> 
> Eventually this dummy function might become populated with a memory
> latency allowness programming. I could add a comment into that function
> in the next version, saying that it's to-be-done for now.

Ah ok! Sounds good, thanks for clarifying!

>>> +	mc->provider.data = data;
>>> +	mc->provider.xlate = of_icc_xlate_onecell;
>>> +	mc->provider.aggregate = tegra_mc_icc_aggregate;
>>> +
>>> +	err = icc_provider_add(&mc->provider);
>>> +	if (err)
>>> +		goto err_msg;
>>
>> Nit: I am planning to re-organize some of the existing drivers to call
>> icc_provider_add() after the topology is populated. Could you please move
>> this after the nodes are created and linked.
> 
> Are you planning to remove the provider's list-head initialization from
> the icc_provider_add() [1] and move it to the individual provider
> drivers, correct?

Yes, that would be the first step, but i need to post some patches first,
so let's keep it as-is for now. Sorry for the confusion.

Thanks,
Georgi
