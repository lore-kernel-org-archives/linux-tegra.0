From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH 0/2] Tegra124 clock fixes
Date: Mon, 25 Nov 2013 15:20:21 +0200
Message-ID: <1385385623-8952-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Mike Turquette <mturquette@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

A few fixes for Tegra124 clocks. These patches will be squashed into the pull
request I will send out later today, but I wanted to post them here as well
so the changes are known.

Peter De Schrijver (2):
  clk: tegra: fix vi clk for Terga124
  clk: tegra: fix pllcx pdiv for Tegra124

 drivers/clk/tegra/clk-id.h           |    1 +
 drivers/clk/tegra/clk-tegra-periph.c |    8 ++++++++
 drivers/clk/tegra/clk-tegra124.c     |    5 ++++-
 3 files changed, 13 insertions(+), 1 deletions(-)

-- 
1.7.7.rc0.72.g4b5ea.dirty
