From: Allen <allen.lkml-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] drm/tegra: Replace dev_* with DRM_DEV_*
Date: Mon, 25 Sep 2017 13:57:07 +0530
Message-ID: <CAOMdWS+W6re5C_kHTzZJHBuvHMkq97T00vFcd7KB2cQFnqGDtQ@mail.gmail.com>
References: <1506271437-23058-1-git-send-email-harshasharmaiitr@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1506271437-23058-1-git-send-email-harshasharmaiitr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Harsha Sharma <harshasharmaiitr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, outreachy-kernel-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Harsha,

>
> @r@
> @@
>
> (
> -dev_info
> +DRM_DEV_INFO
> |
> -dev_err
> +DRM_DEV_ERROR
> |
> -dev_dbg
> +DRM_DEV_DEBUG
> )
>
> Signed-off-by: Harsha Sharma <harshasharmaiitr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> Changes in v2:
>  -Break line over 80 characters
>  -Changes in comments not required
>
>  drivers/gpu/drm/tegra/dc.c     |  53 +++++++-----
>  drivers/gpu/drm/tegra/dpaux.c  |  24 +++---
>  drivers/gpu/drm/tegra/dsi.c    |  68 ++++++++-------
>  drivers/gpu/drm/tegra/falcon.c |  16 ++--
>  drivers/gpu/drm/tegra/fb.c     |  22 +++--
>  drivers/gpu/drm/tegra/gem.c    |   8 +-
>  drivers/gpu/drm/tegra/gr2d.c   |  10 ++-
>  drivers/gpu/drm/tegra/gr3d.c   |  20 +++--
>  drivers/gpu/drm/tegra/hdmi.c   |  66 +++++++++------
>  drivers/gpu/drm/tegra/output.c |   8 +-
>  drivers/gpu/drm/tegra/rgb.c    |  12 +--
>  drivers/gpu/drm/tegra/sor.c    | 184 +++++++++++++++++++++++++----------------
>  drivers/gpu/drm/tegra/vic.c    |  15 ++--
>  13 files changed, 304 insertions(+), 202 deletions(-)
>
> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> index 4df3911..fbc9cc1 100644
> --- a/drivers/gpu/drm/tegra/dc.c
> +++ b/drivers/gpu/drm/tegra/dc.c
> @@ -1137,7 +1137,7 @@ static void tegra_dc_commit_state(struct tegra_dc *dc,
>

 One of the first things you'll probably need to do is to break this
huge patch into
smaller chunks. It becomes difficult to even review this patch(though
the change is
pretty straight forward.).

- Allen
