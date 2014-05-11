From: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 5/6] usb: host: ehci-tegra: Use devm_ioremap_resource
 instead of devm_ioremap
Date: Sun, 11 May 2014 20:14:00 +0530
Message-ID: <CAFp+6iGSfhLB4J4Wr80WSih2bdzcO8vWhgZAonPv6SXbCp-Cmw@mail.gmail.com>
References: <1399715823-19839-1-git-send-email-gautam.vivek@samsung.com>
	<1399715823-19839-6-git-send-email-gautam.vivek@samsung.com>
	<536E814E.4020805@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <536E814E.4020805-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,


On Sun, May 11, 2014 at 1:13 AM, Sergei Shtylyov
<sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org> wrote:
> Hello.
>
>
> On 05/10/2014 01:57 PM, Vivek Gautam wrote:
>
>> Using devm_ioremap_resource() API should actually be preferred over
>> devm_ioremap(), since the former request the mem region first and then
>> gives back the ioremap'ed memory pointer.
>> devm_ioremap_resource() calls request_mem_region(), therby preventing
>> other drivers to make any overlapping call to the same region.
>
>
>> Signed-off-by: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> ---
>>   drivers/usb/host/ehci-tegra.c |    3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>
>
>> diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
>> index 572634c..ccc6433 100644
>> --- a/drivers/usb/host/ehci-tegra.c
>> +++ b/drivers/usb/host/ehci-tegra.c
>> @@ -411,9 +411,8 @@ static int tegra_ehci_probe(struct platform_device
>> *pdev)
>>         }
>>         hcd->rsrc_start = res->start;
>>         hcd->rsrc_len = resource_size(res);
>> -       hcd->regs = devm_ioremap(&pdev->dev, res->start,
>> resource_size(res));
>> +       hcd->regs = devm_ioremap_resource(&pdev->dev, res);
>>         if (!hcd->regs) {
>
>
>    This has to be changed as well as devm_ioremap_resource() returns error,
> not NULL.

Have already updated in the v2 version of this patch, and others in the series.

>
>
>> -               dev_err(&pdev->dev, "Failed to remap I/O memory\n");
>>                 err = -ENOMEM;
>
>
>    This needs to be changed as well, to pass up the error code
> devm_ioremap_resource() returned.

ditoo



-- 
Best Regards
Vivek Gautam
Samsung R&D Institute, Bangalore
India
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
