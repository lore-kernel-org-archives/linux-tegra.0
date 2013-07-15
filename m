From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 0/3] usb: tegra: Replace nvidia,vbus-gpio property
 with vbus-supply
Date: Mon, 15 Jul 2013 14:57:57 +0300
Message-ID: <51E3E3C5.5060906@nvidia.com>
References: <1372422796-23524-1-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1372422796-23524-1-git-send-email-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hey Felipe/Stephen,

what's the status of this patchset and the other one
("usb: phy: tegra: Read UTMI parameters from device tree")?
Can I consider them accepted/pulled for 3.12?

Thanks, Mikko

On 06/28/2013 03:33 PM, Mikko Perttunen wrote:
> This patchset removes the ehci-tegra device tree property nvidia,vbus-gpio
> and adds support for the vbus-supply property to phy-tegra-usb.
>
> Mikko Perttunen (3):
>    usb: phy,host: tegra: Use regulators instead of GPIOs for USB PHY VBUS
>    Documentation: devicetree: phy-tegra-usb: Add vbus-supply property for
>      host mode PHYs
>    ARM: dts: tegra20: Remove obsolete nvidia,vbus-gpio properties
>
>   .../bindings/usb/nvidia,tegra20-usb-phy.txt        |  2 +-
>   arch/arm/boot/dts/tegra20-seaboard.dts             |  1 -
>   arch/arm/boot/dts/tegra20-trimslice.dts            |  1 -
>   arch/arm/boot/dts/tegra20-whistler.dts             |  2 --
>   drivers/usb/host/ehci-tegra.c                      | 34 +---------------------
>   drivers/usb/phy/phy-tegra-usb.c                    | 23 +++++++++++++++
>   include/linux/usb/tegra_usb_phy.h                  |  1 +
>   7 files changed, 26 insertions(+), 38 deletions(-)
>
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
