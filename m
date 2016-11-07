From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V4 4/6] ARM: tegra: Add Tegra30 GMI support
Date: Mon, 7 Nov 2016 13:56:15 +0100
Message-ID: <20161107125615.GA12559@ulmo.ba.sec>
References: <1478507405-13204-1-git-send-email-mirza.krak@gmail.com>
 <1478507405-13204-5-git-send-email-mirza.krak@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="opJtzjQTFsWo+cga"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1478507405-13204-5-git-send-email-mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 07, 2016 at 09:30:03AM +0100, Mirza Krak wrote:
> From: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>=20
> Add a device node for the GMI controller found on Tegra30.
>=20
> Signed-off-by: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Tested-by: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
> Tested-on: Colibri T20/T30 on EvalBoard V3.x and GMI-Memory Board
> Acked-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>=20
> Changes in v2:
> - added address-cells, size-cells and ranges properties
>=20
> Changes in v3:
> - no changes
>=20
> Changes in v4:
> - no changes
>=20
>  arch/arm/boot/dts/tegra30.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)

Applied, thanks.

Thierry

--opJtzjQTFsWo+cga
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYIHnsAAoJEN0jrNd/PrOhv5EP/3NPO8ULS9ehGfrRyytJedWV
Bd9vUxHk7lWdv5HfAZiXDZEIRj0Kq14M3YvyLf3oiNa0R5hpjz0pMUv29y9gNDfP
lxpTa42mUljn/qWuD+kyVU1ylP92uGfdwnSUYmQFwyhr7nkTER0OpQI+Fy6MmEY3
Fxu/TnIcRJTGO3geA95mWnbLRbDwv7NXvde++lNxMp18C9TtsrVmGI57B/ZYU1g0
XP5dr0DQQWbV/Jqyi3rAP3cRoeWV+ijmqfUV3EEKgjcTwTjIeg/PAw9lBaDNU/mX
0AKDZo/1jcJb3dVyOwD6m5RgywS0meoaqmqSe7CiR3PvCWXsPzeC4dKCOQaIccEG
4I5tsr4Ojm9gn1bqzlv27jViCtECGuo+ZegvwW/dKRoHJbsqcOu2KkHzm1db3HhR
9nyYUcKNkbTAYzA9Sk/wJSatAoi9Zb4yrp+axeyjPtFmjejKSRH5xr0QpxLTPZfM
EEj/3G5d0EAoQX8uj4X8welI1TrNsxSPKnvLldrwAqk8lJEO3aEp1k+c+29BA+ib
ggz39YDGwFW8jzmve+PJD7TohzSOaokZOyAodSZaGXtvhJh7v8S6+HCpV7Npx7Xk
BVez0bRwxrOZfjyOlXu+Ekv57XsHxaepVZooZ2IVxE63DV5fjI1NzdRQefXYZe1J
yRgYisUpEILE20vo/3Fd
=TqL1
-----END PGP SIGNATURE-----

--opJtzjQTFsWo+cga--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
