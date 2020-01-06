From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v4 20/20] usb: host: ehci-tegra: Remove unused fields
 from tegra_ehci_hcd
Date: Mon, 6 Jan 2020 10:16:36 -0500 (EST)
Message-ID: <Pine.LNX.4.44L0.2001061014430.1514-100000@iolanthe.rowland.org>
References: <20200106013416.9604-21-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200106013416.9604-21-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen <Peter.Chen@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Felipe Balbi <balbi@kernel.org>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Mon, 6 Jan 2020, Dmitry Osipenko wrote:

> There are few stale fields in tegra_ehci_hcd structure, let's remove them.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/usb/host/ehci-tegra.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
> index 1eb94205a5ac..d6433f206c17 100644
> --- a/drivers/usb/host/ehci-tegra.c
> +++ b/drivers/usb/host/ehci-tegra.c
> @@ -42,12 +42,10 @@ struct tegra_ehci_soc_config {
>  };
>  
>  struct tegra_ehci_hcd {
> -	struct tegra_usb_phy *phy;
>  	struct clk *clk;
>  	struct reset_control *rst;
>  	int port_resuming;
>  	bool needs_double_reset;
> -	enum tegra_usb_phy_port_speed port_speed;
>  };
>  
>  static int tegra_reset_usb_controller(struct platform_device *pdev)

For patches 2, 19, and 20:

Acked-by: Alan Stern <stern@rowland.harvard.edu>

It's nice to see that patch 2 makes the sequence of events in 
tegra_ehci_remove() exactly the same as the failure pathway in 
tegra_ehci_probe().

Alan Stern
