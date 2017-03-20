From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] clk: tegra: Add sata seq input control
Date: Mon, 20 Mar 2017 14:28:30 +0100
Message-ID: <20170320132830.GL22463@ulmo.ba.sec>
References: <1489592525-6231-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="DXIF1lRUlMsbZ3S1"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1489592525-6231-1-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--DXIF1lRUlMsbZ3S1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 15, 2017 at 05:42:05PM +0200, Peter De Schrijver wrote:
> This will be used by the powergating driver to ensure proper sequencer
> state when the SATA domain is powergated.
>=20
> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> ---
>  drivers/clk/tegra/clk-tegra210.c | 25 +++++++++++++++++++++++++
>  include/linux/clk/tegra.h        |  1 +
>  2 files changed, 26 insertions(+)

Applied to for-4.12/clk, thanks.

I assume that somebody will send out patches for the powergate driver?

Thierry

--DXIF1lRUlMsbZ3S1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAljP2P4ACgkQ3SOs138+
s6F3zQ//W90aNjkhySbIEiFQDcLzbn54fW2ynDxEWU5vTeyshwCoxmrTFB9WQisZ
gaHQBoRadQiqEA+XN3U6Aua3b225ZrmqOLNRkJVfF83QAqr1+48LJx+9iWVNLsAj
HO437l4kjY5pRHiXhsnyVb6Ioboog7lRUE/kTEft3uqlJiDHgEMDjTB1zfBDR4Dw
/fl4lwzBGG6VvoNn7fJvC0XP0ShbzJk/49aKVMO062Xaku9apXh0DI6yXuCmUckt
LXbRACTvBsqkxGOtGv9ofN4k5w8uCBSc3VlGShWXmA1IZoiSSYvFqQstZ1TeNdLA
u38dX6x5/dVr3Ow0XNw1n61EWi2aUr0goJVZ/vC5aMvb8zA9VfGy5kGEWuGKF5Kd
TNY1ZCcA3STse1lmUPPSad4fWDngp0O+hPRzqXxPY6h+NAbmjMHJZz4taAT6nvAK
vp6X2FuuRgNmidNErNhwAGlqWJTffDN3Rfqi5JsbPLTNEDkEmnzhAjC/TkS6u1bW
55wojYtBpW7UwTZYEA+K7u36P3qNa4B0BCpnbDaC1Ovr/APdkc4xicA6N3NCB50k
cHGQvMyypNJ+pzvkOex1WCTBt/Lsqy80o1bImb3uI4g7ctOfVzxPBty6DdnSRdTq
0h5AzaDkTHpOct4e7MrN5teDUv1mm7Knn39WmifpYsDG5KRyjkU=
=VpjP
-----END PGP SIGNATURE-----

--DXIF1lRUlMsbZ3S1--
