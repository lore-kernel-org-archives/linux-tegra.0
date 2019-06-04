From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 04/16] PM / devfreq: tegra: Don't ignore clk errors
Date: Tue, 4 Jun 2019 12:57:12 +0200
Message-ID: <20190604105712.GD16519@ulmo>
References: <20190501233815.32643-1-digetx@gmail.com>
 <20190501233815.32643-5-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="48TaNjbzBVislYPb"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190501233815.32643-5-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--48TaNjbzBVislYPb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 02, 2019 at 02:38:03AM +0300, Dmitry Osipenko wrote:
> The clk_set_min_rate() could fail and in this case clk_set_rate() sets
> rate to 0, which may drop EMC rate to minimum and make machine very
> difficult to use.
>=20
> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/devfreq/tegra-devfreq.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--48TaNjbzBVislYPb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlz2TogACgkQ3SOs138+
s6HPQA/6AikYDFOqfBGBSOAYrjtU4L+1ThqX2wVgtvUgiyrO3yuj2hiGpLKHjlz1
klMtRdjUTW7TrfAyhH7G/LCui5PrLcHq8VdavnhvKokoHJXRMsmurAITlOl7l9E0
KPLObjGrUwBAUaU5Ktk4Ni/VK8FkBB8hkePiz1kJrZHBF0wPUGTq7c409CBoZ4Ug
dzNtGfBzW728QIoMOfIJ2RQN95QFULCt0jpablIHMyXFP5Lc4XvFI51Cl1/eq146
+9v6gJmUAXb1DMdAGHFclyLGR1eUCoxvfK2Ghb+FUTMJlLt6n/XhEFZAk3ulKTgF
iD+J5tUqmv2XgEeGl+GGObOQbiVWAUuYQziJIAsbFsSXQBhNHdYV1TdBPK7hb4tn
WNfm0s9XRo/6m60r8syUbaFOmSZWIF37XhLmw+ScnZJ0k3iHpo0FXuA338EWXkmU
NBPHkh32iRrUeYub4tuKeSbEi5taG2ZNO4boE73pdzCfHq/h3Ndfqxj09t6y7A9t
m/FMYsMZXDy7thSetWKAQ9tmYQnnU7PoCh5kE45QowkVQEl9pv/rh3rgl7VPCshq
v7wkFd3wzcMyoer/G26m5tFnetPDOsrSampkZrdCoCWrCA420e62E39tm1BsL/Js
Bmc9So5yijDScVtMA6ZQ/TTvpnwoiQjLgn+A0ATndNHDteYE4Cw=
=w8OB
-----END PGP SIGNATURE-----

--48TaNjbzBVislYPb--
