From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] arm64: tegra: add topology data for Tegra194 cpu
Date: Thu, 31 Jan 2019 23:25:18 +0100
Message-ID: <20190131222517.GB13156@mithrandir>
References: <1548959754-3941-1-git-send-email-byan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jq0ap7NbKX2Kqbes"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1548959754-3941-1-git-send-email-byan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bo Yan <byan@nvidia.com>
Cc: jonathanh@nvidia.com, linux-tegra@vger.kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--jq0ap7NbKX2Kqbes
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 31, 2019 at 10:35:54AM -0800, Bo Yan wrote:
> The xavier CPU architecture includes 8 CPU cores organized in
> 4 clusters. Add cpu-map data for topology initialization, add
> cache data for cache node creation in sysfs.
>=20
> Signed-off-by: Bo Yan <byan@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 148 +++++++++++++++++++++++++=
++++--
>  1 file changed, 140 insertions(+), 8 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/d=
ts/nvidia/tegra194.dtsi
> index 6dfa1ca..7c2a1fb 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> @@ -870,63 +870,195 @@
>  		#address-cells =3D <1>;
>  		#size-cells =3D <0>;
> =20
> -		cpu@0 {
> +		cpu-map {
> +			cluster0 {
> +				core0 {
> +					cpu =3D <&cl0_0>;
> +				};
> +
> +				core1 {
> +					cpu =3D <&cl0_1>;
> +				};
> +			};
> +
> +			cluster1 {
> +				core0 {
> +					cpu =3D <&cl1_0>;
> +				};
> +
> +				core1 {
> +					cpu =3D <&cl1_1>;
> +				};
> +			};
> +
> +			cluster2 {
> +				core0 {
> +					cpu =3D <&cl2_0>;
> +				};
> +
> +				core1 {
> +					cpu =3D <&cl2_1>;
> +				};
> +			};
> +
> +			cluster3 {
> +				core0 {
> +					cpu =3D <&cl3_0>;
> +				};
> +
> +				core1 {
> +					cpu =3D <&cl3_1>;
> +				};
> +			};
> +		};
> +
> +		cl0_0: cpu@0 {
>  			compatible =3D "nvidia,tegra194-carmel", "arm,armv8";
>  			device_type =3D "cpu";
>  			reg =3D <0x10000>;
>  			enable-method =3D "psci";
> +			i-cache-size =3D <131072>;
> +			i-cache-line-size =3D <64>;
> +			i-cache-sets =3D <512>;
> +			d-cache-size =3D <65536>;
> +			d-cache-line-size =3D <64>;
> +			d-cache_sets =3D <256>;

These don't seem to be well-defined. They are mentioned in a very weird
locations (Documentation/devicetree/booting-without-of.txt) but there
seem to be examples and other device tree files that use them so maybe
those are all valid. It might be worth mentioning these in other places
where people can more easily find them.

According to the above document, {i,d}-cache-line-size are deprecated in
favour of {i,d}-cache-block-size.

I also don't see any mention of {i,d}-cache_sets in the device tree
bindings, though riscv/cpus.txt mentions {i,d}-cache-sets (note the
hyphen instead of underscore) in the examples. arm/l2c2x0.txt and
arm/uniphier/cache-unifier.txt describe cache-sets, though that's
slightly different.

Might make sense to document all these in more standard places. Maybe
adding them to arm/cpus.txt. For consistency with other properties, I
think there should be called {i,d}-cache-sets like for RISC-V.

> +			l2-cache =3D <&l2_0>;

This seems to be called next-level-cache everywhere else, though it's
only formally described in arm/uniphier/cache-uniphier.txt. So might
also make sense to add this to arm/cpus.txt.

>  		};
> =20
> -		cpu@1 {
> +		cl0_1: cpu@1 {
>  			compatible =3D "nvidia,tegra194-carmel", "arm,armv8";
>  			device_type =3D "cpu";
>  			reg =3D <0x10001>;
>  			enable-method =3D "psci";
> +			i-cache-size =3D <131072>;
> +			i-cache-line-size =3D <64>;
> +			i-cache-sets =3D <512>;
> +			d-cache-size =3D <65536>;
> +			d-cache-line-size =3D <64>;
> +			d-cache_sets =3D <256>;
> +			l2-cache =3D <&l2_0>;
>  		};
> =20
> -		cpu@2 {
> +		cl1_0: cpu@2 {
>  			compatible =3D "nvidia,tegra194-carmel", "arm,armv8";
>  			device_type =3D "cpu";
>  			reg =3D <0x100>;
>  			enable-method =3D "psci";
> +			i-cache-size =3D <131072>;
> +			i-cache-line-size =3D <64>;
> +			i-cache-sets =3D <512>;
> +			d-cache-size =3D <65536>;
> +			d-cache-line-size =3D <64>;
> +			d-cache_sets =3D <256>;
> +			l2-cache =3D <&l2_1>;
>  		};
> =20
> -		cpu@3 {
> +		cl1_1: cpu@3 {
>  			compatible =3D "nvidia,tegra194-carmel", "arm,armv8";
>  			device_type =3D "cpu";
>  			reg =3D <0x101>;
>  			enable-method =3D "psci";
> +			i-cache-size =3D <131072>;
> +			i-cache-line-size =3D <64>;
> +			i-cache-sets =3D <512>;
> +			d-cache-size =3D <65536>;
> +			d-cache-line-size =3D <64>;
> +			d-cache_sets =3D <256>;
> +			l2-cache =3D <&l2_1>;
>  		};
> =20
> -		cpu@4 {
> +		cl2_0: cpu@4 {
>  			compatible =3D "nvidia,tegra194-carmel", "arm,armv8";
>  			device_type =3D "cpu";
>  			reg =3D <0x200>;
>  			enable-method =3D "psci";
> +			i-cache-size =3D <131072>;
> +			i-cache-line-size =3D <64>;
> +			i-cache-sets =3D <512>;
> +			d-cache-size =3D <65536>;
> +			d-cache-line-size =3D <64>;
> +			d-cache_sets =3D <256>;
> +			l2-cache =3D <&l2_2>;
>  		};
> =20
> -		cpu@5 {
> +		cl2_1: cpu@5 {
>  			compatible =3D "nvidia,tegra194-carmel", "arm,armv8";
>  			device_type =3D "cpu";
>  			reg =3D <0x201>;
>  			enable-method =3D "psci";
> +			i-cache-size =3D <131072>;
> +			i-cache-line-size =3D <64>;
> +			i-cache-sets =3D <512>;
> +			d-cache-size =3D <65536>;
> +			d-cache-line-size =3D <64>;
> +			d-cache_sets =3D <256>;
> +			l2-cache =3D <&l2_2>;
>  		};
> =20
> -		cpu@6 {
> +		cl3_0: cpu@6 {
>  			compatible =3D "nvidia,tegra194-carmel", "arm,armv8";
>  			device_type =3D "cpu";
>  			reg =3D <0x10300>;
>  			enable-method =3D "psci";
> +			i-cache-size =3D <131072>;
> +			i-cache-line-size =3D <64>;
> +			i-cache-sets =3D <512>;
> +			d-cache-size =3D <65536>;
> +			d-cache-line-size =3D <64>;
> +			d-cache_sets =3D <256>;
> +			l2-cache =3D <&l2_3>;
>  		};
> =20
> -		cpu@7 {
> +		cl3_1: cpu@7 {
>  			compatible =3D "nvidia,tegra194-carmel", "arm,armv8";
>  			device_type =3D "cpu";
>  			reg =3D <0x10301>;
>  			enable-method =3D "psci";
> +			i-cache-size =3D <131072>;
> +			i-cache-line-size =3D <64>;
> +			i-cache-sets =3D <512>;
> +			d-cache-size =3D <65536>;
> +			d-cache-line-size =3D <64>;
> +			d-cache_sets =3D <256>;
> +			l2-cache =3D <&l2_3>;
>  		};
>  	};
> =20
> +	l2_0: l2-cache0 {
> +		cache-size =3D <2097152>;
> +		cache-line-size =3D <64>;
> +		cache-sets =3D <2048>;
> +		next-level-cache =3D <&l3>;
> +	};

Does this need a compatible string? Also, are there controllers behind
these caches? I'm just wondering if these also need reg properties and
unit-addresses.

arm/l2c2x0.txt and arm/uniphier/cache-uniphier.txt describe an
additional property that you don't specify here: cache-level. This
sounds useful to have so that we don't have to guess the cache level
=66rom the name, which may or may not work depending on what people name
the nodes.

Also, similar to the L1 cache, cache-block-size is preferred over
cache-line-size.

> +	l3: l3-cache {
> +		cache-size =3D <4194304>;
> +		cache-line-size =3D <64>;
> +		cache-sets =3D <4096>;
> +	};

The same comments apply as for the L2 caches.

Thierry

--jq0ap7NbKX2Kqbes
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxTdcYACgkQ3SOs138+
s6FzABAAjbztv50UkzwKg4xpgqcu8AkBW++ovcczpqHF6n78vgNJIy3INrdJEj4p
fU7XAWA2WvkrCuQj8yXW/2cGli8Ud8HV8+oHxLDLDCAn4mooQHZPE2oRA14aT8Mw
JU2XIjfrjF292vaKAahohJuvJMQOl1JIXc247qHd90QLvUeT8lJKlL8NSX/KPxpL
Gs5WhFEAlcrIo7Yk1X4kpjG6CmtXC1NxVXBbYiP5XkWjezfOKovQUlvFxlgnNP/z
leQq6s0VqzGtVm5LUan6GR1iK/ACtbkbAvpZUCa4Wqh1Rf1Mhckrz1cf6oxB2fic
iqBwbJAzi5v5JCjAN39zcKxujpUL/g/Q5gP3Rtpv7Mt3wKG1xl1qdMy18T+oH1Cf
AS+LSXFANk8+q53PdmLajlt/0mk6P3mEYWNw/s0QNix4xfy1Q2Mp65UDW++TrpXZ
JewQAJ91sri0rukZlKq64cOj6lmyq06EwuqwvFcgXNCpvFdq2jmBTGXOXrEO3Usc
t/MVmkGrIJPxMsaroaQ8xViXdejcOIauv8royGZq9aluZN4LcKAuFrwkKoKSBWYg
9gPjscvhSAB9PHv2Uk33xWIHWgIOxEV6OiTlfaZGu0R2asTn7nnqfv3iYA+OSdaG
bHhGZTSbjeaoBM5h8OzDsZyASXsAwo2r1RUvcHe0jBmPh1AI31U=
=8xhE
-----END PGP SIGNATURE-----

--jq0ap7NbKX2Kqbes--
