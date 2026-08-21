Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8736E3E0724;
	Fri, 21 Aug 2026 08:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787302462; cv=none; b=E089V1MO9gZvWmGt9YGySfKLB4HsoA10lM48EgNbyqCzxQgvvIno1RQ0Spkoc5opJiLKbQQppj6aB39rt97AkjxxYyh/5+g2qzWSX/6ISC3KEKGso+g4uyb9V+Z1/J7L2ZMVFnJgz7kpKXNRae6PvKNj+zAgaXZCajURPfMoDsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787302462; c=relaxed/simple;
	bh=2pefhuoIqJxXaZ7fTyEPbvlwMrq359+zXI0HqxWbo/c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j6t82dcPSPWGQ3LTA+9SbjZBYYd+ARHi59Ih4+XllgBIzUy53gxwudwvxIqg8S/7FJ1de8luiUk75N+8vwKWh8DRF4GBVBXmXPV8CMuUOwjUOyhkgUajAsc2Jqy5AIjAXPudOtYeP4Nt8ywmyXHMu9Oc6D+CO8oLHwdO+X7TsWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1626D1F000E9;
	Fri, 21 Aug 2026 08:54:04 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Ryan Chen <ryan_chen@aspeedtech.com>,
	Joel Stanley <joel@jms.id.au>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	Linus Walleij <linusw@kernel.org>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	David Lechner <david@lechnology.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	=?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio@elopez.com.ar>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-clk@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	arm-scmi@vger.kernel.org,
	imx@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	soc@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 00/45] clk: Make sure clk_init_data is fully initialized (part two)
Date: Fri, 21 Aug 2026 10:53:10 +0200
Message-ID: <cover.1787239813.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

The clk_init_data structure contains several mutually-exclusive members
for different methods to specify the possible parents of a clock,
prompting drivers to initialize only the members they need.  However,
not initializing all members may cause subtle issues, which are only
exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
enabled.

Hence this series aims to make sure all members are fully initialized,
to avoid such bugs, and to prevent future breakage when converting
drivers to a different method for specifying the parents.

Part One[1] fixed all cases that I identified to be real bugs, in
response to a crash I saw on BeagleBone Black.

This series is the clock subpart of Part Two, which fixes remaining
cases that are currently harmless.  These are still fragile, and may
cause future breakage when converting drivers to a different method for
specifying the parents.

Thanks for your comments!

[1] "[PATCH treewide 0/5] clk: Make sure clk_init_data is fully
     initialized (part 1)"
    https://lore.kernel.org/cover.1787165329.git.geert+renesas@glider.be

Geert Uytterhoeven (45):
  clk: aspeed: Make sure clk_init_data is fully initialized
  clk: at91: Make sure clk_init_data is fully initialized
  clk: bcm: iproc: Make sure clk_init_data is fully initialized
  clk: berlin: Make sure clk_init_data is fully initialized
  clk: cdce925: Make sure clk_init_data is fully initialized
  clk: clk-axi-clkgen: Make sure clk_init_data is fully initialized
  clk: cs2000-cp: Make sure clk_init_data is fully initialized
  clk: davinci: Make sure clk_init_data is fully initialized
  clk: fractional-divider: Make sure clk_init_data is fully initialized
  clk: gemini: Make sure clk_init_data is fully initialized
  clk: highbank: Make sure clk_init_data is fully initialized
  clk: hisilicon: Make sure clk_init_data is fully initialized
  clk: imx: Make sure clk_init_data is fully initialized
  clk: ingenic: Make sure clk_init_data is fully initialized
  clk: keystone: Make sure clk_init_data is fully initialized
  clk: lmk04832: Make sure clk_init_data is fully initialized
  clk: mediatek: Make sure clk_init_data is fully initialized
  clk: milbeaut: Make sure clk_init_data is fully initialized
  clk: mmp: Make sure clk_init_data is fully initialized
  clk: mvebu: Make sure clk_init_data is fully initialized
  clk: mxs: Make sure clk_init_data is fully initialized
  clk: nomadik: Make sure clk_init_data is fully initialized
  clk: npcm7xx: Make sure clk_init_data is fully initialized
  clk: nxp: Make sure clk_init_data is fully initialized
  clk: pistachio: Make sure clk_init_data is fully initialized
  clk: pwm: Make sure clk_init_data is fully initialized
  clk: renesas: Make sure clk_init_data is fully initialized
  clk: rockchip: Make sure clk_init_data is fully initialized
  clk: samsung: Make sure clk_init_data is fully initialized
  clk: scpi: Make sure clk_init_data is fully initialized
  clk: silabs: Make sure clk_init_data is fully initialized
  clk: socfpga: Make sure clk_init_data is fully initialized
  clk: spear: Make sure clk_init_data is fully initialized
  clk: stm32: Make sure clk_init_data is fully initialized
  clk: st: Make sure clk_init_data is fully initialized
  clk: sunxi: Make sure clk_init_data is fully initialized
  clk: tegra: Make sure clk_init_data is fully initialized
  clk: uniphier: Make sure clk_init_data is fully initialized
  clk: ux500: Make sure clk_init_data is fully initialized
  clk: versatile: Make sure clk_init_data is fully initialized
  clk: vt8500: Make sure clk_init_data is fully initialized
  clk: x86: Make sure clk_init_data is fully initialized
  clk: xgene: Make sure clk_init_data is fully initialized
  clk: xilinx: Make sure clk_init_data is fully initialized
  clk: zynqmp: Make sure clk_init_data is fully initialized

 drivers/clk/aspeed/clk-aspeed.c                |  2 +-
 drivers/clk/aspeed/clk-ast2600.c               |  2 +-
 drivers/clk/aspeed/clk-ast2700.c               |  2 +-
 drivers/clk/at91/clk-audio-pll.c               |  4 ++--
 drivers/clk/at91/clk-h32mx.c                   |  2 +-
 drivers/clk/at91/clk-main.c                    |  2 +-
 drivers/clk/at91/clk-pll.c                     |  2 +-
 drivers/clk/at91/clk-plldiv.c                  |  2 +-
 drivers/clk/at91/clk-slow.c                    |  2 +-
 drivers/clk/at91/clk-smd.c                     |  2 +-
 drivers/clk/at91/clk-usb.c                     |  6 +++---
 drivers/clk/at91/sckc.c                        |  2 +-
 drivers/clk/bcm/clk-iproc-armpll.c             |  2 +-
 drivers/clk/bcm/clk-iproc-asiu.c               |  2 +-
 drivers/clk/bcm/clk-iproc-pll.c                |  2 +-
 drivers/clk/berlin/berlin2-avpll.c             |  4 ++--
 drivers/clk/berlin/berlin2-pll.c               |  2 +-
 drivers/clk/clk-axi-clkgen.c                   |  2 +-
 drivers/clk/clk-cdce925.c                      |  2 +-
 drivers/clk/clk-cs2000-cp.c                    |  2 +-
 drivers/clk/clk-fractional-divider.c           |  2 +-
 drivers/clk/clk-gemini.c                       |  2 +-
 drivers/clk/clk-highbank.c                     |  2 +-
 drivers/clk/clk-lmk04832.c                     |  6 +++---
 drivers/clk/clk-milbeaut.c                     |  4 ++--
 drivers/clk/clk-nomadik.c                      |  4 ++--
 drivers/clk/clk-npcm7xx.c                      |  2 +-
 drivers/clk/clk-pwm.c                          |  2 +-
 drivers/clk/clk-scpi.c                         |  2 +-
 drivers/clk/clk-si514.c                        |  2 +-
 drivers/clk/clk-si5341.c                       |  2 +-
 drivers/clk/clk-si544.c                        |  2 +-
 drivers/clk/clk-si570.c                        |  2 +-
 drivers/clk/clk-stm32f4.c                      |  4 ++--
 drivers/clk/clk-stm32h7.c                      |  2 +-
 drivers/clk/clk-vt8500.c                       |  4 ++--
 drivers/clk/clk-xgene.c                        |  6 +++---
 drivers/clk/davinci/da8xx-cfgchip.c            |  4 ++--
 drivers/clk/davinci/pll.c                      |  2 +-
 drivers/clk/davinci/psc.c                      |  2 +-
 drivers/clk/hisilicon/clk-hi3559a.c            |  2 +-
 drivers/clk/hisilicon/clk-hi3620.c             |  2 +-
 drivers/clk/hisilicon/clk-hi6220-stub.c        |  2 +-
 drivers/clk/hisilicon/clk-hisi-phase.c         |  2 +-
 drivers/clk/hisilicon/clk-hix5hd2.c            |  2 +-
 drivers/clk/hisilicon/clkdivider-hi6220.c      |  2 +-
 drivers/clk/hisilicon/clkgate-separated.c      |  2 +-
 drivers/clk/imx/clk-busy.c                     |  4 ++--
 drivers/clk/imx/clk-cpu.c                      |  2 +-
 drivers/clk/imx/clk-divider-gate.c             |  2 +-
 drivers/clk/imx/clk-fixup-div.c                |  2 +-
 drivers/clk/imx/clk-fixup-mux.c                |  2 +-
 drivers/clk/imx/clk-frac-pll.c                 |  2 +-
 drivers/clk/imx/clk-fracn-gppll.c              |  2 +-
 drivers/clk/imx/clk-gate-93.c                  |  2 +-
 drivers/clk/imx/clk-gate-exclusive.c           |  2 +-
 drivers/clk/imx/clk-gate2.c                    |  2 +-
 drivers/clk/imx/clk-lpcg-scu.c                 |  2 +-
 drivers/clk/imx/clk-pfd.c                      |  2 +-
 drivers/clk/imx/clk-pfdv2.c                    |  2 +-
 drivers/clk/imx/clk-pll14xx.c                  |  2 +-
 drivers/clk/imx/clk-pllv1.c                    |  2 +-
 drivers/clk/imx/clk-pllv2.c                    |  2 +-
 drivers/clk/imx/clk-pllv3.c                    |  2 +-
 drivers/clk/imx/clk-pllv4.c                    |  2 +-
 drivers/clk/imx/clk-scu.c                      |  4 ++--
 drivers/clk/imx/clk-sscg-pll.c                 |  2 +-
 drivers/clk/ingenic/cgu.c                      |  2 +-
 drivers/clk/keystone/gate.c                    |  2 +-
 drivers/clk/keystone/pll.c                     |  2 +-
 drivers/clk/keystone/syscon-clk.c              |  2 +-
 drivers/clk/mediatek/clk-cpumux.c              |  2 +-
 drivers/clk/mmp/clk-apbc.c                     |  2 +-
 drivers/clk/mmp/clk-apmu.c                     |  2 +-
 drivers/clk/mmp/clk-frac.c                     |  2 +-
 drivers/clk/mmp/clk-gate.c                     |  2 +-
 drivers/clk/mmp/clk-mix.c                      |  2 +-
 drivers/clk/mmp/clk-pll.c                      |  2 +-
 drivers/clk/mvebu/ap-cpu-clk.c                 |  2 +-
 drivers/clk/mvebu/clk-corediv.c                |  2 +-
 drivers/clk/mvebu/clk-cpu.c                    |  2 +-
 drivers/clk/mxs/clk-div.c                      |  2 +-
 drivers/clk/mxs/clk-frac.c                     |  2 +-
 drivers/clk/mxs/clk-pll.c                      |  2 +-
 drivers/clk/mxs/clk-ref.c                      |  2 +-
 drivers/clk/nxp/clk-lpc18xx-creg.c             |  2 +-
 drivers/clk/pistachio/clk-pll.c                |  2 +-
 drivers/clk/renesas/rzg2l-cpg.c                | 18 +++++++++---------
 drivers/clk/renesas/rzv2h-cpg.c                |  8 ++++----
 drivers/clk/rockchip/clk-cpu.c                 |  2 +-
 drivers/clk/rockchip/clk-ddr.c                 |  2 +-
 drivers/clk/rockchip/clk-gate-grf.c            |  2 +-
 drivers/clk/rockchip/clk-inverter.c            |  2 +-
 drivers/clk/rockchip/clk-mmc-phase.c           |  2 +-
 drivers/clk/rockchip/clk-muxgrf.c              |  2 +-
 drivers/clk/rockchip/clk-pll.c                 |  2 +-
 drivers/clk/rockchip/clk.c                     |  2 +-
 drivers/clk/samsung/clk-cpu.c                  |  2 +-
 drivers/clk/samsung/clk-pll.c                  |  2 +-
 drivers/clk/socfpga/clk-gate-a10.c             |  2 +-
 drivers/clk/socfpga/clk-gate-s10.c             |  6 +++---
 drivers/clk/socfpga/clk-gate.c                 |  2 +-
 drivers/clk/socfpga/clk-periph-a10.c           |  2 +-
 drivers/clk/socfpga/clk-periph-s10.c           |  8 ++++----
 drivers/clk/socfpga/clk-periph.c               |  2 +-
 drivers/clk/socfpga/clk-pll-a10.c              |  2 +-
 drivers/clk/socfpga/clk-pll-s10.c              |  8 ++++----
 drivers/clk/socfpga/clk-pll.c                  |  2 +-
 drivers/clk/spear/clk-aux-synth.c              |  2 +-
 drivers/clk/spear/clk-frac-synth.c             |  2 +-
 drivers/clk/spear/clk-gpt-synth.c              |  2 +-
 drivers/clk/spear/clk-vco-pll.c                |  2 +-
 drivers/clk/st/clk-flexgen.c                   |  2 +-
 drivers/clk/st/clkgen-fsyn.c                   |  4 ++--
 drivers/clk/st/clkgen-pll.c                    |  2 +-
 drivers/clk/stm32/clk-stm32mp1.c               |  4 ++--
 drivers/clk/sunxi/clk-sun4i-tcon-ch1.c         |  2 +-
 drivers/clk/tegra/clk-audio-sync.c             |  2 +-
 drivers/clk/tegra/clk-divider.c                |  2 +-
 drivers/clk/tegra/clk-periph-fixed.c           |  2 +-
 drivers/clk/tegra/clk-periph-gate.c            |  2 +-
 drivers/clk/tegra/clk-periph.c                 |  2 +-
 drivers/clk/tegra/clk-pll-out.c                |  2 +-
 drivers/clk/tegra/clk-pll.c                    |  2 +-
 drivers/clk/tegra/clk-sdmmc-mux.c              |  2 +-
 drivers/clk/tegra/clk-super.c                  |  4 ++--
 drivers/clk/tegra/clk-tegra-super-cclk.c       |  2 +-
 drivers/clk/tegra/clk-tegra124-emc.c           |  2 +-
 drivers/clk/tegra/clk-tegra20-emc.c            |  2 +-
 drivers/clk/tegra/clk-tegra210-emc.c           |  2 +-
 drivers/clk/uniphier/clk-uniphier-cpugear.c    |  2 +-
 .../clk/uniphier/clk-uniphier-fixed-factor.c   |  2 +-
 drivers/clk/uniphier/clk-uniphier-fixed-rate.c |  2 +-
 drivers/clk/uniphier/clk-uniphier-gate.c       |  2 +-
 drivers/clk/uniphier/clk-uniphier-mux.c        |  2 +-
 drivers/clk/ux500/clk-prcc.c                   |  2 +-
 drivers/clk/ux500/clk-prcmu.c                  |  4 ++--
 drivers/clk/ux500/clk-sysctrl.c                |  2 +-
 drivers/clk/versatile/clk-icst.c               |  2 +-
 drivers/clk/versatile/clk-sp810.c              |  2 +-
 drivers/clk/versatile/clk-vexpress-osc.c       |  2 +-
 drivers/clk/x86/clk-pmc-atom.c                 |  2 +-
 drivers/clk/xilinx/clk-xlnx-clock-wizard.c     |  6 +++---
 drivers/clk/xilinx/xlnx_vcu.c                  |  2 +-
 drivers/clk/zynqmp/clk-gate-zynqmp.c           |  2 +-
 drivers/clk/zynqmp/clk-mux-zynqmp.c            |  2 +-
 drivers/clk/zynqmp/divider.c                   |  2 +-
 drivers/clk/zynqmp/pll.c                       |  2 +-
 148 files changed, 188 insertions(+), 188 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
