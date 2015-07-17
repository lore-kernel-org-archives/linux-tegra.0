From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RESEND PATCH v3] ARM: tegra124: pmu support
Date: Fri, 17 Jul 2015 10:59:47 +0200
Message-ID: <20150717085946.GB3057@ulmo>
References: <1436808945-14524-1-git-send-email-khuey@kylehuey.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3uo+9/B/ebqu+fSQ"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1436808945-14524-1-git-send-email-khuey@kylehuey.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kyle Huey <me@kylehuey.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>, "open list:TEGRA ARCHITECTUR..." <linux-tegra@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>, Kyle Huey <khuey@kylehuey.com>
List-Id: linux-tegra@vger.kernel.org


--3uo+9/B/ebqu+fSQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 13, 2015 at 10:35:45AM -0700, Kyle Huey wrote:
> This patch modifies the device tree for tegra124 based devices to enable
> the Cortex A15 PMU.  The interrupt numbers are taken from NVIDIA TRM
> DP-06905-001_v03p.  This patch was tested on a Jetson TK1.
>=20
> Updated for proper ordering and to add interrupt-affinity values.
>=20
> Signed-off-by: Kyle Huey <khuey@kylehuey.com>
> ---
>  arch/arm/boot/dts/tegra124.dtsi | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)

Is there any way to test this? What are the effects of adding this? Does
it enable using perf for profiling?

> diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124=
=2Edtsi
> index 13cc7ca..de07d7e 100644
> --- a/arch/arm/boot/dts/tegra124.dtsi
> +++ b/arch/arm/boot/dts/tegra124.dtsi
> @@ -918,31 +918,40 @@
>  		#address-cells =3D <1>;
>  		#size-cells =3D <0>;
> =20
> -		cpu@0 {
> +		A15_0: cpu@0 {
>  			device_type =3D "cpu";
>  			compatible =3D "arm,cortex-a15";
>  			reg =3D <0>;
>  		};
> =20
> -		cpu@1 {
> +		A15_1: cpu@1 {
>  			device_type =3D "cpu";
>  			compatible =3D "arm,cortex-a15";
>  			reg =3D <1>;
>  		};
> =20
> -		cpu@2 {
> +		A15_2: cpu@2 {
>  			device_type =3D "cpu";
>  			compatible =3D "arm,cortex-a15";
>  			reg =3D <2>;
>  		};
> =20
> -		cpu@3 {
> +		A15_3: cpu@3 {
>  			device_type =3D "cpu";
>  			compatible =3D "arm,cortex-a15";
>  			reg =3D <3>;
>  		};
>  	};
> =20
> +	pmu {
> +		compatible =3D "arm,cortex-a15-pmu";
> +		interrupts =3D <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-affinity =3D <&A15_0>, <&A15_1>, <&A15_2>, <&A15_3>;

These labels look somewhat artificial to me, perhaps we could do
something like the following instead?

	interrupt-affinity =3D <&{/cpus/cpu@0}>, ...;

That's slightly more obvious and avoids the need to "invent" labels for
the CPUs.

No need to respin, I can fix that up when applying if nobody objects to
using the alternative notation.

Thierry

--3uo+9/B/ebqu+fSQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVqMP+AAoJEN0jrNd/PrOhzt8QAIm0s0Er1dxt9H6yQxSElfYG
hjavRDjSydeAGmVtIg3WIMI42XL6zVGBhYGc+LciV+qkd26io9sYzCl02CrNIhtj
0TgEFBH0aUaHqdpdZDquMzCkZ4v+ZQmeaPFR7mwef1y9L2EkJrosMkQpu+2E786+
fCgMekxG00Fw4rUq9RJV/OCQeElLwdE5hyED+TlHsvJCiQTEcIrVcOvQ/4FJMygu
pnM/RxIyIYH5EB+fWDU/3PuOOhzy5/Ypau3i0HW2v1E04f/fhbFt6DNz4mFdKN3M
ztdWse454gntWTr0UuaIKT7xDrtJLowbCwHgZcM50Dk4OvVV4qfq1VU0K0ZfiiEg
9ASEGCUlidBy5FeKKO1sudJIMk0d5x8pYAyihlQp84kpfR1GA9DdEA2CflQl1YDu
IUfsjV1ESMU5P7Yi+g16cIKVOBKFSL0MWyirRXQ8U2iAgrgpQ3sshVS1J/jN/oY6
v884ycxoIuxA31tQOswAH3lCxmPhvNU3rkg6E5BSsbW4KoEn2lRkToLlFGH0wLPC
sGVNt3Mkqvn9jfrVIbHUkloPYZSCxWYuYJjrLSOAg0ysg12ctxiat4FD8d+wWzB0
+yfVekaaE9D15qhNeOLF1/Z8T1ajLTiNWeGDDSAmILy7Cxw25luITdrKqXfiVgS8
7zskl/2ufb7KJqf01yCR
=n3Ut
-----END PGP SIGNATURE-----

--3uo+9/B/ebqu+fSQ--
