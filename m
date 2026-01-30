Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FF1303A3B
	for <linux-tegra@vger.kernel.org>; Fri, 30 Jan 2026 13:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769780101; cv=none; b=IDaSPF3RXzKS3W7d53RJIdfrKpE3zz4IR5IscmENSQ+wniJlb3xo64sU7cXfShrdVSTsmDT8hzElKBI1xSMWXCJ9d4KVE6/EpdI09eD6k01BrNTHMb/zGOwTmdo+/B6RPCgXbFVcSU75uRSmfvNDwa0SB5r4KU75m9s+kxXTKAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769780101; c=relaxed/simple;
	bh=E50Z0kZ8QEC/+gID4A4p9F54kc2DuevigG1LcHQ1FUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o53H8JYLManpk1m1BtHQVyhGV/HtoqnbiYCc4sVm2bMcKUFYvYC3io18eEwFqAitMJAXc83Ji1IQbFP5/ubPpp3DvVE74Eg7jyX+UXmlg2OFm47B59Y5GEWvq3E0x/tvKky7iZ3/od5ZIqdw+P53rUzU1unEdRjfR6yRPYp8D24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P0WJDHqW; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P0WJDHqW"
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-4359249bbacso2051793f8f.0
        for <linux-tegra@vger.kernel.org>; Fri, 30 Jan 2026 05:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769780095; x=1770384895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CDk6pvEbCDbKFm0MEs5hS5v1vRZPcd+sQDBn0D1BQXQ=;
        b=P0WJDHqWGnYnB3jZNkeY8R2g9r0jVnSA7XXv9FUVti86QLM1uWm3H0E+eK05IUfeuo
         bqXVxEIrvP57n+iDki1shcVVbe4xe37pAqMT5YwZP3sQcXZtT3JZLASyI9+8IdDn8IKW
         i00eDnwjl8dnl6Iy6zG6hzEvkYxfhwZA4eDOQZ09NqHgRTq4OB8F0p0ISgsTftsQsouJ
         13VlFmn2DEmg5dwc27LIH+SugKoUu2UpH69xCTj3ovByw8IYEZuuwU6+knSabjuoYckd
         TQQcslb9vUxdfxWzlWqZp2fI5NXGvHOzACPAKYKTk8XelxtftIhtZi8H9qeLyxesSHOG
         2uXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769780095; x=1770384895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CDk6pvEbCDbKFm0MEs5hS5v1vRZPcd+sQDBn0D1BQXQ=;
        b=qcJcK3UlKkPCu1Q1kkgYJll6cv7Ro4V6ROk1QGDMv9lKFxXUdBtYTIPHWk47wkV9I3
         pr9dVOM2iyUI/qjHA7xEqX8zy0C2QPKoeQFG9VuSLCcwZ5dYK8fU6OJrv9a3IaS3vO/b
         FEa6Vj6mDfKKi1NVtF8kEcN5+yy3WV0iYgHgz8wlNExm8zkEoC7CavX61cPeU+tkuz0B
         iWUYATU+UrtSuSqiZg6OuSILbF8vRsTra1LN/nFj0nammhKwwT7rtvu/9Rx93R27GTHD
         yrhm9GgscUX7PLhUSc1lqHcIp7y7b0Abzan9MMT8dXmlKqTc2sbQml3lZmxGGBKgpiuJ
         eEJA==
X-Forwarded-Encrypted: i=1; AJvYcCUPNNteLe3UV+Q0AMfo4sgoGJbmcfT3yJuLAr3yrO6dJMKvGvqCa8sB8Bp26krSZrOAaE5xy/fp5q/n/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeGsYI6OsQK2QuZ4/u6Hk0ZsQZV3DGK2xO1I4pHA8Yad/7FHWl
	aU3N1F1VEooZVYUby/r6bkxIRWMjUySI8n0Ye0VP24wbeUC5YqK2NZyn
X-Gm-Gg: AZuq6aKHr0Ge3hDNHEJojAibKBZnOpgO4mfozpsDolPnFAdzSoBR/gR6wH3tMr+tbkt
	FWuyxeC9kzulhlxu7l5GAWSFslNgDJXDC3ouVs3pOqxSQRDwXmO/Gy3iF11yObSXLTXbCdrHZAu
	JerekVrhJ/FOLuXm7j/b1+x051kG6wEUoj1KTrvP7YPEAHZd2Fz61TrkLVwkFHIVwPQ/oVaOXqM
	cRQQiYApyzi0QnoDXDAqRc12aN62Z1IJKQUkZ0AtivpaVHVc42mnGvjE1liYIziw2G40KXtrKd/
	ao00O/hF357WhGhrChI6EMeIJO7FIr3y2g9FLLyPetI1vsAQxfTG56n6Kf8Mk5z3MHb5diK67CX
	+tBw6Qte5Jd7lkPY9MaTRvX5Hy7VRCsv9i4d79+VXBA/0xM0BoKdFlyLY1O8GuvifQdFL4pcos6
	NT
X-Received: by 2002:a05:6000:3105:b0:435:932e:f932 with SMTP id ffacd0b85a97d-435f429d77emr3966731f8f.7.1769780095157;
        Fri, 30 Jan 2026 05:34:55 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce93sm21536837f8f.24.2026.01.30.05.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 05:34:47 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/4] ASoC: dt-bindings: nvidia,tegra-audio: document WM8962 CODEC
Date: Fri, 30 Jan 2026 15:34:33 +0200
Message-ID: <20260130133434.353353-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260130133434.353353-1-clamor95@gmail.com>
References: <20260130133434.353353-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dt-binding for WM8962 CODEC.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../sound/nvidia,tegra-audio-wm8962.yaml      | 88 +++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8962.yaml

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8962.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8962.yaml
new file mode 100644
index 000000000000..2c3bf5a02a34
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8962.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-wm8962.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra audio complex with WM8962 CODEC
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+allOf:
+  - $ref: nvidia,tegra-audio-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - pattern: '^[a-z0-9]+,tegra-audio-wm8962(-[a-z0-9]+)+$'
+      - const: nvidia,tegra-audio-wm8962
+
+  nvidia,audio-routing:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description:
+      A list of the connections between audio components. Each entry is a
+      pair of strings, the first being the connection's sink, the second
+      being the connection's source. Valid names for sources and sinks are
+      the pins (documented in the binding document), and the jacks on the
+      board.
+    minItems: 2
+    items:
+      enum:
+        # Board Connectors
+        - Speakers
+        - Int Spk
+        - Earpiece
+        - Int Mic
+        - Headset Mic
+        - Internal Mic 1
+        - Internal Mic 2
+        - Headphone
+        - Headphones
+        - Headphone Jack
+        - Mic Jack
+
+        # CODEC Pins
+        - IN1L
+        - IN1R
+        - IN2L
+        - IN2R
+        - IN3L
+        - IN3R
+        - IN4L
+        - IN4R
+        - DMICDAT
+        - HPOUTL
+        - HPOUTR
+        - SPKOUT
+        - SPKOUTL
+        - SPKOUTR
+
+required:
+  - nvidia,i2s-controller
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra30-car.h>
+    #include <dt-bindings/soc/tegra-pmc.h>
+    sound {
+        compatible = "microsoft,tegra-audio-wm8962-surface-rt",
+                     "nvidia,tegra-audio-wm8962";
+        nvidia,model = "Microsoft Surface RT WM8962";
+
+        nvidia,audio-routing =
+                "Headphone Jack", "HPOUTR",
+                "Headphone Jack", "HPOUTL",
+                "Int Spk", "SPKOUTR",
+                "Int Spk", "SPKOUTL";
+
+        nvidia,i2s-controller = <&tegra_i2s1>;
+        nvidia,audio-codec = <&wm8962>;
+
+        clocks = <&tegra_car TEGRA30_CLK_PLL_A>,
+                 <&tegra_car TEGRA30_CLK_PLL_A_OUT0>,
+                 <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
+        clock-names = "pll_a", "pll_a_out0", "mclk";
+    };
-- 
2.51.0

