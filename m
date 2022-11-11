Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88131C43217
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Nov 2022 16:18:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233982AbiKKQSS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 11 Nov 2022 11:18:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232841AbiKKQSR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 11 Nov 2022 11:18:17 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 956C566C88;
        Fri, 11 Nov 2022 08:18:16 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id z14so7068398wrn.7;
        Fri, 11 Nov 2022 08:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yfknruDr0wMuf68oTY3G60sx+2R1UCTU/V2tm6vFIJI=;
        b=RYfvkp9Pg1O5NFpcmlrAw/kS9wWKk+uqci3bp7e1C0bTZUn3UZuXwNamKyU4ia0zlb
         9M5wOcHYxVNYjA6RfbZFApXawIbxWdnTOqNjtD4LW+KAEIH122eZr+WqgcE5v/nLZgqZ
         GSgY3GBEtcG7uPSD3mPFixPYIrpoFqv0TpdRyXzhu09FEWXOmehC9f+mgzVoRiGWonfd
         2shn4wBTlDhps0fl30vSAbZMe/dFEgctDxk9MfR8Wx4OT9bUj2ZsP23LOriZF08WtsGf
         DURV1pxqXp1rCtJB5gXgP81LBQ4HauQLYfEw6NOc32y9UqO6QuptLZTxyafP81krlnHr
         KVLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yfknruDr0wMuf68oTY3G60sx+2R1UCTU/V2tm6vFIJI=;
        b=bqL9WLoLXB2FzxDI5eo6zAFO6B2eh8NJCm+Wa6tFjy0wQnfXmZO3UqXCoz9Mwdxcjb
         mcEhewwWzIgNzAv65CJ38Aie5uxCpHGe48UWQ1kFoP0g9RvaFVrYOUa7YFlVukZ78OAl
         mu+l0z5l3ca7eKaqYBpmTMWKL1N8jvNxRsAuPSpunHVB95r2g6RbsTqz39J2vsYGFBTA
         HfBLBPJcJqKzd4Vzhk7dpHzSxWHlWPo+sqc2ixM4Ni10ZNokgTycI4caSMx97zxRyLFJ
         dKSaC/+XgSnH0iBX/6sEZibVdH2Gp1ki9jkLntsCw5yZ7EUFJ0G1q4TZn2Oyr2ltWise
         SHKg==
X-Gm-Message-State: ANoB5pmwEGuFoYtOUoiFTIu1L5M3txKofIUHrKAYZ1yFtVcjgM0vaN1r
        2odQRb596s37lrw9FEvJLjo=
X-Google-Smtp-Source: AA0mqf70D1Fr3uYjNiKSyzajb9enfG7GQIbvlhbLekv6NtM/Apyp+hfg5qh/1oupwE+XiH+vi9Nfbg==
X-Received: by 2002:adf:f4c9:0:b0:236:562b:f67a with SMTP id h9-20020adff4c9000000b00236562bf67amr1698190wrp.562.1668183496088;
        Fri, 11 Nov 2022 08:18:16 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id bi14-20020a05600c3d8e00b003b95ed78275sm3279291wmb.20.2022.11.11.08.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 08:18:15 -0800 (PST)
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
Subject: [PATCH v11 3/5] dt-bindings: reserved-memory: Document iommu-addresses
Date:   Fri, 11 Nov 2022 17:18:04 +0100
Message-Id: <20221111161806.630527-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221111161806.630527-1-thierry.reding@gmail.com>
References: <20221111161806.630527-1-thierry.reding@gmail.com>
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

