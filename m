Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E0549AA2E
	for <linux-tegra@vger.kernel.org>; Tue, 13 Oct 2026 18:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791916362; cv=none; b=DZvvRsyLlikblR3XGbDvPLB5jxeKP3iag9nCKXvgsHikTAj9sHWCj3dytjz3Fw2uIw5vkK16/FPOhWEZMFEGPpNlIEDQFOVdOagdeb98dzlTuUSpQk00cO3B2Mxn3ZlfntVwhBcyihQznULgya/etXqg46yr7UuK6G0g4C1i6gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791916362; c=relaxed/simple;
	bh=sRh2h9zB1an4fHHdjoUBYWc1yZ5+jD2WIHwZzPaCqjM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J/pw5rewdfqcImDpqvwYVg+syGSeVVEtieddzX2X0MjtrlHqSv/LgWgWnB+DKVPmuJsupkaTfwuCgOPGP7xx8TMfYiOZHRkC70q5IqwKuIAmJbgTd2Y/EJdUCPVGPgUTI+cDo3YBb/QyGl8wcZdjU9FIv0k0BRTneMMsM0FL360=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fy+b4oJ8; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fy+b4oJ8"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a161d9b8c7so23374725e9.3
        for <linux-tegra@vger.kernel.org>; Tue, 13 Oct 2026 11:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791916358; x=1792521158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kREpI8m4G/QZhA7u4s2/uYr0oWTkEgsKQc7fRL7IuIU=;
        b=Fy+b4oJ8OF84+GRKg1LZS8p6A0387DQKq1ZTnr5UxFHmr6he2CmvuknxsCtvFLjy/u
         kEFT4tIdfvmZJ03+g9bzWdfG4SwSjw2lnrZJhPZWPBkjqfZpPgkawZD0jcHR59W3F6KD
         RMVYDZzOYfxdJysmh48D//1Qz7pvCpfBzro33L8roe/jZOQlMdZEI4OhY/LCIKjfcNc6
         zumA/cnOzY9GHLsITxBuYWT3IEa+CLIifjwWYzNBcgoTUfgYyQzR3/bVKb+tPd7wNrbm
         q4u6LUVxJ31iJ/w89bs23o2a53puFrfWbfckJjd1+OfrWyyr+vXJPsbfkFydUuOodXqX
         o5Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791916358; x=1792521158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kREpI8m4G/QZhA7u4s2/uYr0oWTkEgsKQc7fRL7IuIU=;
        b=qhxfEO6XiSBHSBvDlHP03prdUw7hv5D6WYDV1GyVWXLnrD8h9sWK5OAEPH5lsTwY5A
         0EzoxC5xCcDe/eK/GKwJek8+RjVjaZVpMojb4ZnuYy5oiVk/rO19AJEYBQJZw2WNojgq
         UnmZWEd8Gh8byRzSk5dFEQHOVkyFXlrfdI358FZCJtidNpNM4eJX7l7aYF0V5KrQnK/T
         CZZQGRV37yST3Vc07ubfdnSp5grNi2uh8zJDBUtM3+yXXgN5Uf8tXW/6NPel8R/kvv1d
         Aw0AXrYz1/MMdZQJySSb60+KbhGQmNBWZJfD0S1ev6U7sNpQwcQRGU/kjWAKntgbOlz4
         lC8Q==
X-Forwarded-Encrypted: i=1; AKwUvBw0dmHiDxVCyTHFT9MRB0TJ5ReSqRdVKkzd0bLHo5H7yq3REyEGeB4yGi6RksIuGdFMqktOJvhEPDLSdg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJLmGbKe/s1WNHOv5Jg8lSJ5jwL2kkZrwY9CsRjfHWk6aHfBCod
	WrKmSeXM2/yPU77+XBsB39Uzezewk/YwH5i3au2DT4cAC9W/l3wky6co
X-Gm-Gg: AYBFou3zzA4t8FbM6/knfqhGj2mnKqFVs1u77dHAoCx2NS6F1l3tyMm0QS7Gc5c0WQq
	7zoehHusH8lEueMiZPfwAQE8Zc3ImKsBMz3EgGNSTbmdM+V7YXsq0GQGgSGKoW2OhTD4UG4TPob
	y4HD7Qaz6aQB95CDTlagxJ5YuPDArK1qyqn4NfnZEDkarF/i1h8jbGIN+MD7SGn8KvZ3L137UYI
	WKKzOiElnmDfrHthr+20IDKu+vSk+fr3+jFLJzXMrT3PchZSSVzGBkw/CrXFHAIK+rW1tFFKOlw
	SPxQ2dj6yO3O7pEGS31Q1koTN1Y0IbnsY+irxqIemr3wSHyc/42osY9YLpwPSkaz2WPVtbLOcDI
	AWaULNl/9qpyyxTzjncDYF5c2/hroG9P85Aa+EK8Xwx2tV08oMCiQMg8o2ckQFnMUuiKE0Ko4yt
	f+tTZmbDe9rk1s7hDG1yZZew0qeM1o30gJMh1ZDCjgyCcF+eYgc/6fijUhTv9MRtQVwPqt2J1JJ
	nPS6FHvu5dIKBmGHRo=
X-Received: by 2002:a05:600c:548e:b0:4a0:1aa0:7cfa with SMTP id 5b1f17b1804b1-4a18e4aa724mr275921405e9.12.1791916358313;
        Tue, 13 Oct 2026 11:32:38 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bea0f1csm548921305e9.9.2026.10.13.11.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:32:37 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] ASoC: dt-bindings: nvidia,tegra-audio: document WM8994 CODEC
Date: Tue, 13 Oct 2026 21:32:25 +0300
Message-ID: <20261013183226.513658-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013183226.513658-1-clamor95@gmail.com>
References: <20261013183226.513658-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dt-binding for WM8994 CODEC.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../sound/nvidia,tegra-audio-wm8994.yaml      | 109 ++++++++++++++++++
 1 file changed, 109 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8994.yaml

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8994.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8994.yaml
new file mode 100644
index 0000000000000..3c9a055f5e4bd
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8994.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-wm8994.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra audio complex with WM8994 CODEC
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
+      - pattern: '^[a-z0-9]+,tegra-audio-wm8994(-[a-z0-9]+)+$'
+      - const: nvidia,tegra-audio-wm8994
+
+  nvidia,audio-routing:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description: |
+      A list of the connections between audio components.
+      Each entry is a pair of strings, the first being the connection's sink,
+      the second being the connection's source. Valid names for sources and
+      sinks are the pins (documented in the binding document),
+      and the jacks on the board.
+    minItems: 2
+    items:
+      enum:
+        # Board Connectors
+        - Headphone Jack
+        - Int Spk
+        - Earpiece
+        - Line Out
+        - Mic Jack
+        - Int Mic
+        - Internal Mic 1
+        - Internal Mic 2
+
+        # CODEC Pins
+        - SPKOUTLP
+        - SPKOUTLN
+        - SPKOUTRP
+        - SPKOUTRN
+        - HPOUT1L
+        - HPOUT1R
+        - HPOUT2P
+        - HPOUT2N
+        - LINEOUT1P
+        - LINEOUT1N
+        - LINEOUT2P
+        - LINEOUT2N
+        - IN1LN
+        - IN1LP
+        - IN2LN
+        - IN2LP:VXRN
+        - IN1RN
+        - IN1RP
+        - IN2RN
+        - IN2RP:VXRP
+        - DMIC1DAT
+        - DMIC2DAT
+        - MICBIAS1
+        - MICBIAS2
+
+required:
+  - nvidia,i2s-controller
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra20-car.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    sound {
+        compatible = "lg,tegra-audio-wm8994-star",
+                     "nvidia,tegra-audio-wm8994";
+        nvidia,model = "LG Optimus 2X WM8994";
+
+        nvidia,audio-routing =
+                "Headphone Jack", "HPOUT1L",
+                "Headphone Jack", "HPOUT1R",
+                "Int Spk", "SPKOUTLN",
+                "Int Spk", "SPKOUTLP",
+                "Earpiece", "HPOUT2N",
+                "Earpiece", "HPOUT2P",
+                "IN2RN", "MICBIAS2",
+                "IN2RN", "Mic Jack",
+                "IN1LN", "MICBIAS1",
+                "IN1LN", "Internal Mic 1",
+                "IN1RN", "MICBIAS1",
+                "IN1RN", "Internal Mic 2";
+
+        nvidia,i2s-controller = <&tegra_i2s1>;
+        nvidia,audio-codec = <&wm8994>;
+
+        nvidia,hp-det-gpios = <&gpio 51 GPIO_ACTIVE_HIGH>;
+        nvidia,mic-det-gpios = <&gpio 27 GPIO_ACTIVE_HIGH>;
+        nvidia,ext-mic-en-gpios = <&gpio 57 GPIO_ACTIVE_HIGH>;
+        nvidia,coupled-mic-hp-det;
+
+        clocks = <&tegra_car TEGRA20_CLK_PLL_A>,
+                 <&tegra_car TEGRA20_CLK_PLL_A_OUT0>,
+                 <&tegra_car TEGRA20_CLK_CDEV1>;
+        clock-names = "pll_a", "pll_a_out0", "mclk";
+    };
-- 
2.53.0

