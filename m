Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi [62.142.5.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C671D0DE2
	for <linux-tegra@vger.kernel.org>; Thu, 22 Aug 2024 22:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724366330; cv=none; b=M0t5SaEUKm9n0WH7az6FLDvxciWA+5/5bzwH85RVrOx8sZU4tW9uO4oNQ/QxwKt6PdajovPko+2QHfm205+fGVF/V4+4Pjys6mXILAiHKYob9QEr0eeMpLaG8E62K8VxKL98uvs+eFwEt3etbe2yk/3YrM7hCTKXJjtqctPC4aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724366330; c=relaxed/simple;
	bh=e2wtUFAtUu+mNt6Y1Gr4ICp3bhuWwA2uBnfNyg3Li5U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z/X7uZve5QBg2wVYJisAZl3ez1vB8IgPlWI1kzCTWqGLsf/K8XNGlNHnLDGFMZHFl1MBKMqVPYN0VsEOJoLjLsqzdxgmO8bxYpV3PWyUm6odttOJ+yIjO8ZqVAQrduqzlZ4uQL8Qd+z/w/nFQhwvX1YjsANYapo8JiH9Yv/CWso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-87.elisa-laajakaista.fi [88.113.25.87])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id 4b1900e7-60d7-11ef-822f-005056bdfda7;
	Fri, 23 Aug 2024 01:38:46 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v1 1/1] gpio: tegra: Replace of_node_to_fwnode() with more suitable API
Date: Fri, 23 Aug 2024 01:38:45 +0300
Message-ID: <20240822223845.706346-1-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_node_to_fwnode() is a IRQ domain specific implementation of
of_fwnode_handle(). Replace the former with more suitable API.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/gpio/gpio-tegra.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index ea5f9cc14bc4..6d3a39a03f58 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -18,11 +18,12 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/module.h>
-#include <linux/seq_file.h>
 #include <linux/irqdomain.h>
 #include <linux/irqchip/chained_irq.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/pm.h>
+#include <linux/property.h>
+#include <linux/seq_file.h>
 
 #define GPIO_BANK(x)		((x) >> 5)
 #define GPIO_PORT(x)		(((x) >> 3) & 0x3)
@@ -755,7 +756,7 @@ static int tegra_gpio_probe(struct platform_device *pdev)
 	}
 
 	irq = &tgi->gc.irq;
-	irq->fwnode = of_node_to_fwnode(pdev->dev.of_node);
+	irq->fwnode = dev_fwnode(&pdev->dev);
 	irq->child_to_parent_hwirq = tegra_gpio_child_to_parent_hwirq;
 	irq->populate_parent_alloc_arg = tegra_gpio_populate_parent_fwspec;
 	irq->handler = handle_simple_irq;
-- 
2.46.0

