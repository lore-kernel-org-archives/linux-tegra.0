From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] soc/tegra: pmc: Drop SMP dependency from CPU APIs
Date: Thu, 13 Dec 2018 11:41:39 -0800
Message-ID: <154473009969.19322.6318653154876468527@swboyd.mtv.corp.google.com>
References: <1544694374-21231-1-git-send-email-jonathanh@nvidia.com> <154469574166.19322.12426804406101736786@swboyd.mtv.corp.google.com> <20181213160746.GA13531@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181213160746.GA13531@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Quoting Thierry Reding (2018-12-13 08:07:46)
> On Thu, Dec 13, 2018 at 02:09:01AM -0800, Stephen Boyd wrote:
> > Quoting Jon Hunter (2018-12-13 01:46:14)
> > > When CONFIG_SMP is disabled, the tegra clk driver now fails to build:
> > >=20
> > > drivers/clk/tegra/clk-tegra30.c: In function =E2=80=98tegra30_cpu_rai=
l_off_ready=E2=80=99:
> > > drivers/clk/tegra/clk-tegra30.c:1151:2: error: implicit declaration o=
f function =E2=80=98tegra_pmc_cpu_is_powered=E2=80=99 [-Werror=3Dimplicit-f=
unction-declaration]
> > >   cpu_pwr_status =3D tegra_pmc_cpu_is_powered(1) ||
> > >     ^
> > > Fix the above error by removing the CONFIG_SMP ifdef around the
> > > declaration around the PMC CPU APIs because although these are not
> > > needed for non-SMP configurations, there is no harm in including these
> > > for non-SMP builds either.
> > >=20
> > > Fixes: 61866523ed6e ("clk: tegra30: Use Tegra CPU powergate helper fu=
nction")
> > > Reported-by: Arnd Bergmann <arnd@arndb.de>
> > > Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> >=20
> > Can I pick this into clk tree? That would make the compilation bisection
> > hole very small. I could even reorder the clk-tegra branch to have this
> > before the user so the bisection hole doesn't exist.
>=20
> Fine with me:
>=20
> Acked-by: Thierry Reding <treding@nvidia.com>

Ok thanks. I'll reorder things soon, but for now I'll just pick this
atop the tegra branch and merge it up to next.
