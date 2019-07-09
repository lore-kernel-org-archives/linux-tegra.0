From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v1] drm/tegra: Fix gpiod_get_from_of_node() regression
Date: Tue, 9 Jul 2019 17:27:32 +0100
Message-ID: <9425f0e8-36ec-76cb-b177-fa486fcafc19@nvidia.com>
References: <20190705151139.19032-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190705151139.19032-1-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 05/07/2019 16:11, Dmitry Osipenko wrote:
> That function now returns ERR_PTR instead of NULL if "hpd-gpio" is not
> present in device-tree. The offending patch missed to adapt the Tegra's
> DRM driver for the API change.
> 
> Fixes: 025bf37725f1 ("gpio: Fix return value mismatch of function gpiod_get_from_of_node()")
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/drm/tegra/output.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
> index 274cb955e2e1..471d33809cd4 100644
> --- a/drivers/gpu/drm/tegra/output.c
> +++ b/drivers/gpu/drm/tegra/output.c
> @@ -126,8 +126,12 @@ int tegra_output_probe(struct tegra_output *output)
>  						       "nvidia,hpd-gpio", 0,
>  						       GPIOD_IN,
>  						       "HDMI hotplug detect");
> -	if (IS_ERR(output->hpd_gpio))
> -		return PTR_ERR(output->hpd_gpio);
> +	if (IS_ERR(output->hpd_gpio)) {
> +		if (PTR_ERR(output->hpd_gpio) == -ENOENT)
> +			output->hpd_gpio = NULL;
> +		else
> +			return PTR_ERR(output->hpd_gpio);
> +	}
>  
>  	if (output->hpd_gpio) {
>  		err = gpiod_to_irq(output->hpd_gpio);
> 

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
