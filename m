From: Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 02/36] drm/plane: Make ->atomic_update() mandatory
Date: Tue, 20 Jan 2015 08:51:15 -0500
Message-ID: <CAF6AEGvObX_YBvw7f+SytnBokpdQopom-sWGoxaPG2k+g1YjTA@mail.gmail.com>
References: <1421750935-4023-1-git-send-email-thierry.reding@gmail.com>
	<1421750935-4023-3-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421750935-4023-3-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Jan 20, 2015 at 5:48 AM, Thierry Reding
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> There is no use-case where it would be useful for drivers not to
> implement this function and the transitional plane helpers already
> require drivers to provide an implementation.
>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index d467185f7942..010661f23035 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -1108,7 +1108,7 @@ void drm_atomic_helper_commit_planes(struct drm_device *dev,
>
>                 funcs = plane->helper_private;
>
> -               if (!funcs || !funcs->atomic_update)
> +               if (!funcs)

maybe WARN_ON() here.. or drm_universal_plane_init(), or somewhere,
for missing mandatory fxns would be a nice thing to avoid explosions
under console_lock for first modeset?

BR,
-R

>                         continue;
>
>                 old_plane_state = old_state->plane_states[i];
> --
> 2.1.3
>
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
