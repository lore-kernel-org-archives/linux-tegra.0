From: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/6] usb: host: ehci-exynos: Use devm_ioremap_resource
 instead of devm_ioremap
Date: Sat, 10 May 2014 17:09:44 +0530
Message-ID: <CAFp+6iGZ6i6a95O4UhWRQc6QdknK4AgVOh+fSKdRZcAhmgn-Rw@mail.gmail.com>
References: <1399715823-19839-1-git-send-email-gautam.vivek@samsung.com>
	<1399715823-19839-2-git-send-email-gautam.vivek@samsung.com>
	<1399716396.580639659@f244.i.mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399716396.580639659-iE7NquU0hAtsdVUOrk1QfQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
Cc: "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "thierry.reding" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,


On Sat, May 10, 2014 at 3:36 PM, Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org> wr=
ote:
> Sat, 10 May 2014 15:26:58 +0530 =D0=BE=D1=82 Vivek Gautam <gautam.viv=
ek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>:
>> Using devm_ioremap_resource() API should actually be preferred over
>> devm_ioremap(), since the former request the mem region first and th=
en
>> gives back the ioremap'ed memory pointer.
>> devm_ioremap_resource() calls request_mem_region(), therby preventin=
g
>> other drivers to make any overlapping call to the same region.
>>
>> Signed-off-by: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> ---
>>  drivers/usb/host/ehci-exynos.c |    3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/usb/host/ehci-exynos.c b/drivers/usb/host/ehci-=
exynos.c
>> index 7f425ac..bccb6f1 100644
>> --- a/drivers/usb/host/ehci-exynos.c
>> +++ b/drivers/usb/host/ehci-exynos.c
>> @@ -135,9 +135,8 @@ skip_phy:
>>
>>       hcd->rsrc_start =3D res->start;
>>       hcd->rsrc_len =3D resource_size(res);
>> -     hcd->regs =3D devm_ioremap(&pdev->dev, res->start, hcd->rsrc_l=
en);
>> +     hcd->regs =3D devm_ioremap_resource(&pdev->dev, res);
>>       if (!hcd->regs) {
>> -             dev_err(&pdev->dev, "Failed to remap I/O memory\n");
>>               err =3D -ENOMEM;
>>               goto fail_io;
>>       }
>
> You should check this as:
>
> if (IS_ERR(hcd->regs)) {
> err =3D PTR_ERR(hcd->regs);
> ...

Thanks for pointing out. Will change this.

>
> Same in other patches in this series.
>
> ---
>



--=20
Best Regards
Vivek Gautam
Samsung R&D Institute, Bangalore
India
