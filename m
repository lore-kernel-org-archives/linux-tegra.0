From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: use correct audio CODEC on Jetson TK1
Date: Sat, 26 Apr 2014 00:11:15 +0200
Message-ID: <20140425221114.GA1352@ulmo>
References: <1398443012-17212-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1398443012-17212-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2014 at 10:23:32AM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Jetson TK1 contains an RT5639 not an RT5640. While the two are extremely
> similar and mostly compatible, we should still use the correct device
> name in the device tree. I had meant to fix this before applying the
> initial DT, but this issue slipped my mind.
>=20
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra124-jetson-tk1.dts | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTWt2CAAoJEN0jrNd/PrOhjncQAJ6L1pH5KYTODKPBm3AWecho
7YEuJZng2TnRVKMqw/jVxNptTtcYQUZMZLX16i+x/A0keGj1JpbnlBHBmFXfy9F6
J93tB3u6nsXHFosxltfQY9UYid+dNigliOtVrbjupDW2L30+QGRwFJhunIr3gLcV
umIhqZpk3NybIR9NZ1mxKu2Djmv1HqT74ZNj6AN5XNN0HWA/rcZWryzMZqQuJl/z
Tui8obPRFaGoOH2sd3l525uEiQvVqWmWwZNAQ7wGaLWhnhs01osa3sq30p0QHqsE
A6tmbUvSWARNLdVXMipLtbDSyGhQXfb4I8nOhiBfD6LYqchKZKb58W7bmQOFlFx1
MhM2M4q8MZLj9nHVsbet8FSuUY08LO3jqDDJCYtlX+tm9Ki3nyCjAApUzCK56igI
SgovpVQ1aETLSkXqkcA/vqev0+HHUrU+vrxonpGAiueQBbIZySOK4g84IJMccmY5
5y0XxcHBcLj2ClgCUGgB6mlESI1m7jmR0o18P0ykM9wiT579ho+NxaxP39nPn6fi
pvj/AL1IA9YvLnnNtuxDOwOwPqUiE0Y6vJG/4XQJO4CH9xeurc137jCA8yV9d5eV
uXIX/4uwhWgBw/6FHklXvPX43aKQuVpPTGqScjUcpStklE1n9kF4ckjGcK6mJK13
6n3g5tXGN3Y7q/Kb+jH+
=Il+J
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--
