From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RFC PATCH 11/13] arm64: tegra: Add SOR power-domain node
Date: Fri, 17 Jun 2016 18:44:46 +0200
Message-ID: <20160617164446.GK27475@ulmo.ba.sec>
References: <1466165027-17917-1-git-send-email-jonathanh@nvidia.com>
 <1466165027-17917-12-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1596427612=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1466165027-17917-12-git-send-email-jonathanh@nvidia.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, Wolfram Sang <wsa@the-dreams.de>, Stephen Warren <swarren@wwwdotorg.org>, dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============1596427612==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="W2ydbIOJmkm74tJ2"
Content-Disposition: inline


--W2ydbIOJmkm74tJ2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 17, 2016 at 01:03:45PM +0100, Jon Hunter wrote:
> Add node for SOR power-domain for Tegra210 and populate the SOR
> power-domain phandle for SOR and DPAUX nodes that are dependent
> on this power-domain.
>=20
> Please note that although neither the SOR or DPAUX drivers currently
> support runtime power-management, by populating the power-domain node
> the SOR power-domain will be turned on before probing SOR or DPAUX
> devices and kept on while the devices are bound.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/d=
ts/nvidia/tegra210.dtsi
> index ebf44f4059f8..94f780b43037 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> @@ -34,6 +34,7 @@
>  			clock-names =3D "dpaux", "parent";
>  			resets =3D <&tegra_car 207>;
>  			reset-names =3D "dpaux";
> +			power-domains =3D <&pd_sor>;
>  			status =3D "disabled";
>  		};
> =20
> @@ -154,6 +155,7 @@
>  			clock-names =3D "sor", "parent", "dp", "safe";
>  			resets =3D <&tegra_car 182>;
>  			reset-names =3D "sor";
> +			power-domains =3D <&pd_sor>;
>  			status =3D "disabled";
>  		};
> =20
> @@ -168,6 +170,7 @@
>  			clock-names =3D "sor", "parent", "dp", "safe";
>  			resets =3D <&tegra_car 183>;
>  			reset-names =3D "sor";
> +			power-domains =3D <&pd_sor>;
>  			status =3D "disabled";
>  		};
> =20
> @@ -180,6 +183,7 @@
>  			clock-names =3D "dpaux", "parent";
>  			resets =3D <&tegra_car 181>;
>  			reset-names =3D "dpaux";
> +			power-domains =3D <&pd_sor>;
>  			status =3D "disabled";
>  		};
> =20
> @@ -592,6 +596,20 @@
>  				resets =3D <&tegra_car 198>;
>  				#power-domain-cells =3D <0>;
>  			};
> +
> +			pd_sor: sor {
> +				clocks =3D <&tegra_car TEGRA210_CLK_SOR0>,
> +					 <&tegra_car TEGRA210_CLK_DSIA>,
> +					 <&tegra_car TEGRA210_CLK_DSIB>,
> +					 <&tegra_car TEGRA210_CLK_MIPI_CAL>,

Does this mean that all of these clocks will be running while the SOR
partition is enabled? Seems like a waste because we rarely need MIPI_CAL
and DSIA and DSIB are completely unused on boards that for example have
only an HDMI output.

I vaguely remember the power domain driver only making sure these are
enabled during the partition power transitions, so perhaps my concerns
aren't justified?

Thierry

--W2ydbIOJmkm74tJ2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXZCj+AAoJEN0jrNd/PrOhKHAP/0i6uSOk458Cu7qsbQvOYT3c
XYP9G93dLfu2gEz9Dtbnz3e/mEYgMAfk7GBH/3IoFbyspflRYrstSi0a+iUIt4FZ
g6+6O+3zcUXrUTpqEG2jhmMSFqc1BKU8ufHseOyAL2TaNP0mJ7BUCOQgdkq8R/+O
A4Radpanu0Kg+G3tBvAmc12y3/9j0aVfdETvK06m84zC3PSZfuMDQWElTIbYwwCg
nW1UrTbNXAgXHKc3I2x8ZXX4XOILjNj+BErnsvqcuwp8hdgBWa4vmzWK+fMhqAMC
F7tjwAiPyJR4x+MsWrQx9AYfTSmy8XCobJ64h0T+M+5z/ABaavJU0mP3XOqxpZM3
hRIoIBn64tUMfAeP/yXJ/KL7qBQhe4eHu79nKegPeAsAVij4AtRfJvrLIPBb5sJI
q1ZIHkRp4GBy5t4S223wKM3C3RUM3IDUBaPNswFWlSihAo5t2ZUaMGCiAMLylVIm
TXtEVK1rjPyGEY3+hVc7SR9AJjapMIfGAaGieuMKM1Fa1RxD2bLyl/cppK7ce9FY
ji8krESWDFou/ahEABTSb+Tsl3Le8SDHVWfk9hZBUFJnBpYNI+qduwEazqahRrMC
MOXv6IsGgHfE5KEYxJYPmxyT6S6fEzIr50FI/Pxt6LzhX858HDVfB0T4MjY8uksM
a2cV0ZRrp43n558UDkW5
=lFhB
-----END PGP SIGNATURE-----

--W2ydbIOJmkm74tJ2--

--===============1596427612==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1596427612==--
