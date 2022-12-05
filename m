Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93911C4321E
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Dec 2022 15:19:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232358AbiLEPTS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Dec 2022 10:19:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232420AbiLEPSz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Dec 2022 10:18:55 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F8B517403
        for <linux-tegra@vger.kernel.org>; Mon,  5 Dec 2022 07:18:54 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id c1so19070335lfi.7
        for <linux-tegra@vger.kernel.org>; Mon, 05 Dec 2022 07:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yR2BrJ7GlNzz1L7RbApb6lqQSBsCQtyE8vkfgp1+AEE=;
        b=bpk0qIW/bil+RnwI4y5r1x0yknZWOjMReR/ROabJRNfvVnaoEn9+IT4/FGHDeX3NWI
         9NRIxlum7z6N7EbBScDmROvabFVDZrDeaWlbzknOGItsv4cJpec5Tirgd0MD2c+aNvlN
         KVh7C18Hc2CvFVWwGY1rweHNRK52JTqX07XqSo+QEvs82wcKeC1rRr+5ZnyLXonD5y23
         ZHIvZyLcin1SOZXsQ2igFSSe96Ikh9aBuMMO2onXchKPLWrYTyyLLCEYeou1XUpST81f
         D/C5rG7cOEQLM1nUMz3wwV7nDchV2yYGVecPYLOK3QdP73YiaCESB+TwJEDaidXrPgA2
         hqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yR2BrJ7GlNzz1L7RbApb6lqQSBsCQtyE8vkfgp1+AEE=;
        b=BsCTGtsOJQWGDLUwW2ZJ/9o9o/Km9Vir9mJIcYudxb5UiqsjQ4uB/JTQpIE6XjTBsR
         uPXqm2I9SSyyIrKxCq4AiWGkepiGg2aVl0QTFjP0trSCXSVgyBdK/2gkH5dpwKL+BXVi
         lN5OJoJkHlWn8mnGkI9DCvZhX5mZSlHxVBmrt0Jvf9sFDtykFQAd07KL9W3sHtHJ3L/U
         Z5bQQmx6IaCs8gR5wdqnFLKjsJhbgUzzzuywosjfdt0fsP9Aq9vKXxm9sc6UX7tPdrK/
         qi34Nb/3SF747dgfO2HHl75zJ/zVi9iekhgfeXDACWS5JJySFYRBgXuJTh7dj0oh6ZUv
         u+mg==
X-Gm-Message-State: ANoB5pn9k58OSvKuWt51+UEQY6fnZ60+E9AxZk8qNjKj0NVfv/kvGouu
        tv1RWygkRBCk/0wupHsT6ssvtA==
X-Google-Smtp-Source: AA0mqf6jyyZRogeiRW4/e4nxxtucWoAmJrilZAi2g0Ug0dFDirM+NqZ01pBbCY7Cv4/B3PSt4Pym+g==
X-Received: by 2002:a05:6512:1698:b0:4a2:4b43:9aad with SMTP id bu24-20020a056512169800b004a24b439aadmr30144514lfb.213.1670253532624;
        Mon, 05 Dec 2022 07:18:52 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id w26-20020a05651204da00b004b55f60c65asm1012470lfq.284.2022.12.05.07.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 07:18:52 -0800 (PST)
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
Subject: [PATCH v2 3/9] media: dt-bindings: cec: convert common CEC properties to DT schema
Date:   Mon,  5 Dec 2022 16:18:39 +0100
Message-Id: <20221205151845.21618-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221205151845.21618-1-krzysztof.kozlowski@linaro.org>
References: <20221205151845.21618-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Convert common HDMI CEC adapter bindings to DT schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../devicetree/bindings/media/cec.txt         |  8 ------
 .../bindings/media/cec/cec-common.yaml        | 28 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 29 insertions(+), 9 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/cec.txt
 create mode 100644 Documentation/devicetree/bindings/media/cec/cec-common.yaml

diff --git a/Documentation/devicetree/bindings/media/cec.txt b/Documentation/devicetree/bindings/media/cec.txt
deleted file mode 100644
index 22d7aae3d3d7..000000000000
--- a/Documentation/devicetree/bindings/media/cec.txt
+++ /dev/null
@@ -1,8 +0,0 @@
-Common bindings for HDMI CEC adapters
-
-- hdmi-phandle: phandle to the HDMI controller.
-
-- needs-hpd: if present the CEC support is only available when the HPD
-  is high. Some boards only let the CEC pin through if the HPD is high,
-  for example if there is a level converter that uses the HPD to power
-  up or down.
diff --git a/Documentation/devicetree/bindings/media/cec/cec-common.yaml b/Documentation/devicetree/bindings/media/cec/cec-common.yaml
new file mode 100644
index 000000000000..af6ee5f1c73f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/cec/cec-common.yaml
@@ -0,0 +1,28 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/cec/cec-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HDMI CEC Adapters Common Properties
+
+maintainers:
+  - Hans Verkuil <hverkuil@xs4all.nl>
+
+properties:
+  $nodename:
+    pattern: "^cec(@[0-9a-f]+|-[0-9]+)?$"
+
+  hdmi-phandle:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the HDMI controller.
+
+  needs-hpd:
+    type: boolean
+    description:
+      The CEC support is only available when the HPD is high. Some boards only
+      let the CEC pin through if the HPD is high, for example if there is a
+      level converter that uses the HPD to power up or down.
+
+additionalProperties: true
diff --git a/MAINTAINERS b/MAINTAINERS
index 07cb85cac4c3..45402e03cda5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4832,7 +4832,7 @@ S:	Supported
 W:	http://linuxtv.org
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/ABI/testing/debugfs-cec-error-inj
-F:	Documentation/devicetree/bindings/media/cec.txt
+F:	Documentation/devicetree/bindings/media/cec/cec-common.yaml
 F:	Documentation/driver-api/media/cec-core.rst
 F:	Documentation/userspace-api/media/cec
 F:	drivers/media/cec/
-- 
2.34.1

