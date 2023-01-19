Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9247C004D4
	for <linux-tegra@archiver.kernel.org>; Thu, 19 Jan 2023 13:39:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231266AbjASNjN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 19 Jan 2023 08:39:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229862AbjASNjM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 19 Jan 2023 08:39:12 -0500
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 866454A235;
        Thu, 19 Jan 2023 05:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
        s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=Jivjnyq0RsdNk+dfRSFWoVxnKfMC/ohHGj4x1noVlTU=; b=do5zi8kPg3+yz9iO2RNEZC5DRy
        q/6ZMZUVkRDm4OHyhEj/qGq7TUlFMxFb0ksOE03w24Sp3iOm/t1a6FEm3gjjoiGOSHT/nQKVnuHVQ
        9C7Urg+WgbY1OBj9I33b1ynOFCujBEYj2eMN4cIne5DASGeLbMZWOiAiR5p7in5/zFvnbIWVfKi1d
        24FSl0KB0iY807oWSpswDjsRlNa3aNyoG1gbkT/qVjUWpJ3PcSipFL2iuFdwe12V7zfhLvAUhS3Kv
        1Y3Xp2DaDoPI2amiicXH4Jt121wEuPY1nQaAWNhbAFWAjqbdGexrPfcqgxE62cAOp9jTF0vj4G02o
        us5N0HWg==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <cyndis@kapsi.fi>)
        id 1pIV8G-0016bd-MF; Thu, 19 Jan 2023 15:39:08 +0200
From:   Mikko Perttunen <cyndis@kapsi.fi>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     Mikko Perttunen <mperttunen@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] gpu: host1x: Fix mask for syncpoint increment register
Date:   Thu, 19 Jan 2023 15:38:59 +0200
Message-Id: <20230119133901.1892413-2-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119133901.1892413-1-cyndis@kapsi.fi>
References: <20230119133901.1892413-1-cyndis@kapsi.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Mikko Perttunen <mperttunen@nvidia.com>

On Tegra186+, the syncpoint ID has 10 bits of space. To allow
using more than 256 syncpoints, fix the mask.

Fixes: 9abdd497cd0a ("gpu: host1x: Tegra234 device data and headers")
Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/hw/hw_host1x06_uclass.h | 2 +-
 drivers/gpu/host1x/hw/hw_host1x07_uclass.h | 2 +-
 drivers/gpu/host1x/hw/hw_host1x08_uclass.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/host1x/hw/hw_host1x06_uclass.h b/drivers/gpu/host1x/hw/hw_host1x06_uclass.h
index 5f831438d19b..50c32de452fb 100644
--- a/drivers/gpu/host1x/hw/hw_host1x06_uclass.h
+++ b/drivers/gpu/host1x/hw/hw_host1x06_uclass.h
@@ -53,7 +53,7 @@ static inline u32 host1x_uclass_incr_syncpt_cond_f(u32 v)
 	host1x_uclass_incr_syncpt_cond_f(v)
 static inline u32 host1x_uclass_incr_syncpt_indx_f(u32 v)
 {
-	return (v & 0xff) << 0;
+	return (v & 0x3ff) << 0;
 }
 #define HOST1X_UCLASS_INCR_SYNCPT_INDX_F(v) \
 	host1x_uclass_incr_syncpt_indx_f(v)
diff --git a/drivers/gpu/host1x/hw/hw_host1x07_uclass.h b/drivers/gpu/host1x/hw/hw_host1x07_uclass.h
index 8cd2ef087d5d..887b878f92f7 100644
--- a/drivers/gpu/host1x/hw/hw_host1x07_uclass.h
+++ b/drivers/gpu/host1x/hw/hw_host1x07_uclass.h
@@ -53,7 +53,7 @@ static inline u32 host1x_uclass_incr_syncpt_cond_f(u32 v)
 	host1x_uclass_incr_syncpt_cond_f(v)
 static inline u32 host1x_uclass_incr_syncpt_indx_f(u32 v)
 {
-	return (v & 0xff) << 0;
+	return (v & 0x3ff) << 0;
 }
 #define HOST1X_UCLASS_INCR_SYNCPT_INDX_F(v) \
 	host1x_uclass_incr_syncpt_indx_f(v)
diff --git a/drivers/gpu/host1x/hw/hw_host1x08_uclass.h b/drivers/gpu/host1x/hw/hw_host1x08_uclass.h
index 724cccd71aa1..4fb1d090edae 100644
--- a/drivers/gpu/host1x/hw/hw_host1x08_uclass.h
+++ b/drivers/gpu/host1x/hw/hw_host1x08_uclass.h
@@ -53,7 +53,7 @@ static inline u32 host1x_uclass_incr_syncpt_cond_f(u32 v)
 	host1x_uclass_incr_syncpt_cond_f(v)
 static inline u32 host1x_uclass_incr_syncpt_indx_f(u32 v)
 {
-	return (v & 0xff) << 0;
+	return (v & 0x3ff) << 0;
 }
 #define HOST1X_UCLASS_INCR_SYNCPT_INDX_F(v) \
 	host1x_uclass_incr_syncpt_indx_f(v)
-- 
2.39.0

