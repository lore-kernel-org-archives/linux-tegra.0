From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2] dt-bindings: Add documentation for GP10B GPU
Date: Fri, 31 Mar 2017 14:56:07 +0200
Message-ID: <20170331125607.GA29779@ulmo.ba.sec>
References: <20170330091831.18322-2-acourbot@nvidia.com>
 <20170330092644.11890-1-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2542564277828628828=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170330092644.11890-1-acourbot@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, gnurou@gmail.com, linux-kernel@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============2542564277828628828==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Content-Disposition: inline


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 30, 2017 at 06:26:44PM +0900, Alexandre Courbot wrote:
> GP10B's definition is mostly similar to GK20A's and GM20B's. The only
> noticeable difference is the use of power domains instead of a regulator
> for power supply.
>=20
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> Changes since v1:
> - It's much better when it compiles.
>=20
>  .../devicetree/bindings/gpu/nvidia,gk20a.txt       | 25 ++++++++++++++++=
+++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt b/Doc=
umentation/devicetree/bindings/gpu/nvidia,gk20a.txt
> index ff3db65e50de..b7e4c7444510 100644
> --- a/Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt
> +++ b/Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt
> @@ -5,6 +5,7 @@ Required properties:
>    Currently recognized values:
>    - nvidia,gk20a
>    - nvidia,gm20b
> +  - nvidia,gp10b
>  - reg: Physical base address and length of the controller's registers.
>    Must contain two entries:
>    - first entry for bar0
> @@ -14,7 +15,8 @@ Required properties:
>  - interrupt-names: Must include the following entries:
>    - stall
>    - nonstall
> -- vdd-supply: regulator for supply voltage.
> +- vdd-supply: regulator for supply voltage. Only required for GPUs not u=
sing
> +  power domains.
>  - clocks: Must contain an entry for each entry in clock-names.
>    See ../clocks/clock-bindings.txt for details.
>  - clock-names: Must include the following entries:
> @@ -27,6 +29,8 @@ is also required:
>    See ../reset/reset.txt for details.
>  - reset-names: Must include the following entries:
>    - gpu
> +- power-domains: GPUs that make use of power domains can define this pro=
perty
> +  instead of vdd-supply. Currently "nvidia,gp10b" makes use of this.
> =20
>  Optional properties:
>  - iommus: A reference to the IOMMU. See ../iommu/iommu.txt for details.
> @@ -68,3 +72,22 @@ Example for GM20B:
>  		iommus =3D <&mc TEGRA_SWGROUP_GPU>;
>  		status =3D "disabled";
>  	};
> +
> +Example for GP10B:
> +
> +	gpu@17000000 {
> +		compatible =3D "nvidia,gp10b";
> +		reg =3D <0x0 0x17000000 0x0 0x1000000>,
> +		      <0x0 0x18000000 0x0 0x1000000>;

Would it make sense to add a reg-names property to give these meaning? I
know that the binding describes what each entry is, but having the names
specified in a property would make it more immediately obvious.

Just a thought, otherwise looks good to me.

Thierry

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAljeUeQACgkQ3SOs138+
s6Ga/A/+NAAYoM6EcNR0ENu5+cpcxGpXJ3pW8KhNnkL4VtHFr7xKNCbqlS4tU65e
wmWc/ks/gufcJUM5sR4UzMrVBD8wPoc4EZtsTwDueOZtjMKi26tvVNquj7ZNR/Fo
WiFJntTXupHtjbSL5iLKX/RFo+7fXb+j+Z/fVGxqt0V9u7qi20/Wx9xuaKaUW1G8
mE6/8kGGA/fgPMNOp6qIyQndwK1W/8ghatvQRoQQ79jYi6mQfsLZmUQYUSu37+f8
KXiSHdU6NqugMh0wxmVWEcfgvFWQgZXx04Ox2BqnrP2aA/UEA5zfx8IIOXsprEwx
7Xe14AlxGVwXDPOEq9/m2gMX1cSFqTWEkT14wgeqqyYOGiyKqPaLHo6eZHu1ypB3
Cr784TiLfBCAjovmQgO/PgPP+psp9+d3j8+N8KGWk53K3Vng8NlwH9t5IXyPTAp2
p5kMO0R8JlGOOyZroA47Oy2FEHgY2FhXOZFNgxAAarrYVXyBRPNqY2RyP3t1GqY8
BWCL2nDGJH1Zeame3AAH5B/9nGHig1vhX6lDeGgLPx1D8DvQvUKiizpYqEZafneT
rauEJeQdibFJC8ZL+vftmTTsYAAMbch9Uphk/8SAmXbmvWgYiWwKmd8vo4mAaoN+
2lg9F9qDduAeWLWAJFo+TIiIwFvL/V78i6R1Ze54q9zibCFXfuc=
=OXep
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--


--===============2542564277828628828==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2542564277828628828==--
