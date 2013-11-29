From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 28/31] ARM: tegra: remove legacy clock entries from DT
Date: Fri, 29 Nov 2013 15:53:04 +0100
Message-ID: <20131129145303.GH9712@ulmo.nvidia.com>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org>
 <1384548866-13141-29-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Bg2esWel0ueIH/G/"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1384548866-13141-29-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--Bg2esWel0ueIH/G/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2013 at 01:54:23PM -0700, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Now that all Tegra drivers have been converted to use the common reset
> framework, we can remove all the legacy DT clocks/clock-names entries for
> "clocks" that were only used with the old custom Tegra module reset API.
>=20
> Cc: treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
> Cc: pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
> Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra20.dtsi |  3 +--
>  arch/arm/boot/dts/tegra30.dtsi | 18 +++---------------
>  2 files changed, 4 insertions(+), 17 deletions(-)

Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--Bg2esWel0ueIH/G/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSmKpPAAoJEN0jrNd/PrOhml0P/2pixqGQpfNy5CpY5RByXAa7
mzta53EiMJhOyH33gS9Ny20X3uhapTBwhjX8Sp8eibq7udqfj7uuifQ+DWsEgXzm
zs4Ggudo10KQCxansXlYjaNxN7b40A6SZ6bjA4LELVdRqhOkLgpr53OyXNocO/nL
1PLnYVPEXGqFpomZc/srW9dQp/DmRTcYivVDoFmGrQUmQctBDOq0Zq3M9bO/xjNp
Qg5lJ2Azyc7leTC5moj2nsqJcFAITg6ZjJOFyFUS3hvJ8AWNd0BvDsPKARRh8q7e
ywft8QFEOr52GQNarHN6IKbPQexWxvaq5PzDVAkunzf3y0pmTfD+Amv9FIH9MfmK
vVpLOCTx44NvBehCAGdaGCAYBZBF/ip6hpm9GepTXKmKPtmn8Fi6W5Ze3fYB40Wb
/o11yuzma4b9in6LLhj3GDL5WeceZeHhmXJH5+Uo29CvoF9gdcKCqbIkVSGz8tPu
8rgZ33pY49sP707af+7I2OXEyCExEBY2AFR9/SakVXVBLTGUWxuICTVnt07Tl1Q5
i6SfiP6qxDJp1vVxhVZdIrZy8owO4xseECdrES0gSR9xMIGUgJ+hgND5fuHusUDc
CWEE95469oW4DT1zbew0Md3+PelWNkAnRZKh+SXLMXz0kD32L2jaOuabfciVVAzk
sEIAQPyba6ZkrEzeH4er
=BkWE
-----END PGP SIGNATURE-----

--Bg2esWel0ueIH/G/--
