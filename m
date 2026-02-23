Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8B1349B1D
	for <linux-tegra@vger.kernel.org>; Mon, 23 Feb 2026 06:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771829717; cv=none; b=F9zkmHTcGEYzdengCW8oEBKAjvNQ9Cz4u2svfsQRqG64HT4+eKMaEDMEFp5YyhXqhM5V04QpSuJbVkZ3NxcsxT0QXq7Q/i3kpNjUeOQd7d8yREJMoJr9T6LAJ54J8bwhZiy0Rs2ccRrv1AZ4eNK6sH29xLjmLqlMCFxZaW9ETEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771829717; c=relaxed/simple;
	bh=OOPv17YuwhtF5qN4VXKo5vOvfgfmMuTBBGc+yr6hm6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HHbkybsdYMLJwN/jhdcBRLxUNV5yEdGGZdvdptRFnH71RzBhetlNJS7B9wWE0kLACCu54cmSmH0pMmMlexNee5Ah14lNUZQFDuacBa0JdmCCANorW9oy8H37GxrJcAS6eMJd50ND/QqmUWJTyMkPbo+dfHYzXTg5KdS1RG65ikc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kwu+edER; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kwu+edER"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38700168abaso32492451fa.3
        for <linux-tegra@vger.kernel.org>; Sun, 22 Feb 2026 22:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771829714; x=1772434514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tfKVvY3zEHHWaD06pd/pcj59qAyzkCZLLQIV8hNmtWk=;
        b=kwu+edERONaYh4RnoTSn9pZMmOggqP65rnytgK7VmwBDCa4E7Ixj/7dQRaTqqvmMjL
         xtZUheW6mX3FYhpPghzBdc9zx0TsAq/qXzBUjFFEC3GKIUgEitVRoFKrlGzfC/p4juE0
         9hzM9xy9CAGw/zNw2w5++HcxU0nk0dXR1h7H+B46aowv44cyn/fp/blQ7UsaZJXBhVao
         HNSiPRVLfqSbw7iuIxuH6rqFPVhWyriAIinSWKPL07Q9mtYWmqOswWjIsPzbdY4Ufwsc
         8Mcl+IiPox3BEhB/ZoxAeh7/LXdEMG/B8dZGJBpX1YbR2IE7kDk4HREk+S16DVKE9qIn
         kzdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771829714; x=1772434514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tfKVvY3zEHHWaD06pd/pcj59qAyzkCZLLQIV8hNmtWk=;
        b=JwmmtepRVIXcsmvAFuEHkF5ODS/7d8/QWDjdXhP/NLjCtver7zGTzuRyqnb/OShU1h
         Zz3JAh95ctI4sV6WNiDZU+Z+dW4zWAqRDXfQYP7uI213RMSLH//EP9kgNVJFRNIqoW7K
         Y1VNeRbNzRecWSH8A3gHumuxAAS/XbIwRNvr2aefM2QDJvCdsHk6YnmfgqqonZUli2Yq
         b29U8ie+pM51WX7tVa3Md3LmtyKus4lJwDU20bu+Tiy3ASo6zzyCDb9jDxfOODT2chu0
         882sB5MjoF+J4E2kFAxJuBRDrmwAFOAVdYR5PrJr4oXaVOlLLywXbGAD+9p2kSMOU5mU
         D5MQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqLMHH9p2bl1YdLBHAlkrh3QV5EavfPOj4aQNwBoYH5sCd6Ld7WRba9rfU1QILzHvlVXr6/WDA1qsE/w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/Cude1IRzarTl9gkwNtNj864oxV7RGXlAx/DOJ/UTJ3HuDgve
	CqMkFsyciZ3Av9CYg4WSj57tmViuzjKmMfrlhl4Jhd2raC6/rLllHudb
X-Gm-Gg: AZuq6aK68uCLsZ9SSTZYrhpaPpNLGW+1RtfuIBPz3ADbLCx/KqdcbWPeYllZ1DagNKR
	KrjkHd1gtbTkW7gr0/j9QnAb1qZQDwbyJeS2OPAT5sGF20W8sKjMMFdVT3JEREHfupeITTybjd+
	/uMRdZ3FwnskWLjceJ+caLeqcc84t8+iJe7kSC1ND2KFAIvHcmAaYaSocl7VqOqVgYcqBS+oLAq
	gPY5QGszf96GGSi10r0Iny3TA28z7uupM5h4s5zzuUM2MgOlobPzRfsMz/d/+d6qoo2lzkLoJ5w
	k+1wITxnNDmBk05fQV9kxUD4Z9XS5GG50k6Ak6Akh0d+l6S287roqtUOq/0OAp7wSrfg0kEmTzV
	3DOUoAqKcnF6lQemRbYcK4/rxIG9/MoHJEMwiTwtEcoEmvyJHrU/xxq47j/g0sdYIyjMpAp9YDZ
	QzGqBWwPJEMfU4
X-Received: by 2002:a05:6512:2348:b0:59f:76ca:9893 with SMTP id 2adb3069b0e04-5a0ed87f9d5mr2208819e87.4.1771829713866;
        Sun, 22 Feb 2026 22:55:13 -0800 (PST)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb4c60bsm1373802e87.84.2026.02.22.22.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 22:55:13 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] ARM: tegra: transformers: add connector node
Date: Mon, 23 Feb 2026 08:55:00 +0200
Message-ID: <20260223065500.13357-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260223065500.13357-1-clamor95@gmail.com>
References: <20260223065500.13357-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All ASUS Transformers have micro-HDMI connector directly available. After
Tegra HDMI got bridge/connector support, we should use connector framework
for proper HW description.

Tested-by: Andreas Westman Dorcsak <hedmoo@yahoo.com> # ASUS TF T30
Tested-by: Robert Eckelmann <longnoserob@gmail.com> # ASUS TF101 T20
Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # ASUS TF201 T30
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../boot/dts/nvidia/tegra30-asus-tf600t.dts   | 21 +++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts b/arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts
index 1ed0536ae3fa..498780a96cf9 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts
@@ -67,8 +67,11 @@ hdmi: hdmi@54280000 {
 			pll-supply = <&vdd_1v8_vio>;
 			vdd-supply = <&vdd_3v3_sys>;
 
-			nvidia,hpd-gpio = <&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
-			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
+			port {
+				hdmi_out: endpoint {
+					remote-endpoint = <&connector_in>;
+				};
+			};
 		};
 
 		lcd: dsi@54300000 {
@@ -2302,6 +2305,20 @@ clk32k_in: clock-32k {
 		clock-output-names = "pmic-oscillator";
 	};
 
+	connector {
+		compatible = "hdmi-connector";
+		type = "d";
+
+		hpd-gpios = <&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
+		ddc-i2c-bus = <&hdmi_ddc>;
+
+		port {
+			connector_in: endpoint {
+				remote-endpoint = <&hdmi_out>;
+			};
+		};
+	};
+
 	cpus {
 		cpu0: cpu@0 {
 			cpu-supply = <&vdd_cpu>;
-- 
2.51.0

