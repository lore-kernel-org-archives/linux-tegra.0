From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] usb: phy: tegra: make the code simple by
 devm_platform_ioremap_resource()
Date: Mon, 27 Jan 2020 22:47:36 +0300
Message-ID: <ebb395ec-89ef-12e9-b3a9-2fc35f764ee2@gmail.com>
References: <20200127135841.17935-1-zhengdejin5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200127135841.17935-1-zhengdejin5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dejin Zheng <zhengdejin5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

27.01.2020 16:58, Dejin Zheng пишет:
> make the code simple by use devm_platform_ioremap_resource() function
> to replace platform_get_resource() and devm_ioremap().
> 
> Signed-off-by: Dejin Zheng <zhengdejin5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/usb/phy/phy-tegra-usb.c | 20 ++------------------
>  1 file changed, 2 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
> index ea7ef1dc0b42..8220bb4ce1ed 100644
> --- a/drivers/usb/phy/phy-tegra-usb.c
> +++ b/drivers/usb/phy/phy-tegra-usb.c
> @@ -944,20 +944,12 @@ static int read_utmi_param(struct platform_device *pdev, const char *param,
>  static int utmi_phy_probe(struct tegra_usb_phy *tegra_phy,
>  			  struct platform_device *pdev)
>  {
> -	struct resource *res;
>  	int err;
>  	struct tegra_utmip_config *config;
>  
>  	tegra_phy->is_ulpi_phy = false;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> -	if (!res) {
> -		dev_err(&pdev->dev, "Failed to get UTMI pad regs\n");
> -		return  -ENXIO;
> -	}
> -
> -	tegra_phy->pad_regs = devm_ioremap(&pdev->dev, res->start,
> -		resource_size(res));
> +	tegra_phy->pad_regs = devm_platform_ioremap_resource(pdev, 1);
>  	if (!tegra_phy->pad_regs) {
>  		dev_err(&pdev->dev, "Failed to remap UTMI pad regs\n");
>  		return -ENOMEM;
> @@ -1054,7 +1046,6 @@ MODULE_DEVICE_TABLE(of, tegra_usb_phy_id_table);
>  static int tegra_usb_phy_probe(struct platform_device *pdev)
>  {
>  	const struct of_device_id *match;
> -	struct resource *res;
>  	struct tegra_usb_phy *tegra_phy = NULL;
>  	struct device_node *np = pdev->dev.of_node;
>  	enum usb_phy_interface phy_type;
> @@ -1071,14 +1062,7 @@ static int tegra_usb_phy_probe(struct platform_device *pdev)
>  	}
>  	tegra_phy->soc_config = match->data;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!res) {
> -		dev_err(&pdev->dev, "Failed to get I/O memory\n");
> -		return  -ENXIO;
> -	}
> -
> -	tegra_phy->regs = devm_ioremap(&pdev->dev, res->start,
> -		resource_size(res));
> +	tegra_phy->regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (!tegra_phy->regs) {
>  		dev_err(&pdev->dev, "Failed to remap I/O memory\n");
>  		return -ENOMEM;
> 

Hello Dejin,

Unfortunately this is not a correct change because registers are shared
by both PHY and USB controllers on Tegra SoCs. The
devm_platform_ioremap_resource() can't be used here because it makes the
mapping exclusive for a single driver, while it should be shared.
