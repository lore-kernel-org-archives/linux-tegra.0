Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23D6FC43462
	for <linux-tegra@archiver.kernel.org>; Fri, 23 Apr 2021 16:31:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EBCB16147F
	for <linux-tegra@archiver.kernel.org>; Fri, 23 Apr 2021 16:31:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235830AbhDWQcc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 23 Apr 2021 12:32:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231437AbhDWQcb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 23 Apr 2021 12:32:31 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D587C06174A;
        Fri, 23 Apr 2021 09:31:53 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id v6so73420720ejo.6;
        Fri, 23 Apr 2021 09:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O2SVOROkj7hDFGhnBCRYqhSUkByOx1CiX/oPNVqXG98=;
        b=FECThjuMq9dPQDyOW0X9vcyhSNbsn9dO90LdiAg7uh4P9LCGfocsWbmd9JGVREFsO8
         QRofm2fMa9fyVt0yOq0LXvy8kXQO1f9cL2CAJjhkcASMHCQBQFvmFnx7YhgT2C4Dtnje
         kzzKfoEbOw6xJRV8FOpr2bEIMN65YloznMwGyFs2NCVl1K4nAO4nnYrwvtf8jJJGs1ZL
         W31cvHgopE+qjO7cB8C6pA5LAHrqt8jBHdhph/lFGRPjUnS5uJhg0vPqdFn0ok1WO2+T
         UhYuAbfsCDyJkEESigRINetl6de60QiZWftCzZ/vakYMrsxAcO2Whk20WIH7/iKHe3NC
         aX8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O2SVOROkj7hDFGhnBCRYqhSUkByOx1CiX/oPNVqXG98=;
        b=Tt0oBsfKR7IW7R5Quu6a9oOkKB/MGe2CiMib36bAriK5IVBBQvJSaPDPusPzDEvXlm
         vLQcr6WlxLX7MC/KHYPdeIT2iBve0b7bj9PeGF5y+uVK1cXmCO1jkGpCLo+TN36WHi9B
         /aLGcMlMbjTDe4Om174aCW03JLOHxtlHiGhj935GpOX9HGx9O4+/Mv0WQSbjtByGmHDk
         1DJKOslxnW0PwYqUGM4RwgoqwFr39TjBN1Ym8+5EX/uDEVUUXAicHcn9hLATS1AVw+u/
         RFer4X499a9RM1sxWFHPux9OKJf6tsdlTnTlwAW6UagU9dWgklrfX+Jb0WAJJn72xTVi
         K7/w==
X-Gm-Message-State: AOAM531QDfESXIssuzSXLjRKXRWY9pHE/S/q92nDLgHvL4Co7X5aikmy
        bKGqPT3/qaMRQMwfQTANfaw=
X-Google-Smtp-Source: ABdhPJz9CNXlmBk9nKzg+Z7xoWbtmbCwYfZUQKFyrJz3hL4dHP4CO2jfhRQ9gxqdpjlqwhZchFQgTw==
X-Received: by 2002:a17:906:eb09:: with SMTP id mb9mr5094852ejb.452.1619195511868;
        Fri, 23 Apr 2021 09:31:51 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id li16sm4252849ejb.101.2021.04.23.09.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 09:31:51 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>, devicetree@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 1/5] dt-bindings: reserved-memory: Document memory region specifier
Date:   Fri, 23 Apr 2021 18:32:30 +0200
Message-Id: <20210423163234.3651547-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210423163234.3651547-1-thierry.reding@gmail.com>
References: <20210423163234.3651547-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Reserved memory region phandle references can be accompanied by a
specifier that provides additional information about how that specific
reference should be treated.

One use-case is to mark a memory region as needing an identity mapping
in the system's IOMMU for the device that references the region. This is
needed for example when the bootloader has set up hardware (such as a
display controller) to actively access a memory region (e.g. a boot
splash screen framebuffer) during boot. The operating system can use the
identity mapping flag from the specifier to make sure an IOMMU identity
mapping is set up for the framebuffer before IOMMU translations are
enabled for the display controller.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../reserved-memory/reserved-memory.txt       | 21 +++++++++++++++++++
 include/dt-bindings/reserved-memory.h         |  8 +++++++
 2 files changed, 29 insertions(+)
 create mode 100644 include/dt-bindings/reserved-memory.h

diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
index e8d3096d922c..e9c2f80b441f 100644
--- a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
+++ b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
@@ -52,6 +52,11 @@ compatible (optional) - standard definition
           be used by an operating system to instantiate the necessary pool
           management subsystem if necessary.
         - vendor specific string in the form <vendor>,[<device>-]<usage>
+#memory-region-cells (optional) -
+    - Defines how many cells are used to form the memory region specifier.
+      The memory region specifier contains additional information on how a
+      reserved memory region referenced by the corresponding phandle will
+      be used in a specific context.
 no-map (optional) - empty property
     - Indicates the operating system must not create a virtual mapping
       of the region as part of its standard mapping of system memory,
@@ -83,6 +88,22 @@ memory-region (optional) - phandle, specifier pairs to children of /reserved-mem
 memory-region-names (optional) - a list of names, one for each corresponding
   entry in the memory-region property
 
+Reserved memory region references can be accompanied by a memory region
+specifier, which provides additional information about how the memory region
+will be used in that specific context. If a reserved memory region does not
+have the #memory-region-cells property, 0 is implied and no information
+besides the phandle is conveyed. For reserved memory regions that contain
+#memory-region-cells = <1>, the following encoding applies if not otherwise
+overridden by the bindings selected by the region's compatible string:
+
+  - bit 0: If set, requests that the region be identity mapped if the system
+    uses an IOMMU for I/O virtual address translations. This is used, for
+    example, when a bootloader has configured a display controller to display
+    a boot splash. Once the OS takes over and enables the IOMMU for the given
+    display controller, the IOMMU may fault if the framebuffer hasn't been
+    mapped to the IOMMU at the address that the display controller tries to
+    access.
+
 Example
 -------
 This example defines 3 contiguous regions are defined for Linux kernel:
diff --git a/include/dt-bindings/reserved-memory.h b/include/dt-bindings/reserved-memory.h
new file mode 100644
index 000000000000..174ca3448342
--- /dev/null
+++ b/include/dt-bindings/reserved-memory.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: (GPL-2.0+ or MIT) */
+
+#ifndef _DT_BINDINGS_RESERVED_MEMORY_H
+#define _DT_BINDINGS_RESERVED_MEMORY_H
+
+#define MEMORY_REGION_IDENTITY_MAPPING 0x1
+
+#endif
-- 
2.30.2

