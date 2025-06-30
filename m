Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EFF23F40A;
	Mon, 30 Jun 2025 08:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751273902; cv=none; b=C+cz/li/+/GpZyOb3mRXpiLnD2ZKSBdOBs4Hmw/+jxTZ+ui3hyNLMApB9rYl+uJpfoLoow35BFgWEQxlWCO+Q9ZectRhwKsPf6CvI6boTuvi70+AcidTLSfoaffpTYtwHwAo3LbUSkHtV/vm7XR2ebORhq1vZf9+SWaiLW3miVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751273902; c=relaxed/simple;
	bh=5MWy0VbB3a2xKpdUlKN6bA8X8zp7YcrqToBNVK2VYYc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g2Vj4t/EaP46QTorHBqqpLJ98hu5FSDB8/D3rReafLK21oosPkzzr7JldHQkTeIrkIJoTlUuFaKdMEpy/gzYxwXIVkFgWhdaEJ0TDe9lJ26/9L3JCR+SaV5B6e2T4dMHUL+c5QCYnAcgSGENxJCxoALBmQH3echtF2oYQjYBjZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=VqyHu2Ip; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="VqyHu2Ip"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 4DDFD60010B4;
	Mon, 30 Jun 2025 09:49:22 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id PrrKZMLvhQnK; Mon, 30 Jun 2025 09:49:20 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 04F9560010B8;
	Mon, 30 Jun 2025 09:49:19 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1751273359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o7RC5Yaho27s6keGIdo2MXa135kKrSIZEJMp9mgNyJU=;
	b=VqyHu2IpoHROI+CsLD7ejgW9DmqbuE461HAn6nSxmElKFUXCwYjnnPyXGOCGuUhDVTCmU2
	onOwKTQ4HBhka0u7xreZaqVSjPTwHdT0ykE+ox97DT0UTy1cOiinuuAmLumb/hEkFqzPxK
	61kxi1z9JhJqpO1ecGTUhcIoM1JIUBc=
Received: from [192.168.1.69] (unknown [92.56.11.86])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id ADA4B360083;
	Mon, 30 Jun 2025 09:49:17 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Date: Mon, 30 Jun 2025 09:48:42 +0100
Subject: [PATCH v3 1/3] drm/tegra: Add NVJPG driver
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-diogo-nvjpg-v3-1-a553c7e91354@tecnico.ulisboa.pt>
References: <20250630-diogo-nvjpg-v3-0-a553c7e91354@tecnico.ulisboa.pt>
In-Reply-To: <20250630-diogo-nvjpg-v3-0-a553c7e91354@tecnico.ulisboa.pt>
To: Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, 
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751273350; l=11034;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=5MWy0VbB3a2xKpdUlKN6bA8X8zp7YcrqToBNVK2VYYc=;
 b=lHC0Fb7AmsJibktnPrTz9sbQ2b8h3/PTtRs5AdGCYllkt8r0DsSBZ6qo4FNKEb1U8kgda5BIk
 Q8V0e66U9VrDm8Tnm4L98TLlrmNLXdLwGg7YdTVbhsXhA1Lj3AEfpXV
X-Developer-Key: i=diogo.ivo@tecnico.ulisboa.pt; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=

Add support for booting and using NVJPG on Tegra210 to the Host1x
and TegraDRM drivers. This driver only supports the new TegraDRM uAPI.

Acked-by: Mikko Perttunen <mperttunen@nvidia.com>
Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
v2->v3:
- Properly handle dma_alloc_coherent error path by checking for a valid
  return pointer

v1->v2:
- Removed explicit reset handling, leaving it to power-domain code
- Set clock rate to maximum upon getting clock
- Use modern variants to set PM ops
- Simplify getting io resource
---
 drivers/gpu/drm/tegra/Makefile |   1 +
 drivers/gpu/drm/tegra/drm.c    |   2 +
 drivers/gpu/drm/tegra/drm.h    |   1 +
 drivers/gpu/drm/tegra/nvjpg.c  | 329 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 333 insertions(+)

diff --git a/drivers/gpu/drm/tegra/Makefile b/drivers/gpu/drm/tegra/Makefile
index 6fc4b504e7861df8802f3f0f5d6faf9eb167b27a..e399b40d64a1d2070b27c2219a36693a8e3edc61 100644
--- a/drivers/gpu/drm/tegra/Makefile
+++ b/drivers/gpu/drm/tegra/Makefile
@@ -25,6 +25,7 @@ tegra-drm-y := \
 	falcon.o \
 	vic.o \
 	nvdec.o \
+	nvjpg.o \
 	riscv.o
 
 tegra-drm-y += trace.o
diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 4596073fe28fa1beb6689da305775f4468714548..f44fb145920ae77dda82780a659a98c88ea25a5a 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1383,6 +1383,7 @@ static const struct of_device_id host1x_drm_subdevs[] = {
 	{ .compatible = "nvidia,tegra210-sor1", },
 	{ .compatible = "nvidia,tegra210-vic", },
 	{ .compatible = "nvidia,tegra210-nvdec", },
+	{ .compatible = "nvidia,tegra210-nvjpg", },
 	{ .compatible = "nvidia,tegra186-display", },
 	{ .compatible = "nvidia,tegra186-dc", },
 	{ .compatible = "nvidia,tegra186-sor", },
@@ -1421,6 +1422,7 @@ static struct platform_driver * const drivers[] = {
 	&tegra_gr3d_driver,
 	&tegra_vic_driver,
 	&tegra_nvdec_driver,
+	&tegra_nvjpg_driver,
 };
 
 static int __init host1x_drm_init(void)
diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 0b65e69f3a8add906e48b471804ad45bb3241455..64c8577720245564c421b85057a02419e235a6b6 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -212,5 +212,6 @@ extern struct platform_driver tegra_gr2d_driver;
 extern struct platform_driver tegra_gr3d_driver;
 extern struct platform_driver tegra_vic_driver;
 extern struct platform_driver tegra_nvdec_driver;
+extern struct platform_driver tegra_nvjpg_driver;
 
 #endif /* HOST1X_DRM_H */
diff --git a/drivers/gpu/drm/tegra/nvjpg.c b/drivers/gpu/drm/tegra/nvjpg.c
new file mode 100644
index 0000000000000000000000000000000000000000..d1beee32223225d6a541403302d08544d01e5012
--- /dev/null
+++ b/drivers/gpu/drm/tegra/nvjpg.c
@@ -0,0 +1,329 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/dma-mapping.h>
+#include <linux/host1x.h>
+#include <linux/iommu.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#include "drm.h"
+#include "falcon.h"
+
+struct nvjpg_config {
+	const char *firmware;
+	unsigned int version;
+};
+
+struct nvjpg {
+	struct falcon falcon;
+
+	void __iomem *regs;
+	struct tegra_drm_client client;
+	struct device *dev;
+	struct clk *clk;
+
+	/* Platform configuration */
+	const struct nvjpg_config *config;
+};
+
+static inline struct nvjpg *to_nvjpg(struct tegra_drm_client *client)
+{
+	return container_of(client, struct nvjpg, client);
+}
+
+static int nvjpg_init(struct host1x_client *client)
+{
+	struct tegra_drm_client *drm = host1x_to_drm_client(client);
+	struct drm_device *dev = dev_get_drvdata(client->host);
+	struct tegra_drm *tegra = dev->dev_private;
+	struct nvjpg *nvjpg = to_nvjpg(drm);
+	int err;
+
+	err = host1x_client_iommu_attach(client);
+	if (err < 0 && err != -ENODEV) {
+		dev_err(nvjpg->dev, "failed to attach to domain: %d\n", err);
+		return err;
+	}
+
+	err = tegra_drm_register_client(tegra, drm);
+	if (err < 0)
+		goto detach;
+
+	/*
+	 * Inherit the DMA parameters (such as maximum segment size) from the
+	 * parent host1x device.
+	 */
+	client->dev->dma_parms = client->host->dma_parms;
+
+	return 0;
+
+detach:
+	host1x_client_iommu_detach(client);
+
+	return err;
+}
+
+static int nvjpg_exit(struct host1x_client *client)
+{
+	struct tegra_drm_client *drm = host1x_to_drm_client(client);
+	struct drm_device *dev = dev_get_drvdata(client->host);
+	struct tegra_drm *tegra = dev->dev_private;
+	struct nvjpg *nvjpg = to_nvjpg(drm);
+	int err;
+
+	/* avoid a dangling pointer just in case this disappears */
+	client->dev->dma_parms = NULL;
+
+	err = tegra_drm_unregister_client(tegra, drm);
+	if (err < 0)
+		return err;
+
+	pm_runtime_dont_use_autosuspend(client->dev);
+	pm_runtime_force_suspend(client->dev);
+
+	host1x_client_iommu_detach(client);
+
+	if (client->group) {
+		dma_unmap_single(nvjpg->dev, nvjpg->falcon.firmware.phys,
+				 nvjpg->falcon.firmware.size, DMA_TO_DEVICE);
+		tegra_drm_free(tegra, nvjpg->falcon.firmware.size,
+			       nvjpg->falcon.firmware.virt,
+			       nvjpg->falcon.firmware.iova);
+	} else {
+		dma_free_coherent(nvjpg->dev, nvjpg->falcon.firmware.size,
+				  nvjpg->falcon.firmware.virt,
+				  nvjpg->falcon.firmware.iova);
+	}
+
+	return 0;
+}
+
+static const struct host1x_client_ops nvjpg_client_ops = {
+	.init = nvjpg_init,
+	.exit = nvjpg_exit,
+};
+
+static int nvjpg_load_falcon_firmware(struct nvjpg *nvjpg)
+{
+	struct host1x_client *client = &nvjpg->client.base;
+	struct tegra_drm *tegra = nvjpg->client.drm;
+	dma_addr_t iova;
+	size_t size;
+	void *virt;
+	int err;
+
+	if (nvjpg->falcon.firmware.virt)
+		return 0;
+
+	err = falcon_read_firmware(&nvjpg->falcon, nvjpg->config->firmware);
+	if (err < 0)
+		return err;
+
+	size = nvjpg->falcon.firmware.size;
+
+	if (!client->group) {
+		virt = dma_alloc_coherent(nvjpg->dev, size, &iova, GFP_KERNEL);
+		if (!virt)
+			return -ENOMEM;
+	} else {
+		virt = tegra_drm_alloc(tegra, size, &iova);
+		if (IS_ERR(virt))
+			return PTR_ERR(virt);
+	}
+
+	nvjpg->falcon.firmware.virt = virt;
+	nvjpg->falcon.firmware.iova = iova;
+
+	err = falcon_load_firmware(&nvjpg->falcon);
+	if (err < 0)
+		goto cleanup;
+
+	/*
+	 * In this case we have received an IOVA from the shared domain, so we
+	 * need to make sure to get the physical address so that the DMA API
+	 * knows what memory pages to flush the cache for.
+	 */
+	if (client->group) {
+		dma_addr_t phys;
+
+		phys = dma_map_single(nvjpg->dev, virt, size, DMA_TO_DEVICE);
+
+		err = dma_mapping_error(nvjpg->dev, phys);
+		if (err < 0)
+			goto cleanup;
+
+		nvjpg->falcon.firmware.phys = phys;
+	}
+
+	return 0;
+
+cleanup:
+	if (!client->group)
+		dma_free_coherent(nvjpg->dev, size, virt, iova);
+	else
+		tegra_drm_free(tegra, size, virt, iova);
+
+	return err;
+}
+
+static __maybe_unused int nvjpg_runtime_resume(struct device *dev)
+{
+	struct nvjpg *nvjpg = dev_get_drvdata(dev);
+	int err;
+
+	err = clk_prepare_enable(nvjpg->clk);
+	if (err < 0)
+		return err;
+
+	usleep_range(20, 30);
+
+	err = nvjpg_load_falcon_firmware(nvjpg);
+	if (err < 0)
+		goto disable_clk;
+
+	err = falcon_boot(&nvjpg->falcon);
+	if (err < 0)
+		goto disable_clk;
+
+	return 0;
+
+disable_clk:
+	clk_disable_unprepare(nvjpg->clk);
+	return err;
+}
+
+static __maybe_unused int nvjpg_runtime_suspend(struct device *dev)
+{
+	struct nvjpg *nvjpg = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(nvjpg->clk);
+
+	return 0;
+}
+
+static int nvjpg_can_use_memory_ctx(struct tegra_drm_client *client, bool *supported)
+{
+	*supported = false;
+
+	return 0;
+}
+
+static const struct tegra_drm_client_ops nvjpg_ops = {
+	.get_streamid_offset = NULL,
+	.can_use_memory_ctx = nvjpg_can_use_memory_ctx,
+};
+#define NVIDIA_TEGRA_210_NVJPG_FIRMWARE "nvidia/tegra210/nvjpg.bin"
+
+static const struct nvjpg_config nvjpg_t210_config = {
+	.firmware = NVIDIA_TEGRA_210_NVJPG_FIRMWARE,
+	.version = 0x21,
+};
+
+static const struct of_device_id tegra_nvjpg_of_match[] = {
+	{ .compatible = "nvidia,tegra210-nvjpg", .data = &nvjpg_t210_config },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, tegra_nvjpg_of_match);
+
+static int nvjpg_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct nvjpg *nvjpg;
+	int err;
+
+	/* inherit DMA mask from host1x parent */
+	err = dma_coerce_mask_and_coherent(dev, *dev->parent->dma_mask);
+	if (err < 0) {
+		dev_err(&pdev->dev, "failed to set DMA mask: %d\n", err);
+		return err;
+	}
+
+	nvjpg = devm_kzalloc(dev, sizeof(*nvjpg), GFP_KERNEL);
+	if (!nvjpg)
+		return -ENOMEM;
+
+	nvjpg->config = of_device_get_match_data(dev);
+
+	nvjpg->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(nvjpg->regs))
+		return PTR_ERR(nvjpg->regs);
+
+	nvjpg->clk = devm_clk_get(dev, "nvjpg");
+	if (IS_ERR(nvjpg->clk)) {
+		dev_err(&pdev->dev, "failed to get clock\n");
+		return PTR_ERR(nvjpg->clk);
+	}
+
+	err = clk_set_rate(nvjpg->clk, ULONG_MAX);
+	if (err < 0) {
+		dev_err(&pdev->dev, "failed to set clock rate\n");
+		return err;
+	}
+
+	nvjpg->falcon.dev = dev;
+	nvjpg->falcon.regs = nvjpg->regs;
+
+	err = falcon_init(&nvjpg->falcon);
+	if (err < 0)
+		return err;
+
+	platform_set_drvdata(pdev, nvjpg);
+
+	INIT_LIST_HEAD(&nvjpg->client.base.list);
+	nvjpg->client.base.ops = &nvjpg_client_ops;
+	nvjpg->client.base.dev = dev;
+	nvjpg->client.base.class = HOST1X_CLASS_NVJPG;
+	nvjpg->dev = dev;
+
+	INIT_LIST_HEAD(&nvjpg->client.list);
+	nvjpg->client.version = nvjpg->config->version;
+	nvjpg->client.ops = &nvjpg_ops;
+
+	err = host1x_client_register(&nvjpg->client.base);
+	if (err < 0) {
+		dev_err(dev, "failed to register host1x client: %d\n", err);
+		goto exit_falcon;
+	}
+
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_set_autosuspend_delay(dev, 500);
+	devm_pm_runtime_enable(dev);
+
+	return 0;
+
+exit_falcon:
+	falcon_exit(&nvjpg->falcon);
+
+	return err;
+}
+
+static void nvjpg_remove(struct platform_device *pdev)
+{
+	struct nvjpg *nvjpg = platform_get_drvdata(pdev);
+
+	host1x_client_unregister(&nvjpg->client.base);
+	falcon_exit(&nvjpg->falcon);
+}
+
+static const struct dev_pm_ops nvjpg_pm_ops = {
+	RUNTIME_PM_OPS(nvjpg_runtime_suspend, nvjpg_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
+};
+
+struct platform_driver tegra_nvjpg_driver = {
+	.driver = {
+		.name = "tegra-nvjpg",
+		.of_match_table = tegra_nvjpg_of_match,
+		.pm = &nvjpg_pm_ops
+	},
+	.probe = nvjpg_probe,
+	.remove = nvjpg_remove,
+};
+
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
+MODULE_FIRMWARE(NVIDIA_TEGRA_210_NVJPG_FIRMWARE);
+#endif

-- 
2.50.0

