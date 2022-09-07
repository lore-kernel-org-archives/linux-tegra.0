Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B179C6FA83
	for <linux-tegra@archiver.kernel.org>; Wed,  7 Sep 2022 08:41:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229959AbiIGIlW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 7 Sep 2022 04:41:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbiIGIlT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 7 Sep 2022 04:41:19 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CDFF7756D;
        Wed,  7 Sep 2022 01:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
        s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=rYp//Jg1lyxpKWkb291uTJu2CIqUef18RIn6yGFAgCg=; b=sk0s1bJUkmVcTL7zsheAfsjCAS
        J9oofWFE3mABrjS5FTMsVKaWtpfSKcCK2MVUpK487L2IE0mHYF5JVKaGUQNoOpMPT3roXExSJzFCF
        TmgRxT+lrhMu5tw94PZqYpzpCpPIIi/h+pwvxmSPAE08a7MfMhi3QnsiJ6mIgKZpFyc4FZGufq1t/
        i66h6lOnzBYTlM75b3MMYa6q++R1TGd28qL+s7gZ3vh35RY4MPYm5vV3u0tOgsErHndX9WAGXt4NY
        YpY7lWMWH7DwGLNR0e7nsz31IBLfBDCD0sHfmc4mTIZXSN8F/mEgdmsPpvVwEv3yRb1kECm/dfCRD
        FPNdnWQQ==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <cyndis@kapsi.fi>)
        id 1oVqaE-00DbXj-NQ; Wed, 07 Sep 2022 11:38:54 +0300
From:   Mikko Perttunen <cyndis@kapsi.fi>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     Mikko Perttunen <mperttunen@nvidia.com>,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] gpu: host1x: Select context device based on attached IOMMU
Date:   Wed,  7 Sep 2022 11:38:42 +0300
Message-Id: <20220907083844.2486805-2-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220907083844.2486805-1-cyndis@kapsi.fi>
References: <20220907083844.2486805-1-cyndis@kapsi.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Mikko Perttunen <mperttunen@nvidia.com>

On Tegra234, engines that are programmed through Host1x channels can
be attached to either the NISO0 or NISO1 SMMU. Because of that, when
selecting a context device to use with an engine, we need to select
one that is also attached to the same SMMU.

Add a parameter to host1x_memory_context_alloc to specify which device
we are allocating a context for, and use it to pick an appropriate
context device.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/drm/tegra/uapi.c | 2 +-
 drivers/gpu/host1x/context.c | 5 +++++
 include/linux/host1x.h       | 1 +
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/uapi.c b/drivers/gpu/drm/tegra/uapi.c
index a98239cb0e29..5adab6b22916 100644
--- a/drivers/gpu/drm/tegra/uapi.c
+++ b/drivers/gpu/drm/tegra/uapi.c
@@ -116,7 +116,7 @@ int tegra_drm_ioctl_channel_open(struct drm_device *drm, void *data, struct drm_
 
 		if (supported)
 			context->memory_context = host1x_memory_context_alloc(
-				host, get_task_pid(current, PIDTYPE_TGID));
+				host, client->base.dev, get_task_pid(current, PIDTYPE_TGID));
 
 		if (IS_ERR(context->memory_context)) {
 			if (PTR_ERR(context->memory_context) != -EOPNOTSUPP) {
diff --git a/drivers/gpu/host1x/context.c b/drivers/gpu/host1x/context.c
index b08cf11f9a66..8d6447cdd882 100644
--- a/drivers/gpu/host1x/context.c
+++ b/drivers/gpu/host1x/context.c
@@ -104,6 +104,7 @@ void host1x_memory_context_list_free(struct host1x_memory_context_list *cdl)
 }
 
 struct host1x_memory_context *host1x_memory_context_alloc(struct host1x *host1x,
+							  struct device *dev,
 							  struct pid *pid)
 {
 	struct host1x_memory_context_list *cdl = &host1x->context_list;
@@ -118,6 +119,10 @@ struct host1x_memory_context *host1x_memory_context_alloc(struct host1x *host1x,
 	for (i = 0; i < cdl->len; i++) {
 		struct host1x_memory_context *cd = &cdl->devs[i];
 
+		if (cd->dev.iommu->iommu_dev != dev->iommu->iommu_dev) {
+			continue;
+		}
+
 		if (cd->owner == pid) {
 			refcount_inc(&cd->ref);
 			mutex_unlock(&cdl->lock);
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index cb2100d9b0ff..ef05de1f4f1e 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -469,6 +469,7 @@ struct host1x_memory_context {
 
 #ifdef CONFIG_IOMMU_API
 struct host1x_memory_context *host1x_memory_context_alloc(struct host1x *host1x,
+							  struct device *dev,
 							  struct pid *pid);
 void host1x_memory_context_get(struct host1x_memory_context *cd);
 void host1x_memory_context_put(struct host1x_memory_context *cd);
-- 
2.37.0

