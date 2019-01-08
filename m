From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH V5] i2c: tegra: Fix Maximum transfer size
Date: Tue, 8 Jan 2019 13:59:09 -0800
Message-ID: <1546984750-26199-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com, mkarthik@nvidia.com, smohammed@nvidia.com, talho@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, Sowjanya Komatineni <skomatineni@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

V5 is same as V4 Patch rebased to 5.0-rc1

Sowjanya Komatineni (1):
  i2c: tegra: Fix Maximum transfer size

 drivers/i2c/busses/i2c-tegra.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

-- 
2.7.4
