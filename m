From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 5/9] usb: phy: tegra: Register as an USB PHY.
Date: Mon, 01 Jul 2013 15:53:16 -0600
Message-ID: <51D1FA4C.8000507@wwwdotorg.org>
References: <1372455427-20898-1-git-send-email-ttynkkynen@nvidia.com> <1372455427-20898-6-git-send-email-ttynkkynen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1372455427-20898-6-git-send-email-ttynkkynen@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tuomas Tynkkynen <ttynkkynen@nvidia.com>
Cc: balbi@ti.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
List-Id: linux-tegra@vger.kernel.org

On 06/28/2013 03:37 PM, Tuomas Tynkkynen wrote:
> Register the Tegra PHY device instances with the PHY subsystem so that
> the Tegra EHCI driver can locate a PHY via the standard APIs.

> diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c

> +	err = usb_add_phy_dev(&tegra_phy->u_phy);
> +	if (err < 0) {
> +		tegra_usb_phy_close(&tegra_phy->u_phy);
> +		return err;
> +	}

Don't you want to do that a bit later? In particular ...

>  	tegra_phy->u_phy.shutdown = tegra_usb_phy_close;
>  	tegra_phy->u_phy.set_suspend = tegra_usb_phy_suspend;
> 
> 	dev_set_drvdata(&pdev->dev, tegra_phy);

... that all happens *after* the call to usb_add_phy_dev() call, yet I
think the USB core could legally call any of the PHY methods after the
call to usb_add_phy_dev(), and that probably requires all those methods
pointers and drvdata to be set up? I suggest moving the call to
usb_add_phy_dev() to the very end of the function.

> +static int tegra_usb_phy_remove(struct platform_device *pdev)
> +{
> +	struct tegra_usb_phy *tegra_phy = platform_get_drvdata(pdev);
> +
> +	usb_remove_phy(&tegra_phy->u_phy);
> +	return 0;
> +}

Nit: I'd typically expect to see a blank line before the return statement.
