From: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] USB: host: tegra: CONFIG_USB_EHCI_TEGRA requires ULPI
 and ULPI viewport support
Date: Fri, 4 Oct 2013 12:30:45 -0700
Message-ID: <524F1765.3070206@nvidia.com>
References: <alpine.DEB.2.02.1310032300110.32666@tamien> <524EE6F5.9020109@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <524EE6F5.9020109-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/04/2013 09:04 AM, Stephen Warren wrote:
> On 10/04/2013 12:02 AM, Paul Walmsley wrote:
>> Selecting CONFIG_USB_EHCI_TEGRA requires CONFIG_USB_ULPI_VIEWPORT.
>> Otherwise the build can break with:
>>
>> drivers/usb/phy/phy-tegra-usb.c: In function 'ulpi_open':
>> drivers/usb/phy/phy-tegra-usb.c:689:31: error:
>> 'ulpi_viewport_access_ops' undeclared (first use in this function)
>> drivers/usb/phy/phy-tegra-usb.c:689:31: note: each undeclared identifier
>> is reported only once for each function it appears in
>>
>> if CONFIG_USB_ULPI_VIEWPORT is not manually selected.
>>
>> Fix by forcing CONFIG_USB_ULPI_VIEWPORT to be selected when
>> CONFIG_USB_EHCI_TEGRA is selected.  Then, since CONFIG_USB_ULPI_VIEWPORT
>> requires CONFIG_USB_ULPI to be selected, add that too.
>>
>> N.B.: ULPI is deprecated on this controller for T114, so it might make
>> sense to split the ULPI support code into a separate file, compiled only
>> if a ULPI PHY is selected.
> This was fixed at least in 3.13 (perhaps 3.12 too?) by:
>
> config ARCH_TEGRA
> ...
>          select USB_ARCH_HAS_EHCI if USB_SUPPORT
>          select USB_ULPI if USB_PHY
>          select USB_ULPI_VIEWPORT if USB_PHY
>
> I think it'd be better to back-port that patch to stable, for consistency.

Yep agreed.  Want to cc that patch to linux-stable instead?  The v3.13.x 
-stable builds are breaking here for T114-only Kconfigs...



- Paul
