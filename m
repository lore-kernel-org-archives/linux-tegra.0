From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 0/2] LP1/LP2 suspend-resume CPU clock fixes for Tegra30
Date: Thu, 30 Aug 2018 22:04:52 +0300
Message-ID: <20180830190454.8729-1-digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hello,

This patch-series fixes CPU hanging after suspend-resume / LP2 cpuidle
on Tegra30. The bug really appears during stress-testing, like frequent
suspending under variable load + the upcoming Tegra30 CPUFREQ driver.

Dmitry Osipenko (2):
  ARM: tegra: Switch CPU to PLLP before powergating on Tegra30
  ARM: tegra: Switch CPU to PLLP on resume from LP1 on Tegra30

 arch/arm/mach-tegra/sleep-tegra30.S | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.18.0
