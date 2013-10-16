From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: pull request for tegra clocks (resend with some CCs added this
 time)
Date: Wed, 16 Oct 2013 17:35:51 +0200
Message-ID: <20131016153550.GA22451@ulmo.nvidia.com>
References: <20131015153620.GA12721@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NzB8fVQJ5HfG6fxh"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131015153620.GA12721-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2013 at 06:36:20PM +0300, Peter De Schrijver wrote:
> The following changes since commit a0cf1abc25ac197dd97b857c0f6341066a8cb1=
cf:
>=20
>   Add linux-next specific files for 20130927 (2013-09-27 18:48:50 +1000)
>=20
> are available in the git repository at:
>   git://nv-tegra.nvidia.com/user/pdeschrijver/linux.git tegra-clk-patches=
-0
>=20
> Andrew Chew (1):
>       clk: tegra: Set the clk parent of host1x to pll_p
>=20
> Mark Zhang (3):
>       clk: tegra: Correct sbc mux width & parent
>       clk: tegra: Fix vde/2d/3d clock src offset
>       clk: tegra: Set the clock parent of gr2d/gr3d to pll_c2
>=20
> Peter De Schrijver (3):
>       ARM: tegra114: add missing clocks to binding
>       clk: tegra: replace enum tegra114_clk by binding header
>       clk: tegra: PLLE spread spectrum control
>=20
> Thierry Reding (1):
>       clk: tegra114: Rename gr_2d/gr_3d to gr2d/gr3d

I think this pull request is missing the initialization of the display
controller clocks (TEGRA114_CLK_DISP1 and TEGRA114_CLK_DISP2) from
Mikko's Dalmore HDMI series.

Thierry

--NzB8fVQJ5HfG6fxh
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSXrJWAAoJEN0jrNd/PrOhtqgQAKSzixdiJv7Ex4ifObEg7vAE
yd5wAhjdCPhr/VA1CgydmMwR5sHojLzB9yiOhAgeHoBnTyxg/dw+NnfiYfJ0XxpF
2pY4LTzEqRP0pgWBulML1uc2UcskVCBsIAUE+/vEfNBhf2dtEIyyOjqTxdCpgufy
GK77qSa3sHHwIntkwuIq54mZpI4p5vC2h/qCHoODvBeODHH3rk+hkm1SwE2V7vO5
6eZr6DXzzCVnjznXr4L7Y6K0+9HxSX9QzFoOYHR89n72qW7ChMvGOZgEawEWLwok
ELEYNI2So/oynDV1C8ZCd91PMZaRtCClMIZ0k3Twd01DNA9aLMmK3uXQsLZ7Vdvo
mhbN1+eynn68lKc6jSfwxloalpeZLBYWZ4Wh7uhXQdZY3RS6mU9mmGmR2ibiB1le
qyHhZJvVHZNE9HYvGxfCSLdulsRSTdUSCUNxhYtaYzKDS5TvtNE85+tSA5Gj2Xnv
cfwEp6hSt8vD70DCF+7eoNtVXVcJKH5R29MEq2E7qOHHidxQaQ78uK3wFRVOMT/C
xFg/ZR16ukeeVwsyv/ayLqv88kHv9ayIg3wzlPf9pKMU+AQlgTJZtcMTh5KQNU88
hD+cQ7QSB04fm42lumCWAYhDPjLA7YwkQPm4ZMGHFwCBUmQMnuq6JSm2zdtOfaUu
LV2FuhsG1UJ+Rv/m9bhM
=Vjv1
-----END PGP SIGNATURE-----

--NzB8fVQJ5HfG6fxh--
