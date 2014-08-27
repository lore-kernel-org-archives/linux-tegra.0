From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 2/9] mailbox: Add NVIDIA Tegra XUSB mailbox driver
Date: Wed, 27 Aug 2014 11:13:47 -0700
Message-ID: <CAL1qeaGPr=BeYL1-=ddRL7rSuvYdQcd6vCEEHDrNA-KYst6bnw@mail.gmail.com>
References: <1408381705-3623-1-git-send-email-abrestic@chromium.org>
	<1408381705-3623-3-git-send-email-abrestic@chromium.org>
	<53FB8820.4010202@wwwdotorg.org>
	<CAL1qeaERHeKKNpqh9qHOppgT7ymvntisdjVvZheP78U6NaPz-A@mail.gmail.com>
	<53FE1A7A.4010906@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53FE1A7A.4010906-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TbrhsbdSgBK9A@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Aug 27, 2014 at 10:50 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 08/27/2014 11:38 AM, Andrew Bresticker wrote:
>>
>> On Mon, Aug 25, 2014 at 12:01 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
>> wrote:
>>>
>>> On 08/18/2014 11:08 AM, Andrew Bresticker wrote:
>>>>
>>>> +static int tegra_xusb_mbox_probe(struct platform_device *pdev)
>>>
>>>
>>>
>>>> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>>>
>>>> +       if (!res)
>>>> +               return -ENODEV;
>>>
>>>
>>>
>>> Should devm_request_mem_region() be called here to claim the region?
>>
>>
>> No, the xHCI host driver also needs to map these registers, so they
>> cannot be mapped exclusively here.
>
>
> That's unfortunate. Having multiple drivers with overlapping register
> regions is not a good idea. Can we instead have a top-level driver map all
> the IO regions, then instantiate the various different sub-components
> internally, and divide up the address space. Probably via MFD or similar.
> That would prevent multiple drivers from touching the same register region.

Perhaps I'm misunderstanding, but I don't see how MFD would prevent us
from having to map this register space in two different locations -
the XUSB FPCI address space cannot be divided cleanly between host and
mailbox registers.  Or are you saying that there should be a separate
device driver that exposes an API for accessing this register space,
like the Tegra fuse or PMC drivers?
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
