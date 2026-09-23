Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EBE392831
	for <linux-tegra@vger.kernel.org>; Wed, 23 Sep 2026 22:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790201058; cv=none; b=SRS8mp/Nzx3wXercXosN3OzMh9zKHoWOAT/md436icbkmffsrxzo1CmaGXm41bwXY4bSqjE+DZ77JquI/bFqMdfucOP4GSHRAhyQKAYLzUXYzhpN05A/mc355rqCUbQdNyKM7/8zayaHjC+hz5tOaZYqQH0s8vX0j2I5Hn+Z3Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790201058; c=relaxed/simple;
	bh=5NRTfbaTrkCr5LOdsA5VA+Gzr3i5fzEHKnaeh5azfmE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C/vEHPqQFP8j7m7YSOWJ9rfGSg3XE3L+JSsMrjJB1JMflvHtfD3R5XD+hv8jM1YrNrvcLRv+GP1U9+3XlBmP+VS2Ub1AdDFydKs2Uxs8xYP7Es9HpMqJc7yWPrbq5WLORApBSeSltkGyK4f+dB92yRcenfllzwCRAAZ4K8WI5oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iqc/h5cS; arc=none smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iqc/h5cS"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-32836ab4521so166248eec.3
        for <linux-tegra@vger.kernel.org>; Wed, 23 Sep 2026 15:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790201056; x=1790805856; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k1oWgDzzyzgn3DsMuIYLcEQN7MVtCq5GjZ4iffV4ihs=;
        b=iqc/h5cSSJEtqxfovm9Cs+gCmlaIaLCj+qRCm9ZgGZE539bLilGdvvXG6C2Qr0BHhQ
         RWcr6g09tziVkSP9q0xiVru+PXMDWEmzL7seLLJuxESDWxwcgZmbLb6KaHgoFqoKXnEK
         XVmVEdocwWWMXMZY4yufYamGBsChP06jOXY/7w5JkxNgZ56PTXoYJo09ygcg0z9LG7O8
         Xsdm+tBEcRqMFpNmUrgN9BmZiDLyg/YeI0vmCdExa1Ji6UWgo18i5AgT6b0tCDcqIRGn
         VkTScdZ/jorDcjXEqKCaGtCxCYLJRwDW1Di696q0FtHKphDgYVycTFj1NmaUuhL4Gfh7
         4vwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790201056; x=1790805856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k1oWgDzzyzgn3DsMuIYLcEQN7MVtCq5GjZ4iffV4ihs=;
        b=pgmT/x0nvcK2/UaKgDNXyIeieqZgkAJsEvTWq+reuC+xCzD+1NI/RDkVFSNZujdDWR
         37wGpy0JC+E7Y98RV36BZ2CDLYokz/W+0fiBfbqOA/4tEB/0S32QUdxPyclyd8TCrX7W
         dk31LGoiFhoaz8Fl+WjP9RfwhG8GkfcWDHUzWbvntAnmrX1j7b+Y7B/QW2ttrSdGs9mF
         Y1729yS7aXfPG5ZlzWuaF5E21M/dxx+jugooX4EEqB73sCq80JuxaSITezAd9Ch818ZI
         QB5Fkp9h5bmfrLk1VQLBuCcntD97V4DIW7A+u3d7cc1gg2wX8SKImkW50E0pnWCN1j7O
         hSLw==
X-Forwarded-Encrypted: i=1; AKwUvBxoG/Dpn17KIYnuv8Ql6GZswplshqGoS2HbZb/5d2W0UIQlZHQjkRVAp6rEcfKv+hApIwPmWC41sDD0ww==@vger.kernel.org
X-Gm-Message-State: AFuF++lcNxwl+6MqSKbDuSKyKnFdOUljuoLR+rnyfAtbRepJKVTeYhiD
	LQuKFbXYa04YBmxkxJvF9HXEJ4CRFsJSxdnMnPHTb4NAkGREa15C3x4k
X-Gm-Gg: AYBFou0OL8waiqEczj+2/zeDz+ArOZn/+KVfgfNYXy479Oq8deAqRwh/ffrHTwZaYNn
	CBnPnVFzIXoH8YEoiDQZ3yimhlbN8SCzxk14YEx25+GuEhkhCkWwstrtHzhSlFhTvqeGZK5BQCf
	nSFZ0nWdUnfYbtmjg4C94cr9x0amHqU0LpfNMBfpJABc+4vO32+39jki1FrvrIKXly+5FpORfHI
	CLxGdP37/jnFsxan4U9coqVjn08fehqc8QWCxVgtknxro2dkmzX1N+C97EZW0Ox0e2gawgdafUJ
	gtNktq3qCOjaJKcKTItHan7qccISgnp8jeX4FLP4aUceuviJmpAysRy2ODGVlLq5jxlkqQKRLJF
	/lABLgG4KGE8ijkL+JIfbe2VyC4ncgjLwgTJkrMD/QB8ltHWhvDlmc65cNNKJw8lVWrD9Wy6K14
	uiJ0xcDF+2fIF+4OlWrKRJCCUUUzpYiLZs3fmj7v1TC6sW54xR7ZOZpeyfi9gYLMgQvh4ucQzEP
	xuXKsY41knZ5xXWoQ==
X-Received: by 2002:a05:693c:87d5:20b0:33e:9ec7:45a2 with SMTP id 5a478bee46e88-34001f125edmr666208eec.1.1790201055436;
        Wed, 23 Sep 2026 15:04:15 -0700 (PDT)
Received: from [10.197.48.252] ([2409:40c2:5047:8a3f:9ef:734:1515:aac8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e95c7bf6bsm7962458eec.8.2026.09.23.15.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 15:04:14 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Thu, 24 Sep 2026 03:33:30 +0530
Subject: [PATCH v4 1/2] regulator: dt-bindings:
 nvidia,tegra-regulators-coupling: Convert to DT schema
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-ti-tps6586x-v4-1-6c7a8fb8b646@gmail.com>
References: <20260924-ti-tps6586x-v4-0-6c7a8fb8b646@gmail.com>
In-Reply-To: <20260924-ti-tps6586x-v4-0-6c7a8fb8b646@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790201024; l=6027;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=5NRTfbaTrkCr5LOdsA5VA+Gzr3i5fzEHKnaeh5azfmE=;
 b=fZ8nVo7kLTKYNRQ3rXO/ekavlZuaLFdw7hQTwo+aYkVE76oAPggIx8REBTvceme10MBC2ePi8
 TOSaT4Zelw3DEGA/AxlPUrOYo6rJXciI4hlzDJJdPsNw0BdoQ7lEZQW
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

