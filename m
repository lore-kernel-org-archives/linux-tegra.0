Received: from mail-dl2-f41.google.com (mail-dl2-f41.google.com [74.125.229.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497DB457E4E
	for <linux-tegra@vger.kernel.org>; Tue, 29 Sep 2026 19:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790710225; cv=none; b=Zwh6Di1+A2wQtN6//A8bntIgl6dgfSQdecnC1+1F/AtmgYkfgUoaa+NZiTHm8SqomT3q/PiovE/ye3YDugJaeWpLlL8rKmnibhdSvncAiFuHPK09PBE4CTGYBh4A1zhuKSzmcElnpOeCuQzBi/HR71RAI1DeNR7wkKqzfCaLc/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790710225; c=relaxed/simple;
	bh=6D/zV/BjV8cJK2Je+v+NtgU8vRbHOOzx39ErHS1L0wg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XwSGH5rJdjCrLnXahPTq/sWhuSwsYMGB65miWF2JLdjCJMHAJejC0OiWOYiAXqdk9UxZeGx/XnN2cosoouyDkF17aChGrpoOW/q0xxz8jcwAloW9tnCxNbQMH7n/C8HSY93S1DDglyThc1lrtVKLcApeQ8N7L3PCCDvFMbGy7BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eogtCSYG; arc=none smtp.client-ip=74.125.229.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eogtCSYG"
Received: by mail-dl2-f41.google.com with SMTP id a92af1059eb24-14a08c1a158so94465c88.1
        for <linux-tegra@vger.kernel.org>; Tue, 29 Sep 2026 12:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790710223; x=1791315023; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/UG3W2zvz26cOj2el4KNelGNWjE9fyh79XyScbN/3K0=;
        b=eogtCSYGHV1QGIJ/cCszlUKCbzy8uUN6gdfY802OW604IsNG6nFNeq7UjdsL3lU47U
         VHM2rF5bqGHmnOjDPwrbYRAZljXlRdjBdDEzJyqa/k2lqNt2YhpVVKRdN0F9nf8sx9xI
         Z0x3wCIxJkaF8rzg6j6Ma1ClH8w+zSApjULHe+coVbQtR4afqcRI6SFxnDTa+CHFeh6P
         oGwKj0PblchQ3rboeiQYpd00AO1Ql4MwmYE40HAZYxhXRo1JZGS0UXzCr33a4+jBHn8G
         wOAkH7pE6sUidAuGbSJCLZWwLLqwESSygl8OgCrFaM+0EPVLJSBxEOkeJxp3jtNANE9k
         f1Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790710223; x=1791315023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/UG3W2zvz26cOj2el4KNelGNWjE9fyh79XyScbN/3K0=;
        b=eITxYIKudWiHytmMuHicQYriwvhmE1d4Spn9oG0jFk/GhFQZrX4LMQXvyoVXTcWGEj
         j84VQfxLoglcMgOBz81yrTU7a9gflZKCEnHrlUCtuKJkD7vHAaazcDcn1Wl9Um/XfXjv
         KRTWmbJMSQ0Gebpw9cuTA7oWTXZY1VhZ70ZFuq5Odo2oyEq+XPPystoMhFMFC8rdYQ/v
         QiFjOyd29c60mhs3m6PZ8lpyNTC9DzMLSmH47LHeOAAacLUF8xMGVp6IZax0krCuHf9g
         qiciFc+7C+y09bhQEnuVEjiWyMw/LkgH5/dmQZhlguHxhxSPw0/uRqcJjegRSN9YvTTb
         iPrA==
X-Forwarded-Encrypted: i=1; AKwUvBxvH55vl0woPpJpZU7i65EmlE9NRB+Nf7GmExP/ic0eM3AJJNReEPABCp1XiJpWWK5UTzkymQ7wa7OoQg==@vger.kernel.org
X-Gm-Message-State: AFuF++mTNsHzgYccgw4alSSCw8/bcp40yfZT9F5znvqsD6ZMWIbGmkv5
	kqnaCkNvDXVK7OP5p5mLz8IAFIHVgOWcp1NW2aZvX05f2uTUgXEfCnNj
X-Gm-Gg: AYBFou2dig9USjGmrqMN+Q25pB0Lf3SKdhKftTZABxtcWHXgbVHoHPd9XT4vtMWiA8o
	spQXYAvgUFNDF6/nPuYKH5VN/NH05Y+hTo2JKEnZ1BUWSW6mKlDZyFKCYz86LJqMvL2L21v3K8w
	vYaWDB8RRzSAo++9E6ofoDR9KnwMo+r/My72N2u8ANeo3ZO1XGLmFLZq1+Arc5qKiYw72BnngYx
	kq97s5sWSnDl5zRHqUVgqPsjtfkgkshE8taiQzV+f6k6G10UJ32NGjFMrrg1sfixtNFt9uwcCUS
	t+GOKNcX1Sgz4fjj3at7tpE8CILXl51ny2A5Tjz2gHb+hHFQs9cldwn7nKb4T3l7hVsZ6vY2Hfw
	Ssj+yZlDKlka+JPTo7Gznoitoxj8miYU8MnOcjgaJsy33P/V6BXEgEao3U4VVAGeW4jCSuQ75m5
	8KcjcdG40u2NR7uv/pN5y30ud4c4qVZed39YA5RKhaXD7iNiMhY7IFelYIZ4foAzn62aBj2P1St
	HeA+WqC2g==
X-Received: by 2002:a05:7301:7004:b0:33e:6714:3945 with SMTP id 5a478bee46e88-34c65f5670bmr486208eec.2.1790710223113;
        Tue, 29 Sep 2026 12:30:23 -0700 (PDT)
Received: from [10.211.86.252] ([2409:40c2:5054:69f0:5c6b:5195:5b7b:d414])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c386b6bd9sm1275349eec.16.2026.09.29.12.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 12:30:22 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Wed, 30 Sep 2026 00:59:42 +0530
Subject: [PATCH v5 1/2] regulator: dt-bindings:
 nvidia,tegra-regulators-coupling: Convert to DT schema
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-ti-tps6586x-v5-1-aac0273b5da3@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790710190; l=4808;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=6D/zV/BjV8cJK2Je+v+NtgU8vRbHOOzx39ErHS1L0wg=;
 b=bwFqmRHQ2OhNrqZV6NuV1o8SI1SN6Vo3ifa/hs6HvYRQ03J66So8GHbsMHHMQqbWeIKbHcAtU
 dr7iYLy4qpEAkQCTMuryNhdPTSCLUgJS+vWyhQ28jyIe5EecStBVQzO
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert NVIDIA Tegra Regulators Coupling from legacy text to DT schema.
Set additionalProperties true as this is shared schema.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../regulator/nvidia,tegra-regulators-coupling.txt | 65 ----------------------
 .../nvidia,tegra-regulators-coupling.yaml          | 38 +++++++++++++
 2 files changed, 38 insertions(+), 65 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/nvidia,tegra-regulators-coupling.txt b/Documentation/devicetree/bindings/regulator/nvidia,tegra-regulators-coupling.txt
deleted file mode 100644
index 4bf2dbf7c6cc0..0000000000000
--- a/Documentation/devicetree/bindings/regulator/nvidia,tegra-regulators-coupling.txt
+++ /dev/null
@@ -1,65 +0,0 @@
-NVIDIA Tegra Regulators Coupling
-================================
-
-NVIDIA Tegra SoC's have a mandatory voltage-coupling between regulators.
-Thus on Tegra20 there are 3 coupled regulators and on NVIDIA Tegra30
-there are 2.
-
-Tegra20 voltage coupling
-------------------------
-
-On Tegra20 SoC's there are 3 coupled regulators: CORE, RTC and CPU.
-The CORE and RTC voltages shall be in a range of 170mV from each other
-and they both shall be higher than the CPU voltage by at least 120mV.
-
-Tegra30 voltage coupling
-------------------------
-
-On Tegra30 SoC's there are 2 coupled regulators: CORE and CPU. The CORE
-and CPU voltages shall be in a range of 300mV from each other and CORE
-voltage shall be higher than the CPU by N mV, where N depends on the CPU
-voltage.
-
-Required properties:
-- nvidia,tegra-core-regulator: Boolean property that designates regulator
-  as the "Core domain" voltage regulator.
-- nvidia,tegra-rtc-regulator: Boolean property that designates regulator
-  as the "RTC domain" voltage regulator.
-- nvidia,tegra-cpu-regulator: Boolean property that designates regulator
-  as the "CPU domain" voltage regulator.
-
-Example:
-
-	pmic {
-		regulators {
-			core_vdd_reg: core {
-				regulator-name = "vdd_core";
-				regulator-min-microvolt = <950000>;
-				regulator-max-microvolt = <1300000>;
-				regulator-coupled-with = <&rtc_vdd_reg &cpu_vdd_reg>;
-				regulator-coupled-max-spread = <170000 550000>;
-
-				nvidia,tegra-core-regulator;
-			};
-
-			rtc_vdd_reg: rtc {
-				regulator-name = "vdd_rtc";
-				regulator-min-microvolt = <950000>;
-				regulator-max-microvolt = <1300000>;
-				regulator-coupled-with = <&core_vdd_reg &cpu_vdd_reg>;
-				regulator-coupled-max-spread = <170000 550000>;
-
-				nvidia,tegra-rtc-regulator;
-			};
-
-			cpu_vdd_reg: cpu {
-				regulator-name = "vdd_cpu";
-				regulator-min-microvolt = <750000>;
-				regulator-max-microvolt = <1125000>;
-				regulator-coupled-with = <&core_vdd_reg &rtc_vdd_reg>;
-				regulator-coupled-max-spread = <550000 550000>;
-
-				nvidia,tegra-cpu-regulator;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/regulator/nvidia,tegra-regulators-coupling.yaml b/Documentation/devicetree/bindings/regulator/nvidia,tegra-regulators-coupling.yaml
new file mode 100644
index 0000000000000..f5637a5772137
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/nvidia,tegra-regulators-coupling.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/nvidia,tegra-regulators-coupling.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra Regulators Coupling
+
+description: >
+  NVIDIA Tegra SoC's have a mandatory voltage-coupling between regulators. Thus
+  on Tegra20 there are 3 coupled regulators and on NVIDIA Tegra30 there are 2.
+
+  On Tegra20 SoC's - there are 3 coupled regulators:CORE, RTC and CPU. The CORE
+  and RTC voltages shall be in a range of 170mV from each other and they both
+  shall be higher than the CPU voltage by at least 120mV.
+
+  On Tegra30 SoC's - there are 2 coupled regulators:CORE and CPU. The CORE and
+  CPU voltages shall be in a range of 300mV from each other and CORE voltage
+  shall be higher than the CPU by N mV, where N depends on the CPU voltage.
+
+maintainers:
+  - Dmitry Osipenko <digetx@gmail.com>
+  - Thierry Reding <treding@nvidia.com>
+
+properties:
+  nvidia,tegra-core-regulator:
+    description: designates regulator as the "Core domain" voltage regulator.
+    type: boolean
+
+  nvidia,tegra-rtc-regulator:
+    description: designates regulator as the "RTC domain" voltage regulator.
+    type: boolean
+
+  nvidia,tegra-cpu-regulator:
+    description: designates regulator as the "CPU domain" voltage regulator.
+    type: boolean
+
+additionalProperties: true

-- 
2.55.0

