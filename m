From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3] ARM64: boot: dts: Add regulators for Tegra210 Smaug
Date: Thu, 30 Jun 2016 11:32:19 +0200
Message-ID: <20160630093219.GC1776@ulmo.ba.sec>
References: <1467149304-29274-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hOcCNbCCxyk/YU74"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1467149304-29274-1-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--hOcCNbCCxyk/YU74
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 28, 2016 at 05:28:24PM -0400, Rhyland Klein wrote:
> Add regulators to the Tegra210 Smaug DTS file including
> support for the max77620 PMIC.
>=20
> Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> v3:
>  - Fixed up ramp delays
>  - s/maxim,enable-sleep/maxim,device-state-on-disabled-event/
>  - remove GPIO 3 from pp3300
>=20
> v2:
>  - Updated reg properties to match current binding
>=20
>  arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 314 ++++++++++++++++++++=
++++++
>  1 file changed, 314 insertions(+)

Applied to for-4.8/arm64, thanks.

Thierry

--hOcCNbCCxyk/YU74
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXdOcjAAoJEN0jrNd/PrOhYGEP/0HpH9069zlWZSwr832zrTcV
ravQb3pVueKw54bLpv9eqEP9JQYQ1syJnRuzBcsqIhTwOWC7aap5YS5iOkuBG8lo
X3gwTLnJD9J1pnfek3610nqMH2FfJm0Auz7ymnWfN/yIeNOFB2QiuFE8VOldDf0+
p1rs0w+Msv7UFNDYeumNMAEMwB4CBDV52V010AanGp+aQQLigauzRrvp+tJyVpL/
1j40fi2UGEr7JuMW13YiyUbGWbSBcIocL3h8n+pQBdtyEIj6lXk2Knw0sfE/EhRl
32Y1rWAtmbrfMtOlxNRWvssrRrL/lzjcWAyJPYzQNMzE9LwAQcyTG2/Yd+WfyuDS
AQHVYb3iwx/IN1d5JWlxUPYr8TKhg9noIc42utZ4aY2hksc7TKtwofzkdlQ1u+mI
waoRYtC9D7/V+o4/H/5v2AurgubAne9GpVyKJGjCNT52yG6bu/R7ziXWAFG3bEGZ
A5HAr0NpQe1sjaCEKZCPV2ji6BaM/JPsE2Jr2XZwGTkAYvx9ympKJOMPFX59GXFC
hffN/Hph5Zb9VXnyeBmdrRXp/n9QurcV0w00AbOfGV7cYBe5Fnbh4Njvi4DYVjUN
+WgtKtshp5ClqE+U6/wZL5JlN93Tf0dktg2NLdqR4nVHPIL6y0sgB2tD+HdazWrE
4YKVGoYyXeqX76VYocnP
=is9t
-----END PGP SIGNATURE-----

--hOcCNbCCxyk/YU74--
