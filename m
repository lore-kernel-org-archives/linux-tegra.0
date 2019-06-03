From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 6/8] regulator: core: Don't attach generic coupler to Tegra SoC regulators
Date: Tue,  4 Jun 2019 02:59:02 +0300
Message-ID: <20190603235904.19097-7-digetx@gmail.com>
References: <20190603235904.19097-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190603235904.19097-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Today generic coupler can't handle regulators coupling that is specific to
NVIDIA Tegra SoC's, hence don't allow generic coupler to attach to those
regulators. Later on it should be possible to switch at least Tegra20 to a
generic coupler, once all prerequisite bits will get resolved in upstream
(voltage management support by all drivers, etc).

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/regulator/core.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 5a5b86d3edfb..68cccaf2e8f2 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -4866,6 +4866,16 @@ static int regulator_init_coupling(struct regulator_dev *rdev)
 static int generic_coupler_attach(struct regulator_coupler *coupler,
 				  struct regulator_dev *rdev)
 {
+	/*
+	 * Generic coupler isn't suitable for NVIVIA Tegra SoC's, at least
+	 * for now. Hence filter out the unwanted regulators as they shall be
+	 * managed by a platform-specific coupler.
+	 */
+	if (of_property_read_bool(rdev->dev.of_node, "tegra-core-regulator") ||
+	    of_property_read_bool(rdev->dev.of_node, "tegra-rtc-regulator") ||
+	    of_property_read_bool(rdev->dev.of_node, "tegra-cpu-regulator"))
+		return -EPERM;
+
 	return 0;
 }
 
-- 
2.21.0
