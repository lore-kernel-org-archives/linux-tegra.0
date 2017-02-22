From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH 0/7] Tegra210 clock bug fixes
Date: Wed, 22 Feb 2017 17:13:55 +0200
Message-ID: <1487776444-4701-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rhyland Klein <rklein@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

A number of bug fixes for the Tegra210 clock implementation.

Peter De Schrijver (7):
  clk: tegra: fix pll_a1 iddq register, add pll_a1
  clk: tegra: fix isp clock modelling
  clk: tegra: correct afi parent
  clk: tegra: remove non-existing pll_m_out1 clock
  clk: tegra: don't warn for PLL defaults unnecessarily
  clk: tegra: correct tegra210_pll_fixed_mdiv_cfg rate calculation
  clk: tegra: fix type for m field

 drivers/clk/tegra/clk-id.h               |  1 +
 drivers/clk/tegra/clk-tegra-periph.c     | 13 +++++++++---
 drivers/clk/tegra/clk-tegra210.c         | 35 ++++++++++++++++++++------------
 drivers/clk/tegra/clk.h                  |  2 +-
 include/dt-bindings/clock/tegra210-car.h |  4 ++--
 5 files changed, 36 insertions(+), 19 deletions(-)

-- 
1.9.1

