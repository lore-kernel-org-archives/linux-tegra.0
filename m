Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45F09C433F5
	for <linux-tegra@archiver.kernel.org>; Wed, 29 Sep 2021 20:03:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 254A76152B
	for <linux-tegra@archiver.kernel.org>; Wed, 29 Sep 2021 20:03:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346267AbhI2UFR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 29 Sep 2021 16:05:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346219AbhI2UFQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 29 Sep 2021 16:05:16 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 191E5C06161C;
        Wed, 29 Sep 2021 13:03:35 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id m3so15340216lfu.2;
        Wed, 29 Sep 2021 13:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z4yxKSjcHMOhHZXOb7ea2h6XciDifOHim7fZiJyl6a0=;
        b=V9b9VpuY/A0npyPextFVOTJ+Pu0aQ4mK0Z4HfonJxztesIQ4F4FoTOlMkcrXeWGoe6
         D5kfYQ01fK/CLV9oJTeFLwpbuEZfLXjs7oYCs9POTAv7BvoPS2XPYDaxFtxC6AD6dv+V
         b4jtvC3Um5ces/+5hXxFtd1URDV32vDylsDdlZHVZB7U37S7v9d7PmLfiAAAh+tnhdo4
         R5QTXMWWz3KTiSqPV9IkCRelJNMDThTme+m8UzFe5muDF8N/RZMb3mQfhIaIlSzcOGAQ
         PT4g1Fg/w6nQutY9kQ2kC2IKFHBtArnLX55SP6dPAZcxfnCylcVy+v7nG4pX7ZCBc4vU
         V5ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z4yxKSjcHMOhHZXOb7ea2h6XciDifOHim7fZiJyl6a0=;
        b=HrUA38Z/y92WWHQ3uTxjGc48TOPhhl5MlAbJZqzNLam5alqVNgvsNPkwMI+M0I9gZS
         3sSM0h0ttDU2vWKWuzyusxHTayceJtcgXuuTQlRMGV3ZgZZ7L3tKXq/P+7OZ2x82EzjJ
         pkwWwCzmTGuC2clmU1I4xEO1rsU1ch17vjrDqeVRGuYep5c2ZfF/fUk688cDjgfOruyi
         HmE41TImwfIU/nHDFABsv9DTo0lg6LbZD12XeHqlMchoTMewlQvVo/+olSki45R8NcGV
         surg+T00nz2o/D95do3HwLeiDSGEmLyLBsjsYRXR9m9BffuMvJB2uXIETVj6tSZ8ep0R
         nbww==
X-Gm-Message-State: AOAM533vLJSY2NgWPe3x2LVVRii7hoDT/fKjkTveHiA6BghMhyc/6O+h
        dFfa3eOf/80nwJ9QMIWeNi8=
X-Google-Smtp-Source: ABdhPJz6DGi5j8+yKXPmLVc8U7ZO7ykzWDDX+25fzT/p9NMsn7/bDf91gb3NSG6qYLatq/wfMq4Deg==
X-Received: by 2002:a05:651c:20b:: with SMTP id y11mr1864342ljn.463.1632945813472;
        Wed, 29 Sep 2021 13:03:33 -0700 (PDT)
Received: from localhost.localdomain (46-138-80-108.dynamic.spd-mgts.ru. [46.138.80.108])
        by smtp.gmail.com with ESMTPSA id u7sm99578lft.79.2021.09.29.13.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 13:03:33 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: memory: tegra20: emc: Document optional LPDDR properties
Date:   Wed, 29 Sep 2021 23:03:04 +0300
Message-Id: <20210929200305.4245-2-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210929200305.4245-1-digetx@gmail.com>
References: <20210929200305.4245-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Some Tegra20 boards don't use RAM code for the memory chip identification
and the identity information should read out from LPDDR chip in this case.
Document new optional generic LPDDR properties that will be used for the
memory chip identification if RAM code isn't provided.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../nvidia,tegra20-emc.yaml                   | 43 +++++++++++++++++--
 1 file changed, 40 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.yaml
index cac6842dc8f1..6d01b1bf6304 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.yaml
@@ -158,6 +158,46 @@ patternProperties:
         description:
           Value of RAM_CODE this timing set is used for.
 
+      jedec,lpddr-manufacturer-id:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Unique manufacturer ID of SDRAM chip this timing set is used for.
+          See MR5 description in JEDEC LPDDR2 specification (JESD209-2).
+
+      jedec,lpddr-revision-id1:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Revision 1 value of SDRAM chip this timing set is used for.
+          See MR6 description in chip vendor specification.
+
+      jedec,lpddr-revision-id2:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Revision 2 value of SDRAM chip this timing set is used for.
+          See MR7 description in chip vendor specification.
+
+      jedec,lpddr-density-mbits:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Density in megabits of SDRAM chip this timing set is used for.
+          See MR8 description in JEDEC LPDDR2 specification.
+
+      jedec,lpddr-io-width-bits:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          IO bus width in bits of SDRAM chip this timing set is used for.
+          See MR8 description in JEDEC LPDDR2 specification.
+
+      jedec,lpddr-type:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          LPDDR type which corresponds to a number of words SDRAM pre-fetches
+          per column request that this timing set is used for.
+          See MR8 description in JEDEC LPDDR2 specification.
+        enum:
+          - 4 # S4 (4 words prefetch architecture)
+          - 2 # S2 (2 words prefetch architecture)
+
       "#address-cells":
         const: 1
 
@@ -168,9 +208,6 @@ patternProperties:
       "^emc-table@[0-9]+$":
         $ref: "#/$defs/emc-table"
 
-    required:
-      - nvidia,ram-code
-
     additionalProperties: false
 
 required:
-- 
2.32.0

