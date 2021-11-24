Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41419C43219
	for <linux-tegra@archiver.kernel.org>; Wed, 24 Nov 2021 22:06:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344351AbhKXWJo (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 24 Nov 2021 17:09:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344159AbhKXWJm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 24 Nov 2021 17:09:42 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 791D0C061574;
        Wed, 24 Nov 2021 14:06:32 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id b1so10873227lfs.13;
        Wed, 24 Nov 2021 14:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2uuzWPY9rvjqfLr6fV1cmdNXd06jrQuuKD96OjbdPNQ=;
        b=qfW/HGnpwCJ+dlE2szaDZeKhas1KXNCAysUabq12Y4F5YGkDbHpghxFVOofzIK/kTC
         gElro/xsp2BmqhbbG3ukENdsXrM9TwUCWplBi6kH+whRJB8SDMaLZFjTvHm/8V03CJ++
         RLRTk+bu7Y3J9gdjMza+jSJyJjieaKdSMxy+eD8wOGX3WLkHpww8wtwwMBsFJLUhrAH/
         P4l/0QOWxp7sTeiB5tf21QhBm7/gvsft2MS/cFZlxQX+b45CW4ykPXboy/+9UXz7gz1W
         B5RpB040Vl27+liyU/91pUGKM5/H4jly777rmEfqoluq7zNJgdIPhoMtAPKruSeaH/P0
         6MPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2uuzWPY9rvjqfLr6fV1cmdNXd06jrQuuKD96OjbdPNQ=;
        b=xWwyUZjBy5MX2VpTDsd33hirZNeW8/eHsbrev3m1iJOz6DrTCLUpGB3jDibyprG9HR
         lAMETHoKI67Pp57m2G471c1x1TPBFCq+1r99c/+Y59AM0kcZ7vXZkHTeM3x0XU+X7H/K
         sS1AonazPwvLxHgW2F3WzE/25rEKppSHE12rgexMQqEWZxEBTf7xTQutBcxGi9tqmeK0
         lPLtfMdfxxnuxnLSwF4g6QrnF4i+C07c+/QAuEahh3+zMZamme8uifoYa0k8hwlN0MZy
         T3J2f7S1H5wqLTU2u1YBOU4OBSgYce3PUrhmUrNGFl1YaEtt0Fw5TXVJVnDu/k1tQa7O
         T8yg==
X-Gm-Message-State: AOAM53183C2D/50c5/0RHWBoyvVrBgCA+FaXM0LH1PlBIxp278psmeKT
        JZKoMvoBff+H162CMBL+K1Y=
X-Google-Smtp-Source: ABdhPJzQ5wmPsf7MT2kOseSoWuXZrjMS2l8zY/SyQMJGCvCCrfyBLGpbOCXFy5OZHCgrTdnaiZanxQ==
X-Received: by 2002:a05:6512:249:: with SMTP id b9mr19394202lfo.496.1637791590799;
        Wed, 24 Nov 2021 14:06:30 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.gmail.com with ESMTPSA id w17sm93266ljh.15.2021.11.24.14.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 14:06:30 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Agneli <poczt@protonmail.ch>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-tegra@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v1 01/20] ASoC: dt-bindings: Add binding for Tegra20 S/PDIF
Date:   Thu, 25 Nov 2021 01:00:38 +0300
Message-Id: <20211124220057.15763-2-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124220057.15763-1-digetx@gmail.com>
References: <20211124220057.15763-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add device-tree binding for Tegra20 S/PDIF controller.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/sound/nvidia,tegra20-spdif.yaml  | 88 +++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra20-spdif.yaml

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra20-spdif.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra20-spdif.yaml
new file mode 100644
index 000000000000..4a2747d64772
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra20-spdif.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nvidia,tegra20-spdif.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra20 S/PDIF Controller
+
+description: |
+  The S/PDIF controller supports both input and output in serial audio
+  digital interface format. The input controller can digitally recover
+  a clock from the received stream. The S/PDIF controller is also used
+  to generate the embedded audio for HDMI output channel.
+
+maintainers:
+  - Thierry Reding <treding@nvidia.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+properties:
+  compatible:
+    const: nvidia,tegra20-spdif
+
+  reg:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 2
+
+  clock-names:
+    items:
+      - const: spdif_out
+      - const: spdif_in
+
+  dmas:
+    minItems: 2
+
+  dma-names:
+    items:
+      - const: rx
+      - const: tx
+
+  "#sound-dai-cells":
+    const: 0
+
+  nvidia,fixed-parent-rate:
+    description: |
+      Specifies whether board prefers parent clock to stay at a fixed rate.
+      This allows multiple Tegra20 audio components work simultaneously by
+      limiting number of supportable audio rates.
+    type: boolean
+
+  assigned-clocks: true
+  assigned-clock-parents: true
+
+required:
+  - compatible
+  - reg
+  - resets
+  - interrupts
+  - clocks
+  - clock-names
+  - dmas
+  - dma-names
+  - "#sound-dai-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    spdif@70002400 {
+        compatible = "nvidia,tegra20-spdif";
+        reg = <0x70002400 0x200>;
+        interrupts = <77>;
+        clocks = <&tegra_car99>, <&tegra_car 98>;
+        clock-names = "spdif_out", "spdif_in";
+        resets = <&tegra_car 10>;
+        dmas = <&apbdma 3>, <&apbdma 3>;
+        dma-names = "rx", "tx";
+        #sound-dai-cells = <0>;
+    };
+
+...
-- 
2.33.1

