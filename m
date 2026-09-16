Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BEFF4F475B
	for <linux-tegra@vger.kernel.org>; Wed, 16 Sep 2026 13:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789564429; cv=none; b=UmLRxuDQhSoapSKKWdx6+UFvBBdvZzJv47coZgDW1sNOdBjg7cCdhuKr9V+5ePY1xbxsetgLMDUb1WEnpMkIZlzDHG3YS+A07qmAKZEZYohIq1HT654TF3nZb86dVj36ioqtbYp7HDxvcOd1K52c9NsCQERUxbSwx6S5ejSDV3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789564429; c=relaxed/simple;
	bh=ITEH47kZLzhgpz+XPj8tLDQWf3P/3eMNHuqVkVzkFOg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jxIKUSFH2GTrzCC5ZayHrbI2J50iDI3GyH/nENEkcFUHcUrD8xNnYyl2jSL/nRLYzj9x0qMWXX4MyxVqkCl/ILNlZTKlIeHOaFwZjfKULD91HzilKmHwFabuKJhhu4az8NmEW1rNYF+AIKWppnrRBUvELlnf0Yh8kTtZ0AmTwP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aEmNKKK4; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aEmNKKK4"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc44f8f356bso31968a12.1
        for <linux-tegra@vger.kernel.org>; Wed, 16 Sep 2026 06:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789564426; x=1790169226; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OTowUO34akYDMoKwYg6M5YQFPaJFFtTDHdbH85GqPmo=;
        b=aEmNKKK49AjS4qWGFth8nCO/0rLL0zwMgzVQ7R/Cdrxv0ejtrz0svyB7yxlJ4UzokT
         KE2M1Z6ZXwghhjV0aM8HO956KBPLOGtr8sVjxg6HLSqYBZRCMyKoBd3mg57f/Voz6GOu
         708bDtMrupCyWjl7Wkcz9TaO4ejpIskBXejKR2J2oYKVnOCdgLKUNcM8WKIala9qfTyR
         uAa59FJdVQ6IBUMf8eOqmFmod7uVWpf90xz//opMbmPZa6rN92llo2PWI27WckvqColM
         kxKNLISTf6iZW8EsHBvYpG5iyeDTOB7odVumjLENq18I57bHswSlsHPrFDBURiwIkvtN
         Wx7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789564426; x=1790169226;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OTowUO34akYDMoKwYg6M5YQFPaJFFtTDHdbH85GqPmo=;
        b=iYNGimHuGpgXFDojk3a+b48SYRNqIFaJq0u+O4oPANJrvppRysya2euZFRRZlBHbxO
         YD47QXiOBr3GkWRtI5RxqFON8wsYm6IyzROYK/j80vil41au+/oTPXYzUMssezl+LMix
         c3Q83gJORaV8xHLHJBmHZcm8RMgMd7d3cYFDpidL/2hIpZ6BI2sk6t24V/DX1wot4cus
         2hQC3xNO0EEW3zVcF12NWLRu3nA0lAYyWQeepcmtKto58B7s3ZnSy5BVAn8sH0ZAioRc
         lehrBEiN3jZZNoMXp24JNYavul2yoCrzeojSt/z5fXxPdNxJaZVy4tVv8ow2N9IPpu/z
         cYQw==
X-Forwarded-Encrypted: i=1; AKwUvBzYA408yMzEosfYlm4zITgLHSdpMxLUk2lSFBhmAhyqBdZE23/tvyUw1n6kWoGqkCWg80sef6l4Xz4rNw==@vger.kernel.org
X-Gm-Message-State: AFuF++kw8MBitng0kttPlFM85NPsrPF/RoJY6+85zhwWyufTuRalF+Jv
	YokmYNMLfAtCAn2SkYlU8HxfcGlHbAdwJ8rCtfa96zoPGPi/+h4fIcgZ
X-Gm-Gg: AYBFou1QGIjtMHFTcQKqbNl9mBIJ7rVU4fnpmuB99ppp8JzgzQrxZjv757ilGcvvgry
	pr56c7ByisajZpS0nfdWVKQPSvfBKB7apRLSVC2CvBEX9MkBuOfR3C448PQAfZjLJpeRxJGnlP8
	cnedtLUm8jb4C/2vPSrogVI6lgftMskHNGkahtbkNpPbcQTWVmGr2qybGHX+ZjjidY/JeBETXtv
	ApKygMalV+f7g4k253qUOJnC+pygDgy6wBw1hX7bxD7A4S2wmTLpkog+46e6T+xI9x0dVo7nhqV
	w00c83mHiQ8vhKj5SdmmPFOu0lDWYWSz2GkYWJMxNIhm6QFdzwPONCCxhupYjLLznRcEkFxMKjv
	Snza+zD6oJZ+NAtakJQtVBAURASzgIUY+RoOjW0LQhWsisQFgm0JXMe1RRR4Qe9v3KmFlpG5Zbz
	DjD0b8/Ii7hdm/YflDHi/A/p0WeYRFhTJZfXI6hdYCSLBiQLf+Sc05k3Outa3gVgyoRNNms2czr
	lMLyu3WVY4=
X-Received: by 2002:a17:90a:d444:b0:39d:fcef:e241 with SMTP id 98e67ed59e1d1-39e1e2e2daemr4310853a91.2.1789564426450;
        Wed, 16 Sep 2026 06:13:46 -0700 (PDT)
Received: from [10.107.92.252] ([2409:40c2:5413:87f7:9fa7:eb18:a8e7:30a7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5aa1194sm9422972eec.14.2026.09.16.06.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 06:13:45 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Wed, 16 Sep 2026 18:41:28 +0530
Subject: [PATCH v2 3/4] regulator: dt-bindings: Reference Tegra regulator
 coupling schema
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-ti-tps6586x-v2-3-f12cfdfb446c@gmail.com>
References: <20260916-ti-tps6586x-v2-0-f12cfdfb446c@gmail.com>
In-Reply-To: <20260916-ti-tps6586x-v2-0-f12cfdfb446c@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@avionic-design.de>, 
 Lee Jones <lee@kernel.org>, Shree Ramamoorthy <s-ramamoorthy@ti.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com, mfd@lists.linux.dev, 
 Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789564321; l=3261;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=ITEH47kZLzhgpz+XPj8tLDQWf3P/3eMNHuqVkVzkFOg=;
 b=H8QfJexEcJgwy5BT8ZgCZ5oHcOwyw0O8OB0qGHVYkBjj6C/SmmHUGP8t8eE+H1sRxnAMoYfzQ
 nq0VNU85OtmCwS7zz1Nt7OJDka9x8ryCzUv66RONJEg63oB0tXJZwQJ
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Several PMICs used on Tegra boards TPS65910, TPS62360, and MAX77620 use
Tegra-specific regulator coupling properties. Update their dt bindings
to reference the shared nvidia,tegra-regulators-coupling.yaml schema.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 Documentation/devicetree/bindings/mfd/ti,tps65910.yaml       | 12 +++++++++---
 .../bindings/regulator/maxim,max77620-regulator.yaml         |  5 ++++-
 Documentation/devicetree/bindings/regulator/ti,tps62360.yaml |  1 +
 3 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml b/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml
index caff9dc0b2bb..798d27099401 100644
--- a/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml
+++ b/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml
@@ -99,7 +99,9 @@ properties:
     patternProperties:
       "^(vrtc|vio|vpll|vdac|vmmc|vbb|vddctrl)$":
         type: object
-        $ref: /schemas/regulator/regulator.yaml#
+        allOf:
+          - $ref: /schemas/regulator/regulator.yaml#
+          - $ref: /schemas/regulator/nvidia,tegra-regulators-coupling.yaml#
         properties:
           ti,regulator-ext-sleep-control:
             description: |
@@ -112,7 +114,9 @@ properties:
 
       "^(vdd[1-3]|vaux([1-2]|33)|vdig[1-2])$":
         type: object
-        $ref: /schemas/regulator/regulator.yaml#
+        allOf:
+          - $ref: /schemas/regulator/regulator.yaml#
+          - $ref: /schemas/regulator/nvidia,tegra-regulators-coupling.yaml#
         properties:
           ti,regulator-ext-sleep-control:
             description: |
@@ -125,7 +129,9 @@ properties:
 
       "^ldo[1-8]$":
         type: object
-        $ref: /schemas/regulator/regulator.yaml#
+        allOf:
+          - $ref: /schemas/regulator/regulator.yaml#
+          - $ref: /schemas/regulator/nvidia,tegra-regulators-coupling.yaml#
         properties:
           ti,regulator-ext-sleep-control:
             description: |
diff --git a/Documentation/devicetree/bindings/regulator/maxim,max77620-regulator.yaml b/Documentation/devicetree/bindings/regulator/maxim,max77620-regulator.yaml
index 7118c34961ba..67fbe7d6dc1c 100644
--- a/Documentation/devicetree/bindings/regulator/maxim,max77620-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/maxim,max77620-regulator.yaml
@@ -22,7 +22,10 @@ patternProperties:
 
   "^(sd[0-3]|ldo[0-8])$":
     type: object
-    $ref: /schemas/regulator/regulator.yaml#
+    allOf:
+      - $ref: /schemas/regulator/regulator.yaml#
+      - $ref: /schemas/regulator/nvidia,tegra-regulators-coupling.yaml#
+
     unevaluatedProperties: false
 
     properties:
diff --git a/Documentation/devicetree/bindings/regulator/ti,tps62360.yaml b/Documentation/devicetree/bindings/regulator/ti,tps62360.yaml
index 90c39275c150..6768fc6ea0d3 100644
--- a/Documentation/devicetree/bindings/regulator/ti,tps62360.yaml
+++ b/Documentation/devicetree/bindings/regulator/ti,tps62360.yaml
@@ -20,6 +20,7 @@ description: |
 
 allOf:
   - $ref: regulator.yaml#
+  - $ref: /schemas/regulator/nvidia,tegra-regulators-coupling.yaml#
 
 properties:
   compatible:

-- 
2.55.0

