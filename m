Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AED1C6FA82
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Sep 2022 08:14:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231282AbiITIOv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 20 Sep 2022 04:14:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231493AbiITINx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 20 Sep 2022 04:13:53 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F253A65649;
        Tue, 20 Sep 2022 01:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
        s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=WPTT/lWY1pF8BiH6WPVmkViAQEe1BgeLFBLcqSEATp4=; b=H++TXQmtE2t0ptLaSOFUm95VbJ
        VTk3Ig1ZJWWLEMBTADmw1DhetRehVoS05VnPWR/uqTcNEvKubr9pP07FWJe0L4r2/O9MNv34gfX7T
        yJzZrM+6goCbyeb7RuKX7d3V7N/SpkN9Rv+dlmfk+H2OGVTCkiBmIfVYohtpZxbFI6y4bcf3TCFy/
        S/rzpYGWo3LBslX4u/6xeormxeJGYxihtgJXMFstuU9HPqMxSxOK1kvaep+DK74+oqhNfJX9Z5hqK
        GE+ombawb4jc43cdzIkl9Bo+vMJ1w4Pw6pHYQ/fl1h+Q9ueXF0zmO5g61lb0Wmub+ujFyU/W0YxSi
        x5QZwI/w==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <cyndis@kapsi.fi>)
        id 1oaYMp-0017q3-5w; Tue, 20 Sep 2022 11:12:31 +0300
From:   Mikko Perttunen <cyndis@kapsi.fi>
To:     Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     Mikko Perttunen <mperttunen@nvidia.com>,
        Ashish Mhetre <amhetre@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/8] gpu: host1x: Add stream ID register data for NVDEC on Tegra234
Date:   Tue, 20 Sep 2022 11:12:00 +0300
Message-Id: <20220920081203.3237744-6-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220920081203.3237744-1-cyndis@kapsi.fi>
References: <20220920081203.3237744-1-cyndis@kapsi.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Mikko Perttunen <mperttunen@nvidia.com>

Add entries for NVDEC to the Tegra234 SID table.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/dev.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index 0cd3f97e7e49..d6b4614f968f 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -225,6 +225,18 @@ static const struct host1x_sid_entry tegra234_sid_table[] = {
 		.offset = 0x34,
 		.limit = 0x34
 	},
+	{
+		/* NVDEC channel */
+		.base = 0x17c8,
+		.offset = 0x30,
+		.limit = 0x30,
+	},
+	{
+		/* NVDEC MMIO */
+		.base = 0x1698,
+		.offset = 0x34,
+		.limit = 0x34,
+	},
 };
 
 static const struct host1x_info host1x08_info = {
-- 
2.37.0

