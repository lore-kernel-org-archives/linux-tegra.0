From: Lucas Stach <dev@lynxeye.de>
Subject: Re: [PATCH] drm/tegra: hdmi: probe deferral error reporting
Date: Mon, 23 Jul 2018 22:49:15 +0200
Message-ID: <228cdf6fe37298223d77b52fd4cdb821b0da7d11.camel@lynxeye.de>
References: <20180720075515.26852-1-marcel@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180720075515.26852-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel@ziswiler.com>, linux-tegra@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>
List-Id: linux-tegra@vger.kernel.org

Am Freitag, den 20.07.2018, 09:55 +0200 schrieb Marcel Ziswiler:
> From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> Actually report the error code from devm_regulator_get() which may as
> well just be a probe deferral.

This is still noisy, so while you are changing this I would prefer if
this wouldn't print the error message if it's a simple probe deferral.

Suppressing the log message in that case gets us much cleaner kernel
logs, where real errors stand out.

Regards,
Lucas

> 
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> ---
> 
>  drivers/gpu/drm/tegra/hdmi.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
> index 0082468f703c..94c182dbb6d0 100644
> --- a/drivers/gpu/drm/tegra/hdmi.c
> +++ b/drivers/gpu/drm/tegra/hdmi.c
> @@ -1693,14 +1693,16 @@ static int tegra_hdmi_probe(struct platform_device *pdev)
>  
>  	hdmi->hdmi = devm_regulator_get(&pdev->dev, "hdmi");
>  	if (IS_ERR(hdmi->hdmi)) {
> -		dev_err(&pdev->dev, "failed to get HDMI regulator\n");
> -		return PTR_ERR(hdmi->hdmi);
> +		err = PTR_ERR(hdmi->hdmi);
> +		dev_err(&pdev->dev, "failed to get HDMI regulator: %d\n", err);
> +		return err;
>  	}
>  
>  	hdmi->pll = devm_regulator_get(&pdev->dev, "pll");
>  	if (IS_ERR(hdmi->pll)) {
> -		dev_err(&pdev->dev, "failed to get PLL regulator\n");
> -		return PTR_ERR(hdmi->pll);
> +		err = PTR_ERR(hdmi->pll);
> +		dev_err(&pdev->dev, "failed to get PLL regulator: %d\n", err);
> +		return err;
>  	}
>  
>  	hdmi->vdd = devm_regulator_get(&pdev->dev, "vdd");
