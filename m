Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD70549E5D8;
	Wed,  2 Sep 2026 22:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788387085; cv=none; b=LLs8EmAnnN8oJdsWY+uemsaA8unzCdm7tFp8jRATep1xkwaPQk7yKsONYJdXHB1pDtl3dV/SKSpu3PzKV0BElpLjUpyo1jcG1IqmEymzTc7cg1iwKPnusQhQpkp51FB9+PwqcYwELedoZcCfEkt2ctGOy8kG6r/AIHx0dqt5FYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788387085; c=relaxed/simple;
	bh=w0FIq/wI9cmtotdcX6hqBoQu50S6JMTM4GMSBTcF+Fo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RoiUGGRbjtxLyhelKKIzPFr2IfdjCLddodK70Ka+jUENTb4BcrX3wBEIi/AkSxRGh6YwfX9M+T52RaXYLFw1kB49ej6J7yFVwIFJ5mY/FYBV685jpJhg95xIfCAKPIMwYgFRd3U7FMkaMsVKqpHS3w9XDy2uhEBxtat9l6HKWNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VF1eNTSc; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VF1eNTSc"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2474B1A1969;
	Wed,  2 Sep 2026 22:11:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E5D255FF79;
	Wed,  2 Sep 2026 22:11:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C99CF11C79331;
	Thu,  3 Sep 2026 00:11:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788387073; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NK7cau63fcqdFZfa3C4RbEfYEu8jP3q+rhw7IrsO4Sg=;
	b=VF1eNTScexkHbdmcNVIeyFk0zlEOfCXdz3GDJ8fpVaiwQzzfEKAVGX6RIzjlIEi6tjPgVD
	r6cVq+4j4amKHlJpZZRFQ/Hw7iQYGNwiVkqIZlYmnyKE6kZBIxk699DP4LcJ4IQiZq2W6r
	M9CVy8w6zcpFUn9Yv7oSPDhCuHChvPAm+3wpstuQ46crJ5/wrdwBQjQRVkqZIdUvmU6bBa
	bozBNc+wMYFFXnw7X0M73rLXgzjmXnR8IneOJglXN1+KaRNKNg4HxTdbH9237YZLUWmnBY
	If1+BWanHmTgdQLovq10y1TRKSNkj/Y6cLRr1xftfRDDUmZLf5Qup3pSCVRnKg==
From: Diogo Ivo <diogo.ivo@bootlin.com>
Date: Thu, 03 Sep 2026 00:11:00 +0200
Subject: [PATCH 1/2] ASoC: dt-bindings: realtek,rt5677: Add clock property
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-rt5677-mclk-v1-1-b71a5a3533f9@bootlin.com>
References: <20260903-rt5677-mclk-v1-0-b71a5a3533f9@bootlin.com>
In-Reply-To: <20260903-rt5677-mclk-v1-0-b71a5a3533f9@bootlin.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Animesh Agarwal <animeshagarwal28@gmail.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Diogo Ivo <diogo.ivo@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1265; i=diogo.ivo@bootlin.com;
 h=from:subject:message-id; bh=w0FIq/wI9cmtotdcX6hqBoQu50S6JMTM4GMSBTcF+Fo=;
 b=owEBbQKS/ZANAwAKAQa+fFtWXslFAcsmYgBqmJ75msUIt7jf5fCQNhewHQ1AmpZ6Ps7Q3BsUT
 7keSKFUQvGJAjMEAAEKAB0WIQTma35o1i1081e8B2UGvnxbVl7JRQUCapie+QAKCRAGvnxbVl7J
 RYvUEACYX5nGiAuyG9UpC57wHI7D9sX5i4BeNf20EfQYWkgdm11q9hEERhyidk8orUdW9k+ONS2
 e7V/v/aWC8cCQlhjD968PKPnclsS854epMOoasAhPj3g/ctiSo3ZjiZj3UspXMC79t3IVCsKgtr
 B5JDtk/7lS1rNMeWSyKCloMXtglVbK3Y/Zmg3oM6PFci+n0T8AgF+95cKQ3DBADEn6+btne6I5d
 i7XSZbG+LX06Yung86tqcQO4L5oM4fn56sBf2Iq1a8h82IA0Rd9tm/o+vUHmiNuCwYdhsgf9wPU
 W52td3eAenfCkSfBbQLJyhSlK/g2nzm7e0ECtWCga3AUk5lMRIkp8+IM79502v5J6P642/ky/SC
 b6TuN/jz8Hys65O/ZvsB+G4VFy2d1lBe/iMH1aYBQ8zxtamIXRVvydNH0hOJDaesi1LOyqHF46x
 A0wKJFnirDnD/9DDiAlUlQD6QwE//rx0Zkn1BuP2UzmTYuDIvgdH3aFKul2gm+CnmxBfZSdj6Nu
 MIWaxCvgUA6W7Zpgr2ZpyuqPns0YvIUhAStXJPco4Ng1T9rj5lBFtk14+kwzdwUcKLRO4XJdPtO
 aVaDSu2NQlNCBUTpndbcPzkwo3o3DR/3ECG7mjal2rMetLTddholaLYgQ/3yDwi894Q/HCienVo
 iqdbn7CHtA31NlQ==
X-Developer-Key: i=diogo.ivo@bootlin.com; a=openpgp;
 fpr=E66B7E68D62D74F357BC076506BE7C5B565EC945
X-Last-TLS-Session-Version: TLSv1.3

Add a clock property as the RT5677 codec can be fed an
external clock signal.

Signed-off-by: Diogo Ivo <diogo.ivo@bootlin.com>
---
 Documentation/devicetree/bindings/sound/realtek,rt5677.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5677.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5677.yaml
index ae27ae78b1b2..e9fb97a48445 100644
--- a/Documentation/devicetree/bindings/sound/realtek,rt5677.yaml
+++ b/Documentation/devicetree/bindings/sound/realtek,rt5677.yaml
@@ -44,6 +44,14 @@ properties:
   '#gpio-cells':
     const: 2
 
+  clocks:
+    items:
+      - description: phandle and clock specifier for codec MCLK.
+
+  clock-names:
+    items:
+      - const: mclk
+
   realtek,pow-ldo2-gpio:
     maxItems: 1
     description: CODEC's POW_LDO2 pin.
@@ -127,6 +135,8 @@ examples:
             interrupts = <3 IRQ_TYPE_LEVEL_HIGH>;
             gpio-controller;
             #gpio-cells = <2>;
+            clocks = <&osc>;
+            clock-names = "mclk";
             realtek,pow-ldo2-gpio = <&gpio 3 GPIO_ACTIVE_HIGH>;
             realtek,reset-gpio = <&gpio 3 GPIO_ACTIVE_LOW>;
             realtek,in1-differential;

-- 
2.55.0

