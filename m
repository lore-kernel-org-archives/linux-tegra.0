From: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 6/6] usb: host: ohci-exynos: Use devm_ioremap_resource
 instead of devm_ioremap
Date: Fri, 6 Jun 2014 18:32:42 +0530
Message-ID: <CAFp+6iEe8fvxboG79=2s=oe4BkQJYAoVUPtYkPdjJHCe+bC=8Q@mail.gmail.com>
References: <1399723210-21569-1-git-send-email-gautam.vivek@samsung.com>
	<1399723210-21569-7-git-send-email-gautam.vivek@samsung.com>
	<CAFp+6iFufCh6SVEF-HQA62ZsJGJGSebDSs28eqcrMy1X8e5vjA@mail.gmail.com>
	<20140604131306.GB28484@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140604131306.GB28484@ulmo>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,


On Wed, Jun 4, 2014 at 6:43 PM, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Wed, Jun 04, 2014 at 03:41:20PM +0530, Vivek Gautam wrote:
>> Hi,
>>
>>
>> On Sat, May 10, 2014 at 5:30 PM, Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>> > Using devm_ioremap_resource() API should actually be preferred over
>> > devm_ioremap(), since the former request the mem region first and then
>> > gives back the ioremap'ed memory pointer.
>> > devm_ioremap_resource() calls request_mem_region(), therby preventing
>> > other drivers to make any overlapping call to the same region.
>> >
>> > Signed-off-by: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>
>> Although this patch and rest in the series are merged.
>> But i have got a doubt, so making this thread alive.
>>
>> > ---
>> >  drivers/usb/host/ohci-exynos.c |    7 +++----
>> >  1 file changed, 3 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/drivers/usb/host/ohci-exynos.c b/drivers/usb/host/ohci-exynos.c
>> > index 9cf80cb..dec691d 100644
>> > --- a/drivers/usb/host/ohci-exynos.c
>> > +++ b/drivers/usb/host/ohci-exynos.c
>> > @@ -120,10 +120,9 @@ skip_phy:
>> >
>> >         hcd->rsrc_start = res->start;
>> >         hcd->rsrc_len = resource_size(res);
>> > -       hcd->regs = devm_ioremap(&pdev->dev, res->start, hcd->rsrc_len);
>> > -       if (!hcd->regs) {
>> > -               dev_err(&pdev->dev, "Failed to remap I/O memory\n");
>> > -               err = -ENOMEM;
>> > +       hcd->regs = devm_ioremap_resource(&pdev->dev, res);
>>
>> Here, we replaced devm_ioremap() call with devm_ioremap_resource(),
>> which internally requests the memory region
>
> I guess this could lead to problems if drivers haven't been written to
> cleanly split the register ranges that they access, since now two
> overlapping regions may be requested and cause the drivers to fail.

Sorry i did not understand completely. Wouldn't the request_mem_region()
fail for an already busy resource ?
So devm_ioremap_resource() will in fact prevent the drivers from requesting
the same memory region twice until the first request frees the region.
Isn't it ?

>
>> and then does a "devm_ioremap()" or "devm_ioremap_nocache()" based on
>> the check for IORESOURCE_CACHEABLE flag.
>>
>> But this flag is not set for the resource of this device.
>> So should we be explicitly setting the flag in driver ?
>
> I don't think it makes much sense to map these registers cached anyway.
> Drivers will likely expect writes to this region to take effect without
> needing any kind of flushing.

These "hcd->regs" are going to be used by the controller, so wouldn't there be a
a performance difference when the requested address space is
cacheable/non-cacheable ?




-- 
Best Regards
Vivek Gautam
Samsung R&D Institute, Bangalore
India
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
