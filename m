From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: tegra: fix SMP build
Date: Tue, 11 Dec 2018 09:21:11 -0800
Message-ID: <154454887151.17204.5632248748272979028@swboyd.mtv.corp.google.com>
References: <20181211143528.2024488-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181211143528.2024488-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, Aapo Vienamo <avienamo@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Quoting Arnd Bergmann (2018-12-11 06:35:07)
> When CONFIG_SMP is disabled, the tegra clk driver now fails to build:
>=20
> drivers/clk/tegra/clk-tegra30.c: In function 'tegra30_cpu_rail_off_ready':
> drivers/clk/tegra/clk-tegra30.c:1151:19: error: implicit declaration of f=
unction 'tegra_pmc_cpu_is_powered'; did you mean 'tegra_powergate_is_powere=
d'? [-Werror=3Dimplicit-function-declaration]
>   cpu_pwr_status =3D tegra_pmc_cpu_is_powered(1) ||
>=20
> I don't know if tegra works without CONFIG_SMP, but we can get it to
> build by making the calls conditional, and removing the pointless
> ifdef around the declaration. The assumption now is that in a
> non-SMP system, the secondary CPUs are always disabled.
>=20
> Fixes: 61866523ed6e ("clk: tegra30: Use Tegra CPU powergate helper functi=
on")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> Not sure if this is the best solution. If you think it's not, please
> submit a different fix.

Hmm.. Is there any reason why the implementation of
tegra_pmc_cpu_is_powered() is under an ifdef CONFIG_SMP? I'd rather not
have to think about SMP or not in this clk code and have the
tegra_pmc_cpu_is_powered() function do the UP vs SMP code optimization.
