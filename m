From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 0/5] NVIDIA Tegra devfreq drivers improvements
Date: Tue, 31 Mar 2020 02:16:12 +0300
Message-ID: <20200330231617.17079-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hello,

This series contains minor patches that I was going to send out a month or
two ago, but completely forgot about. More importantly, it also contains new
patches that are needed in order to address an upcoming problem in regards
to adding interconnect API support for NVIDIA Tegra [1].

[1] https://patchwork.ozlabs.org/project/linux-tegra/list/?series=167480

The problem lies in clk_round_rate(), which rounds clock rate based on the
min/max clk limits imposed by active clk users. This is not suitable for
the Tegra devfreq drivers because they use clk_round_rate() for building
OPP table, and thus, nothing should limit the clk rate, otherwise the OPP
table values are erroneously getting limited to the clk's limits.

Dmitry Osipenko (5):
  PM / devfreq: tegra: Add Dmitry as a maintainer
  clk: Introduce clk_round_rate_unboundly()
  PM / devfreq: tegra20: Use clk_round_rate_unboundly()
  PM / devfreq: tegra30: Use clk_round_rate_unboundly()
  PM / devfreq: tegra30: Make CPUFreq notifier to take into account
    boosting

 MAINTAINERS                       |  9 ++++++
 drivers/clk/clk.c                 | 49 ++++++++++++++++++++++++-------
 drivers/devfreq/tegra20-devfreq.c |  4 +--
 drivers/devfreq/tegra30-devfreq.c |  6 ++--
 include/linux/clk.h               | 18 ++++++++++++
 5 files changed, 70 insertions(+), 16 deletions(-)

-- 
2.25.1
