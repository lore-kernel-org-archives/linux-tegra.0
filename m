From: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 5/6] drm: tegra: clean out old gem prototypes
Date: Thu, 20 Dec 2012 10:48:23 +0800
Message-ID: <50D27C77.7040909@gmail.com>
References: <1355953137-31563-1-git-send-email-dev@lynxeye.de> <1355953137-31563-6-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1355953137-31563-6-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

We must forget about that. I believe no one read the header files while
review. So thanks. :)

Mark
On 12/20/2012 05:38 AM, Lucas Stach wrote:
> There is no gem.c anymore, those functions are implemented by the
> drm_cma_helpers now.
>=20
> Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/drm.h | 18 ------------------
>  1 Datei ge=C3=A4ndert, 18 Zeilen entfernt(-)
>=20
> diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.=
h
> index eae1f56..71e61f2 100644
> --- a/drivers/gpu/drm/tegra/drm.h
> +++ b/drivers/gpu/drm/tegra/drm.h
> @@ -205,24 +205,6 @@ extern int tegra_output_parse_dt(struct tegra_ou=
tput *output);
>  extern int tegra_output_init(struct drm_device *drm, struct tegra_ou=
tput *output);
>  extern int tegra_output_exit(struct tegra_output *output);
> =20
> -/* from gem.c */
> -extern struct tegra_gem_object *tegra_gem_alloc(struct drm_device *d=
rm,
> -						size_t size);
> -extern int tegra_gem_handle_create(struct drm_device *drm,
> -				   struct drm_file *file, size_t size,
> -				   unsigned long flags, uint32_t *handle);
> -extern int tegra_gem_dumb_create(struct drm_file *file, struct drm_d=
evice *drm,
> -				 struct drm_mode_create_dumb *args);
> -extern int tegra_gem_dumb_map_offset(struct drm_file *file,
> -				     struct drm_device *drm, uint32_t handle,
> -				     uint64_t *offset);
> -extern int tegra_gem_dumb_destroy(struct drm_file *file,
> -				  struct drm_device *drm, uint32_t handle);
> -extern int tegra_drm_gem_mmap(struct file *filp, struct vm_area_stru=
ct *vma);
> -extern int tegra_gem_init_object(struct drm_gem_object *obj);
> -extern void tegra_gem_free_object(struct drm_gem_object *obj);
> -extern struct vm_operations_struct tegra_gem_vm_ops;
> -
>  /* from fb.c */
>  extern int tegra_drm_fb_init(struct drm_device *drm);
>  extern void tegra_drm_fb_exit(struct drm_device *drm);
>=20
