From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] clk: tegra: mark TEGRA210_CLK_DBGAPB as always on
Date: Mon, 20 Mar 2017 15:18:47 +0100
Message-ID: <20170320141847.GD28203@ulmo.ba.sec>
References: <1488295191-24038-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="VMt1DrMGOVs3KQwf"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1488295191-24038-1-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--VMt1DrMGOVs3KQwf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 28, 2017 at 05:19:50PM +0200, Peter De Schrijver wrote:
> This is needed to make the JTAG debugging interface work.
>=20
> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> ---
>  drivers/clk/tegra/clk-tegra210.c | 1 +
>  1 file changed, 1 insertion(+)

Let's revisit the power-saving aspects of this when we're actually good
at saving power. I suspect that the power consumption of DBGAPB is
dwarfed by the rest of the SoC. I've added a TODO comment as a reminder.

Applied to for-4.12/clk, thanks.

Thierry

--VMt1DrMGOVs3KQwf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAljP5McACgkQ3SOs138+
s6F1KhAAjRBkTlU+k50OlRZegGNYPADzskXC3QS4kErxGn3hkAwvh/ADmfC1GTF9
8Whvz9H7lU+Qi76pnnDoOj3/cN/7Y9RZ7WnGUrslZvfd8JuQFLFPVyKE0yxcpSMg
Rly/YHLK06q0+WgHYTeK5ZX2qdfaSL4lvyE6m/MrPnAkvK44jWJg+n72IrpIpCXF
d4rV+TBMz9bKuGq7Dj3Eg6Z4jkmLOVFVBF3O3vG/tkA+rhDCe7+dxJSa3SOCMOG8
7bymACvfLfrRef6729dz4JnlENZGUkJgvEFsOB5igJKfaQCzwOigu9iCW37knhHJ
ajEOggImYxhdTR9Ld1OHc+fRM7VVob5aB0TqQrEUcZ36SCPaeJaeu41ySDNOn4YX
mmSuUC4qxOmGw05RoV8DUtmhAb5ZPIFVXPN3sgzvHJjEXYMB20efXHCAGo7ZNYvC
SSPcESHEynolO3mcGNRp/w++LGO4OEmCKxP41zip4Emk7ZOn4XRRNcy/74EyKGgk
t4vQbJ/yU1qZi9kO6Q0SfEpZ+Mh9iFONbJZbBsJ0LMobaV8v9d/nCPANE7IZQGHN
RKAyIZbDSCAZWw/xK7Hw5PWIQ2sgnfHrikOUEnRWEkc4poyBJOzX/XE5s1T9DG0c
QlzMbVktNziIH3kCO/QmY0VrFKk7o7481v+cQtU7r2irWSN6fjU=
=qay2
-----END PGP SIGNATURE-----

--VMt1DrMGOVs3KQwf--
