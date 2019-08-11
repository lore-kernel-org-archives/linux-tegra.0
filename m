From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v10 07/15] memory: tegra20-emc: Increase handshake timeout
Date: Mon, 12 Aug 2019 00:00:35 +0300
Message-ID: <20190811210043.20122-8-digetx@gmail.com>
References: <20190811210043.20122-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190811210043.20122-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Turned out that it could take over a millisecond under some circumstances,
like running on a very low CPU/memory frequency. TRM says that handshake
happens when there is a "safe" moment, but not explains exactly what that
moment is. Apparently at least memory should be idling and thus the low
frequency should be a reasonable cause for a longer handshake delay.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra20-emc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index 25a6aad6a7a9..da75efc632c7 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -236,7 +236,7 @@ static int emc_complete_timing_change(struct tegra_emc *emc, bool flush)
 	}
 
 	timeout = wait_for_completion_timeout(&emc->clk_handshake_complete,
-					      usecs_to_jiffies(100));
+					      msecs_to_jiffies(100));
 	if (timeout == 0) {
 		dev_err(emc->dev, "EMC-CAR handshake failed\n");
 		return -EIO;
-- 
2.22.0
