Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1649134D3AD
	for <linux-tegra@vger.kernel.org>; Mon, 23 Feb 2026 08:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771835750; cv=none; b=F9vmF0gR8tciQ4W/n7ocn38iumH9dPeoIvhRi/HoR/mX25VhjieuM+rGEqN9pIOqMhH/tPE0VbS8JZSpfQ3Fk3a0zz19BBRAne+W3aaqy576mgTc4Hz49Sxdpov8l2W5iY7WVxbBYzhNiKSG9afRkSwKMltC6SO6GedHkNOOQ34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771835750; c=relaxed/simple;
	bh=QeLyuN/2seU7NDyjmTtE2l7+boc7LAWG8fBCNm5LX8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FxRZPe7hBRytn8Re8sZSIV+nG3rLXpDLyQp/WIwgp2b9Gj7y0drtPKbhYzpunUAQih/grJLWesK0+oiD7kwyVsHXPIOE4gDan6v3ICpqtwWyM0Zgt+RFUvhCYDrwFP9OixHNZ/fPPfvDnQeb4sY14F3GboOowxiqK3ld8m9/PjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WtEyOkd3; arc=none smtp.client-ip=209.85.208.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WtEyOkd3"
Received: by mail-ed1-f68.google.com with SMTP id 4fb4d7f45d1cf-65c20dc9577so7617533a12.2
        for <linux-tegra@vger.kernel.org>; Mon, 23 Feb 2026 00:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771835747; x=1772440547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wwfoQIZP8rgjlqT6i1sqvtnJ8vCvBM4mV5XScfELGpI=;
        b=WtEyOkd3nqjmUyLJrf/yPbw6koYWsvfpN0c4sIUXF59NgzwO2cMKi6dXmiiNpMTZJI
         /g+OYacegA+ZzKZ6IdepPEQH+9l6/8xluPmQ+mVw1n/QwwSFgTqsQoPFa58sBMyReJKx
         OG7E3curflSwiu0YPQ7z6qcBWxl7AUABi7SLXB1F1MmT6e7+yRcoqbDs7lfW/Ox3aIwj
         kzb/aqbwE91oP0J3vmRr+EO6QVz8kBI2s5dAic6hLeuh1D3yLyi/FLIjXV4ynYvXmF3a
         uM4N1EEIXqJ6NrRt1rO2YemRJrMenhzGW911m9o2Ej7trdmOSRNrNarbO80Vr1DQjKeO
         G2yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771835747; x=1772440547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wwfoQIZP8rgjlqT6i1sqvtnJ8vCvBM4mV5XScfELGpI=;
        b=MusQsmYm7nvKweT1crkK9TrWX/zv8oXcQ6AA/jnrXU/ztHRyIALgUADcQ7l46iJXsK
         3YQjTtKgOWJEp64o3LelmDYxaY4S6s7bWeO6swIzKaterCv+hVyi16Oq0ZJVM7wkETCZ
         B1HWY7v6lX+nBeXBJJ/ciNCYA9fiL/gruv5Q5pvExJ0bM8PK5PIDI8oDECINZogarRqq
         n1fOh041V9PHe7Nsij6uc1vXsGm6bTrd37h6R+iVPfiX2LGw8u41QK3ESk6a4Y+zFkRp
         hjliL1lp2milLUw8ir/8VEm7o/Kcp/NOgU3T5dCFux3BAt0KfHyrHOcndtt7kVqTKbd2
         CCDA==
X-Forwarded-Encrypted: i=1; AJvYcCWlBWluZGTR0ZTmJ6AfvHcPWlhD74gTsZE0R89WcaPWwgKZVfLuxEMVcixODK/v+oCtpSA/xr3JuLmOKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxoC85uvTiatCrRQanQHP26pGrqppG2vqOmsbFim40ev19h3Jt
	jV/W4CE8FWdUSyfIa2UVk6xk1JlY/cDHo1T72QUymzQS4U0sueNdiK2YrEPpDphN
X-Gm-Gg: AZuq6aLPWLxrSSNyoFfqKL29+i3iv2P0JTSOK/pqDdpInWIfw5Ib13j4r6tCiJ3mpc1
	rkz2UIE4J/vJsASUETdn0DQPtvFo93IhI0D8RmliN3UCHrXNy61kz39NVhJRdi7akro/yVf2Oyd
	X1II9/REmwgMWPQ7B06VlzW7zKkAM1PKAKzHI8XUwLFkORAnbpznSy1n+IzWFv8dhHvc9IQwPRa
	JzmYElLvRO5ASk8r+PDZUgbCrHV6p3BOr2+D0lCryt1XNTAaWefqGjXEQvV2lbbOLJxGvvqyPyb
	MKXN89nnTnEf3xtVw+W+rt3FLGr8C8i2bNkMYefoT/mzifubnMUxBAXuZD2ZJsTXAAYOV4P5sHN
	CgAmEldf15XpiqrcQ/NcAxToBdAj7PdsBa9tS3RXbhzo4pxBFzhPk4HHcJteOQoeaa8Nbwb9gEs
	LykK46ZFIwe4Ot
X-Received: by 2002:a05:6512:1081:b0:5a0:f5e6:7f91 with SMTP id 2adb3069b0e04-5a0f5e67ffbmr142293e87.43.1771829461585;
        Sun, 22 Feb 2026 22:51:01 -0800 (PST)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a78b4a45sm13916521fa.13.2026.02.22.22.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 22:51:01 -0800 (PST)
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
Subject: [PATCH v3 1/5] ASoC: dt-bindings: nvidia,tegra-audio: document CPCAP CODEC
Date: Mon, 23 Feb 2026 08:50:47 +0200
Message-ID: <20260223065051.13070-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260223065051.13070-1-clamor95@gmail.com>
References: <20260223065051.13070-1-clamor95@gmail.com>
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
index 000000000000..69af2022d0fa
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
+      - pattern: '^motorola,tegra-audio-cpcap(-[a-z0-9]+)+$'
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
+        compatible = "motorola,tegra-audio-cpcap-olympus",
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

