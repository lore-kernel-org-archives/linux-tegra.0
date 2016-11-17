From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [bug report] clk: tegra: Add BPMP clock driver
Date: Thu, 17 Nov 2016 18:25:28 +0100
Message-ID: <20161117172526.GA20185@ulmo.ba.sec>
References: <20161117125645.GA32763@mwanda>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="n8g4imXOkfNTN/H1"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161117125645.GA32763@mwanda>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

--n8g4imXOkfNTN/H1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dan,

On Thu, Nov 17, 2016 at 03:59:54PM +0300, Dan Carpenter wrote:
> Hello Thierry Reding,
>=20
> The patch 569d53d81e37: "clk: tegra: Add BPMP clock driver" from Aug
> 18, 2016, leads to the following static checker warning:
>=20
> 	drivers/clk/tegra/clk-bpmp.c:183 tegra_bpmp_clk_get_parent()
> 	warn: sizeof(&pointer)?
>=20
> drivers/clk/tegra/clk-bpmp.c
>    171  static u8 tegra_bpmp_clk_get_parent(struct clk_hw *hw)
>    172  {
>    173          struct tegra_bpmp_clk *clk =3D to_tegra_bpmp_clk(hw);
>    174          struct cmd_clk_get_parent_response response;
>    175          struct tegra_bpmp_clk_message msg;
>    176          unsigned int i;
>    177          int err;
>    178 =20
>    179          memset(&msg, 0, sizeof(msg));
>    180          msg.cmd =3D CMD_CLK_GET_PARENT;
>    181          msg.clk =3D clk->id;
>    182          msg.rx.data =3D &response;
>    183          msg.rx.size =3D sizeof(&response);
>=20
> This should almost certainly sizeof(response). int vs pointer.
>=20
>    184 =20
>    185          err =3D tegra_bpmp_clk_transfer(clk->bpmp, &msg);
>    186          if (err < 0) {
>    187                  dev_err(clk->bpmp->dev, "failed to get parent for=
 %s: %d\n",

Mike pointed that out during review and I've fixed it since then. I
assume that this worked fine because we were accidentally ovewriting
something on the stack that we no longer used (perhaps the following
msg variable?).

Thanks for reporting,
Thierry

--n8g4imXOkfNTN/H1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYLegDAAoJEN0jrNd/PrOhuVcQALYXkmdoQXvAUSrsN5fDmfJ2
8bidxNqvuj2A+xwALnOzkoxj3Vkhcd6e728r+oI6PtGhSbJ2+m/in9IMgKZ1AQPx
3yjnHPsxzORyUXPmd6dqwo/tuhdFfRawe41qd2Orj1WD2CqRSJ+2e+MokkMbynXu
p++bE1jU2cPVwntU+GLsfZRJ8uQbrbFDNjUiw9tvQkGhH+qsGqNOy04MMzGTHk90
Y6c1ECLDqQ1qBOI+XLf7Zye3UpfcGAemTXeBGnFk4pUdDt9ZfJREixRei9xJQT/Z
J97TeN3kImPekibLV1I9kM/048A3hjx2GQ8/Rp9rhFNdgFWNFYS72PoSCgDwlw9F
Ycrh/3Tb4QkqaDZ85MJdt8+SMrwZszMHNKvPArXXqtU0ky8itg1plMQtiJ9S9WEk
iT+ExiD+63qLSIRVuAYpt/eDpG+6Tq0Yu1toj6SPTYGvEzQpZgzCAWQvBseK9pAq
vXEDFf7JrWsbppHcTOdyozeeNn27UkFsDeOs8y+mTmYYnFMZKwckt0RAsK1E1mNh
KtxqS3XL+s6ZmEfwa+88YHXBQKQCfKhWWDEnaTNlU57FUwbEn2VPPuXlBb9KSGpr
b24dwm9zLeH1CVwuCwJ+hyJwDWWXYLewHLa0a5L59ZQjJ9JnsuhNzcQCxcpkEYjQ
SflwFhwk2tQ8OUfqrjjx
=/l+h
-----END PGP SIGNATURE-----

--n8g4imXOkfNTN/H1--
