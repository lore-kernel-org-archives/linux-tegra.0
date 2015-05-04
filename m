From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 00/20] Tegra210 Clock Support
Date: Mon, 4 May 2015 16:13:15 +0200
Message-ID: <20150504141313.GA17642@ulmo.nvidia.com>
References: <1430506447-29074-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vkogqOf2sHV7VnPd"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1430506447-29074-1-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 01, 2015 at 02:53:47PM -0400, Rhyland Klein wrote:
> This patch series updates the tegra common clock driver and adds
> support for the Tegra210 clocks. The clocks in Tegra210 changed
> significantly in some ways from earlier generations, so to support
> them, we need to extend our base framework a bit and add some new
> features.
>=20
> Some patches here also address issues found while adding features
> and other cleanup type work.
>=20
> v3:
>   - Fixed pll_u hierarchy which was incorrect
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

Rhyland,

what is this based on? It doesn't apply on top of any recent linux-next,
nor v4.1-rc1 or v4.0.

Can you regenerate the series on top of v4.1-rc1, please?

Thierry

--vkogqOf2sHV7VnPd
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVR352AAoJEN0jrNd/PrOhB64QAMBEFVMz0MCOn5sBc6270H/r
S/srK82bUfBbXN+LAFLJM5g6psa1dmB6adDmrUz5X1d1N5c4cclW/gcD9af9Nv4O
RSBu9v84b+hD1L0s8WTkHUtVeRGzoSzJVg7tKM4txKqhvWJh9TyOl/BKq9MZf2s9
p+PzT1B9fKUjwO4XP313JYM7zTkf5AwNdMHAirUb5s0nmOOp2I5c06oq2IJRBlTV
hMPEHNl1h/GjbN/m8r/7BNw/Cu8Z3IVDwusgW9XOiiTWYkMZ9QLItMRDbRkgNCXb
kseE63J5XBAz28KsEoCM57DDWq2A8lrNR6tEaMhlqt7vh3cq5spmcWEIsD33GV9q
xCqQqfEY/nXD2wA+ipZaxmMKXFq8m1b2YCPCIs9vGrxJlsUnUuLzEvtsgUqEw3FA
UX7yXW3hhU18kUcCnJiDy02bagNQVSUrJJbYLJq9SaMaUghDcSHECGrf8z61ZXAq
kar6H6iCFF/cfEZMacyZBSLwv4yGgVRPpWBwAEWoRyHZyhQY4IY6VW2Gm5xC72o7
P20m18D3Uac62ZnSI8E+pMJWmPwW0r6mtbkC6IatQVPtneD3ejRugseKsHFLIPd0
HdpqezJCm3NRa1EteJTOl5AOzjN14eVPU+35Vt5WsRParwIXpR+ptcu+KnP2MbEg
oF5GnvAnysj+nNvYAGy8
=G05z
-----END PGP SIGNATURE-----

--vkogqOf2sHV7VnPd--
