From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v2] drm/tegra: dpaux: Modify error handling
Date: Mon, 15 Aug 2016 10:04:05 +0100
Message-ID: <e2bf16fe-9ea7-6bd8-a027-0fa1bda79804@nvidia.com>
References: <20160815045748.GA12947@amitoj-Inspiron-3542>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160815045748.GA12947@amitoj-Inspiron-3542>
Sender: linux-kernel-owner@vger.kernel.org
To: Amitoj Kaur Chawla <amitoj1606@gmail.com>, thierry.reding@gmail.com, airlied@linux.ie, swarren@wwwdotorg.org, gnurou@gmail.com, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: julia.lawall@lip6.fr
List-Id: linux-tegra@vger.kernel.org


On 15/08/16 05:57, Amitoj Kaur Chawla wrote:
> devm_pinctrl_register returns an ERR_PTR in case of error and should
> have an IS_ERR check instead of a null check.
> 
> The Coccinelle semantic patch used to make this change is as follows:
> @@
> expression e;
> @@
> 
>   e = devm_pinctrl_register(...);
> if(
> -    !e
> +    IS_ERR(e)
>     )
>     {
>   <+...
>   return
> - ...
> + PTR_ERR(e)
>   ;
>   ...+>
>   }
> 
> Signed-off-by: Amitoj Kaur Chawla <amitoj1606@gmail.com>
> ---
> Changes in v2:
>         -Correct typo
> 
>  drivers/gpu/drm/tegra/dpaux.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
> index 059f409..2fde44c 100644
> --- a/drivers/gpu/drm/tegra/dpaux.c
> +++ b/drivers/gpu/drm/tegra/dpaux.c
> @@ -539,9 +539,9 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
>  	dpaux->desc.owner = THIS_MODULE;
>  
>  	dpaux->pinctrl = devm_pinctrl_register(&pdev->dev, &dpaux->desc, dpaux);
> -	if (!dpaux->pinctrl) {
> +	if (IS_ERR(dpaux->pinctrl)) {
>  		dev_err(&pdev->dev, "failed to register pincontrol\n");
> -		return -ENODEV;
> +		return PTR_ERR(dpaux->pinctrl);
>  	}
>  #endif
>  	/* enable and clear all interrupts */
> 

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers!
Jon

-- 
nvpublic
