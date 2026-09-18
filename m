Received: from mail-pz2-f26.google.com (mail-pz2-f26.google.com [74.125.228.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F5D3DD521
	for <linux-tegra@vger.kernel.org>; Fri, 18 Sep 2026 21:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789765342; cv=none; b=O7An/Suym33WHeYoL+3yNJBl3dCLCULczwuZTSs5GdBWhEIL57nW5vQBkrY4TdInzWver9mHCpiV7HGxotUDXd5PSl2fMCjIk2ut2hoWlrGEZbBYlWTl9CRit7ILKoyWpwPJFhWhH1XwFYUIRv24QQUf+7gKjJmNKEHXaf+wmw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789765342; c=relaxed/simple;
	bh=5NRTfbaTrkCr5LOdsA5VA+Gzr3i5fzEHKnaeh5azfmE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PGCmL5ab/psimBj8ILk/MsH2Hrcm+uuvJSIzT2X0ZG5dDnI3uZtpl6mMcSEYtEDMIdLMOtWs0qBtrbkM6d1K+b3GVZtyibqS3rZO0y0UQ2q/aS1H2ddZ3Ffr4xFjgzhINAopJA1sc3lJlBZt2vRUcf3h0IFU31WuQZcbtGWcE14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=paNAiLK9; arc=none smtp.client-ip=74.125.228.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="paNAiLK9"
Received: by mail-pz2-f26.google.com with SMTP id 41be03b00d2f7-cc1e1b51234so142250a12.3
        for <linux-tegra@vger.kernel.org>; Fri, 18 Sep 2026 14:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789765339; x=1790370139; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k1oWgDzzyzgn3DsMuIYLcEQN7MVtCq5GjZ4iffV4ihs=;
        b=paNAiLK9RuG03u1uVXuUirFeZDheY4mty0mMBm9UN195EAZlFGP7fMMqczRZR0sw2h
         /NS4imHDG0D4BdmTdo38axK8nnH3uQGqKxqHsfja7okaiu4nNXt55v89QkZulGM/SWHa
         ui4R4CHnGIWdJY1BWu2NO8ud72UphcT6BdXX4NQHbCvRn83yYdOpZIe+q5J1T2HhfIKv
         ieVKtG0cB4l6k+YYyIA/eUl1S7NWmXSHY32fHg291yvmxGmVaqRdGEf0/hxIv+c2Yblv
         DRTcCqN3q/I+nb/Dl7TmnWRUA/XrXcGo5YMeThXaAGxWm8OL+yYNRJnL4VsfxJ2R516T
         Jc8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789765339; x=1790370139;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k1oWgDzzyzgn3DsMuIYLcEQN7MVtCq5GjZ4iffV4ihs=;
        b=jCy3LRjS7w+lfTSTx8BClJLCi1p+ui+jtwhY15ntB/cuEYNL9pNwVmK34PhV3jpB2y
         duJ69slVY6u5jvLmauN1FJUjKXUle/C0mLKy8tspuYYCRXug4fFpdPmSK8Z5NY/O3ssc
         f2L92GeEobxKYS2xLXQuyRcz9DrXf/1q+QXFWBi4dBCg7DuAtRHXMTilVIzSVR5hjIgS
         Pfy5S7/tcfY4jSgQiy0NwCYab4SQRV+VpPMUxwkTqtPyssy2c30h8YqzD1LK6X/h/36j
         xUSyGlI/JmBSK7xDZzX6v0d9WS6G32oqul2mY6Ed2y0aa0t/5V85N/Tl5GrN1yyI8Q8p
         9V9w==
X-Forwarded-Encrypted: i=1; AKwUvBxS+/bIJ48f9XaLR8A18LmSN7Adahlr6SNo50ezxI09U5GkqL5Kj/etfZv7xXmuhriFv0N2lk9vtZo7Yw==@vger.kernel.org
X-Gm-Message-State: AFuF++lgUOq+6/pJhRehhFK8qG4H0LhRx8uL7D3EUjiYcaavZNAkb+Cb
	6DqXK4m/wk0b47Om1dpI4+wKoljOMeMIDIqPWkDWAAFAflklmmFuGSXf
X-Gm-Gg: AYBFou0N0a15VcGRlV7forJE/8EVYUdQsVLy+nqqlrDjmb7jWuf2zQ3umN+LJjx2bFv
	yOJ6+7250IAmkLDHvNEdph7Bc+Zy3LI1LvdlyVqqwrij2vuiwalQ6IaagNbKd8lPf3702UtolGJ
	kozzSIvZXMjaMi9OF4QompUDFLWptD2X6F70XwL0sNM4vO8qYg2zMSrSX2vG7ACH5qy0LYVGHci
	UaztqPTgEOOR2c3cgA8ML1ClT8amwWsBGuhi4WgsZm6jAVUDfL3hRbqrsRlsQMw/xWoEz6Rglj7
	uSK+mcihFGN1D8RC5Sl8cvaCaW0B4xzIYDA1IT7MoNh0JDC9ts8reJgHfa8jct3UvlvX+G5RBD7
	wjU1OZGy4FRg65jix3r4lHNyfSHC2jJnq8b3+Znua/9MrGq6yAsEGn6JcjhRY2fPvcF7oEhyky6
	+/WWbptqCLqH7gf0Us8AulkxhXr/mG6Zjh9kfH7URGrJXo6icNA+KpW9zzGAqo1ao5ihT7pWLAC
	b/4wyYC
X-Received: by 2002:a17:90b:254a:b0:398:a2e4:c784 with SMTP id 98e67ed59e1d1-39e5940c49cmr6276032a91.1.1789765339319;
        Fri, 18 Sep 2026 14:02:19 -0700 (PDT)
Received: from [10.198.60.252] ([2409:40c2:5404:cbbd:a461:609f:eccf:23f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55ab3a3sm1396904c88.5.2026.09.18.14.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 14:02:18 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Sat, 19 Sep 2026 02:31:23 +0530
Subject: [PATCH v3 2/4] regulator: dt-bindings:
 nvidia,tegra-regulators-coupling: Convert to DT schema
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260919-ti-tps6586x-v3-2-63dd240f4684@gmail.com>
References: <20260919-ti-tps6586x-v3-0-63dd240f4684@gmail.com>
In-Reply-To: <20260919-ti-tps6586x-v3-0-63dd240f4684@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789765290; l=6027;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=5NRTfbaTrkCr5LOdsA5VA+Gzr3i5fzEHKnaeh5azfmE=;
 b=Dblcb/wzIcyuZ9Qc+Jlt5lBSBRUbfl1pP3QmJWU/oxpdoLMqG2fr3Za6tjHJ7Qd0on2rJKGNt
 KcpF51Iu979AFq8ZabdLGx7W8ZK26OCYjHH+CT0QdAMfeJD2IBp5S/K
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert NVIDIA Tegra Regulators Coupling from legacy text to DT schema.
Set additionalProperties true as this is shared schema.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../regulator/nvidia,tegra-regulators-coupling.txt | 65 -------------------
 .../nvidia,tegra-regulators-coupling.yaml          | 74 ++++++++++++++++++++++
 2 files changed, 74 insertions(+), 65 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/nvidia,tegra-regulators-coupling.txt b/Documentation/devicetree/bindings/regulator/nvidia,tegra-regulators-coupling.txt
deleted file mode 100644
index 4bf2dbf7c6cc..000000000000
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
index 000000000000..aae951cdce8b
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/nvidia,tegra-regulators-coupling.yaml
@@ -0,0 +1,74 @@
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
+
+examples:
+  - |
+    pmic {
+        regulators {
+            core_vdd_reg: core {
+                regulator-name = "vdd_core";
+                regulator-min-microvolt = <950000>;
+                regulator-max-microvolt = <1300000>;
+                regulator-coupled-with = <&rtc_vdd_reg &cpu_vdd_reg>;
+                regulator-coupled-max-spread = <170000 550000>;
+
+                nvidia,tegra-core-regulator;
+            };
+
+            rtc_vdd_reg: rtc {
+                regulator-name = "vdd_rtc";
+                regulator-min-microvolt = <950000>;
+                regulator-max-microvolt = <1300000>;
+                regulator-coupled-with = <&core_vdd_reg &cpu_vdd_reg>;
+                regulator-coupled-max-spread = <170000 550000>;
+
+                nvidia,tegra-rtc-regulator;
+           };
+
+           cpu_vdd_reg: cpu {
+                regulator-name = "vdd_cpu";
+                regulator-min-microvolt = <750000>;
+                regulator-max-microvolt = <1125000>;
+                regulator-coupled-with = <&core_vdd_reg &rtc_vdd_reg>;
+                regulator-coupled-max-spread = <550000 550000>;
+
+                nvidia,tegra-cpu-regulator;
+            };
+        };
+    };

-- 
2.55.0

