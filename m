Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9B30EB64DA
	for <linux-tegra@archiver.kernel.org>; Wed,  5 Jul 2023 15:28:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232514AbjGEP2a (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 5 Jul 2023 11:28:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232425AbjGEP23 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Jul 2023 11:28:29 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACDEF10F2;
        Wed,  5 Jul 2023 08:28:28 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4fb73ba3b5dso11107402e87.1;
        Wed, 05 Jul 2023 08:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688570907; x=1691162907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MUQR9Dg88eZOS0qOnSr/IFqRJ8LItL7T1cAL99njjbU=;
        b=Xm7V+kS2ok9k+5y5pkdDfvpGl0k8sHk/ndnLSE0zoHa3R9P5lJmWTT1BhkXoUG903F
         XqIOxwlr11K35Dz2dkxVtasXJDTMinTPD2xEo9KRF8aIk1XX9ty4vRNdieQSoId+yLa+
         igwk/vhfMeSOLF6lMlkWTwU3OpcUkyZGZ6Y8Q1ORWNwHRS3Z2kKRJ/MMx2rzjGzCJRik
         zyjZIvX+jtATXwnFBcxYX+bx3FnUSS+OGUVbV9W+5BKn1yOlcMajDEhTzHA4lJeDt3+w
         bpL3BhLTrufx9ndVY8e5OpNirDkKDdZ0oaGiFA3srdQxWfuVTsZ3E3bQI4K8PS0nbI90
         /ogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688570907; x=1691162907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MUQR9Dg88eZOS0qOnSr/IFqRJ8LItL7T1cAL99njjbU=;
        b=cWZkGCCE9n/m9IF/yoPb/JUckJg+6eLxL6YpyInPuEUZBZzqmZv+cM6s48wBbeQtA/
         4IMa5jx61zWjZgtjDop9Dj9J8Nv8x8DQktDgbkXXUZo97at71Y0UFCsF3XhP6ABHOViW
         gQx8tzZKy0Mjl8ylALu/zn+i7BzXd7TZ5GhmswlHi4exxTDmzPb19y5rehb15gbCILqY
         xJfDq06W1IHWfOtB9jp7sb1AflkerlBZQmjUnxVAtnTYsT4av4hKoCwHRSdx+lqqgQ6+
         /oJF/+D5zqFO+QFhWGRYj08jHCEaCF2B3wm+i/YKJdid/pcTKSLxBJ7476b3JCI5GyeN
         2Yhg==
X-Gm-Message-State: ABy/qLb7LvUMiieqDTnfNOmoZxJtLtvdMdMP5Q1+ePraV78ynAKhy3Yr
        IpzPzHhOU+9HO44z6tSdMMO6o7hb0Qk=
X-Google-Smtp-Source: APBJJlFWmEui0AtqKgljYg9xPsaWjhjTWrzklz5FuT6B3fq5wKyFH6z1DX3FGPsmTNzQAbSfxdLmOw==
X-Received: by 2002:a05:6512:693:b0:4f8:7734:8dd0 with SMTP id t19-20020a056512069300b004f877348dd0mr13269158lfe.2.1688570906571;
        Wed, 05 Jul 2023 08:28:26 -0700 (PDT)
Received: from localhost (p200300e41f4b7100f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4b:7100:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id u6-20020a7bc046000000b003fa8dbb7b5dsm2451521wmc.25.2023.07.05.08.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 08:28:26 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH] dt-bindings: cpu: Document NVIDIA Tegra186 CCPLEX cluster
Date:   Wed,  5 Jul 2023 17:28:25 +0200
Message-ID: <20230705152825.2514544-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Add device tree bindings for the CCPLEX cluster found on NVIDIA Tegra186
SoCs.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../cpu/nvidia,tegra186-ccplex-cluster.yaml   | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/cpu/nvidia,tegra186-ccplex-cluster.yaml

diff --git a/Documentation/devicetree/bindings/cpu/nvidia,tegra186-ccplex-cluster.yaml b/Documentation/devicetree/bindings/cpu/nvidia,tegra186-ccplex-cluster.yaml
new file mode 100644
index 000000000000..4275ff16e8e3
--- /dev/null
+++ b/Documentation/devicetree/bindings/cpu/nvidia,tegra186-ccplex-cluster.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: (GPL-2.0+ OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/cpu/nvidia,tegra186-ccplex-cluster.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra186 CCPLEX Cluster
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+properties:
+  compatible:
+    const: nvidia,tegra186-ccplex-cluster
+
+  reg:
+    maxItems: 1
+
+  nvidia,bpmp:
+    description: phandle to the BPMP used to query CPU frequency tables
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - nvidia,bpmp
+
+examples:
+  - |
+    ccplex@e000000 {
+        compatible = "nvidia,tegra186-ccplex-cluster";
+        reg = <0x0e000000 0x400000>;
+        nvidia,bpmp = <&bpmp>;
+    };
-- 
2.41.0

