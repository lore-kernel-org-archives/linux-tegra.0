From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_v2_5=2F5=5D_drm=2Ftegra=3A_plane=3A_Support_180=C2=B0_r?=
        =?UTF-8?Q?otation?=
Date: Mon, 15 Jun 2020 22:47:37 +0100
Message-ID: <CACvgo50P5i2jX6ZrMD=UuGr_bA=8MbFhYBWBNvkMcdCyJKS5xg@mail.gmail.com>
References: <20200614200121.14147-1-digetx@gmail.com> <20200614200121.14147-6-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200614200121.14147-6-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>, Derek Basehore <dbasehore-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sean Paul <sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ML dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi all,

Perhaps a silly question:

On Mon, 15 Jun 2020 at 08:28, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> Combining horizontal and vertical reflections gives us 180 degrees of
> rotation.
>
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/dc.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> index f31bca27cde4..ddd9b88f8fce 100644
> --- a/drivers/gpu/drm/tegra/dc.c
> +++ b/drivers/gpu/drm/tegra/dc.c

> +       if (rotation & DRM_MODE_ROTATE_180) {
> +               plane_state->reflect_x = !plane_state->reflect_x;
> +               plane_state->reflect_y = !plane_state->reflect_y;
> +       }
> +
As mentioned by Ville the above is already handled by
drm_rotation_simplify() ... although it makes me wonder:


>         err = drm_plane_create_rotation_property(&plane->base,
>                                                  DRM_MODE_ROTATE_0,
>                                                  DRM_MODE_ROTATE_0 |
> +                                                DRM_MODE_ROTATE_180 |
>                                                  DRM_MODE_REFLECT_X |
>                                                  DRM_MODE_REFLECT_Y);

Would it make sense for drm_plane_create_rotation_property() itself,
to add DRM_MODE_ROTATE_180, when both reflections are supported?

-Emil
