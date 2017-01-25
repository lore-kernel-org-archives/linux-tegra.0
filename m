From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 3/6] ARM: tegra: nyan-big: Include compatible
 revisions for proper detection
Date: Wed, 25 Jan 2017 12:02:46 +0100
Message-ID: <20170125110246.GD9344@ulmo.ba.sec>
References: <20170122154753.31942-1-contact@paulk.fr>
 <20170122154753.31942-3-contact@paulk.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="WChQLJJJfbwij+9x"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170122154753.31942-3-contact-W9ppeneeCTY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--WChQLJJJfbwij+9x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 22, 2017 at 04:47:50PM +0100, Paul Kocialkowski wrote:
> Depthcharge (the payload used with cros devices) will attempt to detect
> boards using their revision. This includes all the known revisions for
> the nyan-big board so that the dtb can be selected preferably.
>=20
> Defining compatibly revisions allows depthcharge to select the kernel
> via the revision it detects instead of using the default kernel. This
> allows having a FIT image with multiple kernels for multiple devices.
>=20
> Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra124-nyan-big.dts | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

I've applied this, with a small change, see below.

> diff --git a/arch/arm/boot/dts/tegra124-nyan-big.dts b/arch/arm/boot/dts/=
tegra124-nyan-big.dts
> index 67d7cfb32541..f12ece9b76a6 100644
> --- a/arch/arm/boot/dts/tegra124-nyan-big.dts
> +++ b/arch/arm/boot/dts/tegra124-nyan-big.dts
> @@ -6,7 +6,12 @@
> =20
>  / {
>  	model =3D "Acer Chromebook 13 CB5-311";
> -	compatible =3D "google,nyan-big", "nvidia,tegra124";
> +	compatible =3D "google,nyan-big-rev7", "google,nyan-big-rev6",
> +			"google,nyan-big-rev5", "google,nyan-big-rev4",
> +			"google,nyan-big-rev3", "google,nyan-big-rev2",
> +			"google,nyan-big-rev5", "google,nyan-big-rev4",

This line is the same as two lines above, so I've removed this one. I've
also used slightly different padding (two tabs and align to the first
string in the first line with spaces) to make it consistent with other
string lists in the file.

Thanks,
Thierry

--WChQLJJJfbwij+9x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliIhdYACgkQ3SOs138+
s6FZNBAAwoRriomJF82TOMLJcavdALIlBBXAslmXaO+4GJ6xYvQfPyFNgrHJwT6F
IFz5/OEp9NdgKJfh0uHRsAEG7BOSMC8o3JffAxd2dg0GubbdKYvZPK65+iSecpfT
0uNZnVUsqg0973kvDKbuY/8iCXau+n7lKkallMMKhFOy425qHqJCOcw4Jvhp3DVp
y5GmXdSZ5yrpSL3ZnlbQhWf/+dh2S+OZxZUjXSbYJVenurXJSBWhUnlunR1//Ctb
8M4o2TFe7+ZbryN4qnQKDt21aSDdZxtf7Q+PcunuTI863ji/NujwmP9yNtBAEiBH
VnHRbkBZuzptA+9AOl1XVXlEpzKb69br+rjudd6xLDptROAPSinpe8mQ6RiT+w7U
eOCUSzKIKGRmwai4bv4lT9qbYDcqlctF//UB8tZGXRrVZuyYPC+LkI9Hqro8unYk
I6xUQv4tz4zpKcyGaaH7d/Td5JTUIKzUQvRMl/h4xakUItdnIt/1vBh/cL1hBrdl
f2b70b9rclp4C2M+GPCgSuoAH/va646L/Vv/f5G0gb1bpa5U8jj7WX4l4xAV8UwA
M0Wu3o8SZ+d1ZREAGo97Jcv0M/qQXsEuLW7QeHyanlQZ13Li2kH+Tjn8c7Xe8vsX
BxE873JPgDW3GPA0p84xqvexfDN7iOapEUaJZBU6wpvxGEtPelA=
=12KO
-----END PGP SIGNATURE-----

--WChQLJJJfbwij+9x--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
