From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 20/31] i2c: tegra: use reset framework
Date: Fri, 29 Nov 2013 15:46:16 +0100
Message-ID: <20131129144615.GB9712@ulmo.nvidia.com>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org>
 <1384548866-13141-21-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1UWUbFP1cBYEclgG"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1384548866-13141-21-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--1UWUbFP1cBYEclgG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2013 at 01:54:15PM -0700, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Tegra's clock driver now provides an implementation of the common
> reset API (include/linux/reset.h). Use this instead of the old Tegra-
> specific API; that will soon be removed.
>=20
> Cc: treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
> Cc: pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
> Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
> Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> This patch is part of a series with strong internal depdendencies. I'm
> looking for an ack so that I can take the entire series through the Tegra
> and arm-soc trees. The series will be part of a stable branch that can be
> merged into other subsystems if needed to avoid/resolve dependencies.
> ---
>  drivers/i2c/busses/i2c-tegra.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)

Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--1UWUbFP1cBYEclgG
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSmKi3AAoJEN0jrNd/PrOhC08QAIDbUMbIlfUW4ViIUMqQ1lTD
wGvFlNoghomHl8yDP1BuWSfHA0njwOE7M1yjR5C8aErCsHLSE7Zzx9Gbs14JwWdm
fBLsNJSE8VaRYsNEJKAr1TEON84U00l+4I079+74zDeVGJqh4Z/HkBRtuZMuqdGN
47vZVVn2PvOgEqKMCieMCCZZuHMLWxZEgHhUfpAMjdqfDfsIk+4DNvrHt1uGdQoO
wc0RZ2rhEgOb5nfRpQG9TlFEzbnRJLdhjXC3oy8QEgbLXXhEu98H3/huoBAZkTIc
p6mCC1ENJ5JOOoWsJHldR8mvtqyFh9LRhx0QcM0vuR379v2JXykDIDSYdaf8h1rq
yt9dcAF7TAYFA2IBrvKwDKXDiOGo1Tu1LnCiinTfi84wjlLiyjrsk2BiY+jWv6pH
wQUxLKKCLCi/I0vr3slJXfU5eUjmNeilNEJpADzHOvG9zuQd0mkQ7skPF7oOIJdB
ufdsS0sdhLOaW8EDmk8voUZ2f2rNZtcAobwlPwLCJBN6VI89I7SpURs/T58Hs4B/
B+sAzpCnknJiUdwsSgw0tMaQzhpeCXLi/xi3cntT+vYVQHSRNx5YX372zJIYpOLn
mMRBm0C0PeC/8DpWeCJd1NuqIALGxh7cazWd/etreQFT4nVHz1Sk83omlOyB5piN
gMfOCNazxng8u3GPAVkC
=PY10
-----END PGP SIGNATURE-----

--1UWUbFP1cBYEclgG--
