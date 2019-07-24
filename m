From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v3] drm/tegra: sor: Enable HDA interrupts at plug-in
Date: Wed, 24 Jul 2019 12:27:53 +0300
Message-ID: <0ba35efb-44ec-d56c-b559-59f1daa3e6e4@gmail.com>
References: <1563885610-27198-1-git-send-email-viswanathl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1563885610-27198-1-git-send-email-viswanathl@nvidia.com>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: Viswanath L <viswanathl@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

23.07.2019 15:40, Viswanath L пишет:
> HDMI plugout calls runtime suspend, which clears interrupt registers
> and causes audio functionality to break on subsequent plug-in; setting
> interrupt registers in sor_audio_prepare() solves the issue.
> 
> Signed-off-by: Viswanath L <viswanathl@nvidia.com>

Yours signed-off-by always should be the last line of the commit's
message because the text below it belongs to a person who applies this
patch, Thierry in this case. This is not a big deal at all and Thierry
could make a fixup while applying the patch if will deem that as necessary.

Secondly, there is no need to add "stable@vger.kernel.org" to the
email's recipients because the patch will flow into stable kernel
versions from the mainline once it will get applied. That happens based
on the stable tag presence, hence it's enough to add the 'Cc' tag to the
commit's message in order to get patch backported.

Lastly, next time please add everyone to the email's recipients whom
you're expecting to get a reply. Otherwise there is a chance that patch
will be left unnoticed.

Everything else looks good to me, thanks!

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>

> Fixes: 8e2988a76c26 ("drm/tegra: sor: Support for audio over HDMI")
> Cc: <stable@vger.kernel.org>
> ---
>  drivers/gpu/drm/tegra/sor.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
> index 5be5a08..0470cfe 100644
> --- a/drivers/gpu/drm/tegra/sor.c
> +++ b/drivers/gpu/drm/tegra/sor.c
> @@ -2164,6 +2164,15 @@ static void tegra_sor_audio_prepare(struct tegra_sor *sor)
>  
>  	value = SOR_AUDIO_HDA_PRESENSE_ELDV | SOR_AUDIO_HDA_PRESENSE_PD;
>  	tegra_sor_writel(sor, value, SOR_AUDIO_HDA_PRESENSE);
> +
> +	/*
> +	 * Enable and unmask the HDA codec SCRATCH0 register interrupt. This
> +	 * is used for interoperability between the HDA codec driver and the
> +	 * HDMI/DP driver.
> +	 */
> +	value = SOR_INT_CODEC_SCRATCH1 | SOR_INT_CODEC_SCRATCH0;
> +	tegra_sor_writel(sor, value, SOR_INT_ENABLE);
> +	tegra_sor_writel(sor, value, SOR_INT_MASK);
>  }
>  
>  static void tegra_sor_audio_unprepare(struct tegra_sor *sor)
> @@ -2913,15 +2922,6 @@ static int tegra_sor_init(struct host1x_client *client)
>  	if (err < 0)
>  		return err;
>  
> -	/*
> -	 * Enable and unmask the HDA codec SCRATCH0 register interrupt. This
> -	 * is used for interoperability between the HDA codec driver and the
> -	 * HDMI/DP driver.
> -	 */
> -	value = SOR_INT_CODEC_SCRATCH1 | SOR_INT_CODEC_SCRATCH0;
> -	tegra_sor_writel(sor, value, SOR_INT_ENABLE);
> -	tegra_sor_writel(sor, value, SOR_INT_MASK);
> -
>  	return 0;
>  }
>  
> 
