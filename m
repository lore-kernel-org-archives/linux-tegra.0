Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958252F6594
	for <linux-tegra@vger.kernel.org>; Fri, 30 Jan 2026 13:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769780089; cv=none; b=bEzN+/lTwd+tJF3jX+KttUG7GLFzS7MSf3N2sLiqRCenecXV6f0xeVT14O+SM5rhd9Ie9cFPAESW0RhEIOOBs4JEznzpOPFS7353eNTsWvmhUcH031L/J/YEr/0db4F1+sXqyl4dyU+64aYFGUnRaHkPppTJmJXpqZab0ld4/uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769780089; c=relaxed/simple;
	bh=c0WSaIWh0GbMsdsZOfpY4fsWR+IwyVApzYh2Vgu5YlU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jq6yGtcbyisPdLFdKa0k5EE2m8oI6u5inPYWIyQFfcWjMBoRPHWqo8J0MxbGGtdwbQXJ0g2A+uSkGeyypjGPLNBvBZrymtbtgSyJAn8PMoskht7EiP5ntiVTotknNydJzU2frolyVmNTj0YuXMPB8V8lS6AbdNuACUV3Hb1Bvmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mr81r7pw; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mr81r7pw"
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-43591b55727so1866028f8f.3
        for <linux-tegra@vger.kernel.org>; Fri, 30 Jan 2026 05:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769780086; x=1770384886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AoCRYLFgaaOwIEgPrhUSNB9d+/cz6LVHg1Zx25jjT1E=;
        b=mr81r7pwnJKNFpLJcYKHJnwpihsXpmONgyOcHB248+4JfXCwJUcoziEv5N7o3KSral
         p3QwuJvPCTyRA+VYWb+DCW1gy+pLj/XrksfA8MMydtYJHoFkgruLMwOWT58Ff6qMwx6e
         ga7svtLnobwRoB9m6TJXLjQ9jo1b1L5R0Uf9auck+6pil2HvXofNbBoWan7hfJOUAAhM
         syUzqucaO8fEZPXVHIgcYUP8rgNYXsrLESjHODHQxUu1HPPN3gfI8Id0Pec2TeVtJq7H
         aLD+WLLO93aansf/O0kXs2EOpHfVJeKgfcWijKEGQFj3jQ8xcCIqb6+z6S/cdAMG4+Oc
         891Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769780086; x=1770384886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AoCRYLFgaaOwIEgPrhUSNB9d+/cz6LVHg1Zx25jjT1E=;
        b=jxPhSln3n9R799Aq07Li0859kMzSHXdfzst7iXNrXsmfQTkyTsOhe9PVxp9l9FdJ1P
         HlgRAGD0UYyCB1JQN30QYro+U2iRzHw00guzQiQsTO10bD51fKMGcA+D//PU442/KPdK
         hGtNvLgRIeumS8kv3QR2AlWx9pZaM4RYpGO6kBXwSRbr5CD6m5LWdLB066O1+2v4NKeL
         s3EuQJWhDd+mTGOq8m2a25cz+NqattXtpeqkzxomL+18U065YlDVmOaAVHgRAsAs26w/
         /ikOZkslqBv9O6K6XG8sQjOip8/SJnYOl4CkMGcxd56tztueDJzwQDaP7xMDA1IJoauP
         zwvg==
X-Forwarded-Encrypted: i=1; AJvYcCUrP46xMXmPQqAhnQ2nKCeMKiIkM8Zld13nx5taRtS+ESdTPVtxxH+POPXYAWuGscMc7mPWhCoO3Dmi/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPlAhZwszS5q2GGlWDTsI765R5lsLMS08pZqZBwmeTQF7fdRTp
	Kqb4C5KwgQHer+VDUItRxuKr+RBRHK0u0NG8drH+P4sV8siXus/uMazp
X-Gm-Gg: AZuq6aKvPVIhy5qVTvDZCvAkbQbAf31bxEkl0tir1+jHUSQjQG1v0gvwapJZ8ML7m34
	+WsdzFssb1RROTEYqtHJqH0YZEIaU5kQjCzbq8c/xQ7+PSTYBV6UN17lnTr57H4wGr6hdWrfANx
	JuF4ciu7QkxGYa60W5ZIXFbnbVQX529IslQYGbsLCtagYtCWhvtMBNuk1vTfBSTueQTs8pqxT7m
	w0lR9boFhHC54SmIv0CRmwaPyyj2YHTtmbsVWjK1lAynMbPNyRXUyFbvwifZN2G6kC7JEARAgCh
	/Wake157NJ5x6KfecIgtE9plAjnXGYI4aq/vKA9BEvri4y3EkohuDiywHPmiAm0yO4w8WeKEUco
	C9okD8d6+2sTW+lRKXoY9HUjjec4+ajQFN2O8JCstV21w2cbPGbQ4G8O/4c+YoXQNxi4HLYsVD6
	IrpErl3bpmgws=
X-Received: by 2002:a05:6000:4023:b0:430:f68f:ee7d with SMTP id ffacd0b85a97d-435f3aafe9cmr4441580f8f.47.1769780085489;
        Fri, 30 Jan 2026 05:34:45 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce93sm21536837f8f.24.2026.01.30.05.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 05:34:45 -0800 (PST)
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
Subject: [PATCH v1 1/4] ASoC: dt-bindings: nvidia,tegra-audio: document CPCAP CODEC
Date: Fri, 30 Jan 2026 15:34:31 +0200
Message-ID: <20260130133434.353353-2-clamor95@gmail.com>
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

Add dt-binding for CPCAP CODEC.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../sound/nvidia,tegra-audio-cpcap.yaml       | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-cpcap.yaml

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-cpcap.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-cpcap.yaml
new file mode 100644
index 000000000000..0af6bd3bf639
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-cpcap.yaml
@@ -0,0 +1,85 @@
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
+        - Int Spk
+        - Headphones
+        - Earpiece
+        - Headset Mic
+        - Internal Mic 1
+        - Internal Mic 2
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
+                "HSMIC", "Headset Mic",
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

