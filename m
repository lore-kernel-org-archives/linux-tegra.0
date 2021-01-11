Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCEC3C43333
	for <linux-tegra@archiver.kernel.org>; Mon, 11 Jan 2021 13:02:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B49F5225AB
	for <linux-tegra@archiver.kernel.org>; Mon, 11 Jan 2021 13:02:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728858AbhAKNBy (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 11 Jan 2021 08:01:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728847AbhAKNBv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 11 Jan 2021 08:01:51 -0500
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E073C0617AA
        for <linux-tegra@vger.kernel.org>; Mon, 11 Jan 2021 05:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=jbdJSmYwsC82f5ZdQGACRHu3MKI2AueVjUc0roDaM1k=; b=nnNgkyMZoZOMV2T15W84MhS5ff
        6sQSswIKECMd7mGGbUlwkxWnX5HFgQyR6MH1DxLGXRWxl8MtkddF4KHQQTHQ6UF6LSXBTZdiUIC1O
        XadeaKyqRN+M85EpXrX+bX0cayhVlLho1xvY9DaZRs+aSerZFfYlK8E7ptMY5PO++n9uudaoJ6JOh
        Is/6Li17bNIuD+QMOhpxtiod+V0AtI1Fhcb8j4qQMk92pmocx3kYqR+/ku08mDGxKsobtad4IBTQj
        uyyjv5erADFz7QlmW8DsAdYKTKKpGvP2frVFglhSiigz8JtPf+peQQWIefHGq2ewGi4PfP1u2t+3K
        UhB12rOg==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1kywo7-0002tl-FA; Mon, 11 Jan 2021 15:00:27 +0200
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
        airlied@linux.ie, daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v5 16/21] drm/tegra: Boot VIC during runtime PM resume
Date:   Mon, 11 Jan 2021 15:00:14 +0200
Message-Id: <20210111130019.3515669-17-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210111130019.3515669-1-mperttunen@nvidia.com>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

With the new UAPI implementation, engines are powered on and off
when there are active jobs, and the core code handles channel
allocation. To accommodate that, boot the engine as part of
runtime PM instead of using the open_channel callback, which is
not used by the new submit path.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
v3:
* runtime_get/put is now done directly from submit path, so no
  callbacks are added
* Reworded.
---
 drivers/gpu/drm/tegra/vic.c | 114 +++++++++++++++++-------------------
 1 file changed, 53 insertions(+), 61 deletions(-)

diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index cb476da59adc..5d2ad125dca3 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -29,7 +29,6 @@ struct vic_config {
 
 struct vic {
 	struct falcon falcon;
-	bool booted;
 
 	void __iomem *regs;
 	struct tegra_drm_client client;
@@ -52,48 +51,6 @@ static void vic_writel(struct vic *vic, u32 value, unsigned int offset)
 	writel(value, vic->regs + offset);
 }
 
-static int vic_runtime_resume(struct device *dev)
-{
-	struct vic *vic = dev_get_drvdata(dev);
-	int err;
-
-	err = clk_prepare_enable(vic->clk);
-	if (err < 0)
-		return err;
-
-	usleep_range(10, 20);
-
-	err = reset_control_deassert(vic->rst);
-	if (err < 0)
-		goto disable;
-
-	usleep_range(10, 20);
-
-	return 0;
-
-disable:
-	clk_disable_unprepare(vic->clk);
-	return err;
-}
-
-static int vic_runtime_suspend(struct device *dev)
-{
-	struct vic *vic = dev_get_drvdata(dev);
-	int err;
-
-	err = reset_control_assert(vic->rst);
-	if (err < 0)
-		return err;
-
-	usleep_range(2000, 4000);
-
-	clk_disable_unprepare(vic->clk);
-
-	vic->booted = false;
-
-	return 0;
-}
-
 static int vic_boot(struct vic *vic)
 {
 #ifdef CONFIG_IOMMU_API
@@ -103,9 +60,6 @@ static int vic_boot(struct vic *vic)
 	void *hdr;
 	int err = 0;
 
-	if (vic->booted)
-		return 0;
-
 #ifdef CONFIG_IOMMU_API
 	if (vic->config->supports_sid && spec) {
 		u32 value;
@@ -153,8 +107,6 @@ static int vic_boot(struct vic *vic)
 		return err;
 	}
 
-	vic->booted = true;
-
 	return 0;
 }
 
@@ -308,35 +260,76 @@ static int vic_load_firmware(struct vic *vic)
 	return err;
 }
 
-static int vic_open_channel(struct tegra_drm_client *client,
-			    struct tegra_drm_context *context)
+
+static int vic_runtime_resume(struct device *dev)
 {
-	struct vic *vic = to_vic(client);
+	struct vic *vic = dev_get_drvdata(dev);
 	int err;
 
-	err = pm_runtime_get_sync(vic->dev);
+	err = clk_prepare_enable(vic->clk);
 	if (err < 0)
 		return err;
 
+	usleep_range(10, 20);
+
+	err = reset_control_deassert(vic->rst);
+	if (err < 0)
+		goto disable;
+
+	usleep_range(10, 20);
+
 	err = vic_load_firmware(vic);
 	if (err < 0)
-		goto rpm_put;
+		goto assert;
 
 	err = vic_boot(vic);
 	if (err < 0)
-		goto rpm_put;
+		goto assert;
+
+	return 0;
+
+assert:
+	reset_control_assert(vic->rst);
+disable:
+	clk_disable_unprepare(vic->clk);
+	return err;
+}
+
+static int vic_runtime_suspend(struct device *dev)
+{
+	struct vic *vic = dev_get_drvdata(dev);
+	int err;
+
+	err = reset_control_assert(vic->rst);
+	if (err < 0)
+		return err;
+
+	usleep_range(2000, 4000);
+
+	clk_disable_unprepare(vic->clk);
+
+	return 0;
+}
+
+static int vic_open_channel(struct tegra_drm_client *client,
+			    struct tegra_drm_context *context)
+{
+	struct vic *vic = to_vic(client);
+	int err;
+
+	err = pm_runtime_get_sync(vic->dev);
+	if (err < 0) {
+		pm_runtime_put(vic->dev);
+		return err;
+	}
 
 	context->channel = host1x_channel_get(vic->channel);
 	if (!context->channel) {
-		err = -ENOMEM;
-		goto rpm_put;
+		pm_runtime_put(vic->dev);
+		return -ENOMEM;
 	}
 
 	return 0;
-
-rpm_put:
-	pm_runtime_put(vic->dev);
-	return err;
 }
 
 static void vic_close_channel(struct tegra_drm_context *context)
@@ -344,7 +337,6 @@ static void vic_close_channel(struct tegra_drm_context *context)
 	struct vic *vic = to_vic(context->client);
 
 	host1x_channel_put(context->channel);
-
 	pm_runtime_put(vic->dev);
 }
 
-- 
2.30.0

