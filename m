From: Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH 00/11] Switch to using CRITICAL clks for Tegra
Date: Wed, 25 May 2016 18:24:20 -0400
Message-ID: <1464215071-28696-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Rhyland Klein <rklein@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Switch to defining clks that need to be on as CRITICAL rather than
using the init_tables defined to enable clks. Some of these may be
able to be converted to HAND_OFF clks, when that is supported.

I added a patch to mark CRITICAL clks in the clk_summary table, figuring
it would be handy to be able to easily tell what clks are CRITICAL
through the table.

I added a warning for using the init_table to enable clks. I considered
removing it entirely, but I thought phasing it out might be better.

Rhyland Klein (11):
  clk: tegra: Switch to using critical/handoff clks
  clk: tegra20: Mark required clks as CRITICAL
  clk: tegra20: clean up init_table
  clk: tegra30: Mark certain clks as critical
  clk: tegra30: clean up init_table
  clk: tegra114: clean up init_table
  clk: tegra124: clean up init_table
  clk: tegra210: Mark required clks as CRITICAL
  clk: tegra210: clean up init_table
  clk: Show CRITICAL clks in clk_summary output
  clk: tegra: WARN if clk in the init_table has enable

 drivers/clk/clk.c                        |  7 ++++--
 drivers/clk/tegra/clk-tegra-periph.c     | 21 ++++++++++------
 drivers/clk/tegra/clk-tegra-super-gen4.c | 12 ++++++----
 drivers/clk/tegra/clk-tegra114.c         | 11 ++++-----
 drivers/clk/tegra/clk-tegra124.c         | 19 ++++++---------
 drivers/clk/tegra/clk-tegra20.c          | 41 +++++++++++++++-----------------
 drivers/clk/tegra/clk-tegra210.c         | 28 ++++++++--------------
 drivers/clk/tegra/clk-tegra30.c          | 28 ++++++++--------------
 drivers/clk/tegra/clk.c                  |  5 ++++
 9 files changed, 81 insertions(+), 91 deletions(-)

-- 
1.9.1
