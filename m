From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/4] ARM: tegra: Switch to new pinctrl driver
Date: Tue, 24 Jan 2012 23:36:51 +0100
Message-ID: <CACRpkdZ_hBviswq7pXoLozC8gjzvowCBrj9yjw1xJT79b5rtwQ@mail.gmail.com>
References: <1327083746-31430-1-git-send-email-swarren@nvidia.com>
	<1327083746-31430-3-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1327083746-31430-3-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Jan 20, 2012 at 7:22 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wr=
ote:

> * Rename old pinmux and new pinctrl platform driver and DT match tabl=
e
> =A0entries, so the new driver gets instantiated.
> * Re-write board-pinmux.c, so that it uses pinctrl APIs to configura =
the
> =A0pinmux.
> * Re-write board-*-pinmux.c so that the pinmux configuration tables a=
re
> =A0in pinctrl format.
>
> Ventana's pin mux table needed some edits on top of the basic format
> conversion, since some mux options that were previously marked as
> reserved are now valid in the new pinctrl driver. Attempting to use t=
he
> old reserved names will result in a failure. Specifically, groups lpw=
0,
> lpw2, lsc1, lsck, and lsda were changed from function rsvd4 to displa=
ya,
> and group pta was changed from function rsvd2 to hdmi.
>
> All boards' pin mux tables needed some edits on top of the based form=
at
> conversion, since function i2c was split into i2c1 (first general I2C
> controller) and i2cp (power I2C controller) to better align function
> definitions with HW blocks.
>
> Due to the split of mux tables into pure mux and pull/tristate tables=
,
> many entries in the separate Seaboard/Ventana tables could be merged
> into the common table, since the entries differed only in the portion
> in one of the tables, not both.
>
> Most pin groups allow configuration of mux, tri-state, and pull. Howe=
ver,
> some don't allow pull configuration, which is instead configured by n=
ew
> groups that only allow pull configuration. This is a reflection of th=
e
> true HW capabilities, which weren't fully represented by the old pinm=
ux
> driver. This required adding new pull table entries for those new gro=
ups,
> and setting many other entries' pull configuration to
> TEGRA_PINCONFIG_DONT_SET.
>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> =A0arch/arm/mach-tegra/board-harmony-pinmux.c =A0 | =A0362 ++++++++++=
++++-------
> =A0arch/arm/mach-tegra/board-paz00-pinmux.c =A0 =A0 | =A0362 ++++++++=
++++++-------
> =A0arch/arm/mach-tegra/board-pinmux.c =A0 =A0 =A0 =A0 =A0 | =A0 62 ++=
++-
> =A0arch/arm/mach-tegra/board-pinmux.h =A0 =A0 =A0 =A0 =A0 | =A0 39 ++=
-
> =A0arch/arm/mach-tegra/board-seaboard-pinmux.c =A0| =A0442 ++++++++++=
++++++---------
> =A0arch/arm/mach-tegra/board-trimslice-pinmux.c | =A0366 ++++++++++++=
++--------
> =A0arch/arm/mach-tegra/pinmux.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 =A06 +-
> =A0drivers/pinctrl/pinctrl-tegra.c =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A0=
6 +-
> =A08 files changed, 1095 insertions(+), 550 deletions(-)

Can I have Colin's or Olof's ACK on this Tegra stuff too?
Would feel better...

Acked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Thanks!
Linus Walleij
