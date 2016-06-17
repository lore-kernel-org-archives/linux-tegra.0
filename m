From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RFC PATCH 03/13] dt-bindings: drm/tegra: Update DPAUX
 documentation
Date: Fri, 17 Jun 2016 18:13:06 +0200
Message-ID: <20160617161306.GD27475@ulmo.ba.sec>
References: <1466165027-17917-1-git-send-email-jonathanh@nvidia.com>
 <1466165027-17917-4-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NklN7DEeGtkPCoo3"
Return-path: <linux-i2c-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1466165027-17917-4-git-send-email-jonathanh@nvidia.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: David Airlie <airlied@linux.ie>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Wolfram Sang <wsa@the-dreams.de>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--NklN7DEeGtkPCoo3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 17, 2016 at 01:03:37PM +0100, Jon Hunter wrote:
> Update the DPAUX compatibility string information for Tegra124, Tegra132
> and Tegra210. For Tegra210 an additional clock, 'sor-safe' is also
> required for DPAUX and so add this clock information as well.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  .../devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt    | 7 +=
+++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra=
20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegr=
a20-host1x.txt
> index a3bd8c050c4e..361a472eac4b 100644
> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host=
1x.txt
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host=
1x.txt
> @@ -226,9 +226,9 @@ of the following host1x client modules:
>    - nvidia,dpaux: phandle to a DispayPort AUX interface
> =20
>  - dpaux: DisplayPort AUX interface
> -  - compatible: For Tegra124, must contain "nvidia,tegra124-dpaux".  Oth=
erwise,
> -    must contain '"nvidia,<chip>-dpaux", "nvidia,tegra124-dpaux"', where
> -    <chip> is tegra132.
> +  - compatible : Should contain one of the following:
> +    - "nvidia,tegra124-dpaux": for Tegra124 and Tegra132
> +    - "nvidia,tegra210-dpaux": for Tegra210
>    - reg: Physical base address and length of the controller's registers.
>    - interrupts: The interrupt outputs from the controller.
>    - clocks: Must contain an entry for each entry in clock-names.
> @@ -236,6 +236,7 @@ of the following host1x client modules:
>    - clock-names: Must include the following entries:
>      - dpaux: clock input for the DPAUX hardware
>      - parent: reference clock
> +    - sor-safe: additional clock input for the DPAUX hardware on Tegra210

It might be worth calling this simply "safe" because that's the
contextual role of the clock, whereas sor-safe is the system name of the
clock.

Thierry

--NklN7DEeGtkPCoo3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXZCGSAAoJEN0jrNd/PrOhFvMQAKhOYcpls3CmecqieOZSo2Au
k6hbK4I1mqoDnuqbblQfZxXhuqx9elwh5PMsHcRNKgkMzzp07svv0ihqa1WO9yd0
IvEk4TDEEh1n7quTC+ul3MoWJDlyQlQhg49CJATWcn58N04d4+jOuQamUJSJvTCb
hgpPyeiG5tv4wi9j14HYSxqNDE98AcQTGe9PazbfF4VP5XDN2MBGg85YxhxhfuX+
FxG3IteNytoX7aJdzlmb+zqGscG0tJuhle86vtHi3dyJDkIKg+RHcnLUWCEkdnhv
ztCJQ8CP+q7leYZA/9QDTPbRZr7EG8y6I98SpVFvywMRUcLnQ/esae/ZjaTIKN4u
Wc97+4VyRja0op5Y/PNXnO8FCe2AUND7nbg5ui5x1fpQJ+n9NzAPVUxE4ewlDUoH
4EZlDWRWChsmz0CUsn+TrURBfNQhYGiHQM80Bxvu8grhRwFgoY8xlIo0HMVuy0hn
KXNM+QwOKSkqO9dJt+5gFGEBS5hbBmuFKf8oIdgY1vSJrYSV7XFIdyHmiO/Nio63
yt0nmzJ00QIN27Ieo6i27uBc/6w4D1oMjhiyIBv1kLPCMuEbFCRENqh0M9PbEX8K
nDrXz6tsU7Wwy0E1ccjwLfQ9pnkYf49p2Qz0B/w1I8PYkf3npLC+WpqFXpMWIPms
H+Ke8fD+TsThKsOZmY6+
=eZ/j
-----END PGP SIGNATURE-----

--NklN7DEeGtkPCoo3--
