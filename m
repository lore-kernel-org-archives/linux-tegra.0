From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 1/5] PM / Domains: Export symbol for genpd_dev_pm_attach_by_name
Date: Wed, 26 Sep 2018 13:27:34 +0100
Message-ID: <1537964858-30332-2-git-send-email-jonathanh@nvidia.com>
References: <1537964858-30332-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1537964858-30332-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Kevin Hilman <khilman@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Export the symbol for genpd_dev_pm_attach_by_name() so that drivers
built as modules can call this function.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/base/power/domain.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/base/power/domain.c b/drivers/base/power/domain.c
index 4b5714199490..b2bbe0d848d2 100644
--- a/drivers/base/power/domain.c
+++ b/drivers/base/power/domain.c
@@ -2397,6 +2397,7 @@ struct device *genpd_dev_pm_attach_by_name(struct device *dev, char *name)
 
 	return genpd_dev_pm_attach_by_id(dev, index);
 }
+EXPORT_SYMBOL_GPL(genpd_dev_pm_attach_by_name);
 
 static const struct of_device_id idle_state_match[] = {
 	{ .compatible = "domain-idle-state", },
-- 
2.7.4
