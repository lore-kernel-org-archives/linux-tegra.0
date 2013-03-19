From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 3/7] usb: phy: tegra: Get PHY mode using DT
Date: Tue, 19 Mar 2013 13:58:31 -0600
Message-ID: <5148C367.6050606@wwwdotorg.org>
References: <1363609781-4045-1-git-send-email-vbyravarasu@nvidia.com> <1363609781-4045-4-git-send-email-vbyravarasu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1363609781-4045-4-git-send-email-vbyravarasu@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Venu Byravarasu <vbyravarasu@nvidia.com>
Cc: gregkh@linuxfoundation.org, stern@rowland.harvard.edu, balbi@ti.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: linux-tegra@vger.kernel.org

On 03/18/2013 06:29 AM, Venu Byravarasu wrote:
> Added a new PHY mode to support OTG.
> Obtained Tegra USB PHY mode using DT property.

> diff --git a/drivers/usb/phy/tegra_usb_phy.c b/drivers/usb/phy/tegra_usb_phy.c

> @@ -713,6 +712,16 @@ struct tegra_usb_phy *tegra_usb_phy_open(struct device *dev, int instance,
>  	else
>  		phy->is_ulpi_phy = true;
>  
> +	err = of_property_match_string(np, "dr_mode", "otg");
> +	if (err < 0) {
> +		err = of_property_match_string(np, "dr_mode", "gadget");
> +		if (err < 0)

The binding says the 3 legal values for this property are "host",
"peripheral", or "otg". This agrees with the usage in
Documentation/devicetree/bindings/usb/fsl-usb.txt and
drivers/usb/host/fsl-mph-dr-of.c. So, "gadget" is not something the code
should be checking for.

I'm sure I pointed this out before.
