From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: USB-related build errors on Tegra in next-20130319
Date: Tue, 19 Mar 2013 10:29:05 -0600
Message-ID: <51489251.5040504@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Felipe,

I see the following Kconfig warnings in next-20130319:

> warning: (ARCH_TEGRA_2x_SOC && ARCH_TEGRA_3x_SOC) selects USB_ULPI which has unmet direct dependencies (USB_SUPPORT && USB_PHY && ARM)
> warning: (ARCH_TEGRA_2x_SOC && ARCH_TEGRA_3x_SOC) selects USB_ULPI_VIEWPORT which has unmet direct dependencies (USB_SUPPORT && USB_PHY && USB_ULPI)
> include/config/auto.conf:624:warning: override: ARCH_MULTIPLATFORM changes choice state
> warning: (ARCH_TEGRA_2x_SOC && ARCH_TEGRA_3x_SOC) selects USB_ULPI which has unmet direct dependencies (USB_SUPPORT && USB_PHY && ARM)
> warning: (ARCH_TEGRA_2x_SOC && ARCH_TEGRA_3x_SOC) selects USB_ULPI_VIEWPORT which has unmet direct dependencies (USB_SUPPORT && USB_PHY && USB_ULPI)

Which I believe are the cause of the following build errors:

> drivers/built-in.o: In function `controller_resume':
> drivers/usb/host/ehci-tegra.c:556: undefined reference to `tegra_usb_phy_preresume'
> drivers/usb/host/ehci-tegra.c:479: undefined reference to `tegra_ehci_phy_restore_start'
> drivers/usb/host/ehci-tegra.c:551: undefined reference to `tegra_ehci_phy_restore_end'
> drivers/usb/host/ehci-tegra.c:546: undefined reference to `tegra_ehci_phy_restore_end'
> drivers/built-in.o: In function `tegra_ehci_probe':
> drivers/usb/host/ehci-tegra.c:734: undefined reference to `tegra_usb_phy_open'
> drivers/built-in.o: In function `tegra_ehci_hub_control':
> drivers/usb/host/ehci-tegra.c:162: undefined reference to `tegra_usb_phy_postresume'
> drivers/usb/host/ehci-tegra.c:215: undefined reference to `tegra_usb_phy_preresume'
> make: *** [vmlinux] Error 1

I pointed out at least the Kconfig problems when you posted the PHY
error handling cleanup series, so I'm not sure why those patches were
applied.
