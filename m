From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] [RFC] dmaengine: add fifo_size member
Date: Thu, 6 Jun 2019 15:36:03 +0100
Message-ID: <e24a26d8-6355-bac0-eeba-8d8ce8d5f985@nvidia.com>
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
 <deae510a-f6ae-6a51-2875-a7463cac9169@gmail.com>
 <71795bb0-2b8f-2b58-281c-e7e15bca3164@gmail.com>
 <2eab4777-79b8-0aea-c22f-ac9d11284889@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2eab4777-79b8-0aea-c22f-ac9d11284889@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Sameer Pujar <spujar@nvidia.com>, Vinod Koul <vkoul@kernel.org>
Cc: dan.j.williams@intel.com, tiwai@suse.com, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, sharadg@nvidia.com, rlokhande@nvidia.com, dramesh@nvidia.com, mkumard@nvidia.com, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


On 06/06/2019 15:26, Jon Hunter wrote:

...

>>> If I understood everything correctly, the FIFO buffer is shared among
>>> all of the ADMA clients and hence it should be up to the ADMA driver to
>>> manage the quotas of the clients. So if there is only one client that
>>> uses ADMA at a time, then this client will get a whole FIFO buffer, but
>>> once another client starts to use ADMA, then the ADMA driver will have
>>> to reconfigure hardware to split the quotas.
>>>
>>
>> You could also simply hardcode the quotas per client in the ADMA driver
>> if the quotas are going to be static anyway.
> 
> Essentially this is what we have done so far, but Sameer is looking for
> a way to make this more programmable/flexible. We can always do that if
> there is no other option indeed. However, seems like a good time to see
> if there is a better way.

My thoughts on resolving this, in order of preference, would be ...

1. Add a new 'fifo_size' variable as Sameer is proposing.
2. Update the ADMA driver to use src/dst_maxburst as the fifo size and
   then have the ADMA driver set a suitable burst size for its burst
   size.
3. Resort to a static configuration.

I can see that #1 only makes sense if others would find it useful,
otherwise #2, may give us enough flexibility for now.

Cheers
Jon

-- 
nvpublic
