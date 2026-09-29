Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B8650B8CB
	for <linux-tegra@vger.kernel.org>; Tue, 29 Sep 2026 19:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790710241; cv=none; b=IoOjsD2tYQlPQrIy5K4nXx6wDhEX0O28hJhw5KFLL8w1F6l/Yc5LKkXZ6MkrOIphZyPw2c9w6ClaO6liQnO9/WkUM386nvJOX/t2g7Nq1eetOzA91YvoXfL+CUKKyXk2OXtPMmdfItvRMm6tuHLMZwVvZmalHjMQ1yPtJ/mNDxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790710241; c=relaxed/simple;
	bh=nrx9PWS3jdg4LqtwUbFvGTGJFxFJvxOwGLbJH8e2/5c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YtkOs+27v0zVoDqtAwNgyQf7YydqAIK8snw3V+Mx8WIgkiyxhiw3LRzfD7nJ18QEEX/fC4trAMYQS1GKMm4UcX6Rj7bgNIzvxgN+Vzss1ZSA8LoodIeEZVxo1YFpcYezNMMiKWUbXiVJGTaPzPCIru/98mc2Mm+jPGvVqdnzfVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ilkfcb6O; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ilkfcb6O"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34c5d196b0bso25033eec.3
        for <linux-tegra@vger.kernel.org>; Tue, 29 Sep 2026 12:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790710239; x=1791315039; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sGAaNaI6MWU2v1/hJGrbMcfgTrexpu3RiGohYIJGhaw=;
        b=Ilkfcb6OyshPQXEBGtaEJSJ1dv9XJ9CxDccKXWcweB8ng4+T8xje3vAAuhji4SVv2O
         fJkClxt+wSVYxG4GqBsEhlm8be1H/FpyKJCkrWUfcdJIpJk8UKWHjG9Kqjz7Jg/THJ0o
         DA2dwnx0hqUDXf/yipGSnWVghQ1mfCBuz2JpzoWY0hMzTwBMRQeLlfXrB3TuwCpGC4rN
         8pEeGe0yubXp24A7AekqcJXGru+rsS54gYcWRUqtiaJilvk98O2qjuk+uqFiYjjYlBhg
         +X5C1aCJCsRfRZnCTdQKU6KBPuHeI+h+zKe0PYax97W34yfcudQZzktn3knuN4lHSq7b
         eTgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790710239; x=1791315039;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sGAaNaI6MWU2v1/hJGrbMcfgTrexpu3RiGohYIJGhaw=;
        b=Ep8HTWQ31OFGskayUlRvtFZL7Jlfrd0GGV4cZMsWN0JDSr8bYrdz/R4pzwmvHK8IKa
         5zjKQG+i3CfMyQBvS2BYckmtM5SiUvIgzNqcBuY6MXe2TOMNuBgjy/p1IZQT/cDNyBe3
         5BYbZCvNh8xDXXFIQ3eJaLouMAoeT1KbrVLlpWlImi9XGDsGnNlqvAeF1u1cCJ8HIzQM
         wAZkCD1vYgrbaWFGLY5sCMDXEoq4q4iWUi9IBcL8GXJdPSdiGHF7Ea+ROwcv01EBh41+
         rGkzTfeiD9Ak9UElCjS48W3V4X4XIn77bCYL7RmFHwNOxZI8c+EBC9Yn7iyzmf1CDh19
         BRQg==
X-Forwarded-Encrypted: i=1; AKwUvBx9vmX3K9QcoQbM5+UGSlGRX6Rm/OwaaHiqGIluzbj4yYVBmzKmoSwjA4og9jjLhW8XtXr2QWQQwa+ERQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIpAqxDRKspNzcUZWfY4aybv8r9f8pYqJTQYAUfRnzT614rU+vg
	NjeXms1UYjRtbW/MGstCHmG4aWuGHoLes0OsGkYEd4fyXlsH6PxMowqs
X-Gm-Gg: AYBFou2QNgUveIat/V05VsAg6bSPpKv/v/e5QMsv3Jfz444XJsKSPuPV/kjeaKhF7Fx
	QybNXcVBEAeE+SI9KeaehfpqA1MX50+66L66M8KGALZH2Rmqg2Fwgat1M/axTn0Pfhj3LgduDxh
	BvDuwqnJntsrSmDfaxBFdgvaux/Pu9+BpvS6PPEV1jvth+J6d3Fl9qZ4kiFdPm40ZLPTIpKTqSE
	Jq+ZEyWFtbeHTM1d7JbouP+zuG6q/pAz/FzsCjRBvFPklr9LhMEyjae9BDk41Q2hVdmwt5ILkK9
	wb4rKJLQdx97ciyBmhi48u+ItXP/n0qLXkXxL+YvYNctirTyqD3+Dlls9Wbe45uIaFziXo4N8ZL
	KchjIWhM2fLpM31sa3MIZe/LNobD7CzZiQPCGTgitgnP1ESuuEtZ8DtZlX+fzPtd1OaOvrgtB+g
	qKHBvQy1VmtIslPABnqoq8OQnmN3D0rB8gpQ34ILM+yHJB46/CKCH85Vnhc7wPXDhOx5uhQebR5
	hcBPnZM/DBWulP7pcKl
X-Received: by 2002:a05:7300:ce8d:b0:343:fdea:9a0 with SMTP id 5a478bee46e88-34c666281edmr481185eec.2.1790710239128;
        Tue, 29 Sep 2026 12:30:39 -0700 (PDT)
Received: from [10.211.86.252] ([2409:40c2:5054:69f0:5c6b:5195:5b7b:d414])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c386b6bd9sm1275349eec.16.2026.09.29.12.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 12:30:38 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Wed, 30 Sep 2026 00:59:43 +0530
Subject: [PATCH v5 2/2] regulator: dt-bindings: Reference Tegra regulator
 coupling schema
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-ti-tps6586x-v5-2-aac0273b5da3@gmail.com>
References: <20260930-ti-tps6586x-v5-0-aac0273b5da3@gmail.com>
In-Reply-To: <20260930-ti-tps6586x-v5-0-aac0273b5da3@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790710190; l=3317;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=nrx9PWS3jdg4LqtwUbFvGTGJFxFJvxOwGLbJH8e2/5c=;
 b=jYVGRLN1rCeA5gBW8wN4yvy44oA+AyGQ8yWRJ8UyoIAUYvVfFwjZ+r2YOpUhCx40CNPw75Xyn
 0gbgWBw5Z9ZAXobjAizQU1JdNpDASKvErGkmpZY2poMs4sg3Z394ON6
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Several PMICs used on Tegra boards TPS65910, TPS62360, and MAX77620 use
Tegra-specific regulator coupling properties. Update their dt bindings
to reference the shared nvidia,tegra-regulators-coupling.yaml schema.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 Documentation/devicetree/bindings/mfd/ti,tps65910.yaml       | 12 +++++++++---
 .../bindings/regulator/maxim,max77620-regulator.yaml         |  5 ++++-
 Documentation/devicetree/bindings/regulator/ti,tps62360.yaml |  1 +
 3 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml b/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml
index f1a76f88fc0cd..209dc97909bfc 100644
--- a/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml
+++ b/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml
@@ -97,7 +97,9 @@ properties:
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
@@ -110,7 +112,9 @@ properties:
 
       "^(vdd[1-3]|vaux([1-2]|33)|vdig[1-2])$":
         type: object
-        $ref: /schemas/regulator/regulator.yaml#
+        allOf:
+          - $ref: /schemas/regulator/regulator.yaml#
+          - $ref: /schemas/regulator/nvidia,tegra-regulators-coupling.yaml#
         properties:
           ti,regulator-ext-sleep-control:
             description: |
@@ -123,7 +127,9 @@ properties:
 
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
index 0f2901cab8afe..a2778c35919b1 100644
--- a/Documentation/devicetree/bindings/regulator/maxim,max77620-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/maxim,max77620-regulator.yaml
@@ -22,7 +22,10 @@ patternProperties:
 
   "^(sd[0-4]|ldo[0-8])$":
     type: object
-    $ref: /schemas/regulator/regulator.yaml#
+    allOf:
+      - $ref: /schemas/regulator/regulator.yaml#
+      - $ref: /schemas/regulator/nvidia,tegra-regulators-coupling.yaml#
+
     unevaluatedProperties: false
 
     properties:
diff --git a/Documentation/devicetree/bindings/regulator/ti,tps62360.yaml b/Documentation/devicetree/bindings/regulator/ti,tps62360.yaml
index 90c39275c150e..6768fc6ea0d3f 100644
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

