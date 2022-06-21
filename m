Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DEC0CCA48B
	for <linux-tegra@archiver.kernel.org>; Tue, 21 Jun 2022 15:11:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352470AbiFUPLB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 21 Jun 2022 11:11:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351771AbiFUPKx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 21 Jun 2022 11:10:53 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 603E42A425;
        Tue, 21 Jun 2022 08:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
        s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=ksIHmlKSMU37+Zo3znbjONqVsnNwDJ3NzqXq/aV3oCA=; b=au5zbtdn7wKZPe2dJRJ/gZlMy1
        3z17b4S6Z4+f1cD4Fz/zl6QYb6PTVjVuikWuLBy8hiSzgtKiFT8nGGYUJV7WrizuyeamPl8Sot5G7
        iuHfQZpDx5vAFZj5zVzgExGEHe5BEFcbSmpWmUxqdy2wl3oj50aLfQnmccc6nZhbIgm5wDxgcZyjk
        UKHX/hiBQd7dsI1vPfb1JpjiJcYkD3IozU7IRYUdJq0zE04OoRONYEHaVORoKphS2aRseSLKEp3lL
        rxPKLPFF5zd8MUtsuf5UnF6QdiJSnFbJPgPvES9rSmK9I/idDVbFq340xixydZ5tpXWj0Huo65GyV
        Zr/ZIL2w==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <cyndis@kapsi.fi>)
        id 1o3fWU-00Ea3F-14; Tue, 21 Jun 2022 18:10:34 +0300
From:   Mikko Perttunen <cyndis@kapsi.fi>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, robh+dt@kernel.org,
        krzysztof.kozlowski@canonical.com
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v6 03/10] dt-bindings: host1x: Add iommu-map property
Date:   Tue, 21 Jun 2022 18:10:15 +0300
Message-Id: <20220621151022.1416300-4-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621151022.1416300-1-cyndis@kapsi.fi>
References: <20220621151022.1416300-1-cyndis@kapsi.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Mikko Perttunen <mperttunen@nvidia.com>

Add schema information for specifying context stream IDs. This uses
the standard iommu-map property.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
Reviewed-by: Robin Murphy <robin.murphy@arm.com>
Acked-by: Rob Herring <robh@kernel.org>
---
v3:
* New patch
v4:
* Remove memory-contexts subnode.
---
 .../bindings/display/tegra/nvidia,tegra20-host1x.yaml        | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
index 4fd513efb0f7..0adeb03b9e3a 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
@@ -144,6 +144,11 @@ allOf:
         reset-names:
           maxItems: 1
 
+        iommu-map:
+          description: Specification of stream IDs available for memory context device
+            use. Should be a mapping of IDs 0..n to IOMMU entries corresponding to
+            usable stream IDs.
+
       required:
         - reg-names
 
-- 
2.36.1

