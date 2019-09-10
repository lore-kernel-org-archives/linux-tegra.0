From: Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH 0/7] add support for clocksource/clockevent DT selection
Date: Tue, 10 Sep 2019 16:47:09 +0300
Message-ID: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: daniel.lezcano@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, nsekhar@ti.com, bgolaszewski@baylibre.com, monstr@monstr.eu, john@phrozen.org, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, lftan@altera.com, tglx@linutronix.de, vgupta@synopsys.com, marc.zyngier@arm.com, patrice.chotard@st.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, eric@anholt.net, wahrenst@gmx.net, f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com, linus.walleij@linaro.org, shc_work@mail.ru, kgene@kernel.org, krzk@kernel.org, ysato@users.sourceforge.jp, liviu.dudau@arm.com, sudeep.holla@arm.com, lorenzo.pieralisi@arm.com, shawnguo@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, nios2-dev@lists.rocketboards.org, linux-snps-arc@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, linux-rpi-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp, linux-amlogic@lists.infradead.org, openbmc@lists.ozlabs.org, linux-oxnas@groups.io, linux-arm-msm@vger.kernel.org, linux-unisoc@lists.infradead.org, linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org, Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: linux-tegra@vger.kernel.org

Hi,

This series adds support to permit the selection of clocksource/clockevent
via DT.

In [1] I proposed a solution other than the one in this series, with parsing DT
bindings and at probe time and passing it to timer specific probe function.
Looking forward though the clocksource/clockevent drivers implementation and
taking into account the response at [2] I sticked the implementation to
timer-of specific library.

The implementation in this series is using timer-of specific library to parse
the DT bindings related to timers functions: clocksource or clockevent.

With this implementation a timer's driver registers for probing an array of
objects of type struct timer_of. In flags member of struct timer_of object it
has to be passed the following new flags (related to how the driver will behave)
as follows:
- TIMER_OF_TYPE_CS: timer could work only as clocksource at a time
- TIMER_OF_TYPE_CE: timer could work only as clockevent at a time
- TIMER_OF_TYPE_CE_AND_CE: timer could work at a time as both, clocksource and
clockevent.

The timer registration macro (for probing) now gets a new argument which should
be an array of struct timer_of objects:

TIMER_OF_DECLARE(name, compat, handler, to)
CLOCKSOURCE_OF_DECLARE(name, compat, handler, to)

In case driver could work to feed only the clocksource subsystem or only the
clockevent subsystem the struct timer_of array passed to TIMER_OF_DECLARE()/
CLOCKSOURCE_OF_DECLARE() should contain 2 entries: one to be filled if probed
timer works as clocksource device, one to be filled if probed timer works as
clockevent device.

For such a case, the minimal format of struct timer_of array is as follows:
struct timer_of to[] = {
	{ .flags = TIMER_OF_TYPE_CS }
	{ .flags = TIMER_OF_TYPE_CE }
	{ /* sentinel. */
};

If timer could work as both, clocksource and clockevent at the same time,
the struct timer_of array should look as follows:
struct timer_of to[] = {
	{ .flags = TIMER_OF_TYPE_CE_AND_CS }
	{ /* sentinel. */
};

And in device tree there should be added chosen bindings as follows:

chosen {
	linux,clocksource {
		timer = <&timer1>
	};
	
	linux,clockevent {
		timer = <&timer2>;
	}
};

timer1: t1@123 {
	compatible = "timerx-compatible";
	/* the rest of DT bindings here */
};

timer2: t1@234 {
	compatible = "timerx-compatible";
	/* the rest of DT bindings here */
};

At probing time (timer_probe()), timer_of_init() will check the DT bindings
and try to match with one of the entries in struct timer_of array passed at
probe. The used entry will be considered used if the timers' device_node 
pointer is set. If no matching b/w DT and what has been passed for probe
via struct timer_of array then probe should fail.

The patches in this series are organized as follows:
1/7 - avoid calling timer_of_init() for every CPU since it should not be needed
2/7 - changes timer registration macro by adding a new argument (pointer to
      struct timer_of)
3/7 - use BIT() macro
4/7 - add clocksource/clockevent selection documentation [3]
5/7 - implement support described above
6/7 - remove an unnecessary line
7/7 - implement this support for integrator-ap timer

I implemented this support for timer published at [4].

Thank you,
Claudiu Beznea

[1] https://lore.kernel.org/lkml/34574b0f-7d09-eb92-ea62-4199c293b0e7@microchip.com/
[2] https://lore.kernel.org/lkml/1ebaa306-8a7f-fd58-56e0-a61b767357f7@linaro.org/
[3] https://lore.kernel.org/lkml/20171213185313.20017-1-alexandre.belloni@free-electrons.com/
[4] https://lore.kernel.org/lkml/1552580772-8499-1-git-send-email-claudiu.beznea@microchip.com/

Alexandre Belloni (2):
  dt-bindings: chosen: Add clocksource and clockevent selection
  clocksource/drivers/integrator-ap: parse the chosen node

Claudiu Beznea (5):
  clocksource/drivers/c-sky: request timer_of_init only for probing CPU
  clocksource: change timer registration macros
  clocksource/timer_of: use BIT() macro
  clocksource/drivers/timer-of: add support support for timer's
    functionalities
  drivers/clocksource/timer-of: keep declaration on one line

 Documentation/devicetree/bindings/chosen.txt |  20 +++++
 arch/arm/kernel/smp_twd.c                    |  10 ++-
 arch/arm/mach-davinci/time.c                 |   2 +-
 arch/microblaze/kernel/timer.c               |   2 +-
 arch/mips/ralink/cevt-rt3352.c               |   2 +-
 arch/nios2/kernel/time.c                     |   2 +-
 drivers/clocksource/Kconfig                  |   1 +
 drivers/clocksource/arc_timer.c              |   6 +-
 drivers/clocksource/arm_arch_timer.c         |   6 +-
 drivers/clocksource/arm_global_timer.c       |   2 +-
 drivers/clocksource/armv7m_systick.c         |   2 +-
 drivers/clocksource/asm9260_timer.c          |   2 +-
 drivers/clocksource/bcm2835_timer.c          |   2 +-
 drivers/clocksource/bcm_kona_timer.c         |   4 +-
 drivers/clocksource/clksrc-dbx500-prcmu.c    |   2 +-
 drivers/clocksource/clksrc_st_lpc.c          |   2 +-
 drivers/clocksource/clps711x-timer.c         |   2 +-
 drivers/clocksource/dw_apb_timer_of.c        |   9 ++-
 drivers/clocksource/exynos_mct.c             |   4 +-
 drivers/clocksource/h8300_timer16.c          |   2 +-
 drivers/clocksource/h8300_timer8.c           |   2 +-
 drivers/clocksource/h8300_tpu.c              |   2 +-
 drivers/clocksource/jcore-pit.c              |   2 +-
 drivers/clocksource/mips-gic-timer.c         |   2 +-
 drivers/clocksource/mps2-timer.c             |   2 +-
 drivers/clocksource/mxs_timer.c              |   2 +-
 drivers/clocksource/nomadik-mtu.c            |   2 +-
 drivers/clocksource/renesas-ostm.c           |   2 +-
 drivers/clocksource/samsung_pwm_timer.c      |  12 ++-
 drivers/clocksource/timer-armada-370-xp.c    |   6 +-
 drivers/clocksource/timer-atcpit100.c        |  74 +++++++++---------
 drivers/clocksource/timer-atlas7.c           |   3 +-
 drivers/clocksource/timer-atmel-pit.c        |   2 +-
 drivers/clocksource/timer-atmel-st.c         |   2 +-
 drivers/clocksource/timer-atmel-tcb.c        |   2 +-
 drivers/clocksource/timer-cadence-ttc.c      |   2 +-
 drivers/clocksource/timer-davinci.c          |   3 +-
 drivers/clocksource/timer-digicolor.c        |   2 +-
 drivers/clocksource/timer-efm32.c            |   4 +-
 drivers/clocksource/timer-fsl-ftm.c          |   2 +-
 drivers/clocksource/timer-fttmr010.c         |  10 +--
 drivers/clocksource/timer-gx6605s.c          |  58 +++++++-------
 drivers/clocksource/timer-imx-gpt.c          |  24 +++---
 drivers/clocksource/timer-imx-sysctr.c       |  61 +++++++--------
 drivers/clocksource/timer-imx-tpm.c          |  69 ++++++++---------
 drivers/clocksource/timer-integrator-ap.c    |  21 +++++-
 drivers/clocksource/timer-ixp4xx.c           |   2 +-
 drivers/clocksource/timer-keystone.c         |   2 +-
 drivers/clocksource/timer-lpc32xx.c          |   2 +-
 drivers/clocksource/timer-mediatek.c         | 108 +++++++++++++++------------
 drivers/clocksource/timer-meson6.c           |   2 +-
 drivers/clocksource/timer-milbeaut.c         |  59 ++++++++-------
 drivers/clocksource/timer-mp-csky.c          |  52 ++++++-------
 drivers/clocksource/timer-npcm7xx.c          |  87 +++++++++++----------
 drivers/clocksource/timer-nps.c              |   6 +-
 drivers/clocksource/timer-of.c               |  91 +++++++++++++++++++++-
 drivers/clocksource/timer-of.h               |  36 +++++++--
 drivers/clocksource/timer-orion.c            |   2 +-
 drivers/clocksource/timer-owl.c              |   6 +-
 drivers/clocksource/timer-oxnas-rps.c        |   4 +-
 drivers/clocksource/timer-pistachio.c        |   2 +-
 drivers/clocksource/timer-prima2.c           |   2 +-
 drivers/clocksource/timer-probe.c            |  17 ++++-
 drivers/clocksource/timer-pxa.c              |   2 +-
 drivers/clocksource/timer-qcom.c             |   4 +-
 drivers/clocksource/timer-rda.c              |  66 ++++++++--------
 drivers/clocksource/timer-riscv.c            |   2 +-
 drivers/clocksource/timer-rockchip.c         |   4 +-
 drivers/clocksource/timer-sp804.c            |   4 +-
 drivers/clocksource/timer-sprd.c             |  75 +++++++++----------
 drivers/clocksource/timer-stm32.c            |  39 +++++-----
 drivers/clocksource/timer-sun4i.c            |  78 +++++++++----------
 drivers/clocksource/timer-sun5i.c            |   4 +-
 drivers/clocksource/timer-tango-xtal.c       |   2 +-
 drivers/clocksource/timer-tegra.c            |  31 ++++----
 drivers/clocksource/timer-ti-32k.c           |   2 +-
 drivers/clocksource/timer-u300.c             |   2 +-
 drivers/clocksource/timer-versatile.c        |   4 +-
 drivers/clocksource/timer-vf-pit.c           |   2 +-
 drivers/clocksource/timer-vt8500.c           |   2 +-
 drivers/clocksource/timer-zevio.c            |   2 +-
 include/linux/clocksource.h                  |  30 +++++++-
 82 files changed, 748 insertions(+), 544 deletions(-)

-- 
2.7.4
