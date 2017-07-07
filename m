From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 3/9] usb: chipidea: Add support for Tegra20/30/114/124
Date: Fri, 7 Jul 2017 11:28:47 +0300
Message-ID: <9178cf9b-21c5-38b6-2545-912211c22ed2@gmail.com>
References: <cover.1499273075.git.digetx@gmail.com>
 <9e0127ea9b580e1af334c4c3bcb8b3c0705614ea.1499273075.git.digetx@gmail.com>
 <20170706012310.GC24420@b29397-desktop>
 <59e943b8-8771-0b1e-36fa-babd5e52a6d5@gmail.com>
 <20170707011040.GA21909@b29397-desktop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170707011040.GA21909@b29397-desktop>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Peter Chen <Peter.Chen-3arQi8VN3Tc@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07.07.2017 04:10, Peter Chen wrote:
> On Thu, Jul 06, 2017 at 01:09:32PM +0300, Dmitry Osipenko wrote:
>> On 06.07.2017 04:23, Peter Chen wrote:
>>> On Wed, Jul 05, 2017 at 08:19:52PM +0300, Dmitry Osipenko wrote:
>>>> +	/* setup and register ChipIdea HDRC device */
>>>> +	udc->data.name = "tegra-udc";
>>>> +	udc->data.capoffset = DEF_CAPOFFSET;
>>>> +	udc->data.flags = 0;
>>>> +	udc->data.usb_phy = udc->phy;
>>>> +
>>>> +	/* setup device specific quirks */
>>>> +	soc = id->data;
>>>> +
>>>> +	if (!soc->supports_unaligned_dma)
>>>> +		udc->data.flags |= CI_HDRC_REQUIRES_ALIGNED_DMA;
>>>> +
>>>> +	/* power on UDC controller */
>>>> +	usb_phy_set_suspend(udc->phy, 0);
>>>
>>> Why above is needed? The chipidea core will do usb_phy_init for power
>>> on.
>>>
>>
>> It is needed because Tegra's USB PHY driver doesn't hook up .init() of the
>> struct usb_phy and the power management is handled by set_suspend().
>>
> 
> Ok, please comment it since it is strange that initialize phy at
> .set_suspend API, after that, you can add my Ack for this patch.
> 

Alright, thank you for the review.

-- 
Dmitry
