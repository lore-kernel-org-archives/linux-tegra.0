Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89559C6FA82
	for <linux-tegra@archiver.kernel.org>; Fri, 23 Sep 2022 12:36:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230431AbiIWMgK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 23 Sep 2022 08:36:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230297AbiIWMgJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 23 Sep 2022 08:36:09 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE60312870D;
        Fri, 23 Sep 2022 05:36:06 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id z2so59645edi.1;
        Fri, 23 Sep 2022 05:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=w6jjw8DFkYwlWS7fcZou1kBVAeHYZmnbwGCONqs9cv0=;
        b=UTROLkadDdKrd1mijVv/d2meCSb4VhSRDelrozl8zC1jpZGtI2l9FDpqwOC0WPmU1f
         ut0uBltBpWl+TOy6+YCHRYyAvYIl6xBng2VSYvS5982ndG+gs9E5MYjCNchX4WwH4zbY
         cVzp/j7V/7FPH317oflm7gQj3/Rf7q5Fl0igAfdfcHIkkDEeDpukPoLm3HN17hr643rX
         azxqZGm602cf5+i6BRTxK9MBjuiXrE2aVm6ktv58k9JxOBzathNKFEAOMBuqeyCC8lNJ
         ZOgGMIC3DoclxBxr+wUbWsvalGS71LvMgxxyHj7ryyaOS4Ew4Ai4wnuQXZ2+xixx/5Ob
         kgKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=w6jjw8DFkYwlWS7fcZou1kBVAeHYZmnbwGCONqs9cv0=;
        b=gElgo8rw0kcfAYrzCSLCu7b/JEPAHG+grs5u7ygfZzmfpmMrf9cwwNq+4FN1Iau8Wz
         7r1reOxpByrqjdlqUJkSe0GZUivzICpUF8EuRxl2tCjMPSJArY/XMMXIwxFq8zB3Mqos
         m+Hl9u78om5mhA8r+vYIK+lusOnsQbdQ8r7q1uAKAOpzj7TsBHngUudtCU45vtU1OUzJ
         RBuxNqYY7wbGC3uocmaG7DhjYxJCeZHDkq82UAQUyeUKir5fdAl5VG4Wly3qgkwvlxjE
         V+YHcw1X92B9g4jXRmjzsFoy3PnyHUFOEIZsfiVlr43OjX+laDXcoxHU3804EoyniC1M
         Dc/w==
X-Gm-Message-State: ACrzQf0hcP9pgN+MyWatI74z3q9wyYvEeKekU0vyf2KblBKpORRAYbfe
        Yk1QYBlBbMr1WtaOzCwuNy8=
X-Google-Smtp-Source: AMsMyM6XYeNWMVe2MiXKRZ2S4M+5CN69WMLH/kH9gD/rrX7jJuJTJW3wgqC/b+SbBkYEcxlurehrlQ==
X-Received: by 2002:a05:6402:50d1:b0:452:899e:77c with SMTP id h17-20020a05640250d100b00452899e077cmr8268391edb.0.1663936564864;
        Fri, 23 Sep 2022 05:36:04 -0700 (PDT)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id i14-20020a50fc0e000000b0044792480994sm5445745edr.68.2022.09.23.05.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 05:36:03 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Janne Grunau <j@jannau.net>, Sameer Pujar <spujar@nvidia.com>,
        devicetree@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-tegra@vger.kernel.org, asahi@lists.linux.dev,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v9 1/5] dt-bindings: reserved-memory: Document iommu-addresses
Date:   Fri, 23 Sep 2022 14:35:53 +0200
Message-Id: <20220923123557.866972-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923123557.866972-1-thierry.reding@gmail.com>
References: <20220923123557.866972-1-thierry.reding@gmail.com>
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
Changes in v9:
- add Reviewed-by tags

Changes in v8:
- include validation warnings that had crept into an unrelated patch

Changes in v7:
- keep reserved-memory.txt to avoid broken references

Changes in v6:
- add device phandle to iommu-addresses property in examples
- remove now unused dt-bindings/reserved-memory.h header

 .../reserved-memory/reserved-memory.yaml      | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml
index 44f72bcf1782..fb48d016e368 100644
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
@@ -97,4 +121,50 @@ oneOf:
 
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
2.37.3

