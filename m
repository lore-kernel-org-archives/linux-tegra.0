From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 0/7] NVIDIA Tegra clocksource improvements and clean up
Date: Thu, 25 Apr 2019 02:14:37 +0300
Message-ID: <20190424231444.20876-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hello,

This series primarily unifies the driver code across all Tegra SoC
generations. In a result the clocksources are allocated per-CPU on
older Tegra's and have a higher rating than the arch-timer, the newer
Tegra210 is getting support for microsecond clocksource and delay-timer
and the driver's code is getting much cleaner. Note that arch-timer usage
is discouraged on all Tegra's due to the time jitter caused by the CPU
frequency scaling.

Dmitry Osipenko (7):
  clocksource/drivers/tegra: Support per-CPU timers on all Tegra's
  clocksource/drivers/tegra: Unify timer code
  clocksource/drivers/tegra: Reset hardware state on init
  clocksource/drivers/tegra: Replace readl/writel with relaxed versions
  clocksource/drivers/tegra: Release all IRQ's on request_irq() error
  clocksource/drivers/tegra: Minor code clean up
  clocksource/drivers/tegra: Use SPDX identifier

 drivers/clocksource/timer-tegra20.c | 287 +++++++++++++---------------
 1 file changed, 136 insertions(+), 151 deletions(-)

-- 
2.21.0
