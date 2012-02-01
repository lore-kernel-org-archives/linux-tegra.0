From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 3/4] ARM: tegra: Switch to new pinctrl driver
Date: Wed, 1 Feb 2012 00:20:11 -0800
Message-ID: <20120201082011.GK7399@quad.lixom.net>
References: <1327083746-31430-1-git-send-email-swarren@nvidia.com>
 <1327083746-31430-3-git-send-email-swarren@nvidia.com>
 <CACRpkdZ_hBviswq7pXoLozC8gjzvowCBrj9yjw1xJT79b5rtwQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdZ_hBviswq7pXoLozC8gjzvowCBrj9yjw1xJT79b5rtwQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Stephen Warren <swarren@nvidia.com>, Colin Cross <ccross@android.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Jan 24, 2012 at 11:36:51PM +0100, Linus Walleij wrote:
> On Fri, Jan 20, 2012 at 7:22 PM, Stephen Warren <swarren@nvidia.com> =
wrote:
>=20
> > * Rename old pinmux and new pinctrl platform driver and DT match ta=
ble
> > =A0entries, so the new driver gets instantiated.
> > * Re-write board-pinmux.c, so that it uses pinctrl APIs to configur=
a the
> > =A0pinmux.
> > * Re-write board-*-pinmux.c so that the pinmux configuration tables=
 are
> > =A0in pinctrl format.
> >
> > Ventana's pin mux table needed some edits on top of the basic forma=
t
> > conversion, since some mux options that were previously marked as
> > reserved are now valid in the new pinctrl driver. Attempting to use=
 the
> > old reserved names will result in a failure. Specifically, groups l=
pw0,
> > lpw2, lsc1, lsck, and lsda were changed from function rsvd4 to disp=
laya,
> > and group pta was changed from function rsvd2 to hdmi.
> >
> > All boards' pin mux tables needed some edits on top of the based fo=
rmat
> > conversion, since function i2c was split into i2c1 (first general I=
2C
> > controller) and i2cp (power I2C controller) to better align functio=
n
> > definitions with HW blocks.
> >
> > Due to the split of mux tables into pure mux and pull/tristate tabl=
es,
> > many entries in the separate Seaboard/Ventana tables could be merge=
d
> > into the common table, since the entries differed only in the porti=
on
> > in one of the tables, not both.
> >
> > Most pin groups allow configuration of mux, tri-state, and pull. Ho=
wever,
> > some don't allow pull configuration, which is instead configured by=
 new
> > groups that only allow pull configuration. This is a reflection of =
the
> > true HW capabilities, which weren't fully represented by the old pi=
nmux
> > driver. This required adding new pull table entries for those new g=
roups,
> > and setting many other entries' pull configuration to
> > TEGRA_PINCONFIG_DONT_SET.
> >
> > Signed-off-by: Stephen Warren <swarren@nvidia.com>
> > ---
> > =A0arch/arm/mach-tegra/board-harmony-pinmux.c =A0 | =A0362 ++++++++=
++++++-------
> > =A0arch/arm/mach-tegra/board-paz00-pinmux.c =A0 =A0 | =A0362 ++++++=
++++++++-------
> > =A0arch/arm/mach-tegra/board-pinmux.c =A0 =A0 =A0 =A0 =A0 | =A0 62 =
++++-
> > =A0arch/arm/mach-tegra/board-pinmux.h =A0 =A0 =A0 =A0 =A0 | =A0 39 =
++-
> > =A0arch/arm/mach-tegra/board-seaboard-pinmux.c =A0| =A0442 ++++++++=
++++++++---------
> > =A0arch/arm/mach-tegra/board-trimslice-pinmux.c | =A0366 ++++++++++=
++++--------
> > =A0arch/arm/mach-tegra/pinmux.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 =A06 +-
> > =A0drivers/pinctrl/pinctrl-tegra.c =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A06 +-
> > =A08 files changed, 1095 insertions(+), 550 deletions(-)
>=20
> Can I have Colin's or Olof's ACK on this Tegra stuff too?
> Would feel better...
>=20
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

This series is:

Acked-by: Olof Johansson <olof@lixom.net>

This should go in through the pinctrl tree, but we have at least one pa=
tch
already that depends on it (for cardhu pinmux tables). Since cardhu is =
still
a quite active board, I expect we might see more patches this merge win=
dow,
etc. So I'd like to take that patch (that is not part of this series) t=
hrough
linux-tegra to reduce conflicts.

To facilitate that, can you land this series in a stable branch in
your tree that you promise not to rebase between now and upstream
submission? That would take care of the dependencies quite nicely,
since we can pull that in as a prereq on the cardhu patch that way.

But all h*ll breaks loose if you rebase that branch... So we need a
strong agreement on that.


-Olof
