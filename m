From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/2] drm/tegra: Fix possible CRTC mask for RGB outputs
Date: Mon, 13 Jan 2014 10:44:26 -0700
Message-ID: <52D425FA.10402@wwwdotorg.org>
References: <1389622894-9574-1-git-send-email-treding@nvidia.com> <1389622894-9574-2-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1389622894-9574-2-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/13/2014 07:21 AM, Thierry Reding wrote:
> The mask of possible CRTCs that an output (DRM encoder) can be attach=
ed
> to is relative to the position within the DRM device's list of CRTCs.
> Deferred probing can cause this to not match the pipe number associat=
ed
> with a CRTC. Use the newly introduced drm_crtc_mask() to compute the
> mask by looking up the proper index of the given CRTC in the list.

> diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.=
c

> @@ -258,7 +258,7 @@ int tegra_dc_rgb_init(struct drm_device *drm, str=
uct tegra_dc *dc)

> -	rgb->output.encoder.possible_crtcs =3D 1 << dc->pipe;
> +	rgb->output.encoder.possible_crtcs =3D drm_crtc_mask(&dc->base);

=46or me, on top of either next-20140109 or next-20140113, this causes:

> drivers/gpu/drm/tegra/rgb.c: In function =91tegra_dc_rgb_init=92:
> drivers/gpu/drm/tegra/rgb.c:261:2: error: implicit declaration of fun=
ction =91drm_crtc_mask=92 [-Werror=3Dimplicit-function-declaration]
