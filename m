From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: tegra: Enable the mic-detect gpio on Acer
 Chromebook 13
Date: Tue, 2 Dec 2014 10:25:36 +0100
Message-ID: <20141202092535.GA6135@ulmo>
References: <1412268212-3458-1-git-send-email-dgreid@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vtzGhvizbBRQ85DL"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1412268212-3458-1-git-send-email-dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 02, 2014 at 09:43:32AM -0700, Dylan Reid wrote:
> Enables the gpio-base mic detection on the Acer Chromebook 13.  This
> gpio is set by the jack-detection chip when it notices either of the
> TRRS type headsets with a microphone.
>=20
> Signed-off-by: Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra124-nyan-big.dts | 2 ++
>  1 file changed, 2 insertions(+)

Applied for v3.20, thanks.

Thierry

--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUfYWPAAoJEN0jrNd/PrOhMCIQAMF3ZSLUlCENPRAEGHpnweFH
I+R+Hl2kPos7EkgI4rTAtQVgAulSB11RPU6FTLpTTpTHaZKxcLFZe8imI1tuDxJu
naWairJtTLgYJaUAhaHnKolFJBSkYSrwu1g4yzzHFGaKlc9Y/Xj0XHM/951QrmMu
VaAf1RlURN8VMSr2DH9gQe4SRdQuijghggZ3Bes1MMeE7Z87zQm1YZaTD+BNkUIe
Zt52ZC3pstp9bRwQB8pjc0vKRqgnzjmfWWlsi9Wzi6wS5P9sGSikmEQBKpLfWPm1
4TgON8rgXiEou5TdkLJVx7kd3bAuj9jhh4RlIfm8dE6GSMbQOwMZ7ni3dW2Ydb2N
1ESuxwSPm9W+1ElbqRfLa1/H2koZkPSAVFixxs6WHDJHg2oFN4Sfieee/sZD+Z8A
qUN8Is2Aecy6UFGR9WdpE0kOfAANAcHshyMR15DK6R9nyOhhX/NDrzOfj/etvfN7
0adjfakKR/HgUMtt/hMXgdqgh14lKQJ0Zx4VHS/2wCF2mPXcIeQx7f9pgpMuh7Y5
Z+eb/RG5nFJwoogVCH9yknSNkmZOZM6/UPGrd/YoASUE8K7nw6f/Yt5R/Pa6z0H3
nKXFFb/Y9HzZFKih2qhE5rpdEubKUhJKt7gqvgdPGIO7nhfTQ1HLvawG+ASVs3A0
1yaUByTeQ1tohokbXcCC
=NqGN
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--
