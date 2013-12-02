From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] clk: tegra: Correct clock number for UARTE
Date: Mon, 2 Dec 2013 13:14:48 +0100
Message-ID: <20131202121447.GB12793@ulmo.nvidia.com>
References: <1385983825-20317-1-git-send-email-treding@nvidia.com>
 <1385984847.4086.3.camel@weser.hi.pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="b5gNqxB1S1yM7hjW"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1385984847.4086.3.camel-WzVe3FnzCwFR6QfukMTsflXZhhPuCNm+@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--b5gNqxB1S1yM7hjW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 02, 2013 at 12:47:27PM +0100, Lucas Stach wrote:
> Am Montag, den 02.12.2013, 12:30 +0100 schrieb Thierry Reding:
> > UARTE has clock number 66. Number 65 is the right one for UARTD.
> >=20
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  drivers/clk/tegra/clk-tegra-periph.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/c=
lk-tegra-periph.c
> > index 5c35885f4a7c..3744a6fe589e 100644
> > --- a/drivers/clk/tegra/clk-tegra-periph.c
> > +++ b/drivers/clk/tegra/clk-tegra-periph.c
> > @@ -492,7 +492,7 @@ static struct tegra_periph_init_data periph_clks[] =
=3D {
> >  	UART("uartb", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_UARTB, 7, tegra_clk=
_uartb),
> >  	UART("uartc", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_UARTC, 55, tegra_cl=
k_uartc),
> >  	UART("uartd", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_UARTD, 65, tegra_cl=
k_uartd),
> > -	UART("uarte", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_UARTE, 65, tegra_cl=
k_uarte),
> > +	UART("uarte", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_UARTE, 66, tegra_cl=
k_uarte),
> >  	XUSB("xusb_host_src", mux_clkm_pllp_pllc_pllre, CLK_SOURCE_XUSB_HOST_=
SRC, 143, TEGRA_PERIPH_ON_APB | TEGRA_PERIPH_NO_RESET, tegra_clk_xusb_host_=
src),
> >  	XUSB("xusb_falcon_src", mux_clkm_pllp_pllc_pllre, CLK_SOURCE_XUSB_FAL=
CON_SRC, 143, TEGRA_PERIPH_NO_RESET, tegra_clk_xusb_falcon_src),
> >  	XUSB("xusb_fs_src", mux_clkm_48M_pllp_480M, CLK_SOURCE_XUSB_FS_SRC, 1=
43, TEGRA_PERIPH_NO_RESET, tegra_clk_xusb_fs_src),
>=20
> Is this a stable patch or why are those magic numbers even necessary? I
> have to admit I didn't follow the Tegra clk stuff closely, but with all
> the churn going on there I would have suspected that those numbers would
> have been replaced by the DT include defines by now.

There is no 1:1 mapping between the DT include defines and the hardware
clock numbers. For instance, UARTB has DT define 192, but the enable bit
is at offset 7.

I think the main reason for doing was because of the Tegra-specific
reset API. Now that that's being converted to the generic API, there may
be some room to refactor this. Until then I think we're stuck with
having these numbers in this table.

But perhaps there were other reasons to do this as well. Peter or
Stephen may know the details better than I do.

Thierry

--b5gNqxB1S1yM7hjW
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSnHm3AAoJEN0jrNd/PrOh/2QQAK7hxFKDIckVGIDM2BwjYOFu
FVZF5lzc45d8LxB8L/bPmhluvgk3MVFx+q+khOaO2GoY4X9J8CkwQHurJdFbAPRd
db6chX0B2Hd1/QvzS6hcU+iO62J97it5lCVtHcxr9fCrmjp7hAFhOwUeDNSRpHct
td9UKH4KJ5/PuQzblVc3qb6jYxRxhsGblYER+iiHlmtwHdX8kaZ7RKLX+1LcT39D
2hZIwe8f3LP7cnVZYyxsEU/nVvDlqVvLB8zvBv3W5zXxhkEMUxqAWjP6gIANIoVr
XtkGUifDYEErpOJhnoMB7KFI4n+0FWJscTc+bHuxQ67Xou1HyLXRUHqNOoWfkGbQ
+7afpiodUcUtCd412wBJcoS5lER2uYRRPDR4kKMQZC4DUmbUKyFq279r7UhEqjTP
ML1rQyrwMrEvijB9y6UnVyUPcIB+hvSnc83YtdxDYgxN7lWvqs4c1nv6bfMY7K8v
kfJUPMWcxkWvQt3eiOFXay8oAllO4gfiKPHOF5HPQkZnqCE8Yst+ubsLsTROo9DU
c3L+YND00Pf3ttlfHDpvkgKOv0uSbp4vIGnMt2IJnWeD2CunFME941i6+sAbKrn9
9ZvkxLodSz8lDYePlF1CUoeoZNyicH/7Ip0yDPHcFGkJJ5Z7343lPcFWTkgVVhB6
Ql1gzvpAGvIdIvxuH+2J
=s9fw
-----END PGP SIGNATURE-----

--b5gNqxB1S1yM7hjW--
