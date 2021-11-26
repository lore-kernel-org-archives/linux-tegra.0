Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8CB6C4332F
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Nov 2021 16:34:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350665AbhKZQhw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 26 Nov 2021 11:37:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378578AbhKZQfw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Nov 2021 11:35:52 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F49DC0613F7;
        Fri, 26 Nov 2021 08:19:41 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id 207so19669103ljf.10;
        Fri, 26 Nov 2021 08:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qK0ts7tSPXqbn+UV99/el3TluqWl3fnnOWodFc+vpkg=;
        b=Pmn0vtIlqSKEdyEV/mRDjpdG0O/iIE7rX0GbGsZ326iW9MdkgI+N5JaHDiQcV0ZmS9
         s4mpBHjz/7079fkGZPCvb2Vo0bI3spK0A3LWqDQ+dpdFVGntM/eWN9OoWOuyRTH+64B3
         IaHtf/9xA6SzLzmJjcZL++iKWiBokestwrBvJiNUVh4Yk9aYXyl6lPVkacuxZGZ/Bx/N
         bIoV6e8Le0wnz6SsRhMauxy7ArLSQrzlpxcv2FF4mP++cZ2c2pd0I+d3K7wMxTvetWbP
         U87t+R2UCkC04NPB0LqGKnYfFl9jL2UWUYLDxdyTg3RGEaqSxNumKFEA9qakcaeJmDae
         npbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qK0ts7tSPXqbn+UV99/el3TluqWl3fnnOWodFc+vpkg=;
        b=l+VTweO1M0Quck7BmL1mSNSYdcYoIfjCAgNaqlESMlCbhyXCjy8Pz2tdc8V0yogg9V
         wCR7LPvd39fF4ddhSgmbOAkwz3/xDTr6XhA1Op7nCMbBxlI9MfwX3FlD7X0Pd3V721v8
         qqG3bSWQiakBZvWRFWM+j0O8GX3dourQMpmo4dpTdNcqugQZCQcOSsNVpwb1Yr/fvEoO
         0fYtUxa6Ee9Km+M6a+Sqw/D36h0TTeisHhxPeq8Ru9dZ8eFUFtuLNdbsztd2Eev546+L
         U3kYGnNJl9JGLoopN7dsWbAkHP0WKeD3mbZ2B/3KB8BeJF7NG5LOb2DTroUtu7ael/RW
         1yeg==
X-Gm-Message-State: AOAM533KnUWF2k6DJ17/U8sXJtmqxmlN5pmtn5qzCmY+9qVmRH9L5lpO
        PMI7njgKy4Y15JOfNKZc21Y=
X-Google-Smtp-Source: ABdhPJxTJmcAap80hyd09S2lN6AlqNMLYeO32b48+fRf5WDQzP8DiYELFZORQcZMSD+wC0g73ko2fQ==
X-Received: by 2002:a2e:2a41:: with SMTP id q62mr30884162ljq.515.1637943579438;
        Fri, 26 Nov 2021 08:19:39 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.gmail.com with ESMTPSA id t7sm613381lfl.260.2021.11.26.08.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 08:19:38 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Agneli <poczt@protonmail.ch>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-tegra@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 01/20] ASoC: dt-bindings: Add binding for Tegra20 S/PDIF
Date:   Fri, 26 Nov 2021 19:17:48 +0300
Message-Id: <20211126161807.15776-2-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126161807.15776-1-digetx@gmail.com>
References: <20211126161807.15776-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add device-tree binding for Tegra20 S/PDIF controller.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/sound/nvidia,tegra20-spdif.yaml  | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra20-spdif.yaml

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra20-spdif.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra20-spdif.yaml
new file mode 100644
index 000000000000..00240205817d
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra20-spdif.yaml
@@ -0,0 +1,85 @@
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

