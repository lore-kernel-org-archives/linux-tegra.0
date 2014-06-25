From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v1 4/9] pinctrl: tegra-xusb: Add USB PHY support
Date: Wed, 25 Jun 2014 16:12:15 -0600
Message-ID: <53AB493F.3030802@wwwdotorg.org>
References: <1403072180-4944-1-git-send-email-abrestic@chromium.org> <1403072180-4944-5-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1403072180-4944-5-git-send-email-abrestic@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Bresticker <abrestic@chromium.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>, Thierry Reding <thierry.reding@gmail.com>, Russell King <linux@arm.linux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>, Grant Likely <grant.likely@linaro.org>, Alan Stern <stern@rowland.harvard.edu>, Kishon Vijay Abraham I <kishon@ti.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-tegra@vger.kernel.org

On 06/18/2014 12:16 AM, Andrew Bresticker wrote:
> In addition to the PCIe and SATA PHYs, the XUSB pad controller also
> supports 3 UTMI, 2 HSIC, and 2 USB3 PHYs.  Each USB3 PHY uses a single
> PCIe or SATA lane and is mapped to one of the three UTMI ports.
> 

> diff --git a/drivers/pinctrl/pinctrl-tegra-xusb.c b/drivers/pinctrl/pinctrl-tegra-xusb.c

> @@ -372,6 +720,193 @@ static int tegra_xusb_padctl_pinconf_group_set(struct pinctrl_dev *pinctrl,
>  			padctl_writel(padctl, regval, lane->offset);
>  			break;
>  
> +		case TEGRA_XUSB_PADCTL_USB3_PORT_NUM:
> +			if (value >= TEGRA_XUSB_PADCTL_USB3_PORTS) {
> +				dev_err(padctl->dev, "Invalid USB3 port: %lu\n",
> +					value);
> +				return -EINVAL;
> +			}
> +			if (!is_pcie_sata_lane(group)) {
> +				dev_err(padctl->dev,
> +					"USB3 port not applicable for pin %d\n",
> +					group);
> +				return -EINVAL;
> +			}
> +			padctl->usb3_ports[value].lane = group;
> +			break;

It feels odd to use pinctrl for a SW-only purpose. In other words, that
chunk of code isn't writing the pinconf data to HW, but rather some
internal variable.

Perhaps it would make more sense for the DT binding to represent this
data directly in a custom property that's parsed at probe() time. That
way, pinctrl only touches "real" HW stuff.

> +static int usb3_phy_power_on(struct phy *phy)
> +{
> +	struct tegra_xusb_padctl *padctl = phy_get_drvdata(phy);
> +	int port = usb3_phy_to_port(phy);
> +	int lane = padctl->usb3_ports[port].lane;
> +	u32 value, offset;
> +
> +	value = padctl_readl(padctl, XUSB_PADCTL_IOPHY_USB3_PADX_CTL2(port));
> +	value &= ~((XUSB_PADCTL_IOPHY_USB3_PAD_CTL2_RX_WANDER_MASK <<
> +		    XUSB_PADCTL_IOPHY_USB3_PAD_CTL2_RX_WANDER_SHIFT) |
> +		   (XUSB_PADCTL_IOPHY_USB3_PAD_CTL2_RX_EQ_MASK <<
> +		    XUSB_PADCTL_IOPHY_USB3_PAD_CTL2_RX_EQ_SHIFT) |
> +		   (XUSB_PADCTL_IOPHY_USB3_PAD_CTL2_CDR_CNTL_MASK <<
> +		    XUSB_PADCTL_IOPHY_USB3_PAD_CTL2_CDR_CNTL_SHIFT));

Hmm. So there is a lot of "PHY" stuff here after all.

However, the PHYs implemented here appear to implement very low-level
I/O pad code, whereas the PHYs we have for our USB 2.0 controller are
somewhat higher-level; they're more USB-oriented than just IO pad
oriented. Do you know which level of abstraction a Linux PHY object is
supposed to be? I could never get an answer when I asked before.
