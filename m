From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 21/29] memory: tegra30-emc: Register as interconnect provider
Date: Mon, 18 Nov 2019 23:02:39 +0300
Message-ID: <20191118200247.3567-22-digetx@gmail.com>
References: <20191118200247.3567-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191118200247.3567-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

EMC now provides MC with memory bandwidth using interconnect API.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra30-emc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/memory/tegra/tegra30-emc.c b/drivers/memory/tegra/tegra30-emc.c
index ee194e8ed521..7316ab50511b 100644
--- a/drivers/memory/tegra/tegra30-emc.c
+++ b/drivers/memory/tegra/tegra30-emc.c
@@ -1171,6 +1171,11 @@ static int tegra_emc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, emc);
 
+	/* Tegra30 has DRAM channel fixed at 32bit width */
+	err = tegra_icc_emc_setup_interconnect(&pdev->dev, 32 / 8);
+	if (err)
+		dev_err(&pdev->dev, "failed to initialize ICC: %d\n", err);
+
 	return 0;
 
 unset_cb:
-- 
2.23.0
