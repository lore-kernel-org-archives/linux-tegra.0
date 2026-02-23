Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CBFDF76
	for <linux-tegra@vger.kernel.org>; Mon, 23 Feb 2026 08:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771835860; cv=none; b=mRkGFCET5JSUTdXxSOmsopT/oT+aGxexMy5eLaPM99kikn2IBxviZ0882RxSKEgrEbiUqbklDdod5tkYfAzQhr2gGB1NLZlRijAKUFQl7zvQ2kdKDIyJqeV356h65P4eXRaXcutwMKT02zk1jeToscB/DKd7WtkPacssZnFegek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771835860; c=relaxed/simple;
	bh=E50Z0kZ8QEC/+gID4A4p9F54kc2DuevigG1LcHQ1FUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ov8XwwBXTksBSjZUBXfxaDyC78swbqV14hatHeRnlZ5SOY6VGJPeR+sG/6I4YpaHTRZOroOH6p1wicz4pATN0dbrSWvBg7z2rNsfSX81R9x9NM0ZGALMO6zZMpITUjeeC5co8QFMEFcwc9+E4Lx434uvrcu6DOrnvfaRGsLgSfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZGXDhnrW; arc=none smtp.client-ip=209.85.208.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZGXDhnrW"
Received: by mail-ed1-f65.google.com with SMTP id 4fb4d7f45d1cf-65a1970b912so8216050a12.1
        for <linux-tegra@vger.kernel.org>; Mon, 23 Feb 2026 00:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771835857; x=1772440657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CDk6pvEbCDbKFm0MEs5hS5v1vRZPcd+sQDBn0D1BQXQ=;
        b=ZGXDhnrWJUz460XRFYFXLefKHllXsNWaPQYM2DCF6sAZE5Bxb8GWVa5bBjmvBNpUDI
         mmRgkQfjXBADJxpetDBAtODx/hKacHtlcaATZkDHoexPeEaJQKEDExSirgmyX9lTORMu
         j9pVOSMwD8i3zAyki8OM5yMS2uTAFtVS6GIhXJ/IO54yEpMXKu4K4ueXZtE5m13Jxwnr
         g0t+v03pLMUcWpvgESSISomBnaoAISN6cq/jZmLklKgrMqYGE9A1z5Lx6UT0L0HsWtaz
         CGv7kLx3Jf/f5SSW0Ubv9jRiANBWoVj5hGSRi2ku4CmutnDY8wUkKo7RNI38pt4sH+KS
         AqkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771835857; x=1772440657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CDk6pvEbCDbKFm0MEs5hS5v1vRZPcd+sQDBn0D1BQXQ=;
        b=k1zylf5ek4glwyHGhbQNq0Oll97qMccoudEmgv4z3d1ycdp9rR3FhiAmIuha1LFuVn
         3NcTNETS6IoCwKzfUxO6elRlfuw7MsIuHcOkzImuem7r+/fINYCVbN17xOcA3s1GOgxg
         nJbl8NleseZK0MZEfrXDbQ7pNPVRBvhDztvwp9zGNSEe4Rxg4CWQh569XM3nhMyYJA5n
         3bFh0lYJqSYSx3VXDVaIbsxaEjhHdfB3W89P7uyMQEbmo6/SdVmCh9mFGn6Bu2aT/CW/
         Qxs0llXL2Q8VUzQjvraOQ8rIqBOl9NIMh78OlocFmE6KNwzELcKikr8JQbc7U4S1KHwe
         jI1w==
X-Forwarded-Encrypted: i=1; AJvYcCWvRqQt3E1JqnhVceB7hcX5bkriO3IKA6KaUTmKRZ3vdK/figLjXprzf1rB5T8tCN05PVz8//kELxqPvw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0ONHG+lDyh/nEN1PD7MIb45YX0zPJZY7UGSACceCjjNavLzUF
	pF3QJ16by06asDTVqzQWfYvzFOkFrCZ7CKcCaLJiz766RhbGnR1hrR2haDTnYyAq
X-Gm-Gg: AZuq6aLYtAd9dAXzAq8RbdnYF3iTXVh7o3RMOO3LTNTtXbAJ26MakFddDz5JwtEOuqc
	tdNKiYuOK+8HTGcyFrPA2MtEnrZsPmOdSC4sLFCkICt72oWVvwtq8fExUFhlLZnd8CyAeJwBts0
	EXE+W/cQuoEDpBASt1kIq60pSxu4di8TuDtwWND9l2VtOz9gJER3sTWFLYQzH/CZQrMXfi4yO9k
	D0CYWv5ZveeHeyS0mqnDA/xUgDmIHyp6w01t3/5A9+u+fqm5cMy1HyLbKG5a8sNWkHJOP2JqzCv
	jvTqMInphKsOcD6AAL1HYQ5aSjVIR7+kBBbVw5YfZJyr6+kqOcKunU3PXqP+p8dSS9kBD0U34KJ
	WMlHtYrXkv4BRj1KR4+Urk/5zvLSqYYcLac90bR4GJ7cBf7NUVqLk0owXoBx4a7VeCDygGqqW0w
	+3Fd/zn00LXn+z
X-Received: by 2002:a05:651c:41c7:b0:386:34b5:aed2 with SMTP id 38308e7fff4ca-389a6072e4amr24552671fa.5.1771829463626;
        Sun, 22 Feb 2026 22:51:03 -0800 (PST)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a78b4a45sm13916521fa.13.2026.02.22.22.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 22:51:03 -0800 (PST)
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
Subject: [PATCH v3 3/5] ASoC: dt-bindings: nvidia,tegra-audio: document WM8962 CODEC
Date: Mon, 23 Feb 2026 08:50:49 +0200
Message-ID: <20260223065051.13070-4-clamor95@gmail.com>
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

