Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49BFEC4332F
	for <linux-tegra@archiver.kernel.org>; Thu,  3 Nov 2022 13:39:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231564AbiKCNjO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 3 Nov 2022 09:39:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231555AbiKCNjN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 3 Nov 2022 09:39:13 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2359DE5D;
        Thu,  3 Nov 2022 06:39:12 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id f27so5355522eje.1;
        Thu, 03 Nov 2022 06:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yfknruDr0wMuf68oTY3G60sx+2R1UCTU/V2tm6vFIJI=;
        b=NA6rCrr2Mx7Xoax5+g1FgEeGa9999sxlDEPP2HakSnJM/Z0faXVg5hEIQOIUBtZdE5
         jUFY+gB92CtN8ElJuicWds9E8b9tUkGxPbBg2r7lwzTshy9QqkEol0WNF0W6iVmIs0gY
         2i39NjBTox0SSm59+LbhhS5fcBSEfUpwpGtK4ndQgGNbDrwUI8GwQCJ4LjeFc5xZ6r1K
         FQ41a0b2VS6UlWySGGIG4LjvGg/mo37LGT5+Clzw85U7WTCzD32zr+HvBVsJBGKnYA1L
         bdjkJgMBhQXQlD/gv/EMPBQQZIxLb6M2ZF8gUDrh0TD8kc33VDWZfJLPWhIjOROsAZFp
         o23A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yfknruDr0wMuf68oTY3G60sx+2R1UCTU/V2tm6vFIJI=;
        b=N5dJsD8O0ZHmmeCpfr6ISFEn8whofBnBeZmj7LcsJjjMtwXNCBDsazjlbAfPS+A4uE
         OBrQgEY8PXp+ewpY/KD0za+blpdfg5tC4fIVQRzypDEucqGO3ZRXr7CMSErRA/Z2JNAm
         henqlNnWKeqtnrihLkQL0srT/Di+7X0H0sf5Hps7mzSJy6tSqCfCXRNw9DnfH4sOwWiR
         Vqsw3/N1Ax2MyxQZhQ9Wthhd2PXkvXmTjDTHeXng/a/URg7OwjZCFgNwOgGukZBrTnrZ
         qJ2gDiZEtiXWMr0vTqJilrw6LXzTZ+xQ/oQsvdhb1dakrkoyopY5pkF97Nv9pXEWFj4S
         aCyA==
X-Gm-Message-State: ACrzQf37dP3gbglMv/P8/E8m3CAC/mjgEm0vg+nsfyc/dj59i3ycl6Kp
        Uzz06MnCYgTnOwcB/XRG5+0=
X-Google-Smtp-Source: AMsMyM5Pw+1WdCd48yiEvishRIIzlNHNFZ5tRHiwcE6mXPINqOXZWjnwqvlsrm7AJeqNnXne1Ac53Q==
X-Received: by 2002:a17:907:1c01:b0:78d:eb6e:3807 with SMTP id nc1-20020a1709071c0100b0078deb6e3807mr29330837ejc.481.1667482750603;
        Thu, 03 Nov 2022 06:39:10 -0700 (PDT)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id es11-20020a056402380b00b00458898fe90asm545067edb.5.2022.11.03.06.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 06:39:09 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Ashish Mhetre <amhetre@nvidia.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Janne Grunau <j@jannau.net>, Sameer Pujar <spujar@nvidia.com>,
        devicetree@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-tegra@vger.kernel.org, asahi@lists.linux.dev,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v10 3/5] dt-bindings: reserved-memory: Document iommu-addresses
Date:   Thu,  3 Nov 2022 14:38:58 +0100
Message-Id: <20221103133900.1473855-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221103133900.1473855-1-thierry.reding@gmail.com>
References: <20221103133900.1473855-1-thierry.reding@gmail.com>
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

 .../reserved-memory/reserved-memory.yaml      | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml
index 44f72bcf1782..07711fb30518 100644
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
@@ -95,6 +119,55 @@ oneOf:
   - required:
       - size
 
+  - required:
+      - iommu-addresses
+
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

