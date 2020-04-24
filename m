From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH 5.4.33 0/2] Fix for long operation cmds busy detection
Date: Fri, 24 Apr 2020 13:06:04 -0700
Message-ID: <1587758766-3274-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: adrian.hunter@intel.com, ulf.hansson@linaro.org, baolin.wang@linaro.org, kstewart@linuxfoundation.org, tglx@linutronix.de, bradleybolen@gmail.com, gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com, skomatineni@nvidia.com
Cc: anrao@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, stable@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

This series is to backport the upstream patches that fixes busy detection
for long operation mmc commands by implementing Tegra specific timeout
callback to switch between finite and infinite HW busy detection wait
modes.


Sowjanya Komatineni (2):
  sdhci: tegra: Implement Tegra specific set_timeout callback
  sdhci: tegra: Enable MMC_CAP_WAIT_WHILE_BUSY host capability

 drivers/mmc/host/sdhci-tegra.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

-- 
2.7.4
