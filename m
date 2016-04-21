From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 0/5] regulator: A few fixes for supply resolution
Date: Thu, 21 Apr 2016 17:11:56 +0100
Message-ID: <1461255121-5245-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Thierry Reding <treding@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

This series is to mainly address the boot failures reported on the
Tegra124 Jetson TK1 where the AS3772 PMIC is failing to probe on -next [0].
However, there are a couple other patches I am including here which
came from looking at this problem. Here is a summary of the patches ...

Patch 1: Allows additional supplies to be resolved even if one fails
Patch 2: Fixes potential crash if turning on a supply fails
Patch 3-5: Address issue with AS3722 probe failing

[0] http://marc.info/?l=linux-tegra&m=145927821311669&w=2

Jon Hunter (5):
  regulator: core: Don't terminate supply resolution early
  regulator: core: Clear the supply pointer if enabling fails
  regulator: core: Move registration of regulator device
  regulator: core: Add early supply resolution for a bypassed regulator
  regulator: helpers: Ensure bypass register field matches ON value

 drivers/regulator/core.c    | 59 ++++++++++++++++++++++++++-------------------
 drivers/regulator/helpers.c |  2 +-
 2 files changed, 35 insertions(+), 26 deletions(-)

-- 
2.1.4
