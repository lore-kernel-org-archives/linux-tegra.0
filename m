From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 3/4] ARM: tegra: Switch to new pinctrl driver
Date: Tue, 24 Jan 2012 14:44:25 -0800
Message-ID: <CAOesGMjuewhO2H+QFQtAX+xFb5hyNn8Q65Cuup4vaXWAFvX87w@mail.gmail.com>
References: <1327083746-31430-1-git-send-email-swarren@nvidia.com>
	<1327083746-31430-3-git-send-email-swarren@nvidia.com>
	<CACRpkdZ_hBviswq7pXoLozC8gjzvowCBrj9yjw1xJT79b5rtwQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZ_hBviswq7pXoLozC8gjzvowCBrj9yjw1xJT79b5rtwQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Stephen Warren <swarren@nvidia.com>, Colin Cross <ccross@android.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Jan 24, 2012 at 2:36 PM, Linus Walleij <linus.walleij@linaro.or=
g> wrote:
> On Fri, Jan 20, 2012 at 7:22 PM, Stephen Warren <swarren@nvidia.com> =
wrote:
>
>> * Rename old pinmux and new pinctrl platform driver and DT match tab=
le
>> =A0entries, so the new driver gets instantiated.
>> * Re-write board-pinmux.c, so that it uses pinctrl APIs to configura=
 the
>> =A0pinmux.
>> * Re-write board-*-pinmux.c so that the pinmux configuration tables =
are
>> =A0in pinctrl format.
>>
>> Ventana's pin mux table needed some edits on top of the basic format
>> conversion, since some mux options that were previously marked as
>> reserved are now valid in the new pinctrl driver. Attempting to use =
the
>> old reserved names will result in a failure. Specifically, groups lp=
w0,
>> lpw2, lsc1, lsck, and lsda were changed from function rsvd4 to displ=
aya,
>> and group pta was changed from function rsvd2 to hdmi.
>>
>> All boards' pin mux tables needed some edits on top of the based for=
mat
>> conversion, since function i2c was split into i2c1 (first general I2=
C
>> controller) and i2cp (power I2C controller) to better align function
>> definitions with HW blocks.
>>
>> Due to the split of mux tables into pure mux and pull/tristate table=
s,
>> many entries in the separate Seaboard/Ventana tables could be merged
>> into the common table, since the entries differed only in the portio=
n
>> in one of the tables, not both.
>>
>> Most pin groups allow configuration of mux, tri-state, and pull. How=
ever,
>> some don't allow pull configuration, which is instead configured by =
new
>> groups that only allow pull configuration. This is a reflection of t=
he
>> true HW capabilities, which weren't fully represented by the old pin=
mux
>> driver. This required adding new pull table entries for those new gr=
oups,
>> and setting many other entries' pull configuration to
>> TEGRA_PINCONFIG_DONT_SET.
>>
>> Signed-off-by: Stephen Warren <swarren@nvidia.com>
>> ---
>> =A0arch/arm/mach-tegra/board-harmony-pinmux.c =A0 | =A0362 +++++++++=
+++++-------
>> =A0arch/arm/mach-tegra/board-paz00-pinmux.c =A0 =A0 | =A0362 +++++++=
+++++++-------
>> =A0arch/arm/mach-tegra/board-pinmux.c =A0 =A0 =A0 =A0 =A0 | =A0 62 +=
+++-
>> =A0arch/arm/mach-tegra/board-pinmux.h =A0 =A0 =A0 =A0 =A0 | =A0 39 +=
+-
>> =A0arch/arm/mach-tegra/board-seaboard-pinmux.c =A0| =A0442 +++++++++=
+++++++---------
>> =A0arch/arm/mach-tegra/board-trimslice-pinmux.c | =A0366 +++++++++++=
+++--------
>> =A0arch/arm/mach-tegra/pinmux.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 =A06 +-
>> =A0drivers/pinctrl/pinctrl-tegra.c =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A06 +-
>> =A08 files changed, 1095 insertions(+), 550 deletions(-)
>
> Can I have Colin's or Olof's ACK on this Tegra stuff too?
> Would feel better...
>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yup, I've just been waiting on things to settle,
bindings/implementation wise. Will look at it over the next day or two
and get back.


-Olof
