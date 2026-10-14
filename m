Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938A04E01E4
	for <linux-tegra@vger.kernel.org>; Wed, 14 Oct 2026 12:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791979344; cv=none; b=gk9b7EGv9r4h5im499YwFbNx4LXdnzsfKga/OnF3hzyLjn9SVSja1SO5sie+CThhhj1OChfNOHWc7NL5WIRNMD6ISpb8ts6IqIHK0tKZM29yfYxCTybA618Pk5YzJR/3Th7LRPvuYi1SYPtkApCJYtMJUKeSpejvDRHF0czEfo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791979344; c=relaxed/simple;
	bh=Ozuozbtj6LfsPDwMAW4dI0Sb+PiNErmQOZoRSLelEJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S3w/3K00WQFbVL1vknex/Y+ohjtemHlZkXhb9X2ljLJI+w4JUXpUr0Vi0/TRz32fjvI2KsDA89zlkFSAqgVYmuMafegpREZu6G1lJsSZR6CcOnGTSpgJ84PIUQSU1RuBsHC++vg7jIEINI35shPzPJrCx2ijIlomZCUFCb9eyzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VAizohZ3; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VAizohZ3"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso2278632f8f.3
        for <linux-tegra@vger.kernel.org>; Wed, 14 Oct 2026 05:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791979341; x=1792584141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Smt7P+dI2+cpPcIZaQuGziRkglc3TS/v4IRgNdviKKw=;
        b=VAizohZ3RgdSunrV3TWa+4Uln/a2w2kR0s8OtMyYXWtMAdJO3XKm+Xs10vlX/drIFY
         vImr1f5drTmrMy5x3c7T5oAh+9dhSqg2hjeHlJukfgwgFy9PVnDOCopqr7nvvaFrp3rs
         Vtjp5dGPYWA4HmUy1kx0q46pYacNlDVQnUbQ3xyhIBZiv8utUzHp5uqKMu2SnpDN7NrW
         eF+HSjMipnrIsdMKVdwGz/+UDhCnKgahHBMkwHcGN0WFiMeXudbuTbmCO3dupcyovGPm
         tuFhQS3/nD80eaHBmG1HlalLnxZSCu5dT/BiAZ0PvdFvDGPEiJKuJJLsCbvWmievMHaD
         j26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791979341; x=1792584141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Smt7P+dI2+cpPcIZaQuGziRkglc3TS/v4IRgNdviKKw=;
        b=QRtxo9m7PGbmAMtBXRYYfV0IM5uOfdEx0IcXu+j86yT4U05uarlhD953rlqKwa+bKc
         zihXsQDi0p8+HD0Kka3cLBU1YBc6N1C+YKeKb8TupQTYftnFN2iMvfzGv/jemdo7TtIa
         iecIp6xV3/xAESTkjY2vt5XTDFtMnbx9MDXRcOlQxa/rrIcHBejUc7C56Mwvpo+0DTt3
         qp1TpNwhSOdMjseEhtNmG3KCQuN/Zy28PfGUMLzJup1Oi6jEH/oQfts0FeGNwlk9w6yl
         jCWzviIhKtPfK6qYNqx/aHY3v8XTyIfBfkSoqD79KwLa5g9Sn/8R+IzLyTc1Pimb8peW
         9Tmw==
X-Forwarded-Encrypted: i=1; AKwUvByvCHcwdhQmhMtTQQFXieJSxaRL8dEc5I++jrDC8409b5pTlT7OnARrly/DHkruB5wv0Jy5lEH9LricCA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLe2Jwwfz3LUY9Ix6RQ2B8/SVdDaHUjiRCxfYYtyV7noZ14lpA+
	hgVDWiP0wHqKCjyx6txb0IcxKnvEsdO+kgGdnqSEyxYqzXa2hyaIO31p
X-Gm-Gg: AYBFou0Gaa2SAP80BWK3KzdIqzSsgOwAoo1DI6CfbO6xRXeuD6R8L+VWykJBj5AXrUa
	jtjtSqjij5WqHnoITt5mzg4gH7AfMTWxG2FVbVotrLwB6e7+dQ/pfwFy/vqfNtv9eldRizzVFEM
	DGtCvXup3uiY/w96NKWKZfb5fMD0EBJvDA5xAbnxLVHEhPgLReiZnFaIz68lQKIxEK+Dlq4ksnN
	pKnP0zDx3mwIOopN44fjUMucami59HUGvqK8jwUAaFOCo+Tsh2eCFhnb09pC+pvhARIxNvcogDm
	xIgd/5vUVjVgBQHu2peAMJ2D+6dLgolD71NrzZC7QIoh6QJFGeV7Kt+8+cYQ/Wd2Ulo/xwdwDwy
	GGEYVk0up2W/3xI0v+9afMKPBBf6dDGTQmVQm20KDstMbBtso5hPwDA3ryluZes7oyVIdVDDKta
	DfLYjtFW9Xd39aLILTgrVEDGb7I5WGaHlSLndcedIA3bYLe46C78D8z4s1z+ye2FUUAvjuzQ7ig
	5VgdhfVyp4+8gmgXbc=
X-Received: by 2002:a5d:6f14:0:b0:48d:ee59:3a30 with SMTP id ffacd0b85a97d-48dee593eefmr2149183f8f.22.1791979340477;
        Wed, 14 Oct 2026 05:02:20 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac36f9sm10937057f8f.36.2026.10.14.05.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:02:19 -0700 (PDT)
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
Subject: [PATCH v2 1/2] ASoC: dt-bindings: nvidia,tegra-audio: Document WM8994 CODEC
Date: Wed, 14 Oct 2026 15:01:47 +0300
Message-ID: <20261014120148.126160-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261014120148.126160-1-clamor95@gmail.com>
References: <20261014120148.126160-1-clamor95@gmail.com>
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
 .../sound/nvidia,tegra-audio-wm8994.yaml      | 110 ++++++++++++++++++
 1 file changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8994.yaml

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8994.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8994.yaml
new file mode 100644
index 0000000000000..d2c317f831ced
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8994.yaml
@@ -0,0 +1,110 @@
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
+        - FM Radio
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

