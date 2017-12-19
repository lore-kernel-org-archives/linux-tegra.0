From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v2 4/4] usb: host: ehci-tegra: Remove USB_PHY dependencies
 from Kconfig
Date: Tue, 19 Dec 2017 12:52:11 -0500 (EST)
Message-ID: <Pine.LNX.4.44L0.1712191249030.1429-100000@iolanthe.rowland.org>
References: <73bed692785827e01d11859f721e07c29a41510b.1513528011.git.digetx@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <73bed692785827e01d11859f721e07c29a41510b.1513528011.git.digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Sun, 17 Dec 2017, Dmitry Osipenko wrote:

> Previously tegra-phy driver was built only when ehci-tegra was, now
> tegra-phy has its own Kconfig entry. Remove the USB_PHY dependencies
> from ehci-tegra's Kconfig since they aren't useful anymore.

Are you sure they aren't useful?  Does this mean it is now
possible/useful to configure a kernel with USB_EHCI_TEGRA enabled and
USB_PHY disabled?

> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/usb/host/Kconfig | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
> index 6150bed7cfa8..5042e72c1b76 100644
> --- a/drivers/usb/host/Kconfig
> +++ b/drivers/usb/host/Kconfig
> @@ -234,9 +234,6 @@ config USB_EHCI_TEGRA
>         tristate "NVIDIA Tegra HCD support"
>         depends on ARCH_TEGRA
>         select USB_EHCI_ROOT_HUB_TT
> -       select USB_PHY
> -	select USB_ULPI
> -	select USB_ULPI_VIEWPORT

Maybe you should add

	select USB_TEGRA_PHY

here.  Also, what happened to USB_ULPI_VIEWPORT?  Is it still 
important?  If not, then what changed?

Alan Stern

>         help
>           This driver enables support for the internal USB Host Controllers
>           found in NVIDIA Tegra SoCs. The controllers are EHCI compliant.
> 
