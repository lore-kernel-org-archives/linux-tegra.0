From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] usb: xhci: tegra: fix runtime PM error handling
Date: Tue, 19 Jun 2018 11:07:20 +0100
Message-ID: <738c34e8-e6cc-9947-8d4f-3867b57a0e12@nvidia.com>
References: <20180617111258.13447-1-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180617111258.13447-1-stefan@agner.ch>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Thierry Reding <thierry.reding@gmail.com>, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 17/06/18 12:12, Stefan Agner wrote:
> The address-of operator will always evaluate to true. However,
> power should be explicitly disabled if no power domain is used.
> 
> Remove the address-of operator.
> 
> Fixes: 58c38116c6cc ("usb: xhci: tegra: Add support for managing powergates")
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
>  drivers/usb/host/xhci-tegra.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
> index a8c1d073cba0..33daac4136e8 100644
> --- a/drivers/usb/host/xhci-tegra.c
> +++ b/drivers/usb/host/xhci-tegra.c
> @@ -1223,10 +1223,10 @@ static int tegra_xusb_probe(struct platform_device *pdev)
>  	pm_runtime_disable(&pdev->dev);
>  	usb_put_hcd(tegra->hcd);
>  disable_xusbc:
> -	if (!&pdev->dev.pm_domain)
> +	if (!pdev->dev.pm_domain)
>  		tegra_powergate_power_off(TEGRA_POWERGATE_XUSBC);
>  disable_xusba:
> -	if (!&pdev->dev.pm_domain)
> +	if (!pdev->dev.pm_domain)
>  		tegra_powergate_power_off(TEGRA_POWERGATE_XUSBA);
>  put_padctl:
>  	tegra_xusb_padctl_put(tegra->padctl);
> 

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Thanks for fixing!
Jon

-- 
nvpublic
