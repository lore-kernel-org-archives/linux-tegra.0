From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH v1 0/2] clk: Tegra124 PLLM fixes
Date: Wed, 24 Apr 2019 11:36:25 +0300
Message-ID: <20190424083625.GQ12975@pdeschrijver-desktop.Nvidia.com>
References: <20190411214835.19947-1-digetx@gmail.com>
 <46c12545-0e9e-93bf-2ccc-4577f4eb223e@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <46c12545-0e9e-93bf-2ccc-4577f4eb223e@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Apr 19, 2019 at 02:50:10PM +0300, Dmitry Osipenko wrote:
> 12.04.2019 0:48, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > Hello, here are two trivial patches that are correcting PLLM on Tegra12=
4.
> > First fixes system lockup due to a bad hardware configuration, second
> > removes usage of a non-existent register bit.
> >=20
> > Dmitry Osipenko (2):
> >   clk: tegra: Fix PLLM programming on Tegra124+ when PMC overrides
> >     divider
> >   clk: tegra124: Remove lock-enable bit from PLLM
> >=20
> >  drivers/clk/tegra/clk-pll.c      | 4 ++--
> >  drivers/clk/tegra/clk-tegra124.c | 3 +--
> >  2 files changed, 3 insertions(+), 4 deletions(-)
> >=20
>=20
> Hello Peter,
>=20
> The patches in this series are trivial and fixing the longstanding bug on=
 Tegra124. Could you please take a look and and ACK the series if it looks =
good to you?

Acked-By: Peter De Schrijver <pdeschrijver@nvidia.com>                     =
                                        =20


Peter.
