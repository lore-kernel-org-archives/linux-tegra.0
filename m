From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] drm/tegra: Fix possible CRTC mask for RGB outputs
Date: Tue, 14 Jan 2014 14:45:58 +0100
Message-ID: <20140114134557.GD10936@ulmo.nvidia.com>
References: <1389622894-9574-1-git-send-email-treding@nvidia.com>
 <1389622894-9574-2-git-send-email-treding@nvidia.com>
 <52D425FA.10402@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rz+pwK2yUstbofK6"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52D425FA.10402-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--rz+pwK2yUstbofK6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2014 at 10:44:26AM -0700, Stephen Warren wrote:
> On 01/13/2014 07:21 AM, Thierry Reding wrote:
> > The mask of possible CRTCs that an output (DRM encoder) can be attached
> > to is relative to the position within the DRM device's list of CRTCs.
> > Deferred probing can cause this to not match the pipe number associated
> > with a CRTC. Use the newly introduced drm_crtc_mask() to compute the
> > mask by looking up the proper index of the given CRTC in the list.
>=20
> > diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
>=20
> > @@ -258,7 +258,7 @@ int tegra_dc_rgb_init(struct drm_device *drm, struc=
t tegra_dc *dc)
>=20
> > -	rgb->output.encoder.possible_crtcs =3D 1 << dc->pipe;
> > +	rgb->output.encoder.possible_crtcs =3D drm_crtc_mask(&dc->base);
>=20
> For me, on top of either next-20140109 or next-20140113, this causes:
>=20
> > drivers/gpu/drm/tegra/rgb.c: In function =E2=80=98tegra_dc_rgb_init=E2=
=80=99:
> > drivers/gpu/drm/tegra/rgb.c:261:2: error: implicit declaration of funct=
ion =E2=80=98drm_crtc_mask=E2=80=99 [-Werror=3Dimplicit-function-declaratio=
n]

It depends on a separate patch that I sent earlier yesterday. I thought
I had Cc'ed you and the linux-tegra mailing list on that patch, but I'm
misremembering apparently. Here's a link to the patch:

	https://patchwork.kernel.org/patch/3475421/

Thierry

--rz+pwK2yUstbofK6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJS1T+VAAoJEN0jrNd/PrOhj5oP/1VBMw7dtqtaznKhFQ7TQ24c
W8rRvX6jno1/XTVnXBekMmygV2fQGN5UXOhg5+naAs6KuRU+UAxEirHmkpMTpHaK
CHxwGaGVnqeZMDGKocGeiMfmRtQzhlLwtkTxKvJPF1yHFBNNaYCZVvs/znUuQnRD
TSA8/uwbJHbe3SGBGqQFQ84GWnsmjvsae0Y9rNrIarTFW/AR0m9Iudf+XpJm0o14
s2MNqj6S0lk1BexSdkgUZ+xFu9BrjIPYSdQkxFP76mctLXsQAR91OCSYqUT2Yg28
fOjf+SnUNhL1t7B/DoanIfnvPWaLjIO203FHbP602wtnRUS20qa0Nq/dtGyjQRDS
wOTsdxWO4blvaL57FHNTslodVvaujGnUvxM0BUhX/5pXW9kUbnGpNHtBtr7YT+re
8tluUDV20lVb/zU664O0rUZ5PH1jiW4KtxoIsOHLxhpyxaRCObC6E888mpRlcLEm
ydaor5W0oOBmNnshN3V2I0IbDLn6NklOzp4acjxyAjmAID0qPnctl156dfvRBbjS
OslOvZ+YPmZjmbZqcD4k5iUyKDmYCAAjl5lIXBxE2rAY2I6DV4j74uyihbF+9j95
uWIzG3Am3/OQzO99Es11dkau+hYR4JJfX8EtWpM/xLdWswoBLJlOVFLiuTkdbjd8
jWBBv6IZReNVYSJVt9Ed
=r1br
-----END PGP SIGNATURE-----

--rz+pwK2yUstbofK6--
