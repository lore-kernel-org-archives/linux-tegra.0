From: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 16/24] drm/tegra: switch to postclose
Date: Mon, 13 Mar 2017 15:10:12 -0400
Message-ID: <20170313191012.GO20329@art_vandelay>
References: <20170308141257.12119-1-daniel.vetter@ffwll.ch>
 <20170308141257.12119-17-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170308141257.12119-17-daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Cc: DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Intel Graphics Development <intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Mar 08, 2017 at 03:12:49PM +0100, Daniel Vetter wrote:
> I didn't spot anything that would require ordering here (well not
> anywhere else either), and I'm trying to unify at least modern drivers
> on one close hook.
> 
> Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>

Reviewed-by: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

> ---
>  drivers/gpu/drm/tegra/drm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> index dba4e090d3df..3b419f9dbf4d 100644
> --- a/drivers/gpu/drm/tegra/drm.c
> +++ b/drivers/gpu/drm/tegra/drm.c
> @@ -804,7 +804,7 @@ static const struct file_operations tegra_drm_fops = {
>  	.llseek = noop_llseek,
>  };
>  
> -static void tegra_drm_preclose(struct drm_device *drm, struct drm_file *file)
> +static void tegra_drm_postclose(struct drm_device *drm, struct drm_file *file)
>  {
>  	struct tegra_drm_file *fpriv = file->driver_priv;
>  	struct tegra_drm_context *context, *tmp;
> @@ -868,7 +868,7 @@ static struct drm_driver tegra_drm_driver = {
>  	.load = tegra_drm_load,
>  	.unload = tegra_drm_unload,
>  	.open = tegra_drm_open,
> -	.preclose = tegra_drm_preclose,
> +	.postclose = tegra_drm_postclose,
>  	.lastclose = tegra_drm_lastclose,
>  
>  #if defined(CONFIG_DEBUG_FS)
> -- 
> 2.11.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
