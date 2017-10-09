From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 2/3] dmaengine: Add driver for NVIDIA Tegra AHB DMA
 controller
Date: Mon, 9 Oct 2017 10:51:53 +0100
Message-ID: <dd49d752-039a-464d-1638-08323d637f5a@nvidia.com>
References: <cover.1507073384.git.digetx@gmail.com>
 <9ef93a0054a6a2e27b72e5bfeebe81e5ab11a224.1507073384.git.digetx@gmail.com>
 <58f8c049-4408-d6a7-7452-f5be8041b7b5@nvidia.com>
 <72374a74-f6bd-256f-73c0-fa970a2e1576@gmail.com>
 <d4885545-6af1-b240-a197-1ed530cc4172@nvidia.com>
 <fc684b85-b4a7-c68d-613c-adbe0b154c6c@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <fc684b85-b4a7-c68d-613c-adbe0b154c6c-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 06/10/17 18:23, Dmitry Osipenko wrote:
> On 06.10.2017 18:50, Jon Hunter wrote:
>> On 06/10/17 16:26, Dmitry Osipenko wrote:
>>> On 06.10.2017 16:11, Jon Hunter wrote:
>>>> On 04/10/17 00:58, Dmitry Osipenko wrote:

...

>>>>> +static struct dma_chan *tegra_ahbdma_of_xlate(struct of_phandle_args *dma_spec,
>>>>> +					      struct of_dma *ofdma)
>>>>> +{
>>>>> +	struct tegra_ahbdma *tdma = ofdma->of_dma_data;
>>>>> +	struct dma_chan *chan;
>>>>> +
>>>>> +	chan = dma_get_any_slave_channel(&tdma->dma_dev);
>>>>> +	if (!chan)
>>>>> +		return NULL;
>>>>> +
>>>>> +	to_ahbdma_chan(chan)->of_req_sel = dma_spec->args[0];
>>>>
>>>> Test for args[0] < TEGRA_AHBDMA_REQ_N_A?
>>>>
>>>
>>> It would duplicate slave_id checking done in tegra_ahbdma_config(), so not
>>> needed here.
>>
>> But surely we should not let them request a channel in the first place?
>>
> 
> If allowing client to disable flow control is okay, as you mentioned below, then
> I agree that it is fine. I'll make this change.
> 
>>>>> +	to_ahbdma_chan(chan)->of_slave = true;
>>>>
>>>> Is this really needed? Doesn't a value of 0..TEGRA_AHBDMA_REQ_N_A-1 tell
>>>> us it is valid?
>>>>
>>>
>>> I think we should enforce channels flow control in a case of OF xlate'd channel,
>>> no? To avoid abusing channels usage by client. Seems tegra_ahbdma_config isn't
>>> correct, should be:
>>
>> Absolutely. However, I don't see the need for the additional 'of_slave'
>> variable. If we validate the slave id here, we can get rid of the extra
>> variable. It does not simplify the code really by adding this IMO.
>>
> 
> 'of_slave' enforces flow control enable. If I understand you correctly, you are
> suggesting that it is okay to leave ability for clients to override flow
> control. Well, that's probably is fine indeed, just keep an eye on client drivers.
Nope :-)

I am simply saying that we do not need this 'of_slave' variable in
addition to the 'of_req_sel'. If we verify that 'args[0] <
TEGRA_AHBDMA_REQ_N_A' in this xlate function and set 'of_req_sel =
args[0]', then in tegra_ahbdma_config() we just have ...

	if (ahbdma_chan->of_req_sel || sconfig->device_fc) {
		if (ahbdma_chan->of_req_sel)
			slave_id = ahbdma_chan->of_req_sel;
		else if (sconfig->slave_id < TEGRA_AHBDMA_REQ_N_A)
			slave_id = sconfig->slave_id;
		else
			return -EINVAL;

		ahb_seq |= AHBDMA_CH_ADDR_WRAP;

		csr |= slave_id << AHBDMA_CH_REQ_SEL_SHIFT;
		csr |= AHBDMA_CH_FLOW;
	}

Cheers
Jon

-- 
nvpublic
