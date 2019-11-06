From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: [PATCH 00/11] thermal: clean up output of make W=1
Date: Wed,  6 Nov 2019 18:58:16 +0530
Message-ID: <cover.1573046440.git.amit.kucheria@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, edubezval@gmail.com, Amit Daniel Kachhap <amit.kachhap@gmail.com>, Amit Kucheria <amit.kucheria@verdurent.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Guillaume La Roque <glaroque@baylibre.com>, Heiko Stuebner <heiko@sntech.de>, Javi Merino <javi.merino@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Jun Nie <jun.nie@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>, Zhang Rui <rui.zhang@intel.com>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Cleanup output of make W=1 inside drivers/thermal. This should allow us to
focus on real issues that tend to get lost in the noise much better.

There is no functional change. This series was generate on top of
linux-next from 20191105.

Regards,
Amit

Amit Kucheria (11):
  thermal: of-thermal: Appease the kernel-doc deity
  thermal: cpu_cooling: Appease the kernel-doc deity
  thermal: step_wise: Appease the kernel-doc deity
  thermal: devfreq_cooling: Appease the kernel-doc deity
  thermal: max77620: Appease the kernel-doc deity
  thermal: mediatek: Appease the kernel-doc deity
  thermal: rockchip: Appease the kernel-doc deity
  thermal: samsung: Appease the kernel-doc deity
  thermal: tegra: Appease the kernel-doc deity
  thermal: amlogic: Appease the kernel-doc deity
  thermal: zx2967: Appease the kernel-doc deity

 drivers/thermal/amlogic_thermal.c    |  6 +++++-
 drivers/thermal/cpu_cooling.c        |  1 +
 drivers/thermal/devfreq_cooling.c    |  3 ++-
 drivers/thermal/fair_share.c         |  4 ++--
 drivers/thermal/gov_bang_bang.c      |  4 ++--
 drivers/thermal/max77620_thermal.c   |  2 +-
 drivers/thermal/mtk_thermal.c        | 12 ++++++------
 drivers/thermal/of-thermal.c         |  2 +-
 drivers/thermal/rockchip_thermal.c   | 22 ++++++++++++++++------
 drivers/thermal/samsung/exynos_tmu.c |  5 ++++-
 drivers/thermal/step_wise.c          |  4 ++--
 drivers/thermal/tegra/soctherm.c     | 15 +++++++++++++--
 drivers/thermal/user_space.c         |  4 ++--
 drivers/thermal/zx2967_thermal.c     |  1 +
 14 files changed, 58 insertions(+), 27 deletions(-)

-- 
2.17.1
