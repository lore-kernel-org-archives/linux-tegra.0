From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] drm: tegra: add CONFIG_OF dependency
Date: Tue, 25 Jul 2017 09:25:56 +0100
Message-ID: <f383ef43-94a6-07bb-087c-308172948cdc@nvidia.com>
References: <20170721161333.3332968-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170721161333.3332968-1-arnd-r2nGTMty4D4@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 21/07/17 17:13, Arnd Bergmann wrote:
> Without CONFIG_OF, we can run into a build error:
> 
> drivers/gpu/drm/tegra/dpaux.c:378:20: error: 'pinconf_generic_dt_node_to_map_group' undeclared here (not in a function); did you mean 'pinconf_generic_params'?
>   .dt_node_to_map = pinconf_generic_dt_node_to_map_group,
>                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>                     pinconf_generic_params
> drivers/gpu/drm/tegra/dpaux.c:379:17: error: 'pinconf_generic_dt_free_map' undeclared here (not in a function); did you mean 'pinconf_generic_params'?
> 
> This adds an explicit dependency.
> 
> Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/tegra/Kconfig b/drivers/gpu/drm/tegra/Kconfig
> index 2db29d67193d..dc58ab140151 100644
> --- a/drivers/gpu/drm/tegra/Kconfig
> +++ b/drivers/gpu/drm/tegra/Kconfig
> @@ -3,6 +3,7 @@ config DRM_TEGRA
>  	depends on ARCH_TEGRA || (ARM && COMPILE_TEST)
>  	depends on COMMON_CLK
>  	depends on DRM
> +	depends on OF
>  	select DRM_KMS_HELPER
>  	select DRM_MIPI_DSI
>  	select DRM_PANEL

Thanks Arnd. I am curious if it can still fail if PINCTRL is not
selected in whatever config you are using?

That said ...

Acked-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Cheers
Jon

-- 
nvpublic
