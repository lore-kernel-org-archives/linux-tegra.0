From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v2 4/5] drm/tegra: Implement VBLANK support
Date: Mon, 11 Feb 2013 10:13:01 +0100
Message-ID: <20130211091301.GC3423@avionic-0098.mockup.avionic-design.de>
References: <1358179560-26799-1-git-send-email-thierry.reding@avionic-design.de>
 <1358179560-26799-5-git-send-email-thierry.reding@avionic-design.de>
 <50FECE63.7090009@tuebingen.mpg.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZwgA9U+XZDXt4+m+"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50FECE63.7090009-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--ZwgA9U+XZDXt4+m+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 22, 2013 at 06:37:39PM +0100, Mario Kleiner wrote:
> On 14.01.13 17:05, Thierry Reding wrote:
> >Implement support for the VBLANK IOCTL. Note that Tegra is somewhat
> >special in this case because it doesn't use the generic IRQ support
> >provided by the DRM core (DRIVER_HAVE_IRQ) but rather registers one
> >interrupt handler for each display controller.
> >
> >While at it, clean up the way that interrupts are enabled to ensure
> >that the VBLANK interrupt only gets enabled when required.
> >
> >Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
>=20
> ... snip ...
>=20
> >  struct drm_driver tegra_drm_driver =3D {
> >  	.driver_features =3D DRIVER_BUS_PLATFORM | DRIVER_MODESET | DRIVER_GE=
M,
> >  	.load =3D tegra_drm_load,
> >@@ -96,6 +136,10 @@ struct drm_driver tegra_drm_driver =3D {
> >  	.open =3D tegra_drm_open,
> >  	.lastclose =3D tegra_drm_lastclose,
> >
> >+	.get_vblank_counter =3D drm_vblank_count,
>=20
> -> .get_vblank_counter =3D drm_vblank_count is a no-op.
>=20
> .get_vblank_counter() is supposed to return some real hardware
> vblank counter value to reinitialize the software vblank counter at
> vbl irq enable time. That software counter gets queried via
> drm_vblank_count(). If you hook this up to drm_vblank_count() it
> essentially returns a constant, frozen vblank count, it has the same
> effect as returning zero or any other constant value -- You lose all
> vblank counter increments during vblank irq off time. The same
> problem is present in nouveau-kms.
>=20
> I think it would be better to either implement a real hw counter
> query, or some function with a /* TODO: Implement me properly */
> comment which returns zero, so it is clear something is missing
> here.

I've finally managed to find some time to look into this some more. The
comment atop the drm_driver.get_vblank_counter() field actually suggests
that drivers should set this to drm_vblank_count if no real hardware
counter is supported.

Now it seems like we may get functionality to obtain the real VBLANK
counter once the syncpoint support is merged, so maybe we can leave this
as-is until then and replace it with a proper implementation at that
point in time?

Alternatively I could use a small wrapper with an explicit comment that
this should be implemented using the upcoming syncpoint support.

Thierry

--ZwgA9U+XZDXt4+m+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRGLYdAAoJEN0jrNd/PrOh/XUQAJXFFoRT4qMoiwjAwYhpqJt2
sw7oEIiyscVHrkfsQRBjM2JNxBchtzoxhzjdMs/6/Czllmks1TnvRR5urzuIKe7F
xJELpeIhfq2OF61jdeQqbFKH+ZRX+yKxk7AV1YvK7czxeeEZqfXsimmhnEhKXAhP
Fz2pJw9p1wYcDxz+yNCYq1jzVlLxRgczZxgaJcVZCHIOT8AwGcpy1xMFgqa3bBBq
yFmVow12wsZtU/33wWrctlGQYLrt0qKYTahiWjIVvaKsbnnPpJusWm7JIg6/RDFj
0E4w1v1Bj3qQMtKCPe/k+h+vYDfrFayjVcK12PBCzwlt5tk7ZaGqNwkmN1Vl7Aou
VJEWyMLCAjCAmonwCiAXbzAFYPoeUJuDQZ3XOKIBGE/6ESwH+dP4OMY2hhvh+sEK
aualCzd2s8vdVj+RF8dso3iMM7M/rt1S75rH0dzG+PyUdb7j6UjyjBBMuZJuMGin
sb09Jp3cWXSMv3Ui5Veqgn87gLkkuCeJ/VtNVB04A4KQoMC3lm9QiZ4j53C5L2Oh
Co5zjJ2mH0G5pXGrhwZ6MHIPxZbGVj/0DPVUtlMlK/p/UkmWqpY8a/Xixi9NF9mD
ldZLi2l67hcs5Dtq0TeJTsECJeaRgiI0JR1lKiA0PEtkctAwBBlGEA+gfig6giZJ
Uy6hhb38WHsGuus3G/FX
=H1EG
-----END PGP SIGNATURE-----

--ZwgA9U+XZDXt4+m+--
