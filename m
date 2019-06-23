From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 00/11] More improvements for Tegra30 devfreq driver
Date: Mon, 24 Jun 2019 00:46:47 +0300
Message-ID: <20190623214658.11680-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hello,

This series is a followup to [1] which addresses some additional review
comments that were made by Thierry Reding to [1] and makes several
important changes to the driver, fixing excessive interrupts activity.
In the end I'm proposing myself as a maintainer for the driver.

[1] https://lore.kernel.org/lkml/0fb50eb1-a173-1756-6889-2526a10ac707@gmail.com/T/

Dmitry Osipenko (11):
  PM / devfreq: tegra30: Change irq type to unsigned int
  PM / devfreq: tegra30: Keep interrupt disabled while governor is
    stopped
  PM / devfreq: tegra30: Handle possible round-rate error
  PM / devfreq: tegra30: Drop write-barrier
  PM / devfreq: tegra30: Rework frequency management logic
  PM / devfreq: tegra30: Reset boosting on startup
  PM / devfreq: tegra30: Reset boosting if clock rate changed
  PM / devfreq: tegra30: Stop de-boosting once it's finished
  PM / devfreq: tegra30: Don't enable consecutive-down interrupt on
    startup
  PM / devfreq: tegra30: Add debug messages
  PM / devfreq: tegra30: Add Dmitry as maintainer

 MAINTAINERS                       |   8 +
 drivers/devfreq/tegra30-devfreq.c | 542 ++++++++++++++++++++++--------
 2 files changed, 409 insertions(+), 141 deletions(-)

-- 
2.22.0
