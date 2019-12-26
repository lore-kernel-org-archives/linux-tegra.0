From: JC Kuo <jckuo@nvidia.com>
Subject: Re: [Patch V2 05/18] phy: tegra: xusb: Add support to get companion
 USB 3 port
Date: Thu, 26 Dec 2019 15:03:42 +0800
Message-ID: <e37a083d-e5de-1b7c-f175-ec4234f60441@nvidia.com>
References: <1576660591-10383-1-git-send-email-nkristam@nvidia.com>
 <1576660591-10383-6-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1576660591-10383-6-git-send-email-nkristam@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Nagarjuna Kristam <nkristam@nvidia.com>, balbi@kernel.org, gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, kishon@ti.com
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 12/18/19 5:16 PM, Nagarjuna Kristam wrote:
> Tegra XUSB host, device mode driver requires the USB 3 companion port
> number for corresponding USB 2 port. Add API to retrieve the same.
> 
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> ---
> V2:
>  - Added -ENODEV as return instead of -1, to sync other errors.
> ---
>  drivers/phy/tegra/xusb.c       | 21 +++++++++++++++++++++
>  include/linux/phy/tegra/xusb.h |  2 ++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
> index 5bde8f1..e75cd71 100644
> --- a/drivers/phy/tegra/xusb.c
> +++ b/drivers/phy/tegra/xusb.c
> @@ -1256,6 +1256,27 @@ int tegra_phy_xusb_utmi_port_reset(struct phy *phy)
>  }
>  EXPORT_SYMBOL_GPL(tegra_phy_xusb_utmi_port_reset);
>  
> +int tegra_xusb_padctl_get_usb3_companion(struct tegra_xusb_padctl *padctl,
> +				    unsigned int port)
> +{
> +	struct tegra_xusb_usb2_port *usb2 = tegra_xusb_find_usb2_port(padctl,
> +								      port);
> +	struct tegra_xusb_usb3_port *usb3;
> +	int i;
> +
> +	if (!usb2)
> +		return -EINVAL;
> +
> +	for (i = 0; i < padctl->soc->ports.usb3.count; i++) {
> +		usb3 = tegra_xusb_find_usb3_port(padctl, i);
> +		if (usb3 && usb3->port == usb2->base.index)
> +			return usb3->base.index;
> +	}
> +
> +	return -ENODEV;
> +}
> +EXPORT_SYMBOL_GPL(tegra_xusb_padctl_get_usb3_companion);
> +
>  MODULE_AUTHOR("Thierry Reding <treding@nvidia.com>");
>  MODULE_DESCRIPTION("Tegra XUSB Pad Controller driver");
>  MODULE_LICENSE("GPL v2");
> diff --git a/include/linux/phy/tegra/xusb.h b/include/linux/phy/tegra/xusb.h
> index 1235865..71d9569 100644
> --- a/include/linux/phy/tegra/xusb.h
> +++ b/include/linux/phy/tegra/xusb.h
> @@ -21,4 +21,6 @@ int tegra_xusb_padctl_usb3_set_lfps_detect(struct tegra_xusb_padctl *padctl,
>  int tegra_xusb_padctl_set_vbus_override(struct tegra_xusb_padctl *padctl,
>  					bool val);
>  int tegra_phy_xusb_utmi_port_reset(struct phy *phy);
> +int tegra_xusb_padctl_get_usb3_companion(struct tegra_xusb_padctl *padctl,
> +					 unsigned int port);
>  #endif /* PHY_TEGRA_XUSB_H */
> 
Reviewed-by: JC Kuo <jckuo@nvidia.com>
