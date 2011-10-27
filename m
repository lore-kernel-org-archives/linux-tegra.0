From: Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>
Subject: Re: [PATCH v2 3/3] staging: nvec: add device tree support
Date: Thu, 27 Oct 2011 23:07:17 +0200
Message-ID: <20111027210717.GA9717@jak-linux.org>
References: <cover.1319658296.git.marvin24@gmx.de>
 <48050ec08d248a2a10b4f5faf6cac6b214041ebe.1319658296.git.marvin24@gmx.de>
 <74CDBE0F657A3D45AFBB94109FB122FF173E1B498B@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="y0ulUmNC+osPPQO6"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF173E1B498B-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "devel-tBiZLqfeLfOHmIFyCCdPziST3g8Odh+X@public.gmane.org" <devel-tBiZLqfeLfOHmIFyCCdPziST3g8Odh+X@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 27, 2011 at 12:17:25PM -0700, Stephen Warren wrote:
> Marc Dietrich wrote at Wednesday, October 26, 2011 1:59 PM:
> > This adds device tree support to the nvec driver. By using this method
> > it is no longer necessary to specify platform data through a board
> > file.
>=20
> You should document the binding in Documentation/devicetree/bindings.
>=20
> > @@ -892,6 +915,17 @@ static int tegra_nvec_resume(struct platform_devic=
e *pdev)
> >  #define tegra_nvec_resume NULL
> >  #endif
> >=20
> > +#if defined(CONFIG_OF)
>=20
> I think you can just remove the ifdef and always include this code. Yes, =
it'll
> result in slightly more rodata when !CONFIG_OF, but !CONFIG_OF isn't goin=
g to
> exist or be useful for Tegra for that much longer.

Often things do not actually build anymore without CONFIG_OF -- For example,
the code in -next failed to build a month ago or so (don't know if that's
still the case, though).
=20
> > +/* Match table for of_platform binding */
> > +static const struct of_device_id nvidia_nvec_of_match[] __devinitconst=
 =3D {
> > +	{ .compatible =3D "nvidia,nvec", },
>=20
> I'm not sure that nvidia,nvec is the right value, but need a little more
> background.
>=20
> It's my understanding that how this works is a little micro-controller
> exists on the board, handles various devices like the keyboard, and sends
> data to Tegra by making I2C master transactions. Isn't it the case that
> the micro-controller (or at least the SW running on it) is board-specific,
> and the same for the I2C protocol? If so, nvidia,nvec is a little generic;
> we probably need to name it compal,paz00-ec or something like that?

nvec means Nvidia Embedded Controller, and the protocol is not
device-specific anyway. There are some device-specific things,
the controller has some commands reserved for OEM usage. We do
not use those yet.

For an example of a non-paz00 device: The Advent Vega tablet and
similar (those with boards called "shuttle") also use nvec.

If you want to know details, you could search someone at your
company who knows more about it. There should be a few people
knowing things about nvec.

--=20
Julian Andres Klode  - Debian Developer, Ubuntu Member

See http://wiki.debian.org/JulianAndresKlode and http://jak-linux.org/.

--y0ulUmNC+osPPQO6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk6pyAUACgkQrCpf/gCCPsJ6FQCgswbCtkJvPspVcHESYuQUedoa
WqYAniiol4bf1lhLXAxPw6HQoZm3OuEX
=Fo0I
-----END PGP SIGNATURE-----

--y0ulUmNC+osPPQO6--
