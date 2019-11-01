From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH -next] clk: tegra: Fix build error without CONFIG_PM_SLEEP
Date: Fri, 1 Nov 2019 10:50:08 +0100
Message-ID: <20191101095008.GB1167505@ulmo>
References: <20191030125650.36776-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="E39vaYmALEf/7YXx"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191030125650.36776-1-yuehaibing@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: YueHaibing <yuehaibing@huawei.com>
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com, sboyd@kernel.org, treding@nvidia.com, jonathanh@nvidia.com, skomatineni@nvidia.com, digetx@gmail.com, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--E39vaYmALEf/7YXx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 30, 2019 at 08:56:50PM +0800, YueHaibing wrote:
> If CONFIG_PM_SLEEP is n, build fails:
>=20
> drivers/clk/tegra/clk-tegra210.c:3426:13: error:
>  tegra210_clk_suspend undeclared here (not in a function); did you mean t=
egra_clk_ndspeed?
>   .suspend =3D tegra210_clk_suspend,
>              ^~~~~~~~~~~~~~~~~~~~
>              tegra_clk_ndspeed
> drivers/clk/tegra/clk-tegra210.c:3427:12: error:
>  tegra210_clk_resume undeclared here (not in a function); did you mean te=
gra210_clk_suspend?
>   .resume =3D tegra210_clk_resume,
>=20
> Use ifdef to guard this.
>=20
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Fixes: 27d10d548c04 ("clk: tegra: Add suspend and resume support on Tegra=
210")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/clk/tegra/clk-tegra210.c | 2 ++
>  1 file changed, 2 insertions(+)

Applied to for-5.5/clk, thanks.

Thierry

--E39vaYmALEf/7YXx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl27/9AACgkQ3SOs138+
s6HHBA/49ZPYvqC1AKre9jJzUfxicONkluYmQwjpNsbuJn44O6tNsj4YK+eiDbBc
jKoCC81MV+Z1IgKUWNjMgcV8GtD4huXCpuoBbnNrKkWQsyk4ZHp3O1HPkM+hqPDJ
ypjG89Nohev4Nig6gFzFM735nFSC45VvL0MYz/Q/wHqmtDXpaoZ/kFm7QEJWchlm
p2VGxJOonjG3+ClxEAiFPL2tt6E/uM7IChPCUo/XxcG4pnmAJ+g5dABeVD0R+CyT
+INdCpJMwOWJWWe5LN1TMEX1zuhhntxYDmhl4STl3fQ9ItEDqENlKTjXqw1RNzes
/Cvq7KPrYv/cfu2EDivbXHll60oxKIscML4rgTTbDBg/Rg7uYG3GudYnj95cSjt5
hP3ZjK1VG4hnl3g2tyu/5AdKjqAV8S1W26oAAiUi0w6ktZQch1iynlJ8/C+udwci
r4v7d4RaTjQ2LMz5cQMGrIj7arc1cPOcny4CIcSn/cfvJFz1TANT/c2pxf60CUiA
jIc0g7XjI7ErTYJFFR4zzHB7sp4Wf/Prw+z+im70ZKVt9aDBSZHNC1Ugc1NXeLLy
m8JV+YwKiHV9ZVRHMmYq2C7qk0n34TS50EcFo6goU4Ezc9qGPmCBhBM2HJ9Vog8N
sAwZ0t0zDBY0mmj8xW+1MykeqbgSk+BTyk5kx/KhaY+cLPYSkQ==
=XFPw
-----END PGP SIGNATURE-----

--E39vaYmALEf/7YXx--
