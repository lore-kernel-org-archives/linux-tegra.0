From: Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH REPOST 2] drm: tegra: don't depend on OF
Date: Thu, 21 Mar 2013 15:02:27 -0400
Message-ID: <CAF6AEGs0Sw=-xGv9+Aq6xnTktE3R4xcGPokVpmjqEAC1uOct8A@mail.gmail.com>
References: <1363888630-30197-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1363888630-30197-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

How far away are we from supporting tegradrm with ARCH_MULTIPLATFORM?
It would be nice to be able to at least compile-test drm core changes
with all the arm drivers in one shot..

BR,
-R

On Thu, Mar 21, 2013 at 1:57 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> ARCH_TEGRA always enabled OF, so there's no need for any driver to
> depend on it.
>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Acked-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/Kconfig |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/tegra/Kconfig b/drivers/gpu/drm/tegra/Kconfig
> index be1daf7..15974ae 100644
> --- a/drivers/gpu/drm/tegra/Kconfig
> +++ b/drivers/gpu/drm/tegra/Kconfig
> @@ -1,6 +1,6 @@
>  config DRM_TEGRA
>         tristate "NVIDIA Tegra DRM"
> -       depends on DRM && OF && ARCH_TEGRA
> +       depends on DRM && ARCH_TEGRA
>         select DRM_KMS_HELPER
>         select DRM_GEM_CMA_HELPER
>         select DRM_KMS_CMA_HELPER
> --
> 1.7.10.4
>
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
