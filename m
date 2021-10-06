Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78E4DC433F5
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Oct 2021 22:49:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6161960FF2
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Oct 2021 22:49:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239872AbhJFWvO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 6 Oct 2021 18:51:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239905AbhJFWtr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 6 Oct 2021 18:49:47 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32EBDC061746;
        Wed,  6 Oct 2021 15:47:55 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id cv2so3001499qvb.5;
        Wed, 06 Oct 2021 15:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZazjXyZEVxAOGCWfu+WjAJm1Kzn5mq9JVmnxHrZ+lKg=;
        b=IMcjp4DCz/OrEO0xq3JWOgCvRsIKoJb8IzqJipjUr0GkNYJVw7Bh5wOuPwl9zJvmk6
         4kQWEXDP0tSbradDRYVGSQVRNGALlyx4T7npK1q6tTbBVcE/aKY7t53SP94u+xkcbAJk
         DEE3jlAANZ/uoZMQfWZVilt1FB4wjLy5qyMha/U+PFjMvTJ+CPrkWzgiw9GaxrtNlGrd
         xNmAuZfYgf3VWJLwWvhpxShB1lWJzXctapTOHBHT/PO6mdoDHaLo5zoV/VSAD2GV9ROe
         jkqhL6wOju/rmERcg3HenDa1P2JXybgsREqK1lmV+TxF7mYnWoSRZaxtHWKFjK+lqZ+g
         RXIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZazjXyZEVxAOGCWfu+WjAJm1Kzn5mq9JVmnxHrZ+lKg=;
        b=NpBkOl6P6Z5nRp0kseHvQAkFlK0bpivZaYHkoOZKr2tebmL0C9fTJCn6CoaE6D4zFR
         8EGAx9Jne4P7AhwNpZnJIif4od+EUlPmK2tLSvMgAnUSQcH2acQUPbfccHiQ6XrTj44p
         rLVXa4PRYycxPoQ3YjPXXWWRhgUYbXAYvqdsRKcwNC02xJOrYdVLK1GtXLz+1xhTWVLt
         DcWp65kEKPPYGYQMadlgC8BHi4k6MggZHi1eyDN2uJ0A4TCIy3up5LCfiTTNcnHiXqHL
         SBrp3FyhQNCRQSAzwQMiMrKXRlYH9qdIhxuyTW9URjsdqt2FZy4HKClxu4lEbHdvU8OS
         r67g==
X-Gm-Message-State: AOAM533ysJ0u8XCntc2pvg6sIMZMQKcL86nugu9u8cqDSI0HjGdMpaAl
        M/b+jOAzT1Yyfq7mei59k+FcU6+hXn4=
X-Google-Smtp-Source: ABdhPJzTpHDErj97IOCUDBGV+rjoxGnAt26phu4h/BjOa9n0QkRPeMcxbPgQ0lEpcsRdU82WVtWvNg==
X-Received: by 2002:a0c:de0e:: with SMTP id t14mr702420qvk.41.1633560474431;
        Wed, 06 Oct 2021 15:47:54 -0700 (PDT)
Received: from localhost.localdomain (79-139-163-57.dynamic.spd-mgts.ru. [79.139.163.57])
        by smtp.gmail.com with ESMTPSA id n11sm14738166qtk.92.2021.10.06.15.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 15:47:54 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v5 7/9] dt-bindings: memory: tegra20: emc: Document new LPDDR2 sub-node
Date:   Thu,  7 Oct 2021 01:46:57 +0300
Message-Id: <20211006224659.21434-8-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211006224659.21434-1-digetx@gmail.com>
References: <20211006224659.21434-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Some Tegra20 boards don't have RAM code stored in NVMEM, which is used for
the memory chip identification and the identity information should be read
out from LPDDR2 chip in this case. Document new sub-node containing generic
LPDDR2 properties that will be used for the memory chip identification if
RAM code isn't available. The identification is done by reading out memory
configuration values from generic LPDDR2 mode registers of SDRAM chip and
comparing them with the values of device-tree 'lpddr2' sub-node.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../nvidia,tegra20-emc.yaml                   | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.yaml
index cac6842dc8f1..2fa44951cfde 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.yaml
@@ -164,12 +164,20 @@ patternProperties:
       "#size-cells":
         const: 0
 
+      lpddr2:
+        $ref: "ddr/jedec,lpddr2.yaml#"
+        type: object
+
     patternProperties:
       "^emc-table@[0-9]+$":
         $ref: "#/$defs/emc-table"
 
-    required:
-      - nvidia,ram-code
+    oneOf:
+      - required:
+          - nvidia,ram-code
+
+      - required:
+          - lpddr2
 
     additionalProperties: false
 
@@ -227,4 +235,15 @@ examples:
                         0x00000000 0x00000000 0x00000000 0x00000000>;
             };
         };
+
+        emc-tables@1 {
+            reg = <1>;
+
+            lpddr2 {
+                compatible = "elpida,B8132B2PB-6D-F", "jedec,lpddr2-s4";
+                revision-id1 = <1>;
+                density = <2048>;
+                io-width = <16>;
+            };
+        };
     };
-- 
2.32.0

