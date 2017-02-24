From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH v2 0/5] Add missing Tegra210 clocks
Date: Fri, 24 Feb 2017 15:19:25 +0200
Message-ID: <1487942376-19631-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rhyland Klein <rklein@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

This series adds a number of clocks which were missing from the Tegra210
clock definition. It applies on top of the 'Tegra210 clock bug fixes' series
posted earlier.

Change log:

v2: fixed a few useless lines moving around

Peter De Schrijver (5):
  clk: tegra: add cec clock
  clk: tegra: define Tegra210 DMIC sync clocks
  clk: tegra: define Tegra210 DMIC clocks
  clk: tegra: add super clk mux/div
  clk: tegra: add aclk

 drivers/clk/tegra/clk-id.h                      | 10 +++
 drivers/clk/tegra/clk-super.c                   | 87 +++++++++++++++++++++++--
 drivers/clk/tegra/clk-tegra-audio.c             | 85 +++++++++++++++++-------
 drivers/clk/tegra/clk-tegra-periph.c            | 22 +++++++
 drivers/clk/tegra/clk-tegra114.c                |  1 +
 drivers/clk/tegra/clk-tegra124.c                |  1 +
 drivers/clk/tegra/clk-tegra210.c                | 20 ++++++
 drivers/clk/tegra/clk-tegra30.c                 |  1 +
 drivers/clk/tegra/clk.h                         |  7 +-
 include/dt-bindings/clock/tegra114-car.h        |  2 +-
 include/dt-bindings/clock/tegra124-car-common.h |  2 +-
 include/dt-bindings/clock/tegra210-car.h        | 13 +++-
 include/dt-bindings/clock/tegra30-car.h         |  2 +-
 13 files changed, 219 insertions(+), 34 deletions(-)

-- 
1.9.1

