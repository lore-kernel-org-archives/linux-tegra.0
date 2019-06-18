From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v3 0/8] Few more cleanups for tegra-timer
Date: Tue, 18 Jun 2019 17:03:50 +0300
Message-ID: <20190618140358.13148-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hello,

This a followup to [0] that includes some more fixes and further
prettifies the driver's code.

[0] https://patchwork.ozlabs.org/project/linux-tegra/list/?series=111529

Changelog:

v3: Addressed request from Jon Hunter that was made in a review comment
    to v2 by dropping the timer's period rounding-up in the "Set and use
    timer' period" patch.

    Appended two new patches to this series that were already sent out
    and reviewed after the v2 of this series:

      clocksource/drivers/tegra: Cycles can't be 0
      clocksource/drivers/tegra: Set up maximum-ticks limit properly

    In this two new patches I addressed review comments that were made by
    Thierry Reding by adding clarifying comments to the code and extending
    the commit messages a tad.

    Corrected the "Fixes" tag in a "Restore timer rate on Tegra210"
    patch such that linux-next checker won't complain about the shortened
    commit's subject.

v2: Fixed a bug that was introduced by [0] in a newly added patch:
    "Restore timer rate on Tegra210".

    Fixed potential problem in regards to error handling in another new
    patch: "Restore base address before cleanup".

    Added new patch "Add verbose definition for 1MHz constant" as per
    Daniel's Lezcano recommendation.

    Fixed a code typo that was made in "Remove duplicated use of per_cpu_ptr"
    of v1.

Dmitry Osipenko (8):
  clocksource/drivers/tegra: Restore timer rate on Tegra210
  clocksource/drivers/tegra: Remove duplicated use of per_cpu_ptr
  clocksource/drivers/tegra: Set and use timer's period
  clocksource/drivers/tegra: Drop unneeded typecasting in one place
  clocksource/drivers/tegra: Add verbose definition for 1MHz constant
  clocksource/drivers/tegra: Restore base address before cleanup
  clocksource/drivers/tegra: Cycles can't be 0
  clocksource/drivers/tegra: Set up maximum-ticks limit properly

 drivers/clocksource/timer-tegra.c | 82 +++++++++++++++++++++----------
 1 file changed, 56 insertions(+), 26 deletions(-)

-- 
2.22.0
