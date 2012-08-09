From: "Arend van Spriel" <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: How to get the irq flags from the dts file
Date: Thu, 9 Aug 2012 14:09:51 +0200
Message-ID: <5023A88F.8040402@broadcom.com>
References: <1344509006.2295.148.camel@tegra-chromium-2>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1344509006.2295.148.camel@tegra-chromium-2>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, frankyl-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, brcm80211-dev-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/09/2012 12:43 PM, Wei Ni wrote:
> Hi, all
> I'm working on tegra wlan upstream issue.
> The tegra board use the Broadcom 4329 as wlan device, and the driver is
> the brcmfmac. 
> 
> This wlan driver support out-band-interrupt (OOB), I want to add DT
> support to use this OOB.
> I can add following lines in the dts file to create platform device and
> pass the interrupt resource to the driver.
> 
> wlan {
>         compatible = "broadcome, brcmf_sdio_pd";

I don't know the DT syntax, but I assume broadcome should be broadcom,
right? ;-)

>         interrupt-parten = <&gpio>;
>         interrupts = <144, 0x04>; /* IRQF_TRIGGER_HIGH */
> };
> 
> In the wlan driver, it will use platform_get_resource() to get the
> res->irq, res->flags, the irq number is right, but the flags will be
> IORESOURCE_IRQ, not the 0x04 (IRQF_TRIGGER_HIGH).
> The wlan driver wish this flags include the IRQF_TRGGER_* information,
> and it will use this flags to configure other hw settings. If it is
> wrong, the wlan can't work.
> 
> I checked drivers/of/irq.c, in function of_irq_to_resource(), it will
> set r->flags = IORESOURCE_IRQ directly, not read the flags from the dtb
> file. And I didn't find any of_xx api to get this flags.
> 
> How can I get this flags, does anyone has suggestion?

I did a quick search in the kernel and there are a number of platform
drivers that seem to expect the IRQF_TRIGGER_* info by using (res->flags
& IRQF_TRIGGER_MASK) and to determine IRQF_SHARED as well.

Gr. AvS
