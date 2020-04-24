From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH 4.19.113 0/3] Fix for long operation cmds busy detection
Date: Fri, 24 Apr 2020 13:06:49 -0700
Message-ID: <1587758812-3331-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-mmc-owner@vger.kernel.org>
Sender: linux-mmc-owner@vger.kernel.org
To: adrian.hunter@intel.com, ulf.hansson@linaro.org, baolin.wang@linaro.org, kstewart@linuxfoundation.org, tglx@linutronix.de, bradleybolen@gmail.com, gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com, skomatineni@nvidia.com
Cc: anrao@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, stable@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

This series includes manually backported changes that implements Tegra
specific timeout callback to switch between finite and infinite HW busy
detection wait modes.

sdhci-tegra driver patch implements set_timeout callback based on one of
the sdhci host driver patch that refactors sdhci_set_timeout and allows
drivers to call __sdhci_set_timeout with their timeout callback
implementation.

Both of these patches are manually backported in this series.


Sowjanya Komatineni (3):
  mmc: sdhci: Refactor sdhci_set_timeout()
  sdhci: tegra: Implement Tegra specific set_timeout callback
  sdhci: tegra: Enable MMC_CAP_WAIT_WHILE_BUSY host capability

 drivers/mmc/host/sdhci-tegra.c | 32 ++++++++++++++++++++++++++++++++
 drivers/mmc/host/sdhci.c       | 38 ++++++++++++++++++++------------------
 drivers/mmc/host/sdhci.h       |  1 +
 3 files changed, 53 insertions(+), 18 deletions(-)

-- 
2.7.4
