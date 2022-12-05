Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 573E1C4321E
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Dec 2022 15:19:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232554AbiLEPTf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Dec 2022 10:19:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231898AbiLEPTF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Dec 2022 10:19:05 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77F41F5A2
        for <linux-tegra@vger.kernel.org>; Mon,  5 Dec 2022 07:19:00 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id a19so13949968ljk.0
        for <linux-tegra@vger.kernel.org>; Mon, 05 Dec 2022 07:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OG/8G+X7cn354GHwDZ9it6hy+FM3bIwIsnxzfxxJJs8=;
        b=n5b5W1egO3RHI1db6QG6Zjkmv/BIcd4ndpcGpufGOnQwvKl64GUkpxRo7nbY/k5YDK
         k56YnJJieRdxDHkEvV3lhLQQe2/AaCfvOJRCfQz4LCYngeM5io5+D8oJUssFIpAVbr1Q
         OsetqNCnDbp72hHaS+7wTcAv12Z7gAj6FV/C1poEmSUNiwY0mekDfq+BEMV9lCTu0uMR
         Qw7uF6byg4YVQ20D9mZE1TrfC/kyBflhHc4/s91jmMrgSMLatPzNKiwweL4FuNtlJak6
         e0d0ROK25AfK8Rk1tsA84L6C5jpPyLhw0fXQUx11xWlokpaGqtpra7IOz+PrrhtrDiCD
         +1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OG/8G+X7cn354GHwDZ9it6hy+FM3bIwIsnxzfxxJJs8=;
        b=b2DUKZGhKnbh3pqqchjJvZm4DAQMT/Ns4z5zI94oeZPAn4cVMV2V5rESc7LK/Penwj
         C6A9DUhZBfP2QutLsHTH7ElA383Wh2hd6G9eDQFPwCkZn+tXC9wguRcIRmTjEYQAuWhB
         jfphG2qmu2/wjvmqV+jpHbbASUnhmxAL1BByMmYeDt5rKqgJC3YS4BUSsH69Zzon9Ycc
         wa3rWvsQrZNR8HJsyLj6ogXv5U4vulG34CnoRhqC+2gxZSsoi45AttE2MCQ3M1Q9Z6vf
         tdAaoSpRfpxGkrMegNDsbfPf90uGPidYN45KIV8dfcHn4zeJlhasbLGXU7uPgOm6pDGM
         2Tuw==
X-Gm-Message-State: ANoB5pl4s8InyBbZBaxePz5j0KQN7uDWUFHAEQpushcKskzVThpxaB06
        vn/Zu/PKcwGJ2NTziaSnwcujjQ==
X-Google-Smtp-Source: AA0mqf6rrJSwBS2KDp5lj1n2eUBOivuCjmtclfYC8Ma0cwZZTgMnwnlI6JALi6ki6VhLVSe/+xSuxA==
X-Received: by 2002:a05:651c:1721:b0:277:2600:9ce1 with SMTP id be33-20020a05651c172100b0027726009ce1mr21479909ljb.233.1670253538773;
        Mon, 05 Dec 2022 07:18:58 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id w26-20020a05651204da00b004b55f60c65asm1012470lfq.284.2022.12.05.07.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 07:18:58 -0800 (PST)
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
Subject: [PATCH v2 7/9] media: dt-bindings: cec-gpio: convert to DT schema
Date:   Mon,  5 Dec 2022 16:18:43 +0100
Message-Id: <20221205151845.21618-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221205151845.21618-1-krzysztof.kozlowski@linaro.org>
References: <20221205151845.21618-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Convert HDMI CEC GPIO bindings to DT schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../devicetree/bindings/media/cec-gpio.txt    | 42 -----------
 .../bindings/media/cec/cec-gpio.yaml          | 73 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 74 insertions(+), 43 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/cec-gpio.txt
 create mode 100644 Documentation/devicetree/bindings/media/cec/cec-gpio.yaml

diff --git a/Documentation/devicetree/bindings/media/cec-gpio.txt b/Documentation/devicetree/bindings/media/cec-gpio.txt
deleted file mode 100644
index 47e8d73d32a3..000000000000
--- a/Documentation/devicetree/bindings/media/cec-gpio.txt
+++ /dev/null
@@ -1,42 +0,0 @@
-* HDMI CEC GPIO driver
-
-The HDMI CEC GPIO module supports CEC implementations where the CEC line
-is hooked up to a pull-up GPIO line and - optionally - the HPD line is
-hooked up to another GPIO line.
-
-Please note: the maximum voltage for the CEC line is 3.63V, for the HPD and
-5V lines it is 5.3V. So you may need some sort of level conversion circuitry
-when connecting them to a GPIO line.
-
-Required properties:
-  - compatible: value must be "cec-gpio".
-  - cec-gpios: gpio that the CEC line is connected to. The line should be
-    tagged as open drain.
-
-If the CEC line is associated with an HDMI receiver/transmitter, then the
-following property is also required:
-
-  - hdmi-phandle - phandle to the HDMI controller, see also cec.txt.
-
-If the CEC line is not associated with an HDMI receiver/transmitter, then
-the following property is optional and can be used for debugging HPD changes:
-
-  - hpd-gpios: gpio that the HPD line is connected to.
-
-This property is optional and can be used for debugging changes on the 5V line:
-
-  - v5-gpios: gpio that the 5V line is connected to.
-
-Example for the Raspberry Pi 3 where the CEC line is connected to
-pin 26 aka BCM7 aka CE1 on the GPIO pin header, the HPD line is
-connected to pin 11 aka BCM17 and the 5V line is connected to pin
-15 aka BCM22 (some level shifter is needed for the HPD and 5V lines!):
-
-#include <dt-bindings/gpio/gpio.h>
-
-cec-gpio {
-	compatible = "cec-gpio";
-	cec-gpios = <&gpio 7 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
-	hpd-gpios = <&gpio 17 GPIO_ACTIVE_HIGH>;
-	v5-gpios = <&gpio 22 GPIO_ACTIVE_HIGH>;
-};
diff --git a/Documentation/devicetree/bindings/media/cec/cec-gpio.yaml b/Documentation/devicetree/bindings/media/cec/cec-gpio.yaml
new file mode 100644
index 000000000000..19169d58316a
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/cec/cec-gpio.yaml
@@ -0,0 +1,73 @@
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/cec/cec-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HDMI CEC GPIO
+
+maintainers:
+  - Hans Verkuil <hverkuil-cisco@xs4all.nl>
+
+description: |
+  The HDMI CEC GPIO module supports CEC implementations where the CEC line is
+  hooked up to a pull-up GPIO line and - optionally - the HPD line is hooked up
+  to another GPIO line.
+
+  Please note:: the maximum voltage for the CEC line is 3.63V, for the HPD and
+  5V lines it is 5.3V. So you may need some sort of level conversion
+  circuitry when connecting them to a GPIO line.
+
+properties:
+  compatible:
+    const: cec-gpio
+
+  cec-gpios:
+    maxItems: 1
+    description:
+      GPIO that the CEC line is connected to. The line should be tagged as open
+      drain.
+
+  hpd-gpios:
+    maxItems: 1
+    description:
+      GPIO that the HPD line is connected to.  Used for debugging HPD changes
+      when the CEC line is not associated with an HDMI receiver/transmitter.
+
+  v5-gpios:
+    maxItems: 1
+    description:
+      GPIO that the 5V line is connected to.  Used for debugging changes on the
+      5V line.
+
+required:
+  - compatible
+  - cec-gpios
+
+allOf:
+  - $ref: cec-common.yaml#
+  - if:
+      required:
+        - hdmi-phandle
+    then:
+      properties:
+        hpd-gpios: false
+
+  - if:
+      required:
+        - hpd-gpios
+    then:
+      properties:
+        hdmi-phandle: false
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    cec {
+        compatible = "cec-gpio";
+        cec-gpios = <&gpio 7 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+        hpd-gpios = <&gpio 17 GPIO_ACTIVE_HIGH>;
+        v5-gpios = <&gpio 22 GPIO_ACTIVE_HIGH>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 05acbaecef52..197351d3bb57 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4848,7 +4848,7 @@ L:	linux-media@vger.kernel.org
 S:	Supported
 W:	http://linuxtv.org
 T:	git git://linuxtv.org/media_tree.git
-F:	Documentation/devicetree/bindings/media/cec-gpio.txt
+F:	Documentation/devicetree/bindings/media/cec/cec-gpio.yaml
 F:	drivers/media/cec/platform/cec-gpio/
 
 CELL BROADBAND ENGINE ARCHITECTURE
-- 
2.34.1

