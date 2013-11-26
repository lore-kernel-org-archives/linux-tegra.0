From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: tegra: fix DEBUG_LL combined with LPAE
Date: Tue, 26 Nov 2013 11:21:11 +0100
Message-ID: <20131126102111.GD27752@ulmo.nvidia.com>
References: <1385419003-11348-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Qrgsu6vtpU/OV/zm"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1385419003-11348-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--Qrgsu6vtpU/OV/zm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 25, 2013 at 03:36:41PM -0700, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> The DEBUG_LL UART address is mapped as an MMU section, hence, the
> virtual address must be section-aligned. Sections are 1MB without LPAE
> and 2MB with LPAE. Tegra's virtual address was only aligned to 1MB, and
> hence the mapping was set up incorrectly with LPAE enabled, thus causing
> a hang early during boot. Fix this by picking a different virtual address
> that is aligned to 2MB.
>=20
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/include/debug/tegra.S | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--Qrgsu6vtpU/OV/zm
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSlHYXAAoJEN0jrNd/PrOhyj0P/iNSvMKUgu2Z3C4kwzIgjVnI
F6v0xJqUJa2ou/E6NTcg5Yu1tHCETZF/lRlqQhSvGIvgQOLVCeCW4g5T5Xjx3Iyv
nX0bQH0suJJMON/cEBeLrUwCecos9pu6JC04ErgNtYzBVaTWe8V65vqGrd2XFiPJ
xjx7v7ephrF93O0FdSdaLJAbaN8VXkFIRJhlcgvU1kG0/DBClHv6KPx9OnXEeEJh
A4wtT/OzCAG9PBO5oRRvfhoj6nPmTM1Qako5dM46txlp0kj85BWuiW0mwvZIJ9QK
jW6i23IOalBY2SIR/ib/pTKGoKSYpn4nx++hrOUgUukp1lkCldkMO/e2XByCtxuo
68HreEvR0m66tyxxZn/ILYP5F3D+Xiwb2gPK2Y7EJJgwHWkUMnF/GZGW/n0QJTsI
gNiD3akw4BGuB1kCpLq8+HE7hhwRSzAXmQmoleL40cnHroGl0++amkZUioxHNGUs
Hf8q4E1RxAGPTWfIvT5bzbIxcM9+8xXQ392ifHlhnWPOoUD1+YctHuKDKtQJYzod
BE8PCMeTPREftPsm+RwUIPiKb2m/nnAG8CcfWrmrkPkJ9e9QOpPX0JKJGNPwk2tr
zsWZWtNOVnhyYzHH7CEonPznJ9lVd8hoFCyVvOVIRo18s0vTWE4SCP31/PJ37bTZ
iSfVXdxBGfk9AYZJL1qc
=n6ti
-----END PGP SIGNATURE-----

--Qrgsu6vtpU/OV/zm--
