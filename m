From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] drm/tegra: Sanitize format modifiers
Date: Mon, 27 Nov 2017 12:18:19 +0100
Message-ID: <20171127111819.GA23315@ulmo>
References: <20171127093948.20986-1-thierry.reding@gmail.com>
 <20171127093948.20986-3-thierry.reding@gmail.com>
 <20171127103814.qnywbtkjqzaj74g4@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="YZ5djTAD1cGYuMQK"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171127103814.qnywbtkjqzaj74g4-dv86pmgwkMBes7Z6vYuT8azUEOm+Xw19@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--YZ5djTAD1cGYuMQK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 27, 2017 at 11:38:14AM +0100, Daniel Vetter wrote:
> On Mon, Nov 27, 2017 at 10:39:48AM +0100, Thierry Reding wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > The existing format modifier definitions were merged prematurely, and
> > recent work has unveiled that the definitions are suboptimal in several
> > ways:
> >=20
> >   - The format specifiers, except for one, are not Tegra specific, but
> >     the names don't reflect that.
> >   - The number space is split into two, reserving 32 bits for some
> >     "parameter" which most of the modifiers are not going to have.
> >   - Symbolic names for the modifiers are not using the standard
> >     DRM_FORMAT_MOD_* prefix, which makes them awkward to use.
> >   - The vendor prefix NV is somewhat ambiguous.
> >=20
> > Fortunately, nobody's started using these modifiers, so we can still fix
> > the above issues. Do so by using the standard prefix. Also, remove TEGRA
> > from the name of those modifiers that exist on NVIDIA GPUs as well. In
> > case of the block linear modifiers, make the "parameter" smaller (4
> > bits, though only 6 values are valid) and don't let that leak into any
> > of the other modifiers.
> >=20
> > Finally, also use the more canonical NVIDIA instead of the ambiguous NV
> > prefix.
> >=20
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  drivers/gpu/drm/tegra/fb.c    | 35 +++++++++++++++++++++++++++++------
> >  include/uapi/drm/drm_fourcc.h | 36 +++++++++++++++++++-----------------
> >  2 files changed, 48 insertions(+), 23 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
> > index 80540c1c66dc..406e895d82cc 100644
> > --- a/drivers/gpu/drm/tegra/fb.c
> > +++ b/drivers/gpu/drm/tegra/fb.c
> > @@ -54,17 +54,40 @@ int tegra_fb_get_tiling(struct drm_framebuffer *fra=
mebuffer,
> >  	struct tegra_fb *fb =3D to_tegra_fb(framebuffer);
> >  	uint64_t modifier =3D fb->base.modifier;
> > =20
> > -	switch (fourcc_mod_tegra_mod(modifier)) {
> > -	case NV_FORMAT_MOD_TEGRA_TILED:
> > +	switch (modifier) {
> > +	case DRM_FORMAT_MOD_NVIDIA_TEGRA_TILED:
> >  		tiling->mode =3D TEGRA_BO_TILING_MODE_TILED;
> >  		tiling->value =3D 0;
> >  		break;
> > =20
> > -	case NV_FORMAT_MOD_TEGRA_16BX2_BLOCK(0):
> > +	case DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(0):
> >  		tiling->mode =3D TEGRA_BO_TILING_MODE_BLOCK;
> > -		tiling->value =3D fourcc_mod_tegra_param(modifier);
> > -		if (tiling->value > 5)
> > -			return -EINVAL;
> > +		tiling->value =3D 0;
> > +		break;
> > +
> > +	case DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(1):
> > +		tiling->mode =3D TEGRA_BO_TILING_MODE_BLOCK;
> > +		tiling->value =3D 1;
> > +		break;
> > +
> > +	case DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(2):
> > +		tiling->mode =3D TEGRA_BO_TILING_MODE_BLOCK;
> > +		tiling->value =3D 2;
> > +		break;
> > +
> > +	case DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(3):
> > +		tiling->mode =3D TEGRA_BO_TILING_MODE_BLOCK;
> > +		tiling->value =3D 3;
> > +		break;
> > +
> > +	case DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(4):
> > +		tiling->mode =3D TEGRA_BO_TILING_MODE_BLOCK;
> > +		tiling->value =3D 4;
> > +		break;
> > +
> > +	case DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(5):
> > +		tiling->mode =3D TEGRA_BO_TILING_MODE_BLOCK;
> > +		tiling->value =3D 5;
> >  		break;
> > =20
> >  	default:
> > diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourc=
c.h
> > index a76ed8f9e383..e04613d30a13 100644
> > --- a/include/uapi/drm/drm_fourcc.h
> > +++ b/include/uapi/drm/drm_fourcc.h
> > @@ -178,7 +178,7 @@ extern "C" {
> >  #define DRM_FORMAT_MOD_VENDOR_NONE    0
> >  #define DRM_FORMAT_MOD_VENDOR_INTEL   0x01
> >  #define DRM_FORMAT_MOD_VENDOR_AMD     0x02
> > -#define DRM_FORMAT_MOD_VENDOR_NV      0x03
> > +#define DRM_FORMAT_MOD_VENDOR_NVIDIA  0x03
> >  #define DRM_FORMAT_MOD_VENDOR_SAMSUNG 0x04
> >  #define DRM_FORMAT_MOD_VENDOR_QCOM    0x05
> >  #define DRM_FORMAT_MOD_VENDOR_VIVANTE 0x06
> > @@ -338,29 +338,17 @@ extern "C" {
> >   */
> >  #define DRM_FORMAT_MOD_VIVANTE_SPLIT_SUPER_TILED fourcc_mod_code(VIVAN=
TE, 4)
> > =20
> > -/* NVIDIA Tegra frame buffer modifiers */
> > -
> > -/*
> > - * Some modifiers take parameters, for example the number of vertical =
GOBs in
> > - * a block. Reserve the lower 32 bits for parameters
> > - */
> > -#define __fourcc_mod_tegra_mode_shift 32
> > -#define fourcc_mod_tegra_code(val, params) \
> > -	fourcc_mod_code(NV, ((((__u64)val) << __fourcc_mod_tegra_mode_shift) =
| params))
> > -#define fourcc_mod_tegra_mod(m) \
> > -	(m & ~((1ULL << __fourcc_mod_tegra_mode_shift) - 1))
> > -#define fourcc_mod_tegra_param(m) \
> > -	(m & ((1ULL << __fourcc_mod_tegra_mode_shift) - 1))
> > +/* NVIDIA frame buffer modifiers */
> > =20
> >  /*
> >   * Tegra Tiled Layout, used by Tegra 2, 3 and 4.
> >   *
> >   * Pixels are arranged in simple tiles of 16 x 16 bytes.
> >   */
> > -#define NV_FORMAT_MOD_TEGRA_TILED fourcc_mod_tegra_code(1, 0)
> > +#define DRM_FORMAT_MOD_NVIDIA_TEGRA_TILED fourcc_mod_code(NVIDIA, 1)
> > =20
> >  /*
> > - * Tegra 16Bx2 Block Linear layout, used by TK1/TX1
> > + * 16Bx2 Block Linear layout, used by desktop GPUs, and Tegra K1 and l=
ater
> >   *
> >   * Pixels are arranged in 64x8 Groups Of Bytes (GOBs). GOBs are then s=
tacked
> >   * vertically by a power of 2 (1 to 32 GOBs) to form a block.
> > @@ -380,7 +368,21 @@ extern "C" {
> >   * Chapter 20 "Pixel Memory Formats" of the Tegra X1 TRM describes thi=
s format
> >   * in full detail.
> >   */
> > -#define NV_FORMAT_MOD_TEGRA_16BX2_BLOCK(v) fourcc_mod_tegra_code(2, v)
> > +#define DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(v) \
> > +	fourcc_mod_code(NVIDIA, 0x10 | ((v) & 0xf))
> > +
> > +#define DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK_ONE_GOB \
> > +	fourcc_mod_code(NVIDIA, 0x10)
>=20
> Any reason to start at 0x10?

As best I can tell the block size parameter is 4 bits wide, although
only the six values defined here are actually valid. So I thought I'd
align this to four bits and give it four bits in case this ever needs
to expand beyond the existing 6 values. I doubt that somewhat, but it
would be awkward to have discontinuities in this. We could still get
discontinuities if this ever extends beyond four bits, but we can
cross that bridge when we get to it. reserving four bits for this
parameter seems like a good compromise to me.

We can always pack other modifiers in the gap between 1 and 0x10 to
fill it up.

> Either way I think this looks a lot more in line with what we generally
> do with modifiers:
>=20
> Acked-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>

Thanks!
Thierry

--YZ5djTAD1cGYuMQK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlob9HkACgkQ3SOs138+
s6FlKA//WpReLAy4PDvr3V/d5EEIXxmbOCYE+oyZhVhOihh4bs+7lSk7eiv1+NNe
QnlK6mre6IIq5/X37GoJqN8PMxzxKtkFcpkBEbF3k3JnYYa0QKZJEQmtB50FWGUA
99GoyDvYDWrV847tPdXh4PFYd78CfDXjvDQE5DKn/fPLclpU+M+Gp+ImoqhLMMAJ
46dm9b/NJNYQzWjTKO7rEuAboFJ3OI90OuWrJmv08LJ21RaNvo8ros6lFIs5kt1w
UzwLZ+lOHjrNE993bzUaYkWW9JGI9V+oAI41dXlJoQ82/t3kVY/llc5D6qF0Bnt7
hCHDeNI4ufYLh46o4u8jfy1wdYyy9OkcX4ZRbLvzDyisQJzp9PZ3NA3Kc6I8hJde
5jpPjOEFa47+wL2wGkNeShxP+25yWiVN7NRP7AzExYRAUjPYUq2f49sfQlxpjOyD
fFa3HP0YCQt8WUYZj44Ee1A2AGjzJGsQp29lbnP0rZ//BnaoXRexwr2ChrSTiO1z
lc9sp/vnQn3p6f/Huq7lpGEyX1EYxyC4XqLaeqrOoxmaPsnnxU5toOjsUnGarHlX
Nj9gEfzHEiOr7gu9EO+sYqnFmQkA6KGQr8zIxP4WP8hTMLjNOg17Kz4gWgsVu0bn
jdeBl/QYa0tVTXaXRrc2gr4OyMdJ7gpqsIwvjEyvKx5+LJcLWIA=
=zxIg
-----END PGP SIGNATURE-----

--YZ5djTAD1cGYuMQK--
