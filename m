From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 17/27] drm/tegra: Add Tegra114 HDMI support
Date: Sat, 12 Oct 2013 13:41:23 +0200
Message-ID: <20131012114122.GF22284@mithrandir>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com>
 <1381134884-5816-18-git-send-email-treding@nvidia.com>
 <52587967.6050806@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="K/NRh952CO+2tg14"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52587967.6050806-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--K/NRh952CO+2tg14
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2013 at 04:19:19PM -0600, Stephen Warren wrote:
> On 10/07/2013 02:34 AM, Thierry Reding wrote:
> > From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > Tegra114 TMDS configuration requires a new peak_current field and the
> > driver current override bit has changed position.
>=20
> > diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
>=20
> >  static const struct tmds_config tegra2_tmds_config[] =3D {
> > @@ -223,6 +224,85 @@ static const struct tmds_config tegra3_tmds_config=
[] =3D {
>=20
> Not related to this patch, but those should have been named
> tegra20_tmds_config[] and tegra30_tmds_config[].
>=20
> >  static void tegra_hdmi_setup_tmds(struct tegra_hdmi *hdmi,
>=20
> > -	value =3D tmds->drive_current | DRIVE_CURRENT_FUSE_OVERRIDE;
> > -	tegra_hdmi_writel(hdmi, value, HDMI_NV_PDISP_SOR_LANE_DRIVE_CURRENT);
> > +	if (of_device_is_compatible(np, "nvidia,tegra114-hdmi")) {
>=20
> Let's not check this at run-time. Instead, host1x_drm_subdevs[]'s .data
> field should be used to contain either flags or a pointer to a
> configuration structure, either of which can be directly consulted to
> determine the properties of the HW in a feature-oriented/semantic way.
>=20
> drivers/gpio/gpio-tegra.c's
> tegra20_gpio_config/tegra30_gpio_config/tegra_gpio_of_match provide a
> good example of this.
>=20
> This means that if Tegra124 is identical to Tegra114, yet a hypothetical
> Tegra999 is different, you don't have to keep adjusting these if
> conditions throughout the code; they can simply refer to the same
> feature bit forever.

Okay, I'll see what I can come up with. It's unfortunately not as simple
as the GPIO driver's parameterization, and who knows what other
differences will be introduced in some later versions of this block.

What I mean is that at some point it becomes questionable whether it
makes sense to parameterize at all if you have to encode the register
offset and bit position within that register for a large number of bits.

Thierry

--K/NRh952CO+2tg14
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSWTViAAoJEN0jrNd/PrOhHGYP/j5ZnWTAXOPae8Q1fgb5m4T0
lCqkBtMePVzyIewlK9XiPduyn4Y0N86bDwdVHIg5VL1E1CFdElSiJbPrjo/SdvkK
4LvWyg+ElS5MP31+/0GBoe/x8lf2feiP4oLGETP/7lIQ/46IHfbibNw7SdxIsLXC
mcrN+41Pxn9JYSvHM11ySPOkJzCSPUr6YPhz+AhQqkCm1+ONN6KS/a54M5o4grHx
Xc/G6OLMgqViO6CqAbfwJEskp3PI6CeoJ79CP/Y9fjczFnQCaPflUIB0IZ/3UdQn
hDINxCX7T5ctQXGmOoiTTd+HTxtpqoA/Z9YdbbaHQK/g3ebza2WgJXoXe+yy0Xy5
tSj2jCBCEJ6QGG39YoMk3lOtfmoTyJvahi34n5cDCwfRppt/kAm6kCT3bLkiY0b2
dgDWonlrtl1ckYHX/Iyg5PKGdIORdw8rJ/GWuEaOtDW2ug3nYs8z0sC305M7DJs/
fx11xLsnWqAXJvDLX3HHx4oslIf7Lt+d1DVBPDOWf/0R0YK4AbTijQx1OBNF9tp1
Cl+DWe741h2UaTk47a23nLNQFD7JO2VvDEXOoL7U4x73xzI4rYTaeQdId8e7WPci
2SXxjQx2OuosQQVYV1HrKgCFldP9RNL6eHusD0DwMgGtX/SHhRyDyXZYIItTItw3
pByUP7q/X1oX7BV6u1s/
=pgK9
-----END PGP SIGNATURE-----

--K/NRh952CO+2tg14--
