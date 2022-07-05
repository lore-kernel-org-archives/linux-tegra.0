Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2139AC433EF
	for <linux-tegra@archiver.kernel.org>; Tue,  5 Jul 2022 13:37:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229977AbiGENhg (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 5 Jul 2022 09:37:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231307AbiGENhO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 5 Jul 2022 09:37:14 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0AE474782;
        Tue,  5 Jul 2022 05:58:43 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id fd6so15169358edb.5;
        Tue, 05 Jul 2022 05:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/KFZ7cMq9JU+ArgnFFOioWDlil9QesIzP5/MdIscAXo=;
        b=Py0vxhDTdUr4+MxP647OOnJwClrnNnu90Pd79Y02NW8ZHIZiTv7rHNn/Z+ThujmZW9
         g0WYwIiwfE+htVnBa/fyVdL587u9cXDLC0vIUNRJSth5U5nuPNnqvsPV8owIWnI4UypF
         vvcaZnMdZh+S17Gti6kcnvj4wynbzZ9gpjflsHdGCqR08vruWJp3Mzc5J69KrxShmamh
         07pVeQOtmLgrdKFUbvlXSsHSolLtmw9r84deR3Du0qinOJvQTpqFR/AY3lWsvPSQ7mR5
         4CEQ3Gq3Gqv01hiNcC18jkVqqIripnnkK2Y9NMEG1WjISnoLS07MYL49fI7WhWKUrlnk
         eqXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/KFZ7cMq9JU+ArgnFFOioWDlil9QesIzP5/MdIscAXo=;
        b=kBjlJWk81ND5HepYgUnLcH0wrcZV0u6ByJzuRzoCfQ2uZIRXaJQfBN5JgnDPcRDkzy
         D3OYQpEf4EivNYXWyezjsel6QHyOapvIoT6mR1W+418HuQ+x1gZA4QWBzQxcp5Pl44Pw
         1zQQY1We/rQRJmljFR2zjgy6iOlLRW8g/pvDZAtBkjdPCtfEKyptpfdcWgbWdIcf9nuP
         p/uzw65zUr7I7gTmUIngqT4v6njVHbJy6g65gdi9Eo7WHa5343aI4mbbe2Zrn4/CT89d
         +nMsbfPtF0aKyfE7VT3XCqskoDVbGAPu8ZaHClQSE8eiIzkc8djtP0ofEP4A1ntlrEq/
         vM7Q==
X-Gm-Message-State: AJIora+tCPCtlqTVV93ftyN5rvlvncqUKt+rPniitoLXlQA+Aze4oYlD
        3NBsU0pt+VS7Vp6gTGPj4YE=
X-Google-Smtp-Source: AGRyM1tL7dLUK0tNEdwSBHVbXevA1qu+6i9xsWr/SUwd7OcqQyEtiWItJWgq2Lpy3YPrD0xM44NgDQ==
X-Received: by 2002:a05:6402:149:b0:431:7dde:9b59 with SMTP id s9-20020a056402014900b004317dde9b59mr46118082edu.339.1657025921510;
        Tue, 05 Jul 2022 05:58:41 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id b9-20020aa7dc09000000b00437938c731fsm17191040edu.97.2022.07.05.05.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 05:58:40 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Janne Grunau <j@jannau.net>, Sameer Pujar <spujar@nvidia.com>,
        devicetree@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-tegra@vger.kernel.org, asahi@lists.linux.dev
Subject: [PATCH v6 1/5] dt-bindings: reserved-memory: Document iommu-addresses
Date:   Tue,  5 Jul 2022 14:58:30 +0200
Message-Id: <20220705125834.431711-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220705125834.431711-1-thierry.reding@gmail.com>
References: <20220705125834.431711-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

This adds the "iommu-addresses" property to reserved-memory nodes, which
allow describing the interaction of memory regions with IOMMUs. Two use-
cases are supported:

  1. Static mappings can be described by pairing the "iommu-addresses"
     property with a "reg" property. This is mostly useful for adopting
     firmware-allocated buffers via identity mappings. One common use-
     case where this is required is if early firmware or bootloaders
     have set up a bootsplash framebuffer that a display controller is
     actively scanning out from during the operating system boot
     process.

  2. If an "iommu-addresses" property exists without a "reg" property,
     the reserved-memory node describes an IOVA reservation. Such memory
     regions are excluded from the IOVA space available to operating
     system drivers and can be used for regions that must not be used to
     map arbitrary buffers.

Each mapping or reservation is tied to a specific device via a phandle
to the device's device tree node. This allows a reserved-memory region
to be reused across multiple devices.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v6:
- add device phandle to iommu-addresses property in examples
- remove now unused dt-bindings/reserved-memory.h header

 .../reserved-memory/reserved-memory.txt       |  1 -
 .../reserved-memory/reserved-memory.yaml      | 62 +++++++++++++++++++
 2 files changed, 62 insertions(+), 1 deletion(-)
 delete mode 100644 Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt

diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
deleted file mode 100644
index 1810701a8509..000000000000
--- a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
+++ /dev/null
@@ -1 +0,0 @@
-This file has been moved to reserved-memory.yaml.
diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml
index 7a0744052ff6..8b885ee82ff4 100644
--- a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml
+++ b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml
@@ -52,6 +52,30 @@ properties:
       Address and Length pairs. Specifies regions of memory that are
       acceptable to allocate from.
 
+  iommu-addresses:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: >
+      A list of phandle and specifier pairs that describe static IO virtual
+      address space mappings and carveouts associated with a given reserved
+      memory region. The phandle in the first cell refers to the device for
+      which the mapping or carveout is to be created.
+
+      The specifier consists of an address/size pair and denotes the IO
+      virtual address range of the region for the given device. The exact
+      format depends on the values of the "#address-cells" and "#size-cells"
+      properties of the device referenced via the phandle.
+
+      When used in combination with a "reg" property, an IOVA mapping is to
+      be established for this memory region. One example where this can be
+      useful is to create an identity mapping for physical memory that the
+      firmware has configured some hardware to access (such as a bootsplash
+      framebuffer).
+
+      If no "reg" property is specified, the "iommu-addresses" property
+      defines carveout regions in the IOVA space for the given device. This
+      can be useful if a certain memory region should not be mapped through
+      the IOMMU.
+
   no-map:
     type: boolean
     description: >
@@ -97,4 +121,42 @@ oneOf:
 
 additionalProperties: true
 
+examples:
+  - |
+    / {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      reserved-memory {
+        ranges;
+
+        adsp_resv: reservation-adsp {
+          /*
+           * Restrict IOVA mappings for ADSP buffers to the 512 MiB region
+           * from 0x40000000 - 0x5fffffff. Anything outside is reserved by
+           * the ADSP for I/O memory and private memory allocations.
+           */
+          iommu-addresses = <&adsp 0x0 0x00000000 0x00 0x40000000>,
+                            <&adsp 0x0 0x60000000 0xff 0xa0000000>;
+        };
+
+        fb: framebuffer@90000000 {
+          reg = <0x0 0x90000000 0x0 0x00800000>;
+          iommu-addresses = <&dc0 0x0 0x90000000 0x0 0x00800000>;
+        };
+      };
+
+      bus@0 {
+        adsp: adsp@2990000 {
+          reg = <0x0 0x2990000 0x0 0x2000>;
+          memory-region = <&adsp_resv>;
+        };
+
+        dc0: display@15200000 {
+          reg = <0x0 0x15200000 0x0 0x10000>;
+          memory-region = <&fb>;
+        };
+      };
+    };
+
 ...
-- 
2.36.1

