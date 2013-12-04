From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2] ARM: tegra: add MMC controllers to Tegra124 DT
Date: Wed, 4 Dec 2013 09:41:59 +0100
Message-ID: <20131204084158.GE19943@ulmo.nvidia.com>
References: <1386095199-24336-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3XA6nns4nE4KvaS/"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1386095199-24336-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--3XA6nns4nE4KvaS/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 03, 2013 at 11:26:39AM -0700, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Tegra124 has 4 MMC controllers just like previous versions of the SoC.
> Note that there are some non-backwards-compatible HW differences, and
> hence a new DT compatible value must be used to describe the HW.
>=20
> Also enable the relevant controllers in the Venice2 board DT.
>=20
> power-gpios property suggested by Thierry Reding.
>=20
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> v2: Add power-gpios to SD card node, suggested by Thierry.
> ---
>  arch/arm/boot/dts/tegra124-venice2.dts | 12 ++++++++++
>  arch/arm/boot/dts/tegra124.dtsi        | 40 ++++++++++++++++++++++++++++=
++++++
>  2 files changed, 52 insertions(+)

Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Tested-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--3XA6nns4nE4KvaS/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSnurWAAoJEN0jrNd/PrOh1OoP/jm0ZW+T+4cunYsUJIp4n4IX
XN05sXqZJj52SS+mRnihFy4m3nheRNzgNmbBy70tV2CgqLJqaqAYv7aQR5WgHHga
uomkwgiTMiaBWIGgicTapOoYQTtsUwDouPdGa3UXDCFBBk/tx+7qRMfiOt+eOoUu
CZjBBObrtCQjlO1PdY7DaIoSzFzBtQQSgsnX9SKMEj0npOo04IIqeSmy90roRyeL
mlMZobtPaDwAMEcwZPD+bdA4CzsFsjMid8W/i+0j0aAvWxDForX7k/fC58oRhoZ6
xNcGzoV5b5LGtUswwLoPhRCZZ34hv26fe8+zHFdl4J0eKpyE1bGt1NMw/vPdhNDX
yteCF2HVesn+qyEXK/uMXc2DjLnUX7y0ypwFwkojedi7PBQPB3u7IDzUqN2Ztvj9
jickBE7ZwuPpPFKmM9QJWiEbkce4So+6H8LWC4idYlDFg+Lig2bO4gX9It8NUd+/
zPliXmTC8iJ95mJZr53nkQheCxuHngsz8uBzhMS9aUT2/jkF/zYf49NIAXfb6MSE
ufOwIpHUTdPsVZJx2ANdpA4k9LHdAMpqAFof/iLlScUQtFOUWgiZCArgEoMnhNll
B2TWYvuLiureDpyvl54oIVzx//J0+dCs6IS8m2wY7IUpuMs38Gkko3Nz8NznwEiT
JeAc9mvJq+FDgD3TkbAd
=eWcB
-----END PGP SIGNATURE-----

--3XA6nns4nE4KvaS/--
