From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [GIT PULL 5/7] ARM: create a cros-ec-keyboard DT fragment
Date: Fri, 18 Jul 2014 16:48:14 +0200
Message-ID: <20140718144813.GA7149@ulmo>
References: <1405694740-4090-1-git-send-email-thierry.reding@gmail.com>
 <1405694740-4090-5-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4Ckj6UjgE2iN1+kY"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1405694740-4090-5-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 18, 2014 at 04:45:38PM +0200, Thierry Reding wrote:
> The following changes since commit 7171511eaec5bf23fb06078f59784a3a0626b3=
8f:
>=20
>   Linux 3.16-rc1 (2014-06-15 17:45:28 -1000)
>=20
> are available in the git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegr=
a-for-3.17-dt-cros-ec-kbd
>=20
> for you to fetch changes up to 1a395e3b4f2e9038964c9eec392ed5300a4b5b83:
>=20
>   ARM: dts: Use the cros-ec-keyboard fragment in exynos5250-snow (2014-06=
-16 12:11:32 -0600)
>=20
> ----------------------------------------------------------------
> ARM: create a cros-ec-keyboard DT fragment
>=20
> This branch contains a series from Doug Anderson that creates a DT
> include file to share some common DT content between Tegra and Exynos
> boards that use cros-ec. I'll be pulling this into Tegra's for-3.17/dt
> branch, and I assume the Samsung maintainers will do something similar.
>=20
> ----------------------------------------------------------------
> Doug Anderson (3):
>       ARM: dts: Create a cros-ec-keyboard fragment
>       ARM: tegra: Use the cros-ec-keyboard fragment in venice2
>       ARM: dts: Use the cros-ec-keyboard fragment in exynos5250-snow
>=20
>  arch/arm/boot/dts/cros-ec-keyboard.dtsi | 105 ++++++++++++++++++++++++++=
++++++
>  arch/arm/boot/dts/exynos5250-snow.dts   |  93 +-------------------------=
--
>  arch/arm/boot/dts/tegra124-venice2.dts  |  96 +-------------------------=
---
>  3 files changed, 111 insertions(+), 183 deletions(-)
>  create mode 100644 arch/arm/boot/dts/cros-ec-keyboard.dtsi

Note that Olof already mentioned that he had pulled this, but he also
said that he hadn't pulled it into anything that feeds into linux-next
so I thought I'd better send it again to make sure it's not forgotten.

Thierry

--4Ckj6UjgE2iN1+kY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTyTOtAAoJEN0jrNd/PrOhjhEQAILtCjfik/2gluaaX1aqwq5c
xX3R4khT+hRpYJilZZdxcxoeF27WgSwC0vmVoViXt3eLdmY7ldmb++jHsfV5TfCG
Ruew2Xvm6yOLNtHiIIjh7QDkKO6OXY5nJJeJiU7DrCVkYLdeslwNkvW3lS82c/CC
B0u2dNo6K/+8J5GR0ig1uNbHCNT1YHdX8XLc712vwUHA8l/r/B4rIpzBm8jINUo6
xlcYy2mlyu4p/ufM5qC/ZqlJ9QYEOExeeRpUO+YWpV53enXhaTQnPEIE+4H67WO4
oFUXlMmICLiVR3PoxWaxr5twCDoDSYrBzLP9ZAPFgtgPSivrV1JICmt7lBJNEIUt
Zap105icYY9Sw12M96p3RfsZCKX3McSvvxJFB2pUGZhuwcG+L8VMiJgaH5+fnai7
+S7PLPmuE4K+dCNCcndchl8jqLO0JLHBfZrUAKFQxXybDm2ON1q6cg4uqqQimWpf
CTgXLjYM9L4f3iRksihYvSgmNS6ZMxKMtKskNgyOPCdEP1FQQUygrL7fiCKnErMY
H63X74VOnJhS1RYkFPE6NGnmUDQ6jZX7Xuc/1Zpl+nnOY85QYMm1j3fUu7z5617R
C5/Py62fhUZk5Ga2LTU1gE6mkB94xrJUaUZCBfdS4Cz9m64nOPooJkThkLAmntnn
DLMv4dpzABy/KesR8zaB
=NSWQ
-----END PGP SIGNATURE-----

--4Ckj6UjgE2iN1+kY--
