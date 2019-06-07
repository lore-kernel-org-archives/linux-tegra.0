From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH] [RFC] dmaengine: add fifo_size member
Date: Fri, 7 Jun 2019 15:17:01 +0300
Message-ID: <e67a2d7c-5bd1-93ad-fe75-afcab38bc17c@ti.com>
References: <1556623828-21577-1-git-send-email-spujar@nvidia.com>
 <20190502060446.GI3845@vkoul-mobl.Dlink>
 <e852d576-9cc2-ed42-1a1a-d696112c88bf@nvidia.com>
 <20190502122506.GP3845@vkoul-mobl.Dlink>
 <3368d1e1-0d7f-f602-5b96-a978fcf4d91b@nvidia.com>
 <20190504102304.GZ3845@vkoul-mobl.Dlink>
 <ce0e9c0b-b909-54ae-9086-a1f0f6be903c@nvidia.com>
 <20190506155046.GH3845@vkoul-mobl.Dlink>
 <b7e28e73-7214-f1dc-866f-102410c88323@nvidia.com>
 <ed95f03a-bbe7-ad62-f2e1-9bfe22ec733a@ti.com>
 <4cab47d0-41c3-5a87-48e1-d7f085c2e091@nvidia.com>
 <8a5b84db-c00b-fff4-543f-69d90c245660@nvidia.com>
 <3f836a10-eaf3-f59b-7170-6fe937cf2e43@ti.com>
 <a36302fc-3173-070b-5c97-7d2c55d5e2cc@nvidia.com>
 <a08bec36-b375-6520-eff4-3d847ddfe07d@ti.com>
 <4593f37c-5e89-8559-4e80-99dbfe4235de@nvidia.com>
 <d0db90e3-3d05-dfba-8768-28511d9ee3ac@ti.com>
 <5208a50a-9ca0-8f24-9ad0-d7503ec53f1c@nvidia.com>
 <ba845a19-5dfb-a891-719f-43821b2dd412@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ba845a19-5dfb-a891-719f-43821b2dd412@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Sameer Pujar <spujar@nvidia.com>, Vinod Koul <vkoul@kernel.org>
Cc: dan.j.williams@intel.com, tiwai@suse.com, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, sharadg@nvidia.com, rlokhande@nvidia.com, dramesh@nvidia.com, mkumard@nvidia.com, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org



On 07/06/2019 13.27, Jon Hunter wrote:
>>> Hrm, it is still not clear how all of these fits together.
>>>
>>> What happens if you configure ADMA side:
>>> BURST = 10
>>> TX/RXSIZE = 100 (100 * 64 bytes?) /* FIFO_SIZE? */
>>> *THRES = 5
>>>
>>> And if you change the *THRES to 10?
>>> And if you change the TX/RXSIZE to 50 (50 * 64 bytes?)
>>> And if you change the BURST to 5?
>>>
>>> In other words what is the relation between all of these?
>>
>> So the THRES values are only applicable when the FETCHING_POLICY (bit 31
>> of the CH_FIFO_CTRL) is set. The FETCHING_POLICY bit defines two modes;
>> a threshold based transfer mode or a burst based transfer mode. The
>> burst mode transfer data as and when there is room for a burst in the FIFO.
>>
>> We use the burst mode and so we really should not be setting the THRES
>> fields as they are not applicable. Oh well something else to correct,
>> but this is side issue.
>>
>>> There must be a rule and constraints around these and if we do really
>>> need a new parameter for ADMA's FIFO_SIZE I'd like it to be defined in a
>>> generic way so others could benefit without 'misusing' a fifo_size
>>> parameter for similar, but not quite fifo_size information.
>>
>> Yes I see what you are saying. One option would be to define both a
>> src/dst_maxburst and src/dst_minburst size. Then we could use max for
>> the FIFO size and min for the actual burst size.
> 
> Actually, we don't even need to do that. We only use src_maxburst for
> DEV_TO_MEM and dst_maxburst for MEM_TO_DEV. I don't see any reason why
> we could not use both the src_maxburst for dst_maxburst for both
> DEV_TO_MEM and MEM_TO_DEV, where one represents the FIFO size and one
> represents that DMA burst size.
> 
> Sorry should have thought of that before. Any objections to using these
> this way? Obviously we would document is clearly in the driver.

Imho if you can explain it without using 'HACK' in the sentences it
might be OK, but it does not feel right.

However since your ADMA and ADMIF is highly coupled and it does needs
special maxburst information (burst and allocated FIFO depth) I would
rather use src_maxburst/dst_maxburst alone for DEV_TO_MEM/MEM_TO_DEV:

ADMA_BURST_SIZE(maxburst)	((maxburst) & 0xff)
ADMA_FIFO_SIZE(maxburst)	(((maxburst) >> 8) & 0xffffff)

So lower 1 byte is the burst value you want from ADMA
the other 3 bytes are the allocated FIFO size for the given ADMAIF channel.

Sure, you need a header for this to make sure there is no
misunderstanding between the two sides.

Or pass the allocated FIFO size via maxburst and then the ADMA driver
will pick a 'good/safe' burst value for it.

Or new member, but do you need two of them for src/dst? Probably
fifo_depth is better word for it, or allocated_fifo_depth.

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
