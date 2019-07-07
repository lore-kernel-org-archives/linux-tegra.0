From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 0/2] Tegra30+ CPU suspend-resume bug-fixes
Date: Mon,  8 Jul 2019 02:03:56 +0300
Message-ID: <20190707230358.10672-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hello,

This small series addresses two suspend-resume bugs: one affects Tegra30+
due to a typo in the code, other fixes CPU hang on Tegra30 specifically.

Please review and apply, thanks!

Dmitry Osipenko (2):
  ARM: tegra: Fix FLOW_CTLR_HALT register clobbering by tegra_resume()
  ARM: tegra: Use WFE for power-gating on Tegra30

 arch/arm/mach-tegra/reset-handler.S |  6 +++---
 arch/arm/mach-tegra/sleep-tegra30.S |  4 +++-
 drivers/soc/tegra/flowctrl.c        | 19 +++++++++++++++++--
 3 files changed, 23 insertions(+), 6 deletions(-)

-- 
2.22.0
