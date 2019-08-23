From: Vidya Sagar <vidyas@nvidia.com>
Subject: Re: [PATCH -next] phy: tegra: Use PTR_ERR_OR_ZERO in
 tegra_p2u_probe()
Date: Fri, 23 Aug 2019 12:34:02 +0530
Message-ID: <7c060719-1df3-c0b8-2e61-5dbfdf1e4798@nvidia.com>
References: <20190822063407.71148-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190822063407.71148-1-yuehaibing@huawei.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: YueHaibing <yuehaibing@huawei.com>, Kishon Vijay Abraham I <kishon@ti.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 8/22/2019 12:04 PM, YueHaibing wrote:
> Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>   drivers/phy/tegra/phy-tegra194-p2u.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/phy/tegra/phy-tegra194-p2u.c b/drivers/phy/tegra/phy-tegra194-p2u.c
> index 7042bed9feaa..42394d27f4cb 100644
> --- a/drivers/phy/tegra/phy-tegra194-p2u.c
> +++ b/drivers/phy/tegra/phy-tegra194-p2u.c
> @@ -92,10 +92,7 @@ static int tegra_p2u_probe(struct platform_device *pdev)
>   	phy_set_drvdata(generic_phy, phy);
>   
>   	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> -	if (IS_ERR(phy_provider))
> -		return PTR_ERR(phy_provider);
> -
> -	return 0;
> +	return PTR_ERR_OR_ZERO(phy_provider);
>   }
Since PTR_ERR_OR_ZERO macro returns zero if input is valid, if some more code gets added in
future after this, then, they might have to change this back to what it is now.
So I ended up continuing with if(IS_ERR(...)) + PTR_ERR towards the end also.
Having said that, I'm fine with this change as well.

Reviewed-by: Vidya Sagar <vidyas@nvidia.com>

>   
>   static const struct of_device_id tegra_p2u_id_table[] = {
> 
> 
> 
> 
> 
