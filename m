Return-Path: <SRS0=4JQ8=EL=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AD5BC388F7
	for <linux-tegra@archiver.kernel.org>; Thu,  5 Nov 2020 10:25:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BFEDC20A8B
	for <linux-tegra@archiver.kernel.org>; Thu,  5 Nov 2020 10:25:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="ec0vNVfB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730060AbgKEKZK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 5 Nov 2020 05:25:10 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:5888 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729944AbgKEKY5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 5 Nov 2020 05:24:57 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fa3d2f80000>; Thu, 05 Nov 2020 02:24:56 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 5 Nov
 2020 10:24:57 +0000
Received: from audio.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Thu, 5 Nov 2020 10:24:54 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <robh+dt@kernel.org>, <devicetree@vger.kernel.org>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <vkoul@kernel.org>, <tglx@linutronix.de>, <jason@lakedaemon.net>,
        <maz@kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH 3/4] dt-bindings: interrupt-controller: arm,gic: Update Tegra compatibles
Date:   Thu, 5 Nov 2020 15:54:05 +0530
Message-ID: <1604571846-14037-4-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604571846-14037-1-git-send-email-spujar@nvidia.com>
References: <1604571846-14037-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1604571896; bh=7YHCL0OJsQAfx9Zv1PlhR6NVOh4W6JdOVDVqiYu2yhY=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Type;
        b=ec0vNVfBqk3IN5H1A1hOSyXF8mO3JQBOzAtEyhTzTOcx2gChLPYEk5C20/KZd8XOD
         9HHDGU6yFzXrcXWK65S4lWeMtNdl1U0iH0l1ARrJeKgkyu0uw8iRApM2r74OcMS50J
         UGpAn3l9XOTDNVsS/N66OQsufzi2JgwbLD6x8rBEf1L6U7kg60mFfJ9NuK5zyjLbdF
         HkpGjzelhQtdOujNALTT1I5awMh0Pnz5NLHydQIwCDp5E/iAVketY36Pf15Tg1jmWq
         oklkOd66+h2vfBSeGPk82vrBWCz2jD16NY8omNQ6smUs6ppG3AR4QWGyqR17MfI2kq
         jw2XhNrqHKJsA==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Update Tegra compatibles to support newer Tegra chips and required
combinations.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 .../devicetree/bindings/interrupt-controller/arm,gic.yaml        | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml
index 0688996..614018f 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml
@@ -35,7 +35,6 @@ properties:
               - arm,gic-400
               - arm,pl390
               - arm,tc11mp-gic
-              - nvidia,tegra210-agic
               - qcom,msm-8660-qgic
               - qcom,msm-qgic2
 
@@ -53,6 +52,14 @@ properties:
           - const: brcm,brahma-b15-gic
           - const: arm,cortex-a15-gic
 
+      - oneOf:
+        - const: nvidia,tegra210-agic
+        - items:
+          - enum:
+            - nvidia,tegra186-agic
+            - nvidia,tegra194-agic
+          - const: nvidia,tegra210-agic
+
   interrupt-controller: true
 
   "#address-cells":
-- 
2.7.4

