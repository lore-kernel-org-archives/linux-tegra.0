From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] soc/tegra: pmc: Drop SMP dependency from CPU APIs
Date: Thu, 13 Dec 2018 02:09:01 -0800
Message-ID: <154469574166.19322.12426804406101736786@swboyd.mtv.corp.google.com>
References: <1544694374-21231-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544694374-21231-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Quoting Jon Hunter (2018-12-13 01:46:14)
> When CONFIG_SMP is disabled, the tegra clk driver now fails to build:
>=20
> drivers/clk/tegra/clk-tegra30.c: In function =E2=80=98tegra30_cpu_rail_of=
f_ready=E2=80=99:
> drivers/clk/tegra/clk-tegra30.c:1151:2: error: implicit declaration of fu=
nction =E2=80=98tegra_pmc_cpu_is_powered=E2=80=99 [-Werror=3Dimplicit-funct=
ion-declaration]
>   cpu_pwr_status =3D tegra_pmc_cpu_is_powered(1) ||
>     ^
> Fix the above error by removing the CONFIG_SMP ifdef around the
> declaration around the PMC CPU APIs because although these are not
> needed for non-SMP configurations, there is no harm in including these
> for non-SMP builds either.
>=20
> Fixes: 61866523ed6e ("clk: tegra30: Use Tegra CPU powergate helper functi=
on")
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

Can I pick this into clk tree? That would make the compilation bisection
hole very small. I could even reorder the clk-tegra branch to have this
before the user so the bisection hole doesn't exist.
