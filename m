Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CB53EF0D4
	for <linux-tegra@vger.kernel.org>; Fri,  6 Feb 2026 17:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770399280; cv=none; b=Vc0Y4UJGAVHjda6W2tsjA0/JXX1gf5VDMgpGcgq7E343v7Rp5V7xre5rpIBJtdd4G8G+tkbW2sEh4kLYk+Ew4tYsbM+2XEMrB9fQiOeVkaHUA9+HRnHPw9H1Wizgkb9NdDdIIgk4pcPwCa/y9Mf8c/v8OVtzvdMQMO9nTkJ+3Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770399280; c=relaxed/simple;
	bh=tT4egkhAh/4FJlYjxvVmOIEurMTvY9gcIWgBMYTPX9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oEKnqrmFzA9jn/SzJsa5cSF2ljfPZ9pbk0WkR5pTgJNSGtXiyEZgqliKDE/QY1tu8KdjwQyk+RJ21sjXB1bKAKBXw7vwOF1kEwumJNO3I7+UBn0UcDjmicFIs26zfJRJTtAoMEnAFckCQE9eq9X1daoikWMSRACR2+pMNNFSdBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hJFtEl6x; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hJFtEl6x"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-4805ef35864so21038215e9.0
        for <linux-tegra@vger.kernel.org>; Fri, 06 Feb 2026 09:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770399278; x=1771004078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kF1hhqYZPeYTY+vJ3xTMx17h8TLzRw6tKr0GpQ4bJnw=;
        b=hJFtEl6xfrQ2/cNaRZIZABNmoMqTD2SLl3r35x3WiN1L3+sqYWiFb8+vOv8qYPyrlV
         iORAqPKpc6gf7+zCQhX1EYjUCszDOMslrXkL03mG8n1NuF38FNjwGZq7QlmkJhwQlpZx
         U2tJ/J2Xn7h0gwifWjUHHsOXhPPMuv8M8fxCQq5C+ns6jlQTLgJlVevF0VHelpHqg0Yq
         i4P2rnjh6yMpon/6hmBcedPC1KK+ufC8GagUlS4FEWmsFJifEUIo0/UigFJ2A/yAOYgu
         arYSw7qVWa78ayal3S37fXV9fVap3yviKFsrmEP05E27dateN/f/K2EuK1cJL6pLTTA3
         uykA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770399278; x=1771004078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kF1hhqYZPeYTY+vJ3xTMx17h8TLzRw6tKr0GpQ4bJnw=;
        b=wgbrYbPqjAM50MTELJZMuuMB4+8Rjbdsb/XtBvx1xmcnHq2d9JuhHW6DF41omUZpDv
         2xY08PHxXhCVV0kEKtrqk4a/pHFLqNMUARTWS4GVWd/Y4q095FAsLtqg2cotTY44AUbr
         2q5W/fo3+wpWuq1fArpPUmGorykCXrplNiOW0N+zIYcJtdxZmSY9NIDwZSRcxCYyrcXs
         ntnKQbh1by34NWhHC26TRhTLySrjNJmKHvUOc9+6MaWgr8Ab1LOAghwp0955ohf0m/CR
         ac/3tlM9oU5R78sauDiE+2Y1YtXdK4oJFgkAg6u1VK2Vny+py0GfU3pJCoh2LWDL1vzc
         dECA==
X-Forwarded-Encrypted: i=1; AJvYcCUUtuR07Tc2cyrnFBQ2Vavl4WYpLO9ZqiHN4R4x5MpxwP7zqQNWIdMBbzyREqUllTkP9UncV0ouAPAcbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGYvuSJ5clCOuYmuG7rcaR56umySND6/NMaTYoY0WHZ4vJpSVO
	84wK/3tmfre1eIyS/aOnGbnxV731KnbOtGb8XXYflTbg9b4UhC/3cgoo
X-Gm-Gg: AZuq6aI0Yt1pdi5Kl0pbq5Znl5x/c6uBzYwTeR6z/GevXOVjXEOzA3GxkIdDLisUVyi
	irg56QgvdeCq61+hsJr4mdV43hSsGeFluvky4U1LqMsO27kNEpG9bicMPfh6s+rl3o+hddizXlQ
	Ti1iJoJLK5lAhz1QV8wSV2+Rb2rHLViuKaqkGgDvRgeJZsbu26c+H+ITnay8jWQUe2iSd9D9vxf
	hUnemmU0BLx2Bp30D0qbCFWH7og8hAHrO7VwtLop68jBhzReMq00TEpCWtQflH34l07tTTN+hp/
	T2IfPxCdo6bzQsr4n364fw2SSQYNhDSnM1Tq7hdziJ79ercn/NC9STJNkMCcgO7RHFODiEQa1dK
	0PzkR+6fBBuQzF0Ip/pmdsoZiZAZxJfuhRLhS0BEoaTCyAs1jJXAAFGOohAqK1rUyk5a7Hu1jo7
	0mcwUDDrEMKL8=
X-Received: by 2002:a05:600c:a08:b0:480:4d37:e742 with SMTP id 5b1f17b1804b1-483201dd276mr48259315e9.10.1770399278112;
        Fri, 06 Feb 2026 09:34:38 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296bd4a1sm7454523f8f.17.2026.02.06.09.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 09:34:37 -0800 (PST)
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
Subject: [PATCH v2 1/5] ASoC: dt-bindings: nvidia,tegra-audio: document CPCAP CODEC
Date: Fri,  6 Feb 2026 19:34:18 +0200
Message-ID: <20260206173423.145954-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260206173423.145954-1-clamor95@gmail.com>
References: <20260206173423.145954-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dt-binding for CPCAP CODEC.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../sound/nvidia,tegra-audio-cpcap.yaml       | 90 +++++++++++++++++++
 1 file changed, 90 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-cpcap.yaml

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-cpcap.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-cpcap.yaml
new file mode 100644
index 000000000000..5335fa56fb3c
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-cpcap.yaml
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-cpcap.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra audio complex with CPCAP CODEC
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
+      - pattern: '^[a-z0-9]+,tegra-audio-cpcap(-[a-z0-9]+)+$'
+      - const: nvidia,tegra-audio-cpcap
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
+        - MICR
+        - HSMIC
+        - EMUMIC
+        - MICL
+        - EXTR
+        - EXTL
+        - EP
+        - SPKR
+        - SPKL
+        - LINER
+        - LINEL
+        - HSR
+        - HSL
+        - EMUR
+        - EMUL
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra20-car.h>
+    #include <dt-bindings/soc/tegra-pmc.h>
+    sound {
+        compatible = "motorola,tegra-audio-cpcap-mot",
+                     "nvidia,tegra-audio-cpcap";
+        nvidia,model = "Motorola Atrix 4G (MB860) CPCAP";
+
+        nvidia,audio-routing =
+                "Headphones", "HSR",
+                "Headphones", "HSL",
+                "Int Spk", "SPKR",
+                "Int Spk", "SPKL",
+                "Earpiece", "EP",
+                "HSMIC", "Mic Jack",
+                "MICR", "Internal Mic 1",
+                "MICL", "Internal Mic 2";
+
+        nvidia,i2s-controller = <&tegra_i2s1>;
+        nvidia,audio-codec = <&cpcap_audio>;
+
+        clocks = <&tegra_car TEGRA20_CLK_PLL_A>,
+                 <&tegra_car TEGRA20_CLK_PLL_A_OUT0>,
+                 <&tegra_car TEGRA20_CLK_CDEV1>;
+        clock-names = "pll_a", "pll_a_out0", "mclk";
+    };
-- 
2.51.0

