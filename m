From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH] USB: EHCI: tegra: Fix use-after-free in .remove()
Date: Tue, 17 Jun 2014 10:26:10 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1406171025530.1187-100000@iolanthe.rowland.org>
References: <1403014660-15509-1-git-send-email-ttynkkynen@nvidia.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1403014660-15509-1-git-send-email-ttynkkynen@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tuomas Tynkkynen <ttynkkynen@nvidia.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, 17 Jun 2014, Tuomas Tynkkynen wrote:

> The tegra_ehci_hcd structure is located in the private space allocated
> by the core USB code so it must not be accessed after the HCD is
> freed.
> 
> Signed-off-by: Tuomas Tynkkynen <ttynkkynen@nvidia.com>
> ---
>  drivers/usb/host/ehci-tegra.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
> index 6fdcb8a..5590567 100644
> --- a/drivers/usb/host/ehci-tegra.c
> +++ b/drivers/usb/host/ehci-tegra.c
> @@ -479,10 +479,11 @@ static int tegra_ehci_remove(struct platform_device *pdev)
>  
>  	usb_phy_shutdown(hcd->phy);
>  	usb_remove_hcd(hcd);
> -	usb_put_hcd(hcd);
>  
>  	clk_disable_unprepare(tegra->clk);
>  
> +	usb_put_hcd(hcd);
> +
>  	return 0;
>  }

Acked-by: Alan Stern <stern@rowland.harvard.edu>
