Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 975BDC4321E
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Dec 2022 15:19:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232608AbiLEPTu (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Dec 2022 10:19:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232117AbiLEPTG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Dec 2022 10:19:06 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC5A41CFF2
        for <linux-tegra@vger.kernel.org>; Mon,  5 Dec 2022 07:19:01 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id n1so13900400ljg.3
        for <linux-tegra@vger.kernel.org>; Mon, 05 Dec 2022 07:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7dqyE4PtxjL++1ali54vQghdy8B+qDO7Jx5t4P4oHaU=;
        b=k0pnJDXExyQnamg5MFHoHErxcqBpqkX5k2Crr7dSE2qrqpkH+3T7dVS3mgnQGTdaSt
         IqtUv118OdBIuQuPLamzIVgWIxCFB6DInannyw/2fGLzZVQnAXZZLwZwLwkKbA6pw3yt
         putzGc9+KkBVRRnzQIsUDNN7CejvW6E55voCOKQDhm2d2Ez9XooO8NG/TUpOAZQUKGfy
         AyR3aQ+Z687Cc3HYa0yOZTzcKtzv2GZ6MgdMTFYeUNSbVS25ma9NvqEAGYSK0l+GTgwH
         wW6GyTbDrEqLmx+mUB177gb9HzRTsSjWlmPM+MkWcf3dOOJ/ip6ZvmJYJzHoMMDa2H6p
         foYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7dqyE4PtxjL++1ali54vQghdy8B+qDO7Jx5t4P4oHaU=;
        b=absU7GXRj6+RnF+A44DUHg9GmEpUSp5T8uchM4/X2WqZuh9CZQM4KfDYWT5azbk0Yq
         n+SDvX7bo053zmD+nhNblFNISQIOrR7PxWHdL9N75db6SnGaTRrIbnsQTXsl32BVGb3Z
         PZwVlHFO+ndVDWKvVCsTGRyx0WzrUrzGqSJBmLBf4rjpGzagzHXSOIhD0ztbV23BG7Iz
         FHIsSBrIXZOWNwUIfGu3U4HDPRju02kFmfHcMCQSLut7zzvbRUlK/q4e+cjlhOQHxbqS
         sz2o2C4Sat5x880op7i+vX0aIVoKSWQgwcAeA3ETALUYfvYmTJO8Fs4ZtegndVUx9Bhs
         Nw7Q==
X-Gm-Message-State: ANoB5pk8y/1AYhhK7wR8zp5mSoZ91ATDaHnnVcwqk1D2E9HaNkVyucN3
        dg3TG+BwBeFjWA+7jltCeqqL5Q==
X-Google-Smtp-Source: AA0mqf5gfTCHSQj00cGPhylb4IRv8UHuJQZEnTsVfoPDooGOMUyuVi4C9b6SqsfeJi6TsyrOt3AH4w==
X-Received: by 2002:a2e:3512:0:b0:277:c68:874b with SMTP id z18-20020a2e3512000000b002770c68874bmr23984354ljz.261.1670253540183;
        Mon, 05 Dec 2022 07:19:00 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id w26-20020a05651204da00b004b55f60c65asm1012470lfq.284.2022.12.05.07.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 07:18:59 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Joe Tessler <jrt@google.com>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Jeff Chase <jnchase@google.com>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 8/9] media: dt-bindings: nvidia,tegra-cec: convert to DT schema
Date:   Mon,  5 Dec 2022 16:18:44 +0100
Message-Id: <20221205151845.21618-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221205151845.21618-1-krzysztof.kozlowski@linaro.org>
References: <20221205151845.21618-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Convert Nvidia Tegra HDMI CEC bindings to DT schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../bindings/media/cec/nvidia,tegra-cec.yaml  | 58 +++++++++++++++++++
 .../devicetree/bindings/media/tegra-cec.txt   | 27 ---------
 MAINTAINERS                                   |  2 +-
 3 files changed, 59 insertions(+), 28 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/cec/nvidia,tegra-cec.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/tegra-cec.txt

diff --git a/Documentation/devicetree/bindings/media/cec/nvidia,tegra-cec.yaml b/Documentation/devicetree/bindings/media/cec/nvidia,tegra-cec.yaml
new file mode 100644
index 000000000000..9a4025ff7fad
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/cec/nvidia,tegra-cec.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/cec/nvidia,tegra-cec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nvidia Tegra HDMI CEC
+
+maintainers:
+  - Hans Verkuil <hverkuil-cisco@xs4all.nl>
+
+allOf:
+  - $ref: cec-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - nvidia,tegra114-cec
+      - nvidia,tegra124-cec
+      - nvidia,tegra210-cec
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: cec
+
+  interrupts:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - hdmi-phandle
+  - interrupts
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra124-car.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    cec@70015000 {
+        compatible = "nvidia,tegra124-cec";
+        reg = <0x70015000 0x00001000>;
+        interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&tegra_car TEGRA124_CLK_CEC>;
+        clock-names = "cec";
+        status = "disabled";
+        hdmi-phandle = <&hdmi>;
+    };
diff --git a/Documentation/devicetree/bindings/media/tegra-cec.txt b/Documentation/devicetree/bindings/media/tegra-cec.txt
deleted file mode 100644
index c503f06f3b84..000000000000
--- a/Documentation/devicetree/bindings/media/tegra-cec.txt
+++ /dev/null
@@ -1,27 +0,0 @@
-* Tegra HDMI CEC hardware
-
-The HDMI CEC module is present in Tegra SoCs and its purpose is to
-handle communication between HDMI connected devices over the CEC bus.
-
-Required properties:
-  - compatible : value should be one of the following:
-	"nvidia,tegra114-cec"
-	"nvidia,tegra124-cec"
-	"nvidia,tegra210-cec"
-  - reg : Physical base address of the IP registers and length of memory
-	  mapped region.
-  - interrupts : HDMI CEC interrupt number to the CPU.
-  - clocks : from common clock binding: handle to HDMI CEC clock.
-  - clock-names : from common clock binding: must contain "cec",
-		  corresponding to the entry in the clocks property.
-  - hdmi-phandle : phandle to the HDMI controller, see also cec.txt.
-
-Example:
-
-cec@70015000 {
-	compatible = "nvidia,tegra124-cec";
-	reg = <0x0 0x70015000 0x0 0x00001000>;
-	interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
-	clocks = <&tegra_car TEGRA124_CLK_CEC>;
-	clock-names = "cec";
-};
diff --git a/MAINTAINERS b/MAINTAINERS
index 197351d3bb57..dee3f776be32 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2999,7 +2999,7 @@ M:	Hans Verkuil <hverkuil-cisco@xs4all.nl>
 L:	linux-tegra@vger.kernel.org
 L:	linux-media@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/media/tegra-cec.txt
+F:	Documentation/devicetree/bindings/media/cec/nvidia,tegra-cec.yaml
 F:	drivers/media/cec/platform/tegra/
 
 ARM/TESLA FSD SoC SUPPORT
-- 
2.34.1

