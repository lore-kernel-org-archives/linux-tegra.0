From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: [PATCH v2 00/11] thermal: clean up output of make W=1
Date: Wed, 20 Nov 2019 21:15:09 +0530
Message-ID: <cover.1574242756.git.amit.kucheria@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org, edubezval@gmail.com, Amit Daniel Kachhap <amit.kachhap@gmail.com>, Amit Kucheria <amit.kucheria@verdurent.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Guillaume La Roque <glaroque@baylibre.com>, Heiko Stuebner <heiko@sntech.de>, Javi Merino <javi.merino@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Jun Nie <jun.nie@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>, Zhang Rui <rui.zhang@intel.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

Cleanup output of make W=1 inside drivers/thermal. This should allow us to
focus on real issues that tend to get lost in the noise much better.

There is no functional change. This series was generate on top of
linux-next from 20191119.

Changes since v1:
- Add review tags
- Fixed up commit message for devfreq_cooling and samsung changes

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
2.20.1
