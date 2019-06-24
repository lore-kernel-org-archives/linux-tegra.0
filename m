From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH V4 00/18] SC7 entry and exit support for Tegra210
Date: Sun, 23 Jun 2019 20:02:41 -0700
Message-ID: <1561345379-2429-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, skomatineni@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, digetx@gmail.com, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

This patch series includes Tegra210 deepsleep support with RTC alarm
wake event.

This series also includes save and restore of PLLs, clocks, OSC contexts
for deepsleep exit to normal operation.

This patch series doesn't support 100% suspend/resume to allow fully
functional state upon resume and we are working on some more drivers suspend
and resume implementations.

[V4]: Changes between V3 & V4 are
	- V3 feedback fixes
	- Removed park bits clear for EMMC pads in pinctrl-tegra driver
	  function tegra_pinctrl_clear_parked_bits as based on V3 feedback
	  parked_bit is updated to parked_bitmask to use with DRV_PINGROUP
	  as well and thierry posted patch series for this.
	- Implemented all peripheral clocks save and restore through their
	  corresponding clk_ops save_context and restore_context and removed
	  all direct registers store and restore in clk-tegra210 driver.
	- Created separate patch for fence_delay update during PLLU init based
	  on V3 feedback.
	- Added more comments in tegra210_clk_resume regarding dfll restore
	  sequence and its dependency on peripheral clocks restore.

[V3]: Changes between V2 & V3 are
	- V2 feedback fixes
	- GPIO restore should happen prior to Pinctrl restore to prevent
	  glitch on GPIO lines. So using resume_noirq for gpio tegra to allow
	  gpio resume prior to pinctrl resume.
	- Implemented save_context and restore_context callbacks for clock
	  plls, pll outs and dividers in corresponding drivers.
	  Note: Peripheral clocks and clock enable and reset need to be in
	  Tegra210 clock suspend/resume as they need to be in proper sequence
	  w.r.t DFLL resume for restoring CPU clock.
	- Removed gpio-tegra changes for hierarchical support to have PMC as
	  parent to GPIOs for GPIO wake event support. Thierry is working on
	  gpiolib for some cleanup before adding hierarchical support. So
	  holding on to GPIO wake support for now.

[V2] : V1 feedback fixes
	Patch 0002: This version still using syscore. Thierry suggest not to
	use syscore and waiting on suggestion from Linux Walleij for any better
	way of storing current state of pins before suspend entry and restoring
	them on resume at very early stage. So left this the same way as V1 and
	will address once I get more feedback on this.
	Also need to findout and implement proper way of forcing resume order
	between pinctrl and gpio driver.

[V1]:	Tegra210 SC7 entry and exit thru RTC wake and Power button GPIO wake
	using hierarchical IRQ with PMC as parent to GPIO.



Sowjanya Komatineni (18):
  irqchip: tegra: do not disable COP IRQ during suspend
  pinctrl: tegra: add suspend and resume support
  gpio: tegra: use resume_noirq for tegra gpio resume
  clk: tegra: save and restore divider rate
  clk: tegra: pllout: save and restore pllout context
  clk: tegra: pll: save and restore pll context
  clk: tegra: save and restore CPU and System clocks context
  clk: tegra: support for saving and restoring OSC context
  clk: tegra: add suspend resume support for DFLL
  clk: tegra: add save and restore context support for peripheral clocks
  clk: tegra210: use fence_udelay during PLLU init
  clk: tegra210: support for Tegra210 clocks suspend and resume
  soc/tegra: pmc: allow support for more tegra wake
  soc/tegra: pmc: add pmc wake support for tegra210
  arm64: tegra: enable wake from deep sleep on RTC alarm.
  soc/tegra: pmc: configure core power request polarity
  soc/tegra: pmc: configure deep sleep control settings
  arm64: dts: tegra210-p2180: Jetson TX1 SC7 timings

 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi |   7 ++
 arch/arm64/boot/dts/nvidia/tegra210.dtsi       |   5 +-
 drivers/clk/tegra/clk-dfll.c                   |  78 ++++++++++++++
 drivers/clk/tegra/clk-dfll.h                   |   2 +
 drivers/clk/tegra/clk-divider.c                |  23 ++++
 drivers/clk/tegra/clk-periph-fixed.c           |  31 ++++++
 drivers/clk/tegra/clk-periph-gate.c            |  34 ++++++
 drivers/clk/tegra/clk-periph.c                 |  43 ++++++++
 drivers/clk/tegra/clk-pll-out.c                |  28 +++++
 drivers/clk/tegra/clk-pll.c                    | 115 ++++++++++++++------
 drivers/clk/tegra/clk-sdmmc-mux.c              |  30 ++++++
 drivers/clk/tegra/clk-tegra-fixed.c            |  14 +++
 drivers/clk/tegra/clk-tegra-super-gen4.c       |   4 -
 drivers/clk/tegra/clk-tegra210.c               | 123 +++++++++++++++++++--
 drivers/clk/tegra/clk.c                        |  94 ++++++++++++++++
 drivers/clk/tegra/clk.h                        |  35 +++++-
 drivers/gpio/gpio-tegra.c                      |   5 +-
 drivers/irqchip/irq-tegra.c                    |  20 +++-
 drivers/pinctrl/tegra/pinctrl-tegra.c          |  47 ++++++++
 drivers/pinctrl/tegra/pinctrl-tegra.h          |   4 +
 drivers/pinctrl/tegra/pinctrl-tegra210.c       |   6 ++
 drivers/soc/tegra/pmc.c                        | 143 ++++++++++++++++++++++++-
 22 files changed, 838 insertions(+), 53 deletions(-)

-- 
2.7.4
