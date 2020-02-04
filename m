From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/3] drm/tegra: sor: Suspend on clock registration failure
Date: Tue, 4 Feb 2020 10:31:31 +0000
Message-ID: <ac6cbd0c-d2ea-c085-ecfc-3fd761649f1b@nvidia.com>
References: <20200131165910.3443936-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200131165910.3443936-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 31/01/2020 16:59, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Make sure the SOR module is suspenden after we fail to register the SOR
> pad output clock.

s/suspenden/suspended/

> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/sor.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
> index 41d24949478e..96cd89bb2e82 100644
> --- a/drivers/gpu/drm/tegra/sor.c
> +++ b/drivers/gpu/drm/tegra/sor.c
> @@ -3922,15 +3922,16 @@ static int tegra_sor_probe(struct platform_device *pdev)
>  	if (!sor->clk_pad) {
>  		char *name;
>  
> -		err = host1x_client_resume(&sor->client);
> -		if (err < 0) {
> -			dev_err(sor->dev, "failed to resume: %d\n", err);
> +		name = devm_kasprintf(sor->dev, GFP_KERNEL, "sor%u_pad_clkout",
> +				      sor->index);
> +		if (!name) {
> +			err = -ENOMEM;
>  			goto remove;
>  		}
>  
> -		name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "sor%u_pad_clkout", sor->index);
> -		if (!name) {
> -			err = -ENOMEM;
> +		err = host1x_client_resume(&sor->client);
> +		if (err < 0) {
> +			dev_err(sor->dev, "failed to resume: %d\n", err);
>  			goto remove;
>  		}
>  
> 

Otherwise ...

Reviewed-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Tested-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Cheers
Jon

-- 
nvpublic
