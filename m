Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C581928BAB9
	for <linux-tegra@vger.kernel.org>; Sat, 29 Aug 2026 19:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788032348; cv=none; b=SJAAQSm4dGmmI1QABq3eSu9KHNzDFNBQU6N2jnFOTiGq1FGqNnTmTTe05rvPuyQoXZZQ+K1J8rUe+PKSdUzCgjI6GPmdyKw3NOVen/i8KnVAnBAGKjZp6DIg3Az88T8mNGPNS6/lzXJtUuype3IvPcfEbitzhI0JAiNEhhdhVI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788032348; c=relaxed/simple;
	bh=+QF5aey9Yc0AZelafCPHXHVwrdosC923drKIebFNQ2o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HU+siOFs3AkI4CM7X/tG+a0uBKLDKrpGYPbBlsg2gB2csCtQJhkCAbGGS05i3eZRnMwhGHzmdlQKbj0hJZylaDGvDzJEXW0phpvPvfb4709O33GlmGcMBRFM0bqa5a9v8RCst3flTF5rkJ68Feik/dCw8r60EOyDdV/0LijGcvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fXRzXzOb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SLQleUI3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fXRzXzOb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SLQleUI3"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TGx00l1257806
	for <linux-tegra@vger.kernel.org>; Sat, 29 Aug 2026 19:39:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=MXeAryZW3xPGLtYXy8CAVnHkvUiYSgcLyOW
	SZ3+p2GE=; b=fXRzXzObo2iWNNkgymod+XykpeH1YZRQ1D3iqtqVS/2K6ckttSP
	oggx5SHqPi9lhKT5EMoPnFAJueWQ7nurlVkdcEWKrJo7rGAo7tB/KKN/9JjYcRYY
	NP7QM7ZGHUMPtL8S0Kiy9WtQcX07wnVCqwnNKIdmWj6nwvQZtnuB7Mzi4AYNVejg
	PIjAHIaad+fwCUXRic3GoK+Ro07uVNE5xgnwYFEPHWRTis5h7tt4QmabJi8NrNwu
	gERNs5Mnae1MKKuOntfdC650I9eggNnHBnByVBeGJ5VrqfVPt+jkJ9qBmcPyy3T/
	J29X+NLtSkdU78OLwuAUqQ/PEQn2J5wLiXw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrkgsgpt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Sat, 29 Aug 2026 19:39:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52ce64c41efso48964541cf.3
        for <linux-tegra@vger.kernel.org>; Sat, 29 Aug 2026 12:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788032345; x=1788637145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MXeAryZW3xPGLtYXy8CAVnHkvUiYSgcLyOWSZ3+p2GE=;
        b=SLQleUI3yXwWNodfbmhpT+LkGjj5kQ/PvJ0BusiF2TawUVdIc+z+UdokDjYPk8Q+cY
         ehfyxIpM1gJ+jC20P6WgGfTWpD3Ocp5XrgmXSuyIfQoGFZNhlxgMUwukGFdMrAOQwAX0
         PrFyZqSmSQSWZfmY/155c8JZ0TtkICePssre74p29xsKZuY5fZwXAXf+PjXzhgKtP2t/
         tn1Uej2jtmbV/p2RkXJfXSxnaX/qlTWcYm9atxFMkgtE7B/b8TBdK1xhkGYq+l0tSqVA
         UCFr9k6DkJE6KjZUNhTJP38ah7ex4aqFE7lZR3QR0WLTgXcgg6Eh65kP1KdsRHkMQELl
         9GUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788032345; x=1788637145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MXeAryZW3xPGLtYXy8CAVnHkvUiYSgcLyOWSZ3+p2GE=;
        b=p5shIrqofi6s+nyw2i0a+eqkfZgCCRzYqJjtG2fagMH6xEFp+j+xy5q2gfrq+CnoKb
         RbZbxlRvm4oprE6Fi78uMgYMMFdTbKZspvQt8FDzcuBbKg7uzFG1scSnWOipysllenzo
         +ywYpPdZK6chiKUUHnVrqa84IGDbqw2CXZCIockY/wuxIkDNIPlgETOy/XRnnGAq8jlm
         UTpDUpp5gATvuzjcp79TbWXhfzsXOwcPl/j4VHFYGMi1JIDZceyR4h1NTSQ+nMT0y/nb
         6izgnd7OCDt3ddS/2TDhT8fMQ3x9CHzRStZQ7L5XlrL83S9oxaiJSwkL+hC77huPGkjN
         nFjQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq0Q1M3cMVmUIB3Py+na76O8TKXy5SxUc5Vn6UU8s2oxVay59IOLgTNRg0XGT9rlE/ZplIBKIZ+eNM4ug==@vger.kernel.org
X-Gm-Message-State: AFuF++kd1ovj3jFr/7Oz+nJjUxdjkKxDesYwILTUC1ukI9Iwm6EuzMV/
	neqy+kQni+uBfro/3gYXJuozr1+JF458JtZkwi05l1JQWShulgISNrDARgR9/bS0x5GZNLWPSMc
	kj3iV9/6a5nW3U3YXaVtJDpNb7fxn0/StJiVPl9od/0FKZk2khTPkz2DPpO9ToxcWTQ==
X-Gm-Gg: AR+sD12qNhOuY/ar628jL6fdFXl+xY0oegieVajgJ2zs//wZ0YbfgQzcEGUiOrB0YGc
	+5GeDWI5e6FtiCQPR3LmcxZAwk4zmWmh4V37zUqBKtWRHKuzO3cRtgEUSZr+dxtm8rcJnjxiDcU
	RNBy0TYGvXNdLXlV5T8OWKJCRhPdB6Fj8wOaHA1K4bVarj8ekI7nF0OwY67hbsS9pdXdlRcwSnv
	70bTXaCCXfkQFVl9POpj7UfY7LfNMGr2NiEPdajQNMHlGFhw5XX/DfJGGAxFiqQtZRIaUFcWS6N
	bqyLOnnGMMiN2UpHWAYmbGTfVp7cG1rkbcs/1C2P59XlDaZ/+uP2aF0SvfpVSx30PLyCk9euJ31
	X+mutylzrqglE/18=
X-Received: by 2002:ac8:7e8f:0:b0:52e:3a38:8cb0 with SMTP id d75a77b69052e-52fb9425a08mr186481341cf.12.1788032345147;
        Sat, 29 Aug 2026 12:39:05 -0700 (PDT)
X-Received: by 2002:ac8:7e8f:0:b0:52e:3a38:8cb0 with SMTP id d75a77b69052e-52fb9425a08mr186480941cf.12.1788032344766;
        Sat, 29 Aug 2026 12:39:04 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cc9497b3esm108965195e9.5.2026.08.29.12.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:39:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: tegra: Replace spaces indentation with tabs
Date: Sat, 29 Aug 2026 21:38:59 +0200
Message-ID: <20260829193858.107368-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4918; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=+QF5aey9Yc0AZelafCPHXHVwrdosC923drKIebFNQ2o=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkzVSOuudJZ3KNB1HFKSvXNbucR47q5QYx+8Ah
 MS64e2IWsCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapM1UgAKCRDBN2bmhouD
 19HhD/9uor9tN+JTRQqcBo6JwJJVLK++mAQKipx9BbLBA1qkFh/rC70LeZwVqGtol8BJ14nfYFf
 GqNiw0tuwl3GjVzaTCi4rw2tyUIRGlIWSEeDLH67yywV4sm7WO92r5Hnr4pq/xeY8N0GsuFJ+uk
 xKJ4sigTJzYVydBVrwahoMky3wR5CYs1Dx6YAu+wcJ3FlUoATsKX0Xg6P5A2zdBM3iwZdaxivEV
 7lOcR6hOujho4ts8c+ScRofd5ctNY5jCEUUeJ1xq6GLVfhccJlJI2YXsNYzW2uqFmIa0811YKjt
 Dg3Rl4VGRPoSpo2jFP1NL8qdkQY6DjiVUiw4aVIjPUgjrRBBMOXblMkEoE8x0EOg5ncQIwNWYGi
 JMzQ4Ip0Sv/tZyHkxKiO3wFr0pF1rYjuE+K6lmkyWMphTovgK9NpEX0CA7vuTlCcwHJSdY754WY
 Ho/bhR+IVgt8Tqd2hyQRJug6cisINgN23jL8nGRt5R6fsr3eBYO8Rloo03zhXI6BsaMLoT6/tf1
 tOArz1GCOxpL0nWUovZwwB8XBJHDSaJH2lr1g2eP0+t4pP8iGKP4/8k0tDOQqRHrYfnA1jOdVwz
 UqT6ToHoDSBJR7yuoTa7mo1jIr5UN4JAzzdmmZwwM3VnjLnOz/dia8PLAw/N/gyTIPV3xh61cos VMrjcOF2be/YA7A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE3MCBTYWx0ZWRfX/qlbehxcfHtV
 gfqtkAJ77bbs/V8inDSaqqw9jGBfvmsH12S5MQG4UDfKmVsMNv+ZrsbOsYtwdcVyO5wWTVhLtHM
 BVI703QY+yFkg6XCg8n7lxFfl4Jtodh0TY1TD+QmhEPD+sEOLnmvZbdj2TP/0DEydQpLH438xZI
 weBnTiOBNFeIstGI6qDQW7op67iiM35Ds59TlG7M86+eypck5wx97UuvFzvp9Pfjtip6j4yUyJi
 owJljlePkyhuUs94jGDORjv9Zsv3yCUYZfn/DXh9dUqkoSNAltD5nv0O6QiT73nmIe26pC+fpMN
 igY0YqmbyL46jkjKKakQ1sbkIeKNZuJAboMWTN51cf4mhx6szW9mHyTd9V+mz5RDTqWQc/yKuxf
 XNmSoAU6tzHFQ947Wl0n4SEwDfq9hx/yOM36WGnhDhdM63GR4U2ilbe7+56RzrDavtlykzuq0aJ
 7e8ENrA8UDP701oSqnw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE3MCBTYWx0ZWRfXw9w47b76EZXC
 vxWyt5CO1W2cxi3RyiZLF1D8+kHrD8/hVahAeA8jQOgONcVzb3jbdqod1yyxxxM3C381woKua9A
 CtZb028tI6BvaysFuT6w+2gb5zE/JFI=
X-Proofpoint-ORIG-GUID: vmdZZXVIGVjU3WfA02EcxzwMJygVBov0
X-Authority-Analysis: v=2.4 cv=Cr6PtH4D c=1 sm=1 tr=0 ts=6a93355a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=MMfNdgY-GmuYLy5ODHIA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: vmdZZXVIGVjU3WfA02EcxzwMJygVBov0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608290170

Replace excessive spaces for aligning indentation into tabs.  This will
be reported by dt-style-check ("[mixed-indent-chars] too many space
characters in indent (more than 7)").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/nvidia/tegra132.dtsi |  4 ++--
 arch/arm64/boot/dts/nvidia/tegra186.dtsi |  2 +-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 26 ++++++++++++------------
 arch/arm64/boot/dts/nvidia/tegra210.dtsi |  2 +-
 4 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132.dtsi b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
index 26cd11a8a4a1..cac29a0b66a6 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
@@ -644,7 +644,7 @@ hda@70030000 {
 		reg = <0x0 0x70030000 0x0 0x10000>;
 		interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA124_CLK_HDA>,
-		         <&tegra_car TEGRA124_CLK_HDA2HDMI>,
+			 <&tegra_car TEGRA124_CLK_HDA2HDMI>,
 			 <&tegra_car TEGRA124_CLK_HDA2CODEC_2X>;
 		clock-names = "hda", "hda2hdmi", "hda2codec_2x";
 		resets = <&tegra_car 125>, /* hda */
@@ -872,7 +872,7 @@ soctherm: thermal-sensor@700e2000 {
 			     <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-names = "thermal", "edp";
 		clocks = <&tegra_car TEGRA124_CLK_TSENSOR>,
-		         <&tegra_car TEGRA124_CLK_SOC_THERM>;
+			 <&tegra_car TEGRA124_CLK_SOC_THERM>;
 		clock-names = "tsensor", "soctherm";
 		resets = <&tegra_car 78>;
 		reset-names = "soctherm";
diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 705af0373a09..a396b4b2dab7 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -1517,7 +1517,7 @@ host1x@13e00000 {
 		      <0x0 0x13e10000 0x0 0x10000>;
 		reg-names = "hypervisor", "vm";
 		interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>,
-		             <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH>;
+			     <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-names = "syncpt", "host1x";
 		clocks = <&bpmp TEGRA186_CLK_HOST1X>;
 		clock-names = "host1x";
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 5e510f77b538..e1219c90dd8b 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1360,17 +1360,17 @@ hsp_top0: hsp@3c00000 {
 			compatible = "nvidia,tegra194-hsp";
 			reg = <0x0 0x03c00000 0x0 0xa0000>;
 			interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>,
-			             <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
-			             <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
-			             <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
-			             <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
-			             <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
-			             <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
-			             <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
-			             <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "doorbell", "shared0", "shared1", "shared2",
-			                  "shared3", "shared4", "shared5", "shared6",
-			                  "shared7";
+					  "shared3", "shared4", "shared5", "shared6",
+					  "shared7";
 			#mbox-cells = <2>;
 		};
 
@@ -1556,9 +1556,9 @@ hsp_aon: hsp@c150000 {
 			compatible = "nvidia,tegra194-hsp";
 			reg = <0x0 0x0c150000 0x0 0x90000>;
 			interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
-			             <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
-			             <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
-			             <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
 			/*
 			 * Shared interrupt 0 is routed only to AON/SPE, so
 			 * we only have 4 shared interrupts for the CCPLEX.
diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 5f5e5370d709..204f3bec77b7 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -1065,7 +1065,7 @@ hda@70030000 {
 		reg = <0x0 0x70030000 0x0 0x10000>;
 		interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA210_CLK_HDA>,
-		         <&tegra_car TEGRA210_CLK_HDA2HDMI>,
+			 <&tegra_car TEGRA210_CLK_HDA2HDMI>,
 			 <&tegra_car TEGRA210_CLK_HDA2CODEC_2X>;
 		clock-names = "hda", "hda2hdmi", "hda2codec_2x";
 		resets = <&tegra_car 125>, /* hda */
-- 
2.53.0

