From: Nagarjuna Kristam <nkristam@nvidia.com>
Subject: Re: [PATCH] phy: tegra: should select USB_PHY
Date: Mon, 23 Mar 2020 09:09:41 +0530
Message-ID: <f720dc73-e6c3-ead7-6a45-6f2b54e0f4ff@nvidia.com>
References: <1584545013-19859-1-git-send-email-clabbe@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1584545013-19859-1-git-send-email-clabbe@baylibre.com>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: Corentin Labbe <clabbe@baylibre.com>, jonathanh@nvidia.com, kishon@ti.com, thierry.reding@gmail.com, treding@nvidia.com
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, stable <stable@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Reviewed-by: Nagarjuna Kristam <nkristam@nvidia.com>

On 18-03-2020 20:53, Corentin Labbe wrote:
> External email: Use caution opening links or attachments
> 
> 
> I have hit the following build error:
> armv7a-hardfloat-linux-gnueabi-ld: drivers/phy/tegra/xusb.o: in function `tegra_xusb_port_unregister':
> xusb.c:(.text+0x2ac): undefined reference to `usb_remove_phy'
> armv7a-hardfloat-linux-gnueabi-ld: drivers/phy/tegra/xusb.o: in function `tegra_xusb_setup_ports':
> xusb.c:(.text+0xf30): undefined reference to `usb_add_phy_dev'
> 
> PHY_TEGRA_XUSB should select USB_PHY
> 
> Fixes: 23babe30fb45d ("phy: tegra: xusb: Add usb-phy support")
> Cc: stable <stable@vger.kernel.org>
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> ---
>   drivers/phy/tegra/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/phy/tegra/Kconfig b/drivers/phy/tegra/Kconfig
> index df07c4dea059..a208aca4ba7b 100644
> --- a/drivers/phy/tegra/Kconfig
> +++ b/drivers/phy/tegra/Kconfig
> @@ -3,6 +3,7 @@ config PHY_TEGRA_XUSB
>          tristate "NVIDIA Tegra XUSB pad controller driver"
>          depends on ARCH_TEGRA
>          select USB_CONN_GPIO
> +       select USB_PHY
>          help
>            Choose this option if you have an NVIDIA Tegra SoC.
> 
> --
> 2.24.1
> 
