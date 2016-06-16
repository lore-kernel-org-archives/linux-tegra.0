From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: tegra-devfreq hangs TK1 with R21.4 u-boot
Date: Thu, 16 Jun 2016 18:16:12 +0200
Message-ID: <20160616161611.GC19360@ulmo.ba.sec>
References: <20160612034541.GA31426@jirafa.cyrius.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="H8ygTp4AXg6deix2"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160612034541.GA31426-IRMp5PtgtdoigzW5ZibpNwC/G2K4zDHf@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Michlmayr <tbm-R+vWnYXSFMfQT0dZR+AlfA@public.gmane.org>
Cc: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <srwarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

--H8ygTp4AXg6deix2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 11, 2016 at 08:45:41PM -0700, Martin Michlmayr wrote:
> I noticed that the Jetson TK1 hangs during boot (when/before mounting
> the SD disk) when CONFIG_ARM_TEGRA_DEVFREQ=3Dy is set and when u-boot
> from R21.4 is used (2014.10-rc2).
>=20
> The hang does not occur when I disable tegra-devfreq or when I use
> tegra-devfreq in combination with u-boot 2016.03 (from DENX upstream,
> built by Debian).
>=20
> Steps to reproduce:
>=20
> ARCH=3Darm make multi_v7_defconfig
> Set CONFIG_ARM_TEGRA_DEVFREQ=3Dy
> Boot from an external SD card and it will hang when/before mounting the
> SD card.

Stephen, any ideas what might be going on here?

Thierry

--H8ygTp4AXg6deix2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXYtDKAAoJEN0jrNd/PrOhesMP/i8W3/c4WZPcYk5QvPVeeyu9
JlZtRmVQvhfNGyk7rlsNjZalhDOySrpHJITPx4M4em/PE1PBO1XUdKd2Gn+fwU4C
WtyNkjepEFzhNEoMUvjG4v655BZOHCKhOns1KTBomstQenljgsR25pS9wS+K3zkU
vOseOqgxQt+ugVLDw2NaCIdY2NI9Q/Qm6ocvdh0kAv0YRnfjk6ALOpEMMwXhDPm1
2vXxcmfPUdcQZDFnsI6BZ1QQWYPQjT/3XZeEpKuhuIyEDI2lV+YadRRfeJwWCLcz
Tfh+aGty5WWZ5FO6yKUImVXQTvUYRdeZ6I5B1Jufio6TG6AydW2876STZVQyEjDu
wrPhS5hokCVu0z6BD95SknXe7//khHcg37fWU26mMw1RAqdEqcRiTo3hjIRvQKNT
hP6nPBhRIo5w4UCu2uToEfcz/SiUk0U9mYmMo3bqEF2MLmFc/KA7C4l8gmdJxZiW
e5GcMYe/jdF0xdYB3O/HxxvHun/cz9RxJroHZ5JSUYBPrYMAWzctjlE7darKq54G
1uXIKv2/fEQZaVDi+2sLVMXM7PxWE50Vim//hYr1BPICYfsSThJGlfbZeAbx/2L5
sjg8Jp8/OVvtn+V7TattAlOCyxOn1jeOhDeXrulkGlw4wzBhZ5AFqW4wrEB6ogZW
B9XiJ0DqguK/EDrq6Jtq
=Or/v
-----END PGP SIGNATURE-----

--H8ygTp4AXg6deix2--
