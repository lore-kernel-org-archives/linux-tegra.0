From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2] drm/tegra: sor: Enable HDA interrupts at plugin
Date: Tue, 23 Jul 2019 03:30:05 +0300
Message-ID: <11288075-f34a-222c-66da-2bfd13db987c@gmail.com>
References: <1563787632-19762-1-git-send-email-viswanathl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1563787632-19762-1-git-send-email-viswanathl@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Viswanath L <viswanathl@nvidia.com>, thierry.reding@gmail.com, airlied@linux.ie, daniel@ffwll.ch, jonathanh@nvidia.com
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

22.07.2019 12:27, Viswanath L пишет:
> HDMI plugout calls runtime suspend, which clears interrupt registers
> and causes audio functionality to break on subsequent plugin; setting
> interrupt registers in sor_audio_prepare() solves the issue

Hello Viswanath,

A dot should be in the end of sentence, please. And should be better to
s/plugin/plug-in/ in the commit's message/title because 'plugin' sounds
as a noun.

Please don't version patch as v2 if v1 wasn't ever sent out.

You should add a stable tag here to get patch backported into stable
kernel versions:

Cc: <stable@vger.kernel.org>

> Signed-off-by: Viswanath L <viswanathl@nvidia.com>

The kernel upstreaming rules require a full name. I'm pretty sure that L
isn't yours surname.

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
