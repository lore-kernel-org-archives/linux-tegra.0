From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4 01/10] clk: tegra20/30: Add custom EMC clock implementation
Date: Tue, 18 Jun 2019 18:14:25 -0700
Message-ID: <20190619011426.98D632085A@mail.kernel.org>
References: <20190616233551.6838-1-digetx@gmail.com> <20190616233551.6838-2-digetx@gmail.com> <20190618122108.GO28892@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190618122108.GO28892@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: Dmitry Osipenko <digetx@gmail.com>, Rob Herring <robh+dt@kernel.org>, Joseph Lo <josephl@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Quoting Thierry Reding (2019-06-18 05:21:08)
> On Mon, Jun 17, 2019 at 02:35:42AM +0300, Dmitry Osipenko wrote:
> > A proper External Memory Controller clock rounding and parent selection
> > functionality is required by the EMC drivers. It is not available using
> > the generic clock implementation, hence add a custom one. The clock rate
> > rounding shall be done by the EMC drivers because they have information
> > about available memory timings, so the drivers will have to register a
> > callback that will round the requested rate. EMC clock users won't be a=
ble
> > to request EMC clock by getting -EPROBE_DEFER until EMC driver is probed
> > and the callback is set up. The functionality is somewhat similar to the
> > clk-emc.c which serves Tegra124+ SoC's, the later HW generations support
> > more parent clock sources and the HW configuration and integration with
> > the EMC drivers differs a tad from the older gens, hence it's not really
> > worth to try to squash everything into a single source file.
> >=20
> > Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> > ---
> >  drivers/clk/tegra/Makefile          |   2 +
> >  drivers/clk/tegra/clk-tegra20-emc.c | 305 ++++++++++++++++++++++++++++
> >  drivers/clk/tegra/clk-tegra20.c     |  55 ++---
> >  drivers/clk/tegra/clk-tegra30.c     |  38 +++-
> >  drivers/clk/tegra/clk.h             |   6 +
> >  include/linux/clk/tegra.h           |  14 ++
> >  6 files changed, 368 insertions(+), 52 deletions(-)
> >  create mode 100644 drivers/clk/tegra/clk-tegra20-emc.c
>=20
> Hi Mike, Stephen,
>=20
> The remaining patches of this series have a build-time dependency on
> this clock driver patch. Would you mind if I pick this up into the Tegra
> tree, so that I can resolve the dependency there? I can send a pull
> request of the stable branch with this one patch if we need to resolve a
> conflict between the clk and Tegra trees.
>=20

Sure. I have review comments though so hopefully they can be addressed
first.
