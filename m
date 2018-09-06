From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH] drm/tegra: return with probe defer if GPIO subsystem is
 not ready
Date: Thu, 06 Sep 2018 16:31:42 -0700
Message-ID: <de84d04c902d1f7f22b6f024b853a1c7@agner.ch>
References: <20180726133606.14587-1-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180726133606.14587-1-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, airlied@linux.ie
Cc: jonathanh@nvidia.com, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 26.07.2018 06:36, Stefan Agner wrote:
> If the GPIO subsystem is not ready make sure to return -EPROBE_DEFER
> instead of silently continuing without HPD.
> 
> Reported-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> Signed-off-by: Stefan Agner <stefan@agner.ch>

I think this did not get merged yet, any chance to get it in?

--
Stefan

> ---
>  drivers/gpu/drm/tegra/output.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
> index ffe34bd0bb9d..4bcefe455afd 100644
> --- a/drivers/gpu/drm/tegra/output.c
> +++ b/drivers/gpu/drm/tegra/output.c
> @@ -133,7 +133,9 @@ int tegra_output_probe(struct tegra_output *output)
>  	output->hpd_gpio = of_get_named_gpio_flags(output->of_node,
>  						   "nvidia,hpd-gpio", 0,
>  						   &output->hpd_gpio_flags);
> -	if (gpio_is_valid(output->hpd_gpio)) {
> +	if (output->hpd_gpio == -EPROBE_DEFER) {
> +		return -EPROBE_DEFER;
> +	} else if (gpio_is_valid(output->hpd_gpio)) {
>  		unsigned long flags;
>  
>  		err = gpio_request_one(output->hpd_gpio, GPIOF_DIR_IN,
