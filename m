Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C283DC4167B
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Nov 2022 18:54:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239999AbiKQSyh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Nov 2022 13:54:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239843AbiKQSyf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Nov 2022 13:54:35 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30EE886A6A;
        Thu, 17 Nov 2022 10:54:34 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id n12so7342817eja.11;
        Thu, 17 Nov 2022 10:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KChe7s1PpwzRHFbrWjjtieMmmxAbXRPdqDfQRgAzhiY=;
        b=A1HC15khtPAcxHJhwy2UmWcVpNOG+ih7nx6A3Q0mCPM1eQcfykAqjYPAkFrUAOZnCY
         LA73eCi1IpLxZ5EF48GYsaHwADIGHTgsszEO7++6ez0xCrhQce+nNGHjeWeFD/VM1kZv
         ViJQqcgcSa1rnWm95i/xVBEvx9dxW8JjSnsiSuTFOT9N2Rivo+g+etaotDgp/UdKUMl4
         LWPP20nqvpd58/Y2QY59FEcmSbKdr5ImUz9WdFU1qIyT9vPJk7mjooR+uKqjPFqpl3Ky
         kaeRawRrkXMPaB/808pHllE5j8UGGQZuiIJZXpUUKp0exnAW4i6SrLmbWxZawX/5WGL5
         50jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KChe7s1PpwzRHFbrWjjtieMmmxAbXRPdqDfQRgAzhiY=;
        b=1L+xlrP0CaUVH0aTNykIusZCTXlWjL4SYcvVJgeyUxho09zTE1yGktifoNNdkV9Ah6
         +WXWkP6VvkLYlQ35l5PLAygiCGX0ZqRuADRAMlMK8GtpdT9YfaU4yRshKO8R6HZ3JJ5Q
         VYNBLw8cC/Dt/JRf+sOiQzB6FMMoy4/mhaAUyfeMH+JEjViJkUZU6xztZXRPt5et/qA4
         1map9orZPhqoLzGmo41+rOS+ouf28VdThm3jAZCmYiqlP77aAkD/qp2+r5KeXu8HNfru
         cxc/Zg6CVG5Rq9CB0uGOGYQ7vYgQkAh4HYtMjYpnWa+pCZbYhKK/EVgAWYKmNFlmOMJM
         hKqQ==
X-Gm-Message-State: ANoB5pkC+O/8xsfft8hfzVvtgg3uHgkH/sSdBc3NZj7ffEQJs8oXFuH5
        P56toxI2odAyt0s5NyAROYY=
X-Google-Smtp-Source: AA0mqf4n9LyHVM6Zo/xnYQV2hFBVpTg57ZXJ82wr3Azz3rXK9BYyWZbMwvdu4vhT9NijRAcmgHNfig==
X-Received: by 2002:a17:907:11c5:b0:7b1:316c:38f7 with SMTP id va5-20020a17090711c500b007b1316c38f7mr3302794ejb.387.1668711272416;
        Thu, 17 Nov 2022 10:54:32 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id s26-20020a056402165a00b0046800749670sm884987edx.53.2022.11.17.10.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 10:54:31 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Ashish Mhetre <amhetre@nvidia.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Janne Grunau <j@jannau.net>, Sameer Pujar <spujar@nvidia.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        devicetree@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-tegra@vger.kernel.org, asahi@lists.linux.dev,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v12 2/4] dt-bindings: reserved-memory: Document iommu-addresses
Date:   Thu, 17 Nov 2022 19:54:22 +0100
Message-Id: <20221117185424.2359687-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221117185424.2359687-1-thierry.reding@gmail.com>
References: <20221117185424.2359687-1-thierry.reding@gmail.com>
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

Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v12:
- allow iommu-addresses to be specified when reg is present

Changes in v10:
- mark iommu-addresses as required in the absence of reg and size

Changes in v9:
- add Reviewed-by tags

Changes in v8:
- include validation warnings that had crept into an unrelated patch

Changes in v7:
- keep reserved-memory.txt to avoid broken references

Changes in v6:
- add device phandle to iommu-addresses property in examples
- remove now unused dt-bindings/reserved-memory.h header

 .../reserved-memory/reserved-memory.yaml      | 89 ++++++++++++++++++-
 1 file changed, 85 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml
index 44f72bcf1782..010219138858 100644
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
@@ -89,12 +113,69 @@ allOf:
           - no-map
 
 oneOf:
-  - required:
-      - reg
+  - oneOf:
+      - required:
+          - reg
+
+      - required:
+          - size
+
+  - oneOf:
+      # IOMMU reservations
+      - required:
+          - iommu-addresses
 
-  - required:
-      - size
+      # IOMMU mappings
+      - required:
+          - reg
+          - iommu-addresses
 
 additionalProperties: true
 
+examples:
+  - |
+    / {
+      compatible = "foo";
+      model = "foo";
+
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      reserved-memory {
+        #address-cells = <2>;
+        #size-cells = <2>;
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
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0x0 0x0 0x0 0x40000000>;
+
+        adsp: adsp@2990000 {
+          reg = <0x2990000 0x2000>;
+          memory-region = <&adsp_resv>;
+        };
+
+        dc0: display@15200000 {
+          reg = <0x15200000 0x10000>;
+          memory-region = <&fb>;
+        };
+      };
+    };
 ...
-- 
2.38.1

