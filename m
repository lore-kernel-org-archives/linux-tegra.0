From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] USB: EHCI: tegra: Fix use-after-free in .remove()
Date: Tue, 17 Jun 2014 09:56:47 -0600
Message-ID: <53A0653F.7090001@wwwdotorg.org>
References: <1403014660-15509-1-git-send-email-ttynkkynen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1403014660-15509-1-git-send-email-ttynkkynen@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tuomas Tynkkynen <ttynkkynen@nvidia.com>, Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 06/17/2014 08:17 AM, Tuomas Tynkkynen wrote:
> The tegra_ehci_hcd structure is located in the private space allocated
> by the core USB code so it must not be accessed after the HCD is
> freed.

> diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c

This seems to be a persistent problem. Witness commit ecc8a0cdca18 "usb:
host: tegra: fix warning messages in ehci_remove". So, I wonder if ...

> @@ -479,10 +479,11 @@ static int tegra_ehci_remove(struct platform_device *pdev)
>  
>  	usb_phy_shutdown(hcd->phy);
>  	usb_remove_hcd(hcd);
> -	usb_put_hcd(hcd);
>  
>  	clk_disable_unprepare(tegra->clk);
>  

It's worth putting a comment here:

	/* This must be last, since *tegra is part of *hcd */
> +	usb_put_hcd(hcd);
> +
>  	return 0;
>  }

Of course, that could be a separate commit if you want.
