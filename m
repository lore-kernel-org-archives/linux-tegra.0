From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2] ARM: dts: tegra124: nyan-big: Add timings for RAM
 codes 4 and 6
Date: Tue, 29 Oct 2019 14:29:46 +0100
Message-ID: <20191029132946.GF508460@ulmo>
References: <20190723033744.4219-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="1Y7d0dPL928TPQbc"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190723033744.4219-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--1Y7d0dPL928TPQbc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 23, 2019 at 06:37:44AM +0300, Dmitry Osipenko wrote:
> Add timings for RAM codes 4 and 6 and a timing for 528mHz of RAM code 1,
> which was missed due to the clock driver bug that is fixed now in all of
> stable kernels.
>=20
> Tested-by: Steev Klimaszewski <steev@kali.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>=20
> Changelog:
>=20
> v2: Improved commit's message a tad.
>=20
>  arch/arm/boot/dts/tegra124-nyan-big-emc.dtsi | 7917 ++++++++++++++----
>  1 file changed, 6272 insertions(+), 1645 deletions(-)

Applied to for-5.5/arm/dt, thanks.

Thierry

--1Y7d0dPL928TPQbc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl24PsgACgkQ3SOs138+
s6HRhRAApan8ZzBX81Q/qwmDIQQNXoQw7XUsmTuuTdWXo4RjmCsIDH7oOjzG4r/4
QMujhT5FlJECfZOKffZJv2X19jz24TzCHdEmJP5bR8A95KaDZEp3KoT278etnzee
a05vW1hBf42mEvI6d5z48+i4k1uzhaBVeBTGN3GwaCbmskpc8efztRYJDvAONWfD
P81N2uBarekZlLTkvY9VNVdE0C3DfyGaAPUlzyiPZHYcPFVYLEKU1dsB1UcZRiE6
fdn62simDa1zZEAlIAN+Oh06Cp106UwUq4ktALQR/p8NyJTPQpByNwldSoXutB5P
gzMyFYUdq5j7Xd2GE1dozlkB3+OnSvUzC6OlNVAs1in2V4xOVj3CBUFy924U9Xo5
MKTkes0FJMsQUEP3WiLHBhp8oTJWxt6REJtEXIQBLVFjIyYfqHPKCx+dx/u08r9x
RNMVlyVM+lTR/POTX5QW3/GMnqwv4f7KMUntN+A3+fpwiJFzPspLQZJ2ZUM1akcA
siUMc9C21YSw4tJ+z6tGHZBvY8mGzFBIr0PPFhhvDFTxRO30YTfTPybgtNAHzmdz
4O22fcpzcTuDYloX9sRQ3lQhJD8TkS12d8jDRIE2SbT/AcIkDH8FEoeHRZAhOiE1
BG8Qwb4dahKDaKDoMYpq2YmiXDGZ1nFJP5UuNMvXmBxqt1dU3t4=
=ZqeM
-----END PGP SIGNATURE-----

--1Y7d0dPL928TPQbc--
