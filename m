From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v6 7/8] clk: tegra20: Check whether direct PLLM sourcing
 is turned off for EMC
Date: Thu, 25 Oct 2018 16:31:41 +0200
Message-ID: <20181025143141.GK21521@ulmo>
References: <20181021183052.32023-1-digetx@gmail.com>
 <20181021183052.32023-8-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Z9t8O/5YJLB6LEUl"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181021183052.32023-8-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--Z9t8O/5YJLB6LEUl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 21, 2018 at 09:30:51PM +0300, Dmitry Osipenko wrote:
> Ensure that direct PLLM sourcing is turned off for EMC as we don't support
> that configuration in the clk driver.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> ---
>  drivers/clk/tegra/clk-tegra20.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Applied to for-4.21/clk, thanks.

Thierry

--Z9t8O/5YJLB6LEUl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlvR080ACgkQ3SOs138+
s6FyqBAAgtHHN3T6xW1Y/Dr30FKTXDoDZ/+OfYWpm1EQkHr6G6NuQ/RolegyZPA2
Tm1B7qKy2zS1zXHHesd/B1juotJomXkBtJERZMfYMS9gYDfrCD5s+eScXWM+jsji
hoylAC0snye0liLZ6+N48Nyf60kFiTYIBQTRzxRGkddpJmVmFWE/xG/kPjItk9qM
oR0QftxAaPUi5LxOWEAxy4+7D6ZWWmdjJuqBc0s0nW+noNAk79xqCwdmvrZK7YyL
A+zh5MDmYBMDVqup51mAUom6O6cicRIiv2nOHmElYs2NI4t9d8dOgXboJi7p5gjA
IcFiN2s155e9egLUK3DJu5FSIpigy5ssEQQembH/Rq1MLG2PzY9zveDPW35DNNjk
cuc4qxb6PsO7sOApgbVsiN7vpEIhEcjNaLF1XagzaKsHBSFO0tBLt9LAGf3KwHQ5
ZR6ET5oLRMRJmMBSJxH7yzceyLIaVNd1D+TKHEWF61Y2iQptt6EBRv61X1gmHt85
EgPpCWUgmTS4FFIeLKF5BpktA/u4MofIGKqqYJXEGBKDbhS9WAYXkV0JJ2rwM0v8
zfSLrRXOYSRJTw5SA7I0167Z9UxpgcogpG3zXez8wA0I+yuGnL56vCtM2OFbWGCA
dPewRlRuYh/tMwehkhoRaQjr/IOarvcEEpDtmGVo5QsH5yhMNts=
=1zbT
-----END PGP SIGNATURE-----

--Z9t8O/5YJLB6LEUl--
