Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65568524B11
	for <linux-tegra@vger.kernel.org>; Thu, 15 Oct 2026 13:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792069617; cv=none; b=A8cz3iFXH2+68UhsBS3N6aHUd1ADaR9HfrKwLrc9UwJc5Z1QhZ/8bvroT/5DJUUxK6r13qt0EOFEjrNhyxbA5rJnftjU576NZ/15llzrJQ8zkGbiRQPJ+fpzkO0vBU5Nf22p/SA3BJ94v7HVeEK9WYTN75Xiap+ybSQTZq2LLew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792069617; c=relaxed/simple;
	bh=rwX/+G3nHAYFtl7fD6dlhoy2RvX0CF79K4bgIq+FETo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OW9dWgCYI7U8N67Z7XM3jcIDM/fZ4mNVz7ZVfCilijKD8ELk42hSLBQtMDoKzDAYWZLdFld1R+7PkpjiNN9IrKRcXD23lGBrYU+j7u2xZ6Z1SG4qKGWqr0gbBNOE0Rovb4h7HgurCXg7RSG+9wEH3QS/aU40IIxzt8ASbZ95GmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z+kvqb6o; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z+kvqb6o"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48df4f540ebso418633f8f.3
        for <linux-tegra@vger.kernel.org>; Thu, 15 Oct 2026 06:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792069612; x=1792674412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pH3e4fgrEI6gUzjW7plb0H5vxjenHgEIqDTN+4/sEJA=;
        b=Z+kvqb6oZ9MAVLJNnl7ndGyiOEgN6Nu3HU25/4IlNcb73Ke/JPZg8qk+jC0j41xZDy
         GHrme6odyfNaMctBOrfLpVpVXWDiuKKuS5hq0XJ1dJqrKSw5MyOD5yhjtF0rLQhgA8ER
         8VI5wd5QjKMTui0zNBh9ypGSTrADxPpemIuTFgUJLwoiWVZcYCUcsrO8a2yPiEIyrv4T
         NkWi5sFnKEwH7Xg5Ub2kyiYLjdgW25K70XfkP0eLgoL/nL1IgJzIklv1gXQM+bwJHsFp
         /JvghMu6boJ4e6DBoAYB4HtKO7eEBndFqAvBkeqt54lb2nMBI518/IiBxzVjflSdVKv/
         Tsqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792069612; x=1792674412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pH3e4fgrEI6gUzjW7plb0H5vxjenHgEIqDTN+4/sEJA=;
        b=0aypLtlLPHFCAwL0vmVZcxCu7jgnNk/VwwOiLIV5Z1eTq2x1iMRJhfKMWLfxDgt0V2
         TBIyq/babewVo6R052laJh+mJuGGD0psYZ6RVg1XuXz9hZ1P6v5fQsvdR+BV6/RLXo/S
         B87dvnhQ9r+30DH5qfihfF77HySnYIsE9CRtbWaN1Ua6zwQgc5P9lIGqFJcNdaMBkzkH
         acehE0s+vo4p7EpCyfPM+pHZE6BRczcichpiMVEJEXsXr4J9Gn8eJWzKvqk3ge7KJjPl
         ojYfpkNo6HO6B6lFBt3wbb6tGk8z5lvtqR7fppVjKB7CCoR3Q/iZsmS6MKY4c/9MZIhO
         WxyA==
X-Forwarded-Encrypted: i=1; AKwUvBzNt3QvRlvVyuQrGGll9ubVkVg0SpW93zjws136mRKK98Zm59/BoneF3QdppCxOLMBiI1yzykPMriIWgA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLXLqVaBeJ6ulNFIjBPSDNC3Ahmr5yvo21GocHNu6qaVpUnRdfr
	50e/YuEAahcD2GSBpXduLFef1Y3LKz9Zc/EN0JOSszPfKEA4jC66kCSs
X-Gm-Gg: AYBFou119AitQOz+4nveHK/Xf+1nCt7IIo7oFBXJ2KC8ZWj4Bv4shweU4/N47x8xFHe
	1Oy5ptEFO7GbaabPGGM57Qk8spHf/rHmgpak4NaArXXuvQcPJwRZIKZco/mbfCWGFHx1bViwvos
	e3bndRNnAxBl2BzaMNHFVNWiOBmpwZHm6jThjA7ywSG1fHeSL/0T/4rnbmXeiO/27wyB3sxOitK
	DmC3HgdY+6AxTgyVXTij/1lZPPmNGriEAsFznWnolDIYeTQca3+w8GsL0M81kw6ClT3DZWwcdkS
	1j7UkHoI5HbPkouGhPonL0EoTKjxi5TbfytrNVDjPliYS+Cn+m5/82eFz90ujMd2jiDuyW/y5fA
	Ejw1UCeRcAXNQUVgBTtmnU0GlHZJL5ECGtNJ1y20v4g7VLqW3MxZaj/Vk4HWReg/6aCV9rC2FHn
	YvSAga7CjT1nI8EQgO46dQRIEBM0smXBZwFckESTWD6PrhdvQieg7vIKuMAQ75Y2BvQBkYF6z+c
	WW5UtlLkK/kjNRPNhk=
X-Received: by 2002:a05:600c:4ec9:b0:4a1:8961:78dd with SMTP id 5b1f17b1804b1-4a18e4c9e46mr403458545e9.27.1792069611104;
        Thu, 15 Oct 2026 06:06:51 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9c001dsm67013005e9.12.2026.10.15.06.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 06:06:49 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] ASoC: dt-bindings: nvidia,tegra-audio: Consolidate all codec support into a single schema
Date: Thu, 15 Oct 2026 16:06:28 +0300
Message-ID: <20261015130628.184279-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015130628.184279-1-clamor95@gmail.com>
References: <20261015130628.184279-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The number of codecs supported by the NVIDIA Tegra audio complex is
increasing, which leads to an increasing number of bindings with minimal
changes. The main differences between codecs are the compatible strings
and possible pin configurations. With the introduction of auxiliary
devices, a definitive description of possible pin configurations becomes
nearly impossible.

Remove all existing per-codec schemas and consolidate everything into a
single schema. Compatibles are grouped into common codecs followed by
unique codecs, all sorted alphabetically. Added examples for each of the
common codecs and for each Tegra generation except Tegra114.

Schema check passes for all in-kernel Tegra device trees.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../sound/nvidia,tegra-audio-alc5632.yaml     |  74 ------
 .../sound/nvidia,tegra-audio-common.yaml      |  92 -------
 .../sound/nvidia,tegra-audio-complex.yaml     | 235 ++++++++++++++++++
 .../sound/nvidia,tegra-audio-cpcap.yaml       |  90 -------
 .../sound/nvidia,tegra-audio-max9808x.yaml    |  95 -------
 .../sound/nvidia,tegra-audio-max98090.yaml    |  97 --------
 .../sound/nvidia,tegra-audio-rt5631.yaml      |  85 -------
 .../sound/nvidia,tegra-audio-rt5640.yaml      |  84 -------
 .../sound/nvidia,tegra-audio-rt5677.yaml      | 100 --------
 .../sound/nvidia,tegra-audio-sgtl5000.yaml    |  67 -----
 .../sound/nvidia,tegra-audio-trimslice.yaml   |  33 ---
 .../sound/nvidia,tegra-audio-wm8753.yaml      |  79 ------
 .../sound/nvidia,tegra-audio-wm8903.yaml      |  93 -------
 .../sound/nvidia,tegra-audio-wm8962.yaml      |  88 -------
 .../sound/nvidia,tegra-audio-wm8994.yaml      | 110 --------
 .../sound/nvidia,tegra-audio-wm9712.yaml      |  76 ------
 16 files changed, 235 insertions(+), 1263 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-alc5632.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-common.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-complex.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-cpcap.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max9808x.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max98090.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5631.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5640.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5677.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-sgtl5000.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-trimslice.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8753.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8903.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8962.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8994.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm9712.yaml

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-alc5632.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-alc5632.yaml
deleted file mode 100644
index 96f2f927a6f59..0000000000000
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-alc5632.yaml
+++ /dev/null
@@ -1,74 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-alc5632.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: NVIDIA Tegra audio complex with ALC5632 CODEC
-
-maintainers:
-  - Jon Hunter <jonathanh@nvidia.com>
-  - Thierry Reding <thierry.reding@gmail.com>
-
-allOf:
-  - $ref: nvidia,tegra-audio-common.yaml#
-
-properties:
-  compatible:
-    items:
-      - pattern: '^[a-z0-9]+,tegra-audio-alc5632(-[a-z0-9]+)+$'
-      - const: nvidia,tegra-audio-alc5632
-
-  nvidia,audio-routing:
-    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
-    description: |
-      A list of the connections between audio components.
-      Each entry is a pair of strings, the first being the connection's sink,
-      the second being the connection's source. Valid names for sources and
-      sinks are the pins (documented in the binding document),
-      and the jacks on the board.
-    minItems: 2
-    items:
-      enum:
-        # Board Connectors
-        - Headset Stereophone
-        - Int Spk
-        - Headset Mic
-        - Digital Mic
-
-        # CODEC Pins
-        - SPKOUT
-        - SPKOUTN
-        - MICBIAS1
-        - MIC1
-        - HPR
-        - HPL
-        - DMICDAT
-
-required:
-  - nvidia,i2s-controller
-
-unevaluatedProperties: false
-
-examples:
-  - |
-    sound {
-        compatible = "nvidia,tegra-audio-alc5632-paz00",
-                     "nvidia,tegra-audio-alc5632";
-
-        nvidia,model = "Compal PAZ00";
-
-        nvidia,audio-routing = "Int Spk", "SPKOUT",
-                               "Int Spk", "SPKOUTN",
-                               "Headset Mic", "MICBIAS1",
-                               "MIC1", "Headset Mic",
-                               "Headset Stereophone", "HPR",
-                               "Headset Stereophone", "HPL",
-                               "DMICDAT", "Digital Mic";
-
-        nvidia,i2s-controller = <&i2s>;
-        nvidia,audio-codec = <&codec>;
-
-        clocks = <&clk 112>, <&clk 113>, <&clk 93>;
-        clock-names = "pll_a", "pll_a_out0", "mclk";
-    };
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-common.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-common.yaml
deleted file mode 100644
index 316806fc7346e..0000000000000
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-common.yaml
+++ /dev/null
@@ -1,92 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-common.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Common properties for NVIDIA Tegra audio complexes
-
-maintainers:
-  - Jon Hunter <jonathanh@nvidia.com>
-  - Thierry Reding <thierry.reding@gmail.com>
-
-properties:
-  clocks:
-    items:
-      - description: PLL A clock
-      - description: PLL A OUT0 clock
-      - description: The Tegra cdev1/extern1 clock, which feeds the card's mclk
-
-  clock-names:
-    items:
-      - const: pll_a
-      - const: pll_a_out0
-      - const: mclk
-
-  nvidia,model:
-    $ref: /schemas/types.yaml#/definitions/string
-    description: The user-visible name of this sound complex.
-
-  nvidia,audio-routing:
-    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
-    description: |
-      A list of the connections between audio components.
-      Each entry is a pair of strings, the first being the connection's sink,
-      the second being the connection's source. Valid names for sources and
-      sinks are the pins (documented in the binding document),
-      and the jacks on the board.
-
-  nvidia,ac97-controller:
-    $ref: /schemas/types.yaml#/definitions/phandle
-    description: The phandle of the AC97 controller
-
-  nvidia,i2s-controller:
-    $ref: /schemas/types.yaml#/definitions/phandle
-    description: The phandle of the Tegra I2S controller
-
-  nvidia,audio-codec:
-    $ref: /schemas/types.yaml#/definitions/phandle
-    description: The phandle of audio codec
-
-  nvidia,aux-devs:
-    $ref: /schemas/types.yaml#/definitions/phandle-array
-    description: List of phandles pointing to auxiliary devices,
-      such as amplifiers or dsp, to be added to the sound card.
-
-  nvidia,spkr-en-gpios:
-    maxItems: 1
-    description: The GPIO that enables the speakers
-
-  nvidia,hp-mute-gpios:
-    maxItems: 1
-    description: The GPIO that mutes the headphones
-
-  nvidia,hp-det-gpios:
-    maxItems: 1
-    description: The GPIO that detect headphones are plugged in
-
-  nvidia,mic-det-gpios:
-    maxItems: 1
-    description: The GPIO that detect microphone is plugged in
-
-  nvidia,ear-sel-gpios:
-    maxItems: 1
-    description: The GPIO that switch between the microphones
-
-  nvidia,int-mic-en-gpios:
-    maxItems: 1
-    description: The GPIO that enables the internal microphone
-
-  nvidia,ext-mic-en-gpios:
-    maxItems: 1
-    description: The GPIO that enables the external microphone
-
-  nvidia,headset:
-    type: boolean
-    description: The Mic Jack represents state of the headset microphone pin
-
-  nvidia,coupled-mic-hp-det:
-    type: boolean
-    description: The Mic detect GPIO is viable only if HP detect GPIO is active
-
-additionalProperties: true
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-complex.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-complex.yaml
new file mode 100644
index 0000000000000..d5506ff4a4c69
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-complex.yaml
@@ -0,0 +1,235 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-complex.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra audio complex
+
+maintainers:
+  - Jon Hunter <jonathanh@nvidia.com>
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - pattern: '^[a-z0-9]+,tegra-audio-max(98088|98089|98090)([-_][a-z0-9]+)+$'
+          - enum:
+              - nvidia,tegra-audio-max98088
+              - nvidia,tegra-audio-max98089
+              - nvidia,tegra-audio-max98090
+      - items:
+          - pattern: '^[a-z0-9]+,tegra-audio-rt(5631|5639|5640|5677)([-_][a-z0-9]+)+$'
+          - enum:
+              - nvidia,tegra-audio-rt5631
+              - nvidia,tegra-audio-rt5640
+              - nvidia,tegra-audio-rt5677
+      - items:
+          - pattern: '^[a-z0-9]+,tegra-audio-wm(8753|8903|8962|8994|9712)([-_][a-z0-9]+)+$'
+          - enum:
+              - nvidia,tegra-audio-wm8753
+              - nvidia,tegra-audio-wm8903
+              - nvidia,tegra-audio-wm8962
+              - nvidia,tegra-audio-wm8994
+              - nvidia,tegra-audio-wm9712
+      - items:
+          - pattern: '^[a-z0-9]+,tegra-audio-alc5632(-[a-z0-9]+)+$'
+          - const: nvidia,tegra-audio-alc5632
+      - items:
+          - pattern: '^motorola,tegra-audio-cpcap(-[a-z0-9]+)+$'
+          - const: nvidia,tegra-audio-cpcap
+      - items:
+          - pattern: '^nvidia,tegra-audio-max98090-nyan-(big|blaze)+$'
+          - const: nvidia,tegra-audio-max98090-nyan
+          - const: nvidia,tegra-audio-max98090
+      - items:
+          - pattern: '^[a-z0-9]+,tegra-audio-sgtl5000([-_][a-z0-9]+)+$'
+          - const: nvidia,tegra-audio-sgtl5000
+      - items:
+          const: nvidia,tegra-audio-trimslice
+      - items:
+          - pattern: ad,tegra-audio-plutux
+          - const: nvidia,tegra-audio-wm8903
+
+  clocks:
+    items:
+      - description: PLL A clock
+      - description: PLL A OUT0 clock
+      - description: The Tegra cdev1/extern1 clock, which feeds the card's mclk
+
+  clock-names:
+    items:
+      - const: pll_a
+      - const: pll_a_out0
+      - const: mclk
+
+  nvidia,model:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: The user-visible name of this sound complex.
+
+  nvidia,audio-routing:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description: |
+      A list of the connections between audio components.
+      Each entry is a pair of strings, the first being the connection's sink,
+      the second being the connection's source. Valid names for sources and
+      sinks are the codec pins and the jacks on the board.
+
+  nvidia,ac97-controller:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of the AC97 controller
+
+  nvidia,i2s-controller:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of the Tegra I2S controller
+
+  nvidia,audio-codec:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of audio codec
+
+  nvidia,aux-devs:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: List of phandles pointing to auxiliary devices,
+      such as amplifiers or dsp, to be added to the sound card.
+
+  nvidia,spkr-en-gpios:
+    maxItems: 1
+    description: The GPIO that enables the speakers
+
+  nvidia,hp-mute-gpios:
+    maxItems: 1
+    description: The GPIO that mutes the headphones
+
+  nvidia,hp-det-gpios:
+    maxItems: 1
+    description: The GPIO that detect headphones are plugged in
+
+  nvidia,mic-det-gpios:
+    maxItems: 1
+    description: The GPIO that detect microphone is plugged in
+
+  nvidia,ear-sel-gpios:
+    maxItems: 1
+    description: The GPIO that switch between the microphones
+
+  nvidia,int-mic-en-gpios:
+    maxItems: 1
+    description: The GPIO that enables the internal microphone
+
+  nvidia,ext-mic-en-gpios:
+    maxItems: 1
+    description: The GPIO that enables the external microphone
+
+  nvidia,headset:
+    type: boolean
+    description: The Mic Jack represents state of the headset microphone pin
+
+  nvidia,coupled-mic-hp-det:
+    type: boolean
+    description: The Mic detect GPIO is viable only if HP detect GPIO is active
+
+oneOf:
+  - required:
+      - nvidia,i2s-controller
+  - required:
+      - nvidia,ac97-controller
+
+additionalProperties: false
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
+  - |
+    #include <dt-bindings/clock/tegra30-car.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/soc/tegra-pmc.h>
+
+    sound {
+        compatible = "asus,tegra-audio-rt5631-tf700t",
+                     "nvidia,tegra-audio-rt5631";
+        nvidia,model = "Asus Transformer Infinity TF700T RT5631";
+
+        nvidia,audio-routing =
+                "Headphone Jack", "HPOL",
+                "Headphone Jack", "HPOR",
+                "Int Spk", "SPOL",
+                "Int Spk", "SPOR",
+                "MIC1", "MIC Bias1",
+                "MIC1", "DSP Analog Mic",
+                "DSP AMIC", "Mic Jack",
+                "DMIC", "DSP Digital Mic",
+                "DSP DMIC", "Int Mic";
+
+        nvidia,i2s-controller = <&tegra_i2s1>;
+        nvidia,audio-codec = <&rt5631>;
+        nvidia,aux-devs = <&fm34ne>;
+
+        nvidia,hp-det-gpios = <&gpio 178 GPIO_ACTIVE_LOW>;
+        nvidia,mic-det-gpios = <&gpio 186 GPIO_ACTIVE_LOW>;
+        nvidia,coupled-mic-hp-det;
+
+        clocks = <&tegra_car TEGRA30_CLK_PLL_A>,
+                 <&tegra_car TEGRA30_CLK_PLL_A_OUT0>,
+                 <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
+        clock-names = "pll_a", "pll_a_out0", "mclk";
+    };
+  - |
+    #include <dt-bindings/clock/tegra124-car.h>
+
+    sound {
+        compatible = "nvidia,tegra-audio-max98090-venice2",
+                     "nvidia,tegra-audio-max98090";
+        nvidia,model = "NVIDIA Tegra Venice2";
+
+        nvidia,audio-routing =
+                "Headphones", "HPR",
+                "Headphones", "HPL",
+                "Speakers", "SPKR",
+                "Speakers", "SPKL",
+                "Mic Jack", "MICBIAS",
+                "IN34", "Mic Jack";
+
+        nvidia,i2s-controller = <&tegra_i2s1>;
+        nvidia,audio-codec = <&acodec>;
+
+        clocks = <&tegra_car TEGRA124_CLK_PLL_A>,
+                 <&tegra_car TEGRA124_CLK_PLL_A_OUT0>,
+                 <&tegra_car TEGRA124_CLK_EXTERN1>;
+        clock-names = "pll_a", "pll_a_out0", "mclk";
+    };
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-cpcap.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-cpcap.yaml
deleted file mode 100644
index 69af2022d0fab..0000000000000
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-cpcap.yaml
+++ /dev/null
@@ -1,90 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-cpcap.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: NVIDIA Tegra audio complex with CPCAP CODEC
-
-maintainers:
-  - Svyatoslav Ryhel <clamor95@gmail.com>
-
-allOf:
-  - $ref: nvidia,tegra-audio-common.yaml#
-
-properties:
-  compatible:
-    items:
-      - pattern: '^motorola,tegra-audio-cpcap(-[a-z0-9]+)+$'
-      - const: nvidia,tegra-audio-cpcap
-
-  nvidia,audio-routing:
-    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
-    description:
-      A list of the connections between audio components. Each entry is a
-      pair of strings, the first being the connection's sink, the second
-      being the connection's source. Valid names for sources and sinks are
-      the pins (documented in the binding document), and the jacks on the
-      board.
-    minItems: 2
-    items:
-      enum:
-        # Board Connectors
-        - Speakers
-        - Int Spk
-        - Earpiece
-        - Int Mic
-        - Headset Mic
-        - Internal Mic 1
-        - Internal Mic 2
-        - Headphone
-        - Headphones
-        - Headphone Jack
-        - Mic Jack
-
-        # CODEC Pins
-        - MICR
-        - HSMIC
-        - EMUMIC
-        - MICL
-        - EXTR
-        - EXTL
-        - EP
-        - SPKR
-        - SPKL
-        - LINER
-        - LINEL
-        - HSR
-        - HSL
-        - EMUR
-        - EMUL
-
-unevaluatedProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/clock/tegra20-car.h>
-    #include <dt-bindings/soc/tegra-pmc.h>
-    sound {
-        compatible = "motorola,tegra-audio-cpcap-olympus",
-                     "nvidia,tegra-audio-cpcap";
-        nvidia,model = "Motorola Atrix 4G (MB860) CPCAP";
-
-        nvidia,audio-routing =
-                "Headphones", "HSR",
-                "Headphones", "HSL",
-                "Int Spk", "SPKR",
-                "Int Spk", "SPKL",
-                "Earpiece", "EP",
-                "HSMIC", "Mic Jack",
-                "MICR", "Internal Mic 1",
-                "MICL", "Internal Mic 2";
-
-        nvidia,i2s-controller = <&tegra_i2s1>;
-        nvidia,audio-codec = <&cpcap_audio>;
-
-        clocks = <&tegra_car TEGRA20_CLK_PLL_A>,
-                 <&tegra_car TEGRA20_CLK_PLL_A_OUT0>,
-                 <&tegra_car TEGRA20_CLK_CDEV1>;
-        clock-names = "pll_a", "pll_a_out0", "mclk";
-    };
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max9808x.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max9808x.yaml
deleted file mode 100644
index 4957645a8e035..0000000000000
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max9808x.yaml
+++ /dev/null
@@ -1,95 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-max9808x.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: NVIDIA Tegra audio complex with MAX9808x CODEC
-
-maintainers:
-  - Jon Hunter <jonathanh@nvidia.com>
-  - Thierry Reding <thierry.reding@gmail.com>
-
-allOf:
-  - $ref: nvidia,tegra-audio-common.yaml#
-
-properties:
-  compatible:
-    oneOf:
-      - items:
-          - pattern: '^[a-z0-9]+,tegra-audio-max98088(-[a-z0-9]+)+$'
-          - const: nvidia,tegra-audio-max98088
-      - items:
-          - pattern: '^[a-z0-9]+,tegra-audio-max98089(-[a-z0-9]+)+$'
-          - const: nvidia,tegra-audio-max98089
-
-  nvidia,audio-routing:
-    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
-    description: |
-      A list of the connections between audio components.
-      Each entry is a pair of strings, the first being the connection's sink,
-      the second being the connection's source. Valid names for sources and
-      sinks are the pins (documented in the binding document),
-      and the jacks on the board.
-    minItems: 2
-    items:
-      enum:
-        # Board Connectors
-        - Speakers
-        - Int Spk
-        - Headphone
-        - Headphones
-        - Headphone Jack
-        - Earpiece
-        - Headset Mic
-        - Mic Jack
-        - Int Mic
-        - Internal Mic 1
-        - Internal Mic 2
-
-        # CODEC Pins
-        - HPL
-        - HPR
-        - SPKL
-        - SPKR
-        - RECL
-        - RECR
-        - INA1
-        - INA2
-        - INB1
-        - INB2
-        - MIC1
-        - MIC2
-        - MICBIAS
-
-unevaluatedProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/clock/tegra30-car.h>
-    #include <dt-bindings/soc/tegra-pmc.h>
-    sound {
-        compatible = "lg,tegra-audio-max98089-p895",
-                     "nvidia,tegra-audio-max98089";
-        nvidia,model = "LG Optimus Vu MAX98089";
-
-        nvidia,audio-routing =
-            "Headphone Jack", "HPL",
-            "Headphone Jack", "HPR",
-            "Int Spk", "SPKL",
-            "Int Spk", "SPKR",
-            "Earpiece", "RECL",
-            "Earpiece", "RECR",
-            "INA1", "Headset Mic",
-            "MIC1", "MICBIAS",
-            "MICBIAS", "Internal Mic 1",
-            "MIC2", "Internal Mic 2";
-
-        nvidia,i2s-controller = <&tegra_i2s0>;
-        nvidia,audio-codec = <&codec>;
-
-        clocks = <&tegra_car TEGRA30_CLK_PLL_A>,
-                 <&tegra_car TEGRA30_CLK_PLL_A_OUT0>,
-                 <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
-        clock-names = "pll_a", "pll_a_out0", "mclk";
-    };
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max98090.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max98090.yaml
deleted file mode 100644
index 4d912458b18ba..0000000000000
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max98090.yaml
+++ /dev/null
@@ -1,97 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-max98090.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: NVIDIA Tegra audio complex with MAX98090 CODEC
-
-maintainers:
-  - Jon Hunter <jonathanh@nvidia.com>
-  - Thierry Reding <thierry.reding@gmail.com>
-
-allOf:
-  - $ref: nvidia,tegra-audio-common.yaml#
-
-properties:
-  compatible:
-    oneOf:
-      - items:
-          - pattern: '^[a-z0-9]+,tegra-audio-max98090(-[a-z0-9]+)+$'
-          - const: nvidia,tegra-audio-max98090
-      - items:
-          - enum:
-              - nvidia,tegra-audio-max98090-nyan-big
-              - nvidia,tegra-audio-max98090-nyan-blaze
-          - const: nvidia,tegra-audio-max98090-nyan
-          - const: nvidia,tegra-audio-max98090
-
-  nvidia,audio-routing:
-    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
-    description: |
-      A list of the connections between audio components.
-      Each entry is a pair of strings, the first being the connection's sink,
-      the second being the connection's source. Valid names for sources and
-      sinks are the pins (documented in the binding document),
-      and the jacks on the board.
-    minItems: 2
-    items:
-      enum:
-        # Board Connectors
-        - Headphones
-        - Speakers
-        - Mic Jack
-        - Int Mic
-
-        # CODEC Pins
-        - MIC1
-        - MIC2
-        - DMICL
-        - DMICR
-        - IN1
-        - IN2
-        - IN3
-        - IN4
-        - IN5
-        - IN6
-        - IN12
-        - IN34
-        - IN56
-        - HPL
-        - HPR
-        - SPKL
-        - SPKR
-        - RCVL
-        - RCVR
-        - MICBIAS
-
-required:
-  - nvidia,i2s-controller
-
-unevaluatedProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/clock/tegra124-car.h>
-
-    sound {
-        compatible = "nvidia,tegra-audio-max98090-venice2",
-                     "nvidia,tegra-audio-max98090";
-        nvidia,model = "NVIDIA Tegra Venice2";
-
-        nvidia,audio-routing =
-                "Headphones", "HPR",
-                "Headphones", "HPL",
-                "Speakers", "SPKR",
-                "Speakers", "SPKL",
-                "Mic Jack", "MICBIAS",
-                "IN34", "Mic Jack";
-
-        nvidia,i2s-controller = <&tegra_i2s1>;
-        nvidia,audio-codec = <&acodec>;
-
-        clocks = <&tegra_car TEGRA124_CLK_PLL_A>,
-                 <&tegra_car TEGRA124_CLK_PLL_A_OUT0>,
-                 <&tegra_car TEGRA124_CLK_EXTERN1>;
-        clock-names = "pll_a", "pll_a_out0", "mclk";
-    };
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5631.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5631.yaml
deleted file mode 100644
index 0c8067c3b0561..0000000000000
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5631.yaml
+++ /dev/null
@@ -1,85 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-rt5631.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: NVIDIA Tegra audio complex with RT5631 CODEC
-
-maintainers:
-  - Jon Hunter <jonathanh@nvidia.com>
-  - Thierry Reding <thierry.reding@gmail.com>
-
-allOf:
-  - $ref: nvidia,tegra-audio-common.yaml#
-
-properties:
-  compatible:
-    items:
-      - pattern: '^[a-z0-9]+,tegra-audio-rt5631(-[a-z0-9]+)+$'
-      - const: nvidia,tegra-audio-rt5631
-
-  nvidia,audio-routing:
-    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
-    description: |
-      A list of the connections between audio components.
-      Each entry is a pair of strings, the first being the connection's sink,
-      the second being the connection's source. Valid names for sources and
-      sinks are the pins (documented in the binding document),
-      and the jacks on the board.
-    minItems: 2
-    items:
-      enum:
-        # Board Connectors
-        - Int Spk
-        - Headphone Jack
-        - Mic Jack
-        - Int Mic
-
-        # CODEC Pins
-        - MIC1
-        - MIC2
-        - AXIL
-        - AXIR
-        - MONOIN_RXN
-        - MONOIN_RXP
-        - DMIC
-        - MIC Bias1
-        - MIC Bias2
-        - MONO_IN
-        - AUXO1
-        - AUXO2
-        - SPOL
-        - SPOR
-        - HPOL
-        - HPOR
-        - MONO
-
-unevaluatedProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/clock/tegra30-car.h>
-    #include <dt-bindings/soc/tegra-pmc.h>
-    sound {
-        compatible = "asus,tegra-audio-rt5631-tf700t",
-                     "nvidia,tegra-audio-rt5631";
-        nvidia,model = "Asus Transformer Infinity TF700T RT5631";
-
-        nvidia,audio-routing =
-                "Headphone Jack", "HPOL",
-                "Headphone Jack", "HPOR",
-                "Int Spk", "SPOL",
-                "Int Spk", "SPOR",
-                "MIC1", "MIC Bias1",
-                "MIC Bias1", "Mic Jack",
-                "DMIC", "Int Mic";
-
-        nvidia,i2s-controller = <&tegra_i2s1>;
-        nvidia,audio-codec = <&rt5631>;
-
-        clocks = <&tegra_car TEGRA30_CLK_PLL_A>,
-                 <&tegra_car TEGRA30_CLK_PLL_A_OUT0>,
-                 <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
-        clock-names = "pll_a", "pll_a_out0", "mclk";
-    };
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5640.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5640.yaml
deleted file mode 100644
index 2638592435b21..0000000000000
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5640.yaml
+++ /dev/null
@@ -1,84 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-rt5640.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: NVIDIA Tegra audio complex with RT5639 or RT5640 CODEC
-
-maintainers:
-  - Jon Hunter <jonathanh@nvidia.com>
-  - Thierry Reding <thierry.reding@gmail.com>
-
-allOf:
-  - $ref: nvidia,tegra-audio-common.yaml#
-
-properties:
-  compatible:
-    items:
-      - pattern: '^[a-z0-9]+,tegra-audio-rt56(39|40)(-[a-z0-9]+)+$'
-      - const: nvidia,tegra-audio-rt5640
-
-  nvidia,audio-routing:
-    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
-    description: |
-      A list of the connections between audio components.
-      Each entry is a pair of strings, the first being the connection's sink,
-      the second being the connection's source. Valid names for sources and
-      sinks are the pins (documented in the binding document),
-      and the jacks on the board.
-    minItems: 2
-    items:
-      enum:
-        # Board Connectors
-        - Headphones
-        - Speakers
-        - Mic Jack
-
-        # CODEC Pins
-        - DMIC1
-        - DMIC2
-        - MICBIAS1
-        - IN1P
-        - IN1R
-        - IN2P
-        - IN2R
-        - HPOL
-        - HPOR
-        - LOUTL
-        - LOUTR
-        - MONOP
-        - MONON
-        - SPOLP
-        - SPOLN
-        - SPORP
-        - SPORN
-
-required:
-  - nvidia,i2s-controller
-
-unevaluatedProperties: false
-
-examples:
-  - |
-    sound {
-        compatible = "nvidia,tegra-audio-rt5640-dalmore",
-                     "nvidia,tegra-audio-rt5640";
-        nvidia,model = "NVIDIA Tegra Dalmore";
-
-        nvidia,audio-routing =
-                "Headphones", "HPOR",
-                "Headphones", "HPOL",
-                "Speakers", "SPORP",
-                "Speakers", "SPORN",
-                "Speakers", "SPOLP",
-                "Speakers", "SPOLN";
-
-        nvidia,i2s-controller = <&tegra_i2s1>;
-        nvidia,audio-codec = <&rt5640>;
-
-        nvidia,hp-det-gpios = <&gpio 143 0>;
-
-        clocks = <&clk 216>, <&clk 217>, <&clk 120>;
-        clock-names = "pll_a", "pll_a_out0", "mclk";
-    };
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5677.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5677.yaml
deleted file mode 100644
index 09e1d0b18d276..0000000000000
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5677.yaml
+++ /dev/null
@@ -1,100 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-rt5677.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: NVIDIA Tegra audio complex with RT5677 CODEC
-
-maintainers:
-  - Jon Hunter <jonathanh@nvidia.com>
-  - Thierry Reding <thierry.reding@gmail.com>
-
-allOf:
-  - $ref: nvidia,tegra-audio-common.yaml#
-
-properties:
-  compatible:
-    items:
-      - pattern: '^[a-z0-9]+,tegra-audio-rt5677(-[a-z0-9]+)+$'
-      - const: nvidia,tegra-audio-rt5677
-
-  nvidia,audio-routing:
-    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
-    description: |
-      A list of the connections between audio components.
-      Each entry is a pair of strings, the first being the connection's sink,
-      the second being the connection's source. Valid names for sources and
-      sinks are the pins (documented in the binding document),
-      and the jacks on the board.
-    minItems: 2
-    items:
-      enum:
-        # Board Connectors
-        - Headphone
-        - Speaker
-        - Headset Mic
-        - Internal Mic 1
-        - Internal Mic 2
-
-        # CODEC Pins
-        - IN1P
-        - IN1N
-        - IN2P
-        - IN2N
-        - MICBIAS1
-        - DMIC1
-        - DMIC2
-        - DMIC3
-        - DMIC4
-        - DMIC L1
-        - DMIC L2
-        - DMIC L3
-        - DMIC L4
-        - DMIC R1
-        - DMIC R2
-        - DMIC R3
-        - DMIC R4
-        - LOUT1
-        - LOUT2
-        - LOUT3
-        - PDM1L
-        - PDM1R
-        - PDM2L
-        - PDM2R
-
-required:
-  - nvidia,i2s-controller
-
-unevaluatedProperties: false
-
-examples:
-  - |
-    sound {
-        compatible = "nvidia,tegra-audio-rt5677-ryu",
-                     "nvidia,tegra-audio-rt5677";
-        nvidia,model = "NVIDIA Tegra Ryu";
-
-        nvidia,audio-routing =
-                "Headphone", "LOUT2",
-                "Headphone", "LOUT1",
-                "Headset Mic", "MICBIAS1",
-                "IN1P", "Headset Mic",
-                "IN1N", "Headset Mic",
-                "DMIC L1", "Internal Mic 1",
-                "DMIC R1", "Internal Mic 1",
-                "DMIC L2", "Internal Mic 2",
-                "DMIC R2", "Internal Mic 2",
-                "Speaker", "PDM1L",
-                "Speaker", "PDM1R";
-
-        nvidia,i2s-controller = <&tegra_i2s1>;
-        nvidia,audio-codec = <&rt5677>;
-
-        nvidia,hp-det-gpios = <&gpio 143 0>;
-
-        clocks = <&clk 216>,
-                 <&clk 217>,
-                 <&clk 121>;
-        clock-names = "pll_a", "pll_a_out0", "mclk";
-    };
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-sgtl5000.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-sgtl5000.yaml
deleted file mode 100644
index e5bc6a6ade246..0000000000000
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-sgtl5000.yaml
+++ /dev/null
@@ -1,67 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-sgtl5000.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: NVIDIA Tegra audio complex with SGTL5000 CODEC
-
-maintainers:
-  - Jon Hunter <jonathanh@nvidia.com>
-  - Thierry Reding <thierry.reding@gmail.com>
-
-allOf:
-  - $ref: nvidia,tegra-audio-common.yaml#
-
-properties:
-  compatible:
-    items:
-      - pattern: '^[a-z0-9]+,tegra-audio-sgtl5000([-_][a-z0-9]+)+$'
-      - const: nvidia,tegra-audio-sgtl5000
-
-  nvidia,audio-routing:
-    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
-    description: |
-      A list of the connections between audio components.
-      Each entry is a pair of strings, the first being the connection's sink,
-      the second being the connection's source. Valid names for sources and
-      sinks are the pins (documented in the binding document),
-      and the jacks on the board.
-    minItems: 2
-    items:
-      enum:
-        # Board Connectors
-        - Headphone Jack
-        - Line In Jack
-        - Mic Jack
-
-        # CODEC Pins
-        - HP_OUT
-        - LINE_OUT
-        - LINE_IN
-        - MIC_IN
-
-required:
-  - nvidia,i2s-controller
-
-unevaluatedProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/clock/tegra30-car.h>
-
-    sound {
-      compatible = "toradex,tegra-audio-sgtl5000-apalis_t30",
-                   "nvidia,tegra-audio-sgtl5000";
-      nvidia,model = "Toradex Apalis T30 SGTL5000";
-      nvidia,audio-routing =
-              "Headphone Jack", "HP_OUT",
-              "LINE_IN", "Line In Jack",
-              "MIC_IN", "Mic Jack";
-      nvidia,i2s-controller = <&tegra_i2s2>;
-      nvidia,audio-codec = <&codec>;
-      clocks = <&tegra_car TEGRA30_CLK_PLL_A>,
-               <&tegra_car TEGRA30_CLK_PLL_A_OUT0>,
-               <&tegra_car TEGRA30_CLK_EXTERN1>;
-      clock-names = "pll_a", "pll_a_out0", "mclk";
-    };
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-trimslice.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-trimslice.yaml
deleted file mode 100644
index 8c87cd166238f..0000000000000
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-trimslice.yaml
+++ /dev/null
@@ -1,33 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-trimslice.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: NVIDIA Tegra audio complex with TrimSlice CODEC
-
-maintainers:
-  - Jon Hunter <jonathanh@nvidia.com>
-  - Thierry Reding <thierry.reding@gmail.com>
-
-allOf:
-  - $ref: nvidia,tegra-audio-common.yaml#
-
-properties:
-  compatible:
-    const: nvidia,tegra-audio-trimslice
-
-required:
-  - nvidia,i2s-controller
-
-unevaluatedProperties: false
-
-examples:
-  - |
-    sound {
-        compatible = "nvidia,tegra-audio-trimslice";
-        nvidia,i2s-controller = <&tegra_i2s1>;
-        nvidia,audio-codec = <&codec>;
-        clocks = <&tegra_car 112>, <&tegra_car 113>, <&tegra_car 93>;
-        clock-names = "pll_a", "pll_a_out0", "mclk";
-    };
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8753.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8753.yaml
deleted file mode 100644
index 3323d6a438f5c..0000000000000
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8753.yaml
+++ /dev/null
@@ -1,79 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-wm8753.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: NVIDIA Tegra audio complex with WM8753 CODEC
-
-maintainers:
-  - Jon Hunter <jonathanh@nvidia.com>
-  - Thierry Reding <thierry.reding@gmail.com>
-
-allOf:
-  - $ref: nvidia,tegra-audio-common.yaml#
-
-properties:
-  compatible:
-    items:
-      - pattern: '^[a-z0-9]+,tegra-audio-wm8753(-[a-z0-9]+)+$'
-      - const: nvidia,tegra-audio-wm8753
-
-  nvidia,audio-routing:
-    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
-    description: |
-      A list of the connections between audio components.
-      Each entry is a pair of strings, the first being the connection's sink,
-      the second being the connection's source. Valid names for sources and
-      sinks are the pins (documented in the binding document),
-      and the jacks on the board.
-    minItems: 2
-    items:
-      enum:
-        # Board Connectors
-        - Headphone Jack
-        - Mic Jack
-
-        # CODEC Pins
-        - LOUT1
-        - LOUT2
-        - ROUT1
-        - ROUT2
-        - MONO1
-        - MONO2
-        - OUT3
-        - OUT4
-        - LINE1
-        - LINE2
-        - RXP
-        - RXN
-        - ACIN
-        - ACOP
-        - MIC1N
-        - MIC1
-        - MIC2N
-        - MIC2
-        - Mic Bias
-
-required:
-  - nvidia,i2s-controller
-
-unevaluatedProperties: false
-
-examples:
-  - |
-    sound {
-        compatible = "nvidia,tegra-audio-wm8753-whistler",
-                     "nvidia,tegra-audio-wm8753";
-        nvidia,model = "tegra-wm8753-harmony";
-
-        nvidia,audio-routing =
-                "Headphone Jack", "LOUT1",
-                "Headphone Jack", "ROUT1";
-
-        nvidia,i2s-controller = <&i2s1>;
-        nvidia,audio-codec = <&wm8753>;
-
-        clocks = <&clk 112>, <&clk 113>, <&clk 93>;
-        clock-names = "pll_a", "pll_a_out0", "mclk";
-    };
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8903.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8903.yaml
deleted file mode 100644
index 1be25ce4514b7..0000000000000
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8903.yaml
+++ /dev/null
@@ -1,93 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-wm8903.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: NVIDIA Tegra audio complex with WM8903 CODEC
-
-maintainers:
-  - Jon Hunter <jonathanh@nvidia.com>
-  - Thierry Reding <thierry.reding@gmail.com>
-
-allOf:
-  - $ref: nvidia,tegra-audio-common.yaml#
-
-properties:
-  compatible:
-    oneOf:
-      - items:
-          - pattern: '^[a-z0-9]+,tegra-audio-wm8903(-[a-z0-9]+)+$'
-          - const: nvidia,tegra-audio-wm8903
-      - items:
-          - pattern: ad,tegra-audio-plutux
-          - const: nvidia,tegra-audio-wm8903
-
-  nvidia,audio-routing:
-    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
-    description: |
-      A list of the connections between audio components.
-      Each entry is a pair of strings, the first being the connection's sink,
-      the second being the connection's source. Valid names for sources and
-      sinks are the pins (documented in the binding document),
-      and the jacks on the board.
-    minItems: 2
-    items:
-      enum:
-        # Board Connectors
-        - Headphone Jack
-        - Int Spk
-        - Mic Jack
-        - Int Mic
-
-        # CODEC Pins
-        - IN1L
-        - IN1R
-        - IN2L
-        - IN2R
-        - IN3L
-        - IN3R
-        - DMICDAT
-        - HPOUTL
-        - HPOUTR
-        - LINEOUTL
-        - LINEOUTR
-        - LOP
-        - LON
-        - ROP
-        - RON
-        - MICBIAS
-
-required:
-  - nvidia,i2s-controller
-
-unevaluatedProperties: false
-
-examples:
-  - |
-    sound {
-        compatible = "nvidia,tegra-audio-wm8903-harmony",
-                     "nvidia,tegra-audio-wm8903";
-        nvidia,model = "tegra-wm8903-harmony";
-
-        nvidia,audio-routing =
-                "Headphone Jack", "HPOUTR",
-                "Headphone Jack", "HPOUTL",
-                "Int Spk", "ROP",
-                "Int Spk", "RON",
-                "Int Spk", "LOP",
-                "Int Spk", "LON",
-                "Mic Jack", "MICBIAS",
-                "IN1L", "Mic Jack";
-
-        nvidia,i2s-controller = <&i2s1>;
-        nvidia,audio-codec = <&wm8903>;
-
-        nvidia,spkr-en-gpios = <&codec 2 0>;
-        nvidia,hp-det-gpios = <&gpio 178 0>;
-        nvidia,int-mic-en-gpios = <&gpio 184 0>;
-        nvidia,ext-mic-en-gpios = <&gpio 185 0>;
-
-        clocks = <&clk 112>, <&clk 113>, <&clk 93>;
-        clock-names = "pll_a", "pll_a_out0", "mclk";
-    };
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8962.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8962.yaml
deleted file mode 100644
index 2c3bf5a02a34f..0000000000000
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8962.yaml
+++ /dev/null
@@ -1,88 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-wm8962.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: NVIDIA Tegra audio complex with WM8962 CODEC
-
-maintainers:
-  - Svyatoslav Ryhel <clamor95@gmail.com>
-
-allOf:
-  - $ref: nvidia,tegra-audio-common.yaml#
-
-properties:
-  compatible:
-    items:
-      - pattern: '^[a-z0-9]+,tegra-audio-wm8962(-[a-z0-9]+)+$'
-      - const: nvidia,tegra-audio-wm8962
-
-  nvidia,audio-routing:
-    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
-    description:
-      A list of the connections between audio components. Each entry is a
-      pair of strings, the first being the connection's sink, the second
-      being the connection's source. Valid names for sources and sinks are
-      the pins (documented in the binding document), and the jacks on the
-      board.
-    minItems: 2
-    items:
-      enum:
-        # Board Connectors
-        - Speakers
-        - Int Spk
-        - Earpiece
-        - Int Mic
-        - Headset Mic
-        - Internal Mic 1
-        - Internal Mic 2
-        - Headphone
-        - Headphones
-        - Headphone Jack
-        - Mic Jack
-
-        # CODEC Pins
-        - IN1L
-        - IN1R
-        - IN2L
-        - IN2R
-        - IN3L
-        - IN3R
-        - IN4L
-        - IN4R
-        - DMICDAT
-        - HPOUTL
-        - HPOUTR
-        - SPKOUT
-        - SPKOUTL
-        - SPKOUTR
-
-required:
-  - nvidia,i2s-controller
-
-unevaluatedProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/clock/tegra30-car.h>
-    #include <dt-bindings/soc/tegra-pmc.h>
-    sound {
-        compatible = "microsoft,tegra-audio-wm8962-surface-rt",
-                     "nvidia,tegra-audio-wm8962";
-        nvidia,model = "Microsoft Surface RT WM8962";
-
-        nvidia,audio-routing =
-                "Headphone Jack", "HPOUTR",
-                "Headphone Jack", "HPOUTL",
-                "Int Spk", "SPKOUTR",
-                "Int Spk", "SPKOUTL";
-
-        nvidia,i2s-controller = <&tegra_i2s1>;
-        nvidia,audio-codec = <&wm8962>;
-
-        clocks = <&tegra_car TEGRA30_CLK_PLL_A>,
-                 <&tegra_car TEGRA30_CLK_PLL_A_OUT0>,
-                 <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
-        clock-names = "pll_a", "pll_a_out0", "mclk";
-    };
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8994.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8994.yaml
deleted file mode 100644
index d2c317f831ced..0000000000000
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8994.yaml
+++ /dev/null
@@ -1,110 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-wm8994.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: NVIDIA Tegra audio complex with WM8994 CODEC
-
-maintainers:
-  - Svyatoslav Ryhel <clamor95@gmail.com>
-
-allOf:
-  - $ref: nvidia,tegra-audio-common.yaml#
-
-properties:
-  compatible:
-    items:
-      - pattern: '^[a-z0-9]+,tegra-audio-wm8994(-[a-z0-9]+)+$'
-      - const: nvidia,tegra-audio-wm8994
-
-  nvidia,audio-routing:
-    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
-    description: |
-      A list of the connections between audio components.
-      Each entry is a pair of strings, the first being the connection's sink,
-      the second being the connection's source. Valid names for sources and
-      sinks are the pins (documented in the binding document),
-      and the jacks on the board.
-    minItems: 2
-    items:
-      enum:
-        # Board Connectors
-        - Headphone Jack
-        - Int Spk
-        - Earpiece
-        - Line Out
-        - Mic Jack
-        - Int Mic
-        - Internal Mic 1
-        - Internal Mic 2
-        - FM Radio
-
-        # CODEC Pins
-        - SPKOUTLP
-        - SPKOUTLN
-        - SPKOUTRP
-        - SPKOUTRN
-        - HPOUT1L
-        - HPOUT1R
-        - HPOUT2P
-        - HPOUT2N
-        - LINEOUT1P
-        - LINEOUT1N
-        - LINEOUT2P
-        - LINEOUT2N
-        - IN1LN
-        - IN1LP
-        - IN2LN
-        - IN2LP:VXRN
-        - IN1RN
-        - IN1RP
-        - IN2RN
-        - IN2RP:VXRP
-        - DMIC1DAT
-        - DMIC2DAT
-        - MICBIAS1
-        - MICBIAS2
-
-required:
-  - nvidia,i2s-controller
-
-unevaluatedProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/clock/tegra20-car.h>
-    #include <dt-bindings/gpio/gpio.h>
-
-    sound {
-        compatible = "lg,tegra-audio-wm8994-star",
-                     "nvidia,tegra-audio-wm8994";
-        nvidia,model = "LG Optimus 2X WM8994";
-
-        nvidia,audio-routing =
-                "Headphone Jack", "HPOUT1L",
-                "Headphone Jack", "HPOUT1R",
-                "Int Spk", "SPKOUTLN",
-                "Int Spk", "SPKOUTLP",
-                "Earpiece", "HPOUT2N",
-                "Earpiece", "HPOUT2P",
-                "IN2RN", "MICBIAS2",
-                "IN2RN", "Mic Jack",
-                "IN1LN", "MICBIAS1",
-                "IN1LN", "Internal Mic 1",
-                "IN1RN", "MICBIAS1",
-                "IN1RN", "Internal Mic 2";
-
-        nvidia,i2s-controller = <&tegra_i2s1>;
-        nvidia,audio-codec = <&wm8994>;
-
-        nvidia,hp-det-gpios = <&gpio 51 GPIO_ACTIVE_HIGH>;
-        nvidia,mic-det-gpios = <&gpio 27 GPIO_ACTIVE_HIGH>;
-        nvidia,ext-mic-en-gpios = <&gpio 57 GPIO_ACTIVE_HIGH>;
-        nvidia,coupled-mic-hp-det;
-
-        clocks = <&tegra_car TEGRA20_CLK_PLL_A>,
-                 <&tegra_car TEGRA20_CLK_PLL_A_OUT0>,
-                 <&tegra_car TEGRA20_CLK_CDEV1>;
-        clock-names = "pll_a", "pll_a_out0", "mclk";
-    };
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm9712.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm9712.yaml
deleted file mode 100644
index 397306b8800d4..0000000000000
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm9712.yaml
+++ /dev/null
@@ -1,76 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-wm9712.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: NVIDIA Tegra audio complex with WM9712 CODEC
-
-maintainers:
-  - Jon Hunter <jonathanh@nvidia.com>
-  - Thierry Reding <thierry.reding@gmail.com>
-
-allOf:
-  - $ref: nvidia,tegra-audio-common.yaml#
-
-properties:
-  compatible:
-    items:
-      - pattern: '^[a-z0-9]+,tegra-audio-wm9712([-_][a-z0-9]+)+$'
-      - const: nvidia,tegra-audio-wm9712
-
-  nvidia,audio-routing:
-    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
-    description: |
-      A list of the connections between audio components.
-      Each entry is a pair of strings, the first being the connection's sink,
-      the second being the connection's source. Valid names for sources and
-      sinks are the pins (documented in the binding document),
-      and the jacks on the board.
-    minItems: 2
-    items:
-      enum:
-        # Board Connectors
-        - Headphone
-        - LineIn
-        - Mic
-
-        # CODEC Pins
-        - MONOOUT
-        - HPOUTL
-        - HPOUTR
-        - LOUT2
-        - ROUT2
-        - OUT3
-        - LINEINL
-        - LINEINR
-        - PHONE
-        - PCBEEP
-        - MIC1
-        - MIC2
-        - Mic Bias
-
-required:
-  - nvidia,ac97-controller
-
-unevaluatedProperties: false
-
-examples:
-  - |
-    sound {
-        compatible = "nvidia,tegra-audio-wm9712-colibri_t20",
-                     "nvidia,tegra-audio-wm9712";
-        nvidia,model = "Toradex Colibri T20";
-
-        nvidia,audio-routing =
-                "Headphone", "HPOUTL",
-                "Headphone", "HPOUTR",
-                "LineIn", "LINEINL",
-                "LineIn", "LINEINR",
-                "Mic", "MIC1";
-
-        nvidia,ac97-controller = <&ac97>;
-
-        clocks = <&clk 112>, <&clk 113>, <&clk 93>;
-        clock-names = "pll_a", "pll_a_out0", "mclk";
-    };
-- 
2.53.0

