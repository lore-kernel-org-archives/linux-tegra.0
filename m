From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH] tegra: ventana: display and backlight DT entries
Date: Tue, 13 Nov 2012 13:34:10 +0100
Message-ID: <20121113123410.GA11202@avionic-0098.mockup.avionic-design.de>
References: <1352802204-1740-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1352802204-1740-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 13, 2012 at 07:23:24PM +0900, Alexandre Courbot wrote:
> Enable internal panel:
> - add EDID file
> - add power sequence to control backlight and panel (panel is currently
>   controlled by the backlight sequence, this will need to be fixed once
>   the panel framework has power sequences support)
>=20
> Also enable HDMI output.
>=20
> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Hi Alex,

Thanks for the patch. It seems like we may actually get the tegra-drm in
for 3.8, so I think it's time we start collecting patches to the DTS
files to enable it on the various boards. I can collect these in my
tegra/next branch to provide a common location and feed them to Stephen
at the appropriate time.

I think the canonical subject for Tegra-related patches against arch/arm
is: "ARM: tegra". A few more comments inline.

> ---
>  arch/arm/boot/dts/tegra20-ventana.dts  | 114 +++++++++++++++++++++++++++=
++++--
>  arch/arm/boot/dts/tegra20-ventana.edid | Bin 0 -> 128 bytes
>  2 files changed, 109 insertions(+), 5 deletions(-)
>  create mode 100644 arch/arm/boot/dts/tegra20-ventana.edid
>=20
> diff --git a/arch/arm/boot/dts/tegra20-ventana.dts b/arch/arm/boot/dts/te=
gra20-ventana.dts
> index adc4754..849a374 100644
> --- a/arch/arm/boot/dts/tegra20-ventana.dts
> +++ b/arch/arm/boot/dts/tegra20-ventana.dts
> @@ -318,11 +318,30 @@
>  		};
>  	};
> =20
> -	i2c@7000c400 {
> +	hdmiddc: i2c@7000c400 {
>  		status =3D "okay";
>  		clock-frequency =3D <400000>;
>  	};

I believe you said Mark already told you, but this probably needs to
reference the DDC in the i2c-pinmux rather than the physical parent.

> =20
> +	host1x {
> +                dc@54200000 {

This looks like it is indented using spaces instead of tabs.

> +			rgb {
> +				status =3D "okay";
> +				nvidia,edid =3D /incbin/("tegra20-ventana.edid");

We've briefly discussed this on IRC already, but for the sake of
completeness I'll restate it here. I think this should be converted to
the bindings as defined by the videomode helpers. These are not merged
yet, but they provide a much more readable representation than a binary
blob.

I know that Stephen mentioned using the nvidia,edid property for boards
where the blob is actually available in some sort. I seem to remember
him mentioning Ventana in particular, but I may be wrong.

> +			};
> +		};
> +
> +		hdmi {
> +			status =3D "okay";
> +
> +			vdd-supply =3D <&avddhdmi>;
> +			pll-supply =3D <&avddhdmipll>;
> +
> +			nvidia,hpd-gpio =3D <&gpio 111 0>; /* PN7 */
> +			nvidia,ddc-i2c-bus =3D <&hdmiddc>;
> +		};
> +	};
> +

The host1x node should be sorted higher, according to its unit address.
I believe the right place would be immediately above the pinmux node.

> +	backlight {
> +		compatible =3D "pwm-backlight";
> +		brightness-levels =3D <0 16 32 48 64 80 96 112 128 144 160 176 192 208=
 224 240 255>;
> +		default-brightness-level =3D <12>;
> +
> +		/* resources used by the power sequences */
> +		pwms =3D <&pwm 2 5000000>;
> +		pwm-names =3D "backlight";
> +		power-supply =3D <&vdd_bl_reg>;
> +		panel-supply =3D <&vdd_panel_reg>;
> +
> +		power-sequences {
> +			power-on {
> +				/*
> +				 * Panel power and LDVS enable.

"LVDS".

Thierry

--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQoj5CAAoJEN0jrNd/PrOhf3UQAK28MQukwfN2AGljN48pFqe0
Nte71bLdKKlJhB8trs5VMnQ6nMqGZ4nb6e1VXdDoJn+PMf5kj7ihxLHU7N/koeng
16R45dVBUvh548/2XrUqESMx1MwMOrzAnDGpn8soiX56v4NjJ5W2WGQvo323knRk
NruENoIquGQyc4DNjYsqug/dwsOBdc/+MqIoH0qGjz0WGJ6Gdfy3CjovV+7Xq5vu
s2Fh6Gdh41MjSIgn0Uu9gpGHtJ7kELUjRMrpcGFGxxSd63hNR1wwyud1kCoP69PI
bmJ6gFOGgvvIDGU2Lz2/m9hN262l7sEDtwbKF3z+lZBhbghWuFhih8IjieSCCy4a
u+L3BvPbbDafM+RAGnObWygGAZeUy/uTtmzJXMFh7YI/yDRJSciCcEC457zHjLK9
R2fc9Q6qnjlej67Cv8gEJVI2eKC4JAvxdSBO9Uglp1wNxs//9PoRnPO2IvhkCAMP
9Bswkznm9nkpt60/m+EVZ1voUAxxnXWPHSs3xMItvoyYLy36VotrEbGbsHA0bY1l
e56ypcp9vRMGGZwnceP6o5CdywZyYUkiiyZM1RmlfWBL0HP6If3dFjEpSh6421o0
dxWrn6TOfki53eDxkXHxDJi9ld31nFt4i7RvwTr24uRcRyJVygJXflEqzc4chu+t
jkShz0TYQ6x9gOO3W0Kb
=dFNl
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--
