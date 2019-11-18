From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 13/29] memory: tegra: Register as interconnect provider
Date: Mon, 18 Nov 2019 23:02:31 +0300
Message-ID: <20191118200247.3567-14-digetx@gmail.com>
References: <20191118200247.3567-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191118200247.3567-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Memory controller now provides memory clients with memory bandwidth using
interconnect API.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/mc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index ec8403557ed4..a4f7cc0bf9e7 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -699,6 +699,10 @@ static int tegra_mc_probe(struct platform_device *pdev)
 		}
 	}
 
+	err = tegra_icc_mc_setup_interconnect(mc);
+	if (err)
+		dev_err(&pdev->dev, "failed to initialize ICC: %d\n", err);
+
 	return 0;
 }
 
-- 
2.23.0
