From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 10/22] interconnect: Relax requirement in of_icc_get_from_provider()
Date: Mon, 30 Mar 2020 04:08:52 +0300
Message-ID: <20200330010904.27643-11-digetx@gmail.com>
References: <20200330010904.27643-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200330010904.27643-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>, Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Artur Świgoń <a.swigon@samsung.com>

This patch relaxes the condition in of_icc_get_from_provider() so that it
is no longer required to set #interconnect-cells = <1> in the DT. In case
of the devfreq driver for exynos-bus, #interconnect-cells is always zero.

Signed-off-by: Artur Świgoń <a.swigon@samsung.com>
[digetx@gmail.com: added cells_num checking for of_icc_xlate_onecell()]
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/interconnect/core.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/interconnect/core.c b/drivers/interconnect/core.c
index 2c6515e3ecf1..7d09656734c1 100644
--- a/drivers/interconnect/core.c
+++ b/drivers/interconnect/core.c
@@ -335,7 +335,7 @@ static struct icc_node *of_icc_get_from_provider(struct of_phandle_args *spec)
 	struct icc_node *node = ERR_PTR(-EPROBE_DEFER);
 	struct icc_provider *provider;
 
-	if (!spec || spec->args_count != 1)
+	if (!spec)
 		return ERR_PTR(-EINVAL);
 
 	mutex_lock(&icc_lock);
@@ -851,6 +851,15 @@ EXPORT_SYMBOL_GPL(icc_nodes_remove);
  */
 int icc_provider_add(struct icc_provider *provider)
 {
+	struct device_node *np = provider->dev->of_node;
+	u32 cells_num;
+	int err;
+
+	err = of_property_read_u32(np, "#interconnect-cells", &cells_num);
+	if (WARN_ON(err))
+		return err;
+	if (WARN_ON(provider->xlate == of_icc_xlate_onecell && cells_num != 1))
+		return -EINVAL;
 	if (WARN_ON(!provider->set))
 		return -EINVAL;
 	if (WARN_ON(!provider->xlate))
-- 
2.25.1
