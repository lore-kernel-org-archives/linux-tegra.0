From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: USB-related build errors on Tegra in next-20130319
Date: Wed, 20 Mar 2013 10:39:11 -0600
Message-ID: <5149E62F.9090705@wwwdotorg.org>
References: <51489251.5040504@wwwdotorg.org> <20130320122031.GI29659@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130320122031.GI29659-S8G//mZuvNWo5Im9Ml3/Zg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org, Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/20/2013 06:20 AM, Felipe Balbi wrote:
> Hi,
> 
> On Tue, Mar 19, 2013 at 10:29:05AM -0600, Stephen Warren wrote:
>> I see the following Kconfig warnings in next-20130319:
>> 
>>> warning: (ARCH_TEGRA_2x_SOC && ARCH_TEGRA_3x_SOC) selects
>>> USB_ULPI which has unmet direct dependencies (USB_SUPPORT &&
>>> USB_PHY && ARM) warning: (ARCH_TEGRA_2x_SOC &&
>>> ARCH_TEGRA_3x_SOC) selects USB_ULPI_VIEWPORT which has unmet
>>> direct dependencies (USB_SUPPORT && USB_PHY && USB_ULPI) 
>>> include/config/auto.conf:624:warning: override:
>>> ARCH_MULTIPLATFORM changes choice state warning:
>>> (ARCH_TEGRA_2x_SOC && ARCH_TEGRA_3x_SOC) selects USB_ULPI which
>>> has unmet direct dependencies (USB_SUPPORT && USB_PHY && ARM) 
>>> warning: (ARCH_TEGRA_2x_SOC && ARCH_TEGRA_3x_SOC) selects
>>> USB_ULPI_VIEWPORT which has unmet direct dependencies
>>> (USB_SUPPORT && USB_PHY && USB_ULPI)
>> 
>> Which I believe are the cause of the following build errors:
>> 
>>> drivers/built-in.o: In function `controller_resume': 
>>> drivers/usb/host/ehci-tegra.c:556: undefined reference to
>>> `tegra_usb_phy_preresume' drivers/usb/host/ehci-tegra.c:479:
>>> undefined reference to `tegra_ehci_phy_restore_start' 
>>> drivers/usb/host/ehci-tegra.c:551: undefined reference to
>>> `tegra_ehci_phy_restore_end' drivers/usb/host/ehci-tegra.c:546:
>>> undefined reference to `tegra_ehci_phy_restore_end' 
>>> drivers/built-in.o: In function `tegra_ehci_probe': 
>>> drivers/usb/host/ehci-tegra.c:734: undefined reference to
>>> `tegra_usb_phy_open' drivers/built-in.o: In function
>>> `tegra_ehci_hub_control': drivers/usb/host/ehci-tegra.c:162:
>>> undefined reference to `tegra_usb_phy_postresume' 
>>> drivers/usb/host/ehci-tegra.c:215: undefined reference to
>>> `tegra_usb_phy_preresume' make: *** [vmlinux] Error 1
>> 
>> I pointed out at least the Kconfig problems when you posted the
>> PHY error handling cleanup series, so I'm not sure why those
>> patches were applied.
> 
> Because tegra EHCI shouldn't be selecting the PHY and you didn't
> even have a proper PHY driver. Try patch below:

I understand that, but applying the patches without that resolved
still seems wrong. Just because something is currently sub-optimal
doesn't mean it should get broken.

The patch you gave fixes the Kconfig warnings, but not the build failure.

The issue is that: tegra_defconfig enables CONFIG_USB_EHCI_TEGRA, but
not CONFIG_USB_PHY since it's new. ehci-tegra.c directly calls
functions exported by phy-tegra-usb.c. However, phy-tegra-usb.c
doesn't get built, since drivers/usb/Makefile adds phy/ to
obj-$(CONFIG_USB_PHY), so doesn't end up "recursing" into the
sub-directory at all. drivers/usb/phy/Makefile contains:
obj-$(CONFIG_USB_EHCI_TEGRA)+= phy-tegra-usb.o which used to couple
the two builds together, in the absence of this new change that limits
the building of phy/.

For now, I think the correct solution is to have USB_EHCI_TEGRA select
USB_PHY. I validated that solves the build problem, and has the bonus
of not needing any changes to tegra_defconfig.

In the series that converts phy-usb-tegra.c to a real driver, we can
give it its own Kconfig option, and have USB_EHCI_TEGRA depend on
that, if you want. We'll then also need to take a patch through the
Tegra tree to update tegra_defconfig.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
