From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1 1/3] of: add nvidia,thermtrips property
Date: Fri, 14 Dec 2018 15:29:56 +0100
Message-ID: <20181214142956.GF23379@ulmo>
References: <1544177407-20203-1-git-send-email-wni@nvidia.com>
 <1544177407-20203-2-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vA66WO2vHvL/CRSR"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1544177407-20203-2-git-send-email-wni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wei Ni <wni@nvidia.com>
Cc: daniel.lezcano@linaro.org, linux-tegra@vger.kernel.org, rui.zhang@intel.com, edubezval@gmail.com, srikars@nvidia.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--vA66WO2vHvL/CRSR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 07, 2018 at 06:10:05PM +0800, Wei Ni wrote:
> Add optional property "nvidia,thermtrips".
> If present, these trips will be used as HW shutdown trips,
> and critical trips will be used as SW shutdown trips.
>=20
> Signed-off-by: Wei Ni <wni@nvidia.com>
> ---
>  .../bindings/thermal/nvidia,tegra124-soctherm.txt    | 20 ++++++++++++++=
+++---
>  1 file changed, 17 insertions(+), 3 deletions(-)

This seems like an odd exception. Why not extend the list of trip point
types with a "shutdown" or "emergency" type that can be used for this?
This doesn't seem like NVIDIA specific functionality, so adding an
NVIDIA specific property doesn't seem right.

Also, please always Cc devicetree@vger.kernel.org and the device tree
bindings maintainers when sending updates for a binding. They need to
ack these kinds of patches and they can't do that if they don't get a
copy of the patch.

Cc'ing them now and quoting the full patch for reference.

Thierry

>=20
> diff --git a/Documentation/devicetree/bindings/thermal/nvidia,tegra124-so=
ctherm.txt b/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soct=
herm.txt
> index b6c0ae53d4dc..ab66d6feab4b 100644
> --- a/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.=
txt
> +++ b/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.=
txt
> @@ -55,10 +55,21 @@ Required properties :
>        - #cooling-cells: Should be 1. This cooling device only support on=
/off state.
>          See ./thermal.txt for a description of this property.
> =20
> +Optional properties:
> +- nvidia,thermtrips : When present, this property specifies the temperat=
ure at
> +  which the soctherm hardware will assert the thermal trigger signal to =
the
> +  Power Management IC, which can be configured to reset or shutdown the =
device.
> +  It is an array of pairs where each pair represents a tsensor id follow=
ed by a
> +  temperature in milli Celcius. In the absence of this property the crit=
ical
> +  trip point will be used for thermtrip temperature.
> +
>  Note:
> -- the "critical" type trip points will be set to SOC_THERM hardware as t=
he
> -shut down temperature. Once the temperature of this thermal zone is high=
er
> -than it, the system will be shutdown or reset by hardware.
> +- the "critical" type trip points will be used to set the temperature at=
 which
> +the SOC_THERM hardware will assert a thermal trigger if the "nvidia,ther=
mtrips"
> +property is missing. When the thermtrips property is present, the breach=
 of a
> +critical trip point is reported back to the thermal framework to impleme=
nt
> +software shutdown.
> +
>  - the "hot" type trip points will be set to SOC_THERM hardware as the th=
rottle
>  temperature. Once the the temperature of this thermal zone is higher
>  than it, it will trigger the HW throttle event.
> @@ -79,6 +90,9 @@ Example :
> =20
>  		#thermal-sensor-cells =3D <1>;
> =20
> +		nvidia,thermtrips =3D <TEGRA124_SOCTHERM_SENSOR_CPU 102500
> +				     TEGRA124_SOCTHERM_SENSOR_GPU 103000>;
> +
>  		throttle-cfgs {
>  			/*
>  			 * When the "heavy" cooling device triggered,
> --=20
> 2.7.4
>=20

--vA66WO2vHvL/CRSR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlwTvmEACgkQ3SOs138+
s6E3ERAAjLeML4kt1YycCG18gnwlUvlQOn3vbq2z03HMtv3tzh9Zm3sJFfaiUKYj
Ccxp1Nu93UGZut3TqodEP795mSiCD7lyJ4O2TdTXsfQpUmMiGjPLqVyQBpkNH/+i
DQrIA03TIgaITeBy0nAgk6HmqRW/FKO/XMzslOiNVIF5BmbLjGrdMY38gA3Pfr7+
bGupH2lhT5Imjrp+GcRwLlQrUVar0p0KD6NXneqg7t4KAeqrEgzd1nDVWIBhtSDh
YSl+FTggAv2g3VmqPucaBlPBFVKE93lRO5n+74IXL2smXESXMpud/HNhiJag1d3+
xGJE56VmJumoXRkKJLMNkhq2xvViiPDNrCjZ5qmbDqccJtXwozHvRX/nInL+aS+z
CDG69jo/qt6AawVsdxQ76ajMCuYbynCcDyQg4rSUFbTuQlc5Yr0WKJ26uS/kK2kG
ZUJlqzuvI5DjfbXYHErLYfExsTXedsvLd6xujD6brNkCpQfUUpy/wXj8Ar7gNCkg
aif/t+jDruNj/1IGagYg4poO1cooBgequQleVRwf23GkfFmNiAsfHy60JVac1NKh
GgBxm0Ykqb9KqApoQbOkW05aizg4+G8aIPxXEg0g5bDFa6trTUGPvieOYoPw6eeK
tVu+nLAJee9cyDxWyqKolMvveL80BnHgmWwBn+UkPH0ceQPdC8E=
=giga
-----END PGP SIGNATURE-----

--vA66WO2vHvL/CRSR--
