From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH V1] dmaengine: tegra: add dma driver
Date: Wed, 25 Apr 2012 11:35:55 +0100
Message-ID: <20120425103555.GS24211@n2100.arm.linux.org.uk>
References: <1334912896-4614-1-git-send-email-ldewangan@nvidia.com> <1334920487.31825.98.camel@vkoul-udesk3> <4F9153AF.7020901@nvidia.com> <1335170491.31825.104.camel@vkoul-udesk3> <4F95483F.5020005@nvidia.com> <20120423130659.GA22186@n2100.arm.linux.org.uk> <4F95567E.3090605@nvidia.com> <4F97BD67.1050300@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F97BD67.1050300-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Vinod Koul <vinod.koul-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Apr 25, 2012 at 02:31:27PM +0530, Laxman Dewangan wrote:
> Hi Vinod,
>
> On Monday 23 April 2012 06:47 PM, Laxman Dewangan wrote:
>> On Monday 23 April 2012 06:36 PM, Russell King - ARM Linux wrote:
>>> On Mon, Apr 23, 2012 at 05:47:03PM +0530, Laxman Dewangan wrote:
>>>> Hi Russell,
>>>> On Monday 23 April 2012 02:11 PM, Vinod Koul wrote:
>>>>> On Fri, 2012-04-20 at 17:46 +0530, Laxman Dewangan wrote:
>>>>>> Thanks Vinod for quick review.
>>>>> Since I was on vacation, I hadn't noticed Russell has already sent the
>>>>> patches for omap dma support.
>>>>> http://permalink.gmane.org/gmane.linux.ports.arm.omap/75034
>>>>>
>>>>> It would be nice if both the efforts are coordinated.
>>>>>
>>>>> Btw I like the virtual channel support introduced by Russell
>>>>>
>>>> Can you please point me the virtual channel related change? I am not
>>>> able to locate this like search for function vchan_* ().
>>>> My driver is also on same line but not used vchan_* and also having
>>>> support for cyclic transfer.
>>> It's only been posted in RFC form on linux-arm-kernel and linux-omap
>>> lists.  The specific patch is:
>>>
>>> http://lists.arm.linux.org.uk/lurker/message/20120418.101116.082b350f.en.html
>>>
>>> I wouldn't call it perfected yet, but usable.  It doesn't have any
>>> knowledge about cyclic transfers either.
>> For simple dma, it is straight to use the virt_chan and it reduce lots
>> of code from tegra_dma as most of it moved to the virt_dma.
>>
>> Some points which I am looking are:
>> 1. Extending this for cyclic support:
>> In cyclic mode, we need to call callback after period_len but do not
>> want to free descriptors. So either I need to add flag on the desctiptor
>> to no delet and so when vc->desc_free(vd); is called from callback, it
>> will not delete the descriptor.
>>
>> 2. With very prep call, we are allocating descriptor. Is it is possible
>> to allocate some desc in advance and then keep using them. The
>> complexity is that if we allocate the desc in advance, we need to
>> allocate the desc and sq_req list and maintain the two different lists
>> as we dont know the sg_len in advance.
>>
>> 3. vchan_cookie_complete()  is not possible in the cyclic mode as we
>> dont want to call dma_cookie_complete() but just want to do following
>> two thing:
>>
>> list_add_tail(&vd->node,&vc->desc_completed);
>> tasklet_schedule(&vc->task);
>>
>> if we extend this function to bypass dma_cookie_complete(&vd->tx); or
>> rather than calling this api, directly call the above apis.
>>
>
>
> I had a  communication with Russell on another change thread and  
> understand that some more work need to be done in virt_chan to support  
> cyclic one.

Yes, and I said I would get to it in due course - I need to add support
so that the OMAP ASoC support can be moved over to DMA engine, and that's
one of the next few drivers I will be looking at.
