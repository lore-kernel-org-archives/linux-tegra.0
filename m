From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v4 00/10] NVIDIA Tegra clocksource driver improvements
Date: Mon,  3 Jun 2019 21:59:38 +0300
Message-ID: <20190603185948.30438-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hello,

This series primarily unifies the driver code across all Tegra SoC
generations. In a result the clocksources are allocated per-CPU on
older Tegra's and have a higher rating than the arch-timer where
appropriate, the newer Tegra210 is getting support for microsecond
clocksource and the driver's code is getting much cleaner.

The series was extensively tested on Tegra20 and Tegra30.

Changelog:

v4: In the comment to v3 Peter De Schrijver pointed out that arch-timer
    isn't affected by DVFS changes and thus it is preferred over tegra-timer
    on [T114, T210). Added new patch to address that: "Lower clocksource
    rating for some Tegra's".

    Daniel Lezcano suggested that it will be worthwhile to rename driver's
    source file as driver now covers more SoC generations than it initially
    did. Hence the new "Rename timer-tegra20.c to timer-tegra.c" patch.

v3: Fixed compilation on ARM64. Turned out that it doesn't have the
    delay-timer, thanks to Nicolas Chauvet for the report.

    Added new "Support COMPILE_TEST universally" patch for better
    compile-test coverage.

v2: Rebased on recent linux-next. Now all of #ifdef's are removed from the
    code due to the recent patch that generalized persistent clocksource.

    Couple other minor cosmetic changes.

Dmitry Osipenko (10):
  clocksource/drivers/tegra: Support per-CPU timers on all Tegra's
  clocksource/drivers/tegra: Unify timer code
  clocksource/drivers/tegra: Reset hardware state on init
  clocksource/drivers/tegra: Replace readl/writel with relaxed versions
  clocksource/drivers/tegra: Release all IRQ's on request_irq() error
  clocksource/drivers/tegra: Minor code clean up
  clocksource/drivers/tegra: Use SPDX identifier
  clocksource/drivers/tegra: Support COMPILE_TEST universally
  clocksource/drivers/tegra: Lower clocksource rating for some Tegra's
  clocksource/drivers/tegra: Rename timer-tegra20.c to timer-tegra.c

 drivers/clocksource/Kconfig                   |   2 +-
 drivers/clocksource/Makefile                  |   2 +-
 .../{timer-tegra20.c => timer-tegra.c}        | 296 +++++++++---------
 3 files changed, 148 insertions(+), 152 deletions(-)
 rename drivers/clocksource/{timer-tegra20.c => timer-tegra.c} (54%)

-- 
2.21.0
