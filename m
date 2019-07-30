From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v9 08/15] memory: tegra20-emc: wait_for_completion_timeout() doesn't return error
Date: Tue, 30 Jul 2019 19:56:11 +0300
Message-ID: <20190730165618.10122-9-digetx@gmail.com>
References: <20190730165618.10122-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190730165618.10122-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The "interruptible" variant may error out, the "uninterruptible" not.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra20-emc.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index da75efc632c7..1b23b1c34476 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -224,7 +224,7 @@ static int emc_prepare_timing_change(struct tegra_emc *emc, unsigned long rate)
 
 static int emc_complete_timing_change(struct tegra_emc *emc, bool flush)
 {
-	long timeout;
+	unsigned long timeout;
 
 	dev_dbg(emc->dev, "%s: flush %d\n", __func__, flush);
 
@@ -240,10 +240,6 @@ static int emc_complete_timing_change(struct tegra_emc *emc, bool flush)
 	if (timeout == 0) {
 		dev_err(emc->dev, "EMC-CAR handshake failed\n");
 		return -EIO;
-	} else if (timeout < 0) {
-		dev_err(emc->dev, "failed to wait for EMC-CAR handshake: %ld\n",
-			timeout);
-		return timeout;
 	}
 
 	return 0;
-- 
2.22.0
