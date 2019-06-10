From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 0/6] Few more cleanups for tegra-timer
Date: Mon, 10 Jun 2019 19:43:54 +0300
Message-ID: <20190610164400.11830-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hello,

This a followup to [0] that includes some more fixes and further
prettifies the driver's code.

[0] https://patchwork.ozlabs.org/project/linux-tegra/list/?series=111529

Changelog:

v2: Fixed a bug that was introduced by [0] in a newly added patch:
    "Restore timer rate on Tegra210".

    Fixed potential problem in regards to error handling in another new
    patch: "Restore base address before cleanup".

    Added new patch "Add verbose definition for 1MHz constant" as per
    Daniel's Lezcano recommendation.

    Fixed a code typo that was made in "Remove duplicated use of per_cpu_ptr"
    of v1.

Dmitry Osipenko (6):
  clocksource/drivers/tegra: Restore timer rate on Tegra210
  clocksource/drivers/tegra: Remove duplicated use of per_cpu_ptr
  clocksource/drivers/tegra: Set and use timer's period
  clocksource/drivers/tegra: Drop unneeded typecasting in one place
  clocksource/drivers/tegra: Add verbose definition for 1MHz constant
  clocksource/drivers/tegra: Restore base address before cleanup

 drivers/clocksource/timer-tegra.c | 59 +++++++++++++++++++------------
 1 file changed, 37 insertions(+), 22 deletions(-)

-- 
2.21.0
