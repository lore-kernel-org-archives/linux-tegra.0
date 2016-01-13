From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V1 06/10] of: Add bindings of hw-trips for soctherm
Date: Wed, 13 Jan 2016 16:25:27 +0100
Message-ID: <20160113152527.GF2588@ulmo>
References: <1452672022-387-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+ts6NCQ4mrNQIV8p"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1452672022-387-1-git-send-email-wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, mikko.perttunen-/1wQRMveznE@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--+ts6NCQ4mrNQIV8p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Cc'ing devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, please make sure to always Cc that
list on device tree binding patches.

On Wed, Jan 13, 2016 at 04:00:22PM +0800, Wei Ni wrote:
> Add hw-trips sub-node for soctherm, which is
> used to describe the hardware trip points for
> each soctherm sensors.

Perhaps you should mention Tegra in the subject and the commit message?

Also please use all of the 72 columns that are at your disposal when
writing commit messages.

> Signed-off-by: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  .../devicetree/bindings/thermal/tegra-soctherm.txt | 29 ++++++++++++++++=
++++++
>  1 file changed, 29 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/thermal/tegra-soctherm.txt=
 b/Documentation/devicetree/bindings/thermal/tegra-soctherm.txt
> index 6b68cd150405..77aef0b4968b 100644
> --- a/Documentation/devicetree/bindings/thermal/tegra-soctherm.txt
> +++ b/Documentation/devicetree/bindings/thermal/tegra-soctherm.txt
> @@ -26,6 +26,18 @@ Required properties :
>      of this property. See <dt-bindings/thermal/tegra124-soctherm.h> for a
>      list of valid values when referring to thermal sensors.
> =20
> +Optional properties:
> +- hw-trips : A sub-node which is a container of hardware trip points
> +    for each sensors.

Perhaps call the node "trip-points"? "hw-" seems kind of redundant since
DT is a hardware description, and "trips" isn't a very good abbreviation
for "trip-points".

> +  * sensors: Sub-nodes which are used to describe the HW trip points inf=
o,
> +        must be named as "cpu", "gpu", "mem", "pll".
> +      Properties:
> +      - therm-temp : Shutdown temperature in millicelsius, once the
> +        temperature of this sensor is higher than the therm-temp, the sy=
stem
> +        will be reset or shutdown.

Why not call the property "shutdown-temperature" if that's what it is.

> +      - throt-temp : HW throttle temperature in millicelsius, once the
> +        temperature of this sensor is higher than the throt-temp, the HW
> +        throttle will be triggered in soctherm. (Not implement yet)

"throttle-temperature" would be a better name in my opinion. More typing
perhaps but less chance of getting the abbreviations wrong. Also there's
no need for the "(Not implement yet)" because the binding isn't about an
implementation, it's about the hardware description. If you have no code
that uses this, a safer option might be to just drop it for now.

Thierry

--+ts6NCQ4mrNQIV8p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWlmxnAAoJEN0jrNd/PrOhn64P/ROmY6V2mUZRaBsCpU1EPfk6
YBYaWg3trnkI24WcVj9PpBb4PodZJTuU/KHmTCIUs0zl4sWsZsT4zMOW0ZaGpdJ4
t1MhfuPVkG4bLoUHLaIW6JvTS2THNIfm0TKT+C9G7XfD/C/K7taK+SO+edg0zdj1
LIhEbzenNmvIf9xBe2XnJB61WaS79TJP3rJT5eC++S94/3Wodq7sFbEfXPdI16vN
arH3FeX4uEbREa0WVHrBt4T37fb2ZvcvJ2KsnSgN325S8d4SCHloDQzpsVit8IIV
TVpDayeCzq3jZ4Y91alyFAOXprlbunJcvCC8QRy4Prcpm+QPYVSYbZ9lqSo0NdEr
L5WZ7vQmDynIpC3Zvf+z6s7g4XTdkX5fNZpZFomZt8JxnPruTnj5YSZs46tR0xdy
kGLP4qjBo3kP97IJFxBfq6yRBVf2Y0GPFeP16uytnzx+ZtoeXV4obNHcxjWw4Ocf
HIOb1ppX8N5UQQOCxIu6fta2dyefku+6GPgUCTOsHg7n7W2I4UU9eM4qFEaNo6cc
4E5vXcqYxB22JRk/jRJjymNLR44VbO48L0RPdZUliZMUovVqW+zTp58fsUIKJ7R7
46BAu/APqvKdHlL/VG0QDPlvf0eXi6e7ETGvjqIWTuMJvP4UkHkoz3CCKVRH9dsT
OSah9UuLdxl8iCXxi6rf
=cwJ6
-----END PGP SIGNATURE-----

--+ts6NCQ4mrNQIV8p--
