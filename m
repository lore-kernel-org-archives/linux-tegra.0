From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] arm64: tegra: Enable all cores on Jetson TX1
Date: Thu, 30 Jun 2016 11:22:31 +0200
Message-ID: <20160630092231.GA1776@ulmo.ba.sec>
References: <20160630080119.27090-1-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UugvWAfsgieZRqgk"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160630080119.27090-1-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 30, 2016 at 05:01:19PM +0900, Alexandre Courbot wrote:
> Enable PSCI firmware and all 4 cores of T210 on Jetson TX1.
>=20
> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Not sure why this was not done - in any case this seems to work fine
> and performance is obviously improved (especially boot time).
>=20
>  arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts | 23 ++++++++++++++++=
++++++
>  1 file changed, 23 insertions(+)

The reason why this wasn't done initially is because the firmware was
supposed to copy this data into the device tree before passing it to the
kernel. The rationale for this decision was that we can't make any
assumptions about the firmware and any potential PSCI implementation.

I suppose the firmware interface could be argued to be part of the
hardware and therefore having it statically in DT would be okay. The one
remaining issue is that it is possible to boot a Tegra X1 without any
secure firmware that might provide PSCI, in which case the DT would now
be lying.

Thierry

--UugvWAfsgieZRqgk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXdOTUAAoJEN0jrNd/PrOh9MsQALco9t5JLbFpww0rvcex59Fa
ETSLUHoEROn1RYbXnIS2184NRjpXhugyTjJrUugKvOmp4Q2gxrj9xpZY/OIl7oDh
md9jS5n7y+FiFT9jyrgcjKXrxvrYitMNChMsZljv5BPnPjAWdjXB/4n3U7RxzULa
pB7cgblid1Xwoxqj5529JbogCeHPl/xnNQXV4ILRcOjwd/49rHYzsCLrYeiIMiwB
0wO+oa3Jek9dtcgxjkxQemdyR4BBOQgnMV856trtSd/wZBrBBVcznZk7PWNOK9Nb
8/DqDDUV3GOpEvRxRhzDOqly3t4GkJ38snqOYPgwK6YR0fmYlJpnEB3DZrXnRLqj
UACkvKcl6kXMMruTeyGOT1AFj0r+Q6R5KEgtAAIGK9yqYcCRSbqFweNkC+qX2gGJ
558rcAwYjd0uI5tZs8/0ffUPNWy4m6SpOAjPCIuIGCEWo+A/nxJnIIvr8FHqAYyu
voA1bkWEYkmAWKrvw4/wJ67SxG1NuEemkcS80op/m9z8ZIIx4rQT+BibnBJZDneL
wbkORMCZwAjL0WuVTA31In+JwDdOMn0T6WjtmaNRMOpo4c6VtiNw6aKM5Ln0cNxI
FZspjYFwOtJMd0SleDbmillGBmd36wEzqg5ck1akgroz/hXtv9kBm39zM1Bj6msk
EQoSj67mihxL8Bkknl8v
=FCWQ
-----END PGP SIGNATURE-----

--UugvWAfsgieZRqgk--
