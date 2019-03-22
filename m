From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/2] arm64: tegra: Add pinmux for PWM-based DFLL support
 on Shield platform
Date: Fri, 22 Mar 2019 10:52:44 +0100
Message-ID: <20190322095244.GF28640@ulmo>
References: <20190322071111.32432-1-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3399374847910234051=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190322071111.32432-1-josephl@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Joseph Lo <josephl@nvidia.com>
Cc: linux-tegra@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, linux-arm-kernel@lists.infradead.org, Jonathan Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============3399374847910234051==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Mjqg7Yu+0hL22rav"
Content-Disposition: inline


--Mjqg7Yu+0hL22rav
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 22, 2019 at 03:11:10PM +0800, Joseph Lo wrote:
> Add pinmux for PWM-based DFLL support on Shield platform.
>=20
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

There's been some discussion recently about moving away from programming
pinmux in the kernel because it isn't always safe to do that. The idea
is that early boot firmware (typically cboot) will already have set up
the pinmux, so there's no need to do it again in the kernel.

These look like you're going to change this pin to/from tristate at
runtime, so perhaps that's the kind of thing that we're okay with?

Adding Stephen for visibility.

Thierry

> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi b/arch/arm64/=
boot/dts/nvidia/tegra210-p2894.dtsi
> index 88a4b9333d84..c668f16c8574 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi
> @@ -1318,6 +1318,20 @@
>  				nvidia,open-drain =3D <TEGRA_PIN_DISABLE>;
>  			};
>  		};
> +
> +		dvfs_pwm_active_state: dvfs_pwm_active {
> +			dvfs_pwm_pbb1 {
> +				nvidia,pins =3D "dvfs_pwm_pbb1";
> +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +			};
> +		};
> +
> +		dvfs_pwm_inactive_state: dvfs_pwm_inactive {
> +			dvfs_pwm_pbb1 {
> +				nvidia,pins =3D "dvfs_pwm_pbb1";
> +				nvidia,tristate =3D <TEGRA_PIN_ENABLE>;
> +			};
> +		};
>  	};
> =20
>  	serial@70006000 {
> --=20
> 2.21.0
>=20

--Mjqg7Yu+0hL22rav
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlyUsGwACgkQ3SOs138+
s6HThw//VN74F6KqfhFhgnKwAkV2voCwap0OpJk7YNYCmL7iUi3y0D0ugZjLPT1w
FRaPS/J/896CD3+fSCXNhxQJHRQk85icEKCWB1/HusJqZITamVu5Zbel1EKC3mjH
6gAxzwrRKwY9NyPouSrfZWjusa/juZ77E0pxdYLqo7mZ2PQshW/+Mnp+wTtoDE4e
FkgCi2Ac+6JVrB/MxumMY5H0yBHE0PHZBj63/oFuCjzCgZbanWyyMiREdJKoaxDV
j3zbM6qS5T6KTboWCVslr1iMCUdmXR6gfwV4sZ23SgLThS+ybIkshchvSai0WMxF
7nN6GNp8NonAoW4e72paNUc2MZSTuYs9RZUKWSJKAeMjOK9tMsuaEd18P2Imyj9T
BS032q0iZOqpXoeVM49LVilN9363cS47EgKmRC1UFZO+IYD6G+vrOyHTQwI7TstA
GgHio6naBZUYlPzkUiJL/NfHI+OF8AFYKbhpbwHaSATkGG7aIlbVaxqjqwdrF/bQ
JX9w8NRUo9TqIiej+6BDBRLhFl2/rwJbJc4kPRirUn7dXN9Yx/COsX7ioX+0Y2xG
sRLYHtvjYEd8YFrP61LYf9LWh0pn5i6S65nIvHfv5gc3jW1xLPfGvfVOVnwzUGz4
Zq1GDlGj/ni2a7U7y7rY5MZ1XsVOmVq77hqN9zOgaN2BKGRQT78=
=DDyk
-----END PGP SIGNATURE-----

--Mjqg7Yu+0hL22rav--


--===============3399374847910234051==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3399374847910234051==--
