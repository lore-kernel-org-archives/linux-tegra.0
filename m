From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 00/20] Tegra210 Clock Support
Date: Tue, 5 May 2015 15:14:21 +0200
Message-ID: <20150505131419.GA11535@ulmo.nvidia.com>
References: <1430757460-9478-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cNdxnHkX5QqsyA0e"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1430757460-9478-1-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 04, 2015 at 12:37:20PM -0400, Rhyland Klein wrote:
> This patch series updates the tegra common clock driver and adds
> support for the Tegra210 clocks. The clocks in Tegra210 changed
> significantly in some ways from earlier generations, so to support
> them, we need to extend our base framework a bit and add some new
> features.
>=20
> Some patches here also address issues found while adding features
> and other cleanup type work.
>=20
> v4:
>   - Fixed minor checkpatch errors and other typos
>   - Rebased ontop of linux-next 20150504

Are you sure about this? It still doesn't apply cleanly to next-20150504
for me.

Thierry

>=20
> v3:
>   - Added a fix from Andrew Bresticker that was found while testing
>     this code.
>=20
> Andrew Bresticker (1):
>   clk: tegra: pll: Fix issues with rates for VCO PLLs
>=20
> Bill Huang (7):
>   clk: tegra: pll-params: change misc_reg count from 3 -> 6
>   clk: tegra: pll: Add logic for SS
>   clk: tegra: pll: Add code to handle if resets are supported by PLL
>   clk: tegra: pll: Adjust vco_min if SDM present
>   clk: tegra: pll: Add dyn_ramp callback
>   clk: tegra: pll: Add Set_default logic
>   clk: tegra: Add Super Gen5 Logic
>=20
> Rhyland Klein (12):
>   clk: tegra: Modify tegra_audio_clk_init to accept more plls
>   clk: tegra: periph: add new periph clks and muxes for Tegra210
>   clk: tegra: pll: add tegra_pll_wait_for_lock to clk header
>   clk: tegra: pll: simplify clk_enable_path
>   clk: tegra: pll: update warning msg
>   clk: tegra: pll: Don't unconditionally set LOCK flags
>   clk: tegra: pll: Add logic for handling SDM data
>   clk: tegra: pll: Add logic for out-of-table rates for T210
>   clk: tegra: pll: Add specialized logic for T210
>   clk: tegra: pll: Add support for PLLMB for T210
>   clk: tegra: pll: Fix _pll_ramp_calc_pll logic and
>     _calc_dynamic_ramp_rate
>   clk: tegra210: add support for Tegra210 clocks
>=20
>  .../bindings/clock/nvidia,tegra210-car.txt         |   56 +
>  drivers/clk/tegra/Makefile                         |    2 +
>  drivers/clk/tegra/clk-id.h                         |   64 +-
>  drivers/clk/tegra/clk-pll.c                        |  697 ++++-
>  drivers/clk/tegra/clk-tegra-audio.c                |   25 +-
>  drivers/clk/tegra/clk-tegra-periph.c               |  257 +-
>  drivers/clk/tegra/clk-tegra-super-gen5.c           |  150 ++
>  drivers/clk/tegra/clk-tegra114.c                   |   30 +-
>  drivers/clk/tegra/clk-tegra124.c                   |   31 +-
>  drivers/clk/tegra/clk-tegra20.c                    |   18 +-
>  drivers/clk/tegra/clk-tegra210.c                   | 2761 ++++++++++++++=
++++++
>  drivers/clk/tegra/clk-tegra30.c                    |   31 +-
>  drivers/clk/tegra/clk.h                            |   90 +-
>  include/dt-bindings/clock/tegra210-car.h           |  401 +++
>  14 files changed, 4468 insertions(+), 145 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra2=
10-car.txt
>  create mode 100644 drivers/clk/tegra/clk-tegra-super-gen5.c
>  create mode 100644 drivers/clk/tegra/clk-tegra210.c
>  create mode 100644 include/dt-bindings/clock/tegra210-car.h
>=20
> --=20
> 1.7.9.5
>=20

--cNdxnHkX5QqsyA0e
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVSMIoAAoJEN0jrNd/PrOhpZoP/jxQGXjyrWJyBGnbITxAU28B
8C0Oqr17BfF3GZZE/0NT2122iCx4hAchrE7VVaI/91fm4OlM25Dh668BTwyG9Aeh
cCciWY881EWk0wZFmkHuDJfJ+mPsUxMKCLkx19Ur/++1yekNw4Aeeb95ICaU1A1X
OWWNLQidrfa7by+hvCtWOd1vhMDKpF/49e13dBuXuyBO2DH2Sy2iwmuiE1gb4xFr
/hn389S6bW2Lnxt3i9pnXa+op9+9K/eA9G3Cx+SyKcq8Anmbb/UHu5lDsMLsgRku
IbNVMG3tjS0D1L2dQsq9J1L8CaY6ETHlnvJER8vyTi2hSKmaKUJHCY996Ls8v1bT
fVI+Bnj09mLcCQ8CZk1R/C2hNoZMalD9SCAOvgBwVbpbQBI38kDw3nHe3pfoZBJh
0MDBW9/+bBJh//uork21gsRAXvDAttXySIMtT21pRo16yu/IX6lGRJDYsgUwhmOp
d1zRB4K0YNbExf1S3w/Drxked1K1lbTe5k9qfw7kPR6K5T13tK/wz/vS+lZOha9T
g3ph9lAqnob3sgAhxXMWW0Zcbc6PNRKcxntSp2QGagPVkJ9CJrYecGN9D3kEwy8D
hf56bIpiuwnIv5lDlRa4kvkmoSHUsX9HE/O3xvOcVH0oFy3+V45deueSV/gvY3Ww
kvVAoOUq9eBFTZjFDnBW
=CAzy
-----END PGP SIGNATURE-----

--cNdxnHkX5QqsyA0e--
