From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v8 20/22] clk: tegra: Remove tegra_pmc_clk_init along
 with clk ids
Date: Mon, 17 Feb 2020 10:55:50 +0100
Message-ID: <20200217095550.GD1345979@ulmo>
References: <1578986667-16041-1-git-send-email-skomatineni@nvidia.com>
 <1578986667-16041-21-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="BRE3mIcgqKzpedwo"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1578986667-16041-21-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: jonathanh@nvidia.com, broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, digetx@gmail.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, spujar@nvidia.com, josephl@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--BRE3mIcgqKzpedwo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2020 at 11:24:25PM -0800, Sowjanya Komatineni wrote:
> Current Tegra clock driver registers PMC clocks clk_out_1, clk_out_2,
> clk_out_3 and 32KHz blink output in tegra_pmc_init() which does direct
> PMC register access during clk_ops and these PMC register read and write
> access will not happen when PMC is in secure mode.
>=20
> Any direct PMC register access from non-secure world will not go
> through.
>=20
> All the PMC clocks are moved to Tegra PMC driver with PMC as a clock
> provider.
>=20
> This patch removes tegra_pmc_clk_init along with corresponding clk ids
> from Tegra clock driver.
>=20
> Tested-by: Dmitry Osipenko <digetx@gmail.com>
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/clk/tegra/Makefile        |   1 -
>  drivers/clk/tegra/clk-id.h        |   7 ---
>  drivers/clk/tegra/clk-tegra-pmc.c | 122 --------------------------------=
------
>  drivers/clk/tegra/clk-tegra114.c  |  17 +-----
>  drivers/clk/tegra/clk-tegra124.c  |  33 ++++-------
>  drivers/clk/tegra/clk-tegra20.c   |   4 --
>  drivers/clk/tegra/clk-tegra210.c  |  17 +-----
>  drivers/clk/tegra/clk-tegra30.c   |  18 +-----
>  drivers/clk/tegra/clk.h           |   1 -
>  9 files changed, 19 insertions(+), 201 deletions(-)
>  delete mode 100644 drivers/clk/tegra/clk-tegra-pmc.c

I think it's best to defer this patch (along with 21 and 22) until all
the others have been merged to make sure we don't regress. Other than
that it should be fine to apply the others in any order, right? Well,
maybe not any order, but at least the ASoC patches should be able to
go through the ASoC tree without impacting functionality, right?

Thierry

--BRE3mIcgqKzpedwo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5KYyUACgkQ3SOs138+
s6HuCQ/9E10KCNy0iUunarGxx9oFFB+Di1Syr9q5oCVlhGsTqb0+10ggogn9cGrH
M9KP91Us7fdSLarDIL4cbSKiSVsHWEbRLMLZaesgO4fN6vpO7ERknHM5bsEdaBcf
/CQb0HnCNHwZ9oMbJ2l5nWrWmdzL0VR3QxqDm19MBl4pBSZjsyHytQr5TWObF1RZ
G9s9wdnbVP71dqTNxYy4F1+I4V7dDG4hvQ5uCruJK4nhQq1yJqJhTXJxT+OdtXbV
GBcl548K1e0zfxN8PRJ07I6LEA5LWr13VWIB6vYncYcRsyabe//W5peULJqGzteK
j19SHWLh1yHnl+uu0i3ogBnPDesS0g+yd6GRYjeSozlnHyRotr9rF7nhuGP48Ynf
zORxISb+zK/uklAKxn74mOBgYFSZacy+QgwwvRjb0JCvNLdLJRgmHOb3PBfL+HLU
IyrCKzpCw+4SjAdf6qXbv2ge4LEcccrtWxj8R3zAf4p9sDS+2NmqvuS+3vFYaKjS
7gfdkYrwh0wLBeT7IRn3t1MPd5aXSyH5vP07WyfP1X/v/+D12M9TFF5KFqFPz1Ml
uBFPAodiAcDuSo5Mc8Mu4y2xxGpWWd8LgJVyQuv7xpf0VW4uIBabi+hC6NwrzFKo
jXwI0TPX6+GFe65DRv0ZKWVoPyGx6U9ECN7mRgs/wKhPzXB6bcI=
=mBSp
-----END PGP SIGNATURE-----

--BRE3mIcgqKzpedwo--
