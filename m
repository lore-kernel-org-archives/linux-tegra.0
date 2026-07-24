Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4093A7D7A
	for <linux-tegra@vger.kernel.org>; Fri, 24 Jul 2026 07:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784877539; cv=none; b=HmAQBS8ee8BeWpFfttKnzXgMto9p1kMfq0+hr5XDZ2ir9hwVakIDkNi4GyHIhzCzYOHAzLuEL9VPM9mADiDeK8wHLN5PdtZwBd1rLHuxWEfqVeClj2xCiyYXHOeusaqqQJY4+V9dd/J9Gz0pxAZdqmbFZW36q3/TU2VwBWoPmOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784877539; c=relaxed/simple;
	bh=8kOkUq8/QNbkFlOXibGos7tK4ImImcoivey6N7UaC1A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bm4E1gYtOsxC/Qrpd6Injy0VjoaJHY51PffvEczJd1OYIbXM9vCx2ZJmCavQCpeuhPy6y8IzLchTyIeiNkxcWZO8lxkmRoXKBS3iDN8T8HabtMlXoFk3NSww/loM8ulpSRJPMUax9SkEuH4G6f88p5qff8gEvQj9BrDIwcb9130=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h+Inf2Zj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D3aSA+Jl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h+Inf2Zj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D3aSA+Jl"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O5xNfp1892289
	for <linux-tegra@vger.kernel.org>; Fri, 24 Jul 2026 07:18:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6KcTwhi8obGfuKLj8dNnCltx59+O49u6DXb3AWbAy+A=; b=h+Inf2ZjQWvrPiCE
	chmr1Np/f/lNLp1yYpWVdXgR4z/nUUVP5nnCdeUQSbDL3mktBPdXXj1jT8WeIiBN
	0jtg8btiWVXuEDbR+ezRdxqkg1FukelNmq7P0Gk13LRcG6+yxu8vyU5A0k6AX3a+
	k3JTuTSD+WJDKKCm+vbvBy0pUY2S6z9Ml3jHttP+xlWZIlq/91mB7Qa6wRApDgYs
	95xOFBCHTPL4+8A/q5ZP3PumYh4nncV2oUaG+9FOdIOP20tITKC2yTZ3sCcKiYvc
	ZwR0NlqjFTquiaQtV61tAG1S6zHeL9JlsRvi4ua9uKhs1Rs3+/xaF08340ZpEByX
	yLNWoA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm2cx89tn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Fri, 24 Jul 2026 07:18:57 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so226471a91.1
        for <linux-tegra@vger.kernel.org>; Fri, 24 Jul 2026 00:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784877537; x=1785482337; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6KcTwhi8obGfuKLj8dNnCltx59+O49u6DXb3AWbAy+A=;
        b=D3aSA+Jljr5/3GTN9QbEq48Fj+aIXlueddHI8vaFngvQewUWGBjSzZaKf2o5lqvREX
         5dhQvy3Hl2/sxdBWNi8CQHMtUozJ5BduAZNhOfOSoYrOuT8NkH0in6hvRnE3spKUjYU+
         HCJRZUdYkaKP9A11+0lUe5gqphgc+5MCyqJXm0yYrXO/7SEDBUNfQT9xpP/1tg2oms8N
         k56cA1L8098D6k9Vqfb/FzOt/a31hxfmAMAsr3TNPhGbSQ4Flbr39kPieHYMKFgqRlmp
         BujMRKdVmllgIh2991j8ob+DIAvW0ooUYCIH6XHRBE6KsEU/3DCZcho7OISjmuDQSJFG
         gz8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784877537; x=1785482337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6KcTwhi8obGfuKLj8dNnCltx59+O49u6DXb3AWbAy+A=;
        b=mvRRrW9QiY9ygcvAEIM9AYMBYAMmI6iEO2tXBFHzRQZ5GNIo/Umx5xjZpu4kcbfGbA
         DKTGYy75WebrP3x1PALw/vcmO+9/9VQdkhsPiCzTcYSMiYC+WFhFTm7fcQv3KyfntNMa
         krE+sJyzFRKDKDfPGb8DJUouaSvxCLRQisV/J4mXMQdh+wEwDGF/uYf5P9H/G43xprPF
         BYlUqbvwKb9riiH5Ev7ZGy4L9iRWiqoPE28MxA8OUIQDuzWRYzL54aPmObOP+ruddGNB
         ehj1hfPay0zz+ZNNDTTjSZT3Xw6ljg7Axw+eyuBXKefX4GenJfgclT7I+QRkOryBfHKl
         TlxA==
X-Forwarded-Encrypted: i=1; AHgh+Rp6pDRY4X6WDEDngusRGXf4MSIq17u+sYcUVXZvacvgNRO8TxELAQBqCsW4tmWwgLAJEUuUTCLKN1B5dA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8cslBn1nkFcM/4PCZF7SjncvH3NC1e8yWyQEQu03v/Dg6zh5X
	Ni/+I0Is1xGsBTW8qiYQc+2pyx88yyu8LtRmRv3xck+D4k4rPgPLQ/MZloLZRn73B6gq03CYY9b
	mvsAURTTEwGxNrbMNHyX1tgcsHYexwTwlav/+u9B7PoYHVbwuGTnlHGZzm7gHdJHidw==
X-Gm-Gg: AR+sD115+xuAi2IpwakttZ1ALX1SprEk17he0hEvXBtpdgDO7KxjXbMgQ2INdizEe88
	bbWH61LccWH+7RW5NENbOQvuSzlgntrsG50qYJjwGdDon9BesHTHQ9iXS++l7kOtdmXYTrUu6o7
	mVstdYzf13oY/evH3OHm6YUSNMtN05NjaKAJoNzdvnXp50QRLOriCx9L2odlk3FKnzrlm1GsYEW
	KVOnlx/u/atRvByg6hyyC6UmXOjeZXGjp9i3T1xBgkPPeXV3nmxr8+hkcGNfFcwspEEC9oy6xfX
	OX0i3uhoRaM9COdqwid1OaCHTpJl48WIJLLPI98L9G9FxWujsaT70fimVm2Y/Li6mSOB/WafGPb
	2MWHSylbBDec2aT3xCqaCsoyhmXb4B+ps+OXyOxUBKr70L7NZDjbAAWoL+VwxiWpcOXfwgTeaBK
	tCbFbds6WY0ygcWdp/Xkt6PhbFdQE=
X-Received: by 2002:a17:90b:4b08:b0:37f:db06:229c with SMTP id 98e67ed59e1d1-38ec65fc538mr6150153a91.22.1784877536537;
        Fri, 24 Jul 2026 00:18:56 -0700 (PDT)
X-Received: by 2002:a17:90b:4b08:b0:37f:db06:229c with SMTP id 98e67ed59e1d1-38ec65fc538mr6150131a91.22.1784877536051;
        Fri, 24 Jul 2026 00:18:56 -0700 (PDT)
Received: from hu-ppapaniy-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efe3afbsm45993805ad.33.2026.07.24.00.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 00:18:55 -0700 (PDT)
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 12:48:07 +0530
Subject: [PATCH RFC 02/10] dt-bindings: firmware: arm,scmi: Add Qualcomm
 Generic Extension Protocol
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-rfc_v8_scmi_memlat-v1-2-cb732bcff1f4@oss.qualcomm.com>
References: <20260724-rfc_v8_scmi_memlat-v1-0-cb732bcff1f4@oss.qualcomm.com>
In-Reply-To: <20260724-rfc_v8_scmi_memlat-v1-0-cb732bcff1f4@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784877514; l=2320;
 i=pragnesh.papaniya@oss.qualcomm.com; s=20260120; h=from:subject:message-id;
 bh=8kOkUq8/QNbkFlOXibGos7tK4ImImcoivey6N7UaC1A=;
 b=kcWWRSTmgHpghdRGCm+tzYMnocOcNLzdIw5A4hcEd3F4SOsgeVTWlBHbs9nPYviDl1lcqVDJl
 XTULEl0Z8EYANL6bYs9r63RpnC+qwCYRqzora1Gjcn8/0ESEKueC6PU
X-Developer-Key: i=pragnesh.papaniya@oss.qualcomm.com; a=ed25519;
 pk=09P9nFmZLXJ9+4Jx10ZK5rIW0Fmk79A/DLErm6aVA0c=
X-Proofpoint-ORIG-GUID: tofCq05DfsnidirVijbhnKMMxIYSVfus
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA2NSBTYWx0ZWRfX2BekJoKRc1/i
 iRH0X0Y2C0P0+dhnuSJY9NeRtAQSt3beSVLeSYoGtOLW/x6SweDQXyRerxuPxeItwcYf9zVFP9H
 gdIRknAYARKGZAeqY6KJ3ZWcp540R31avKposATRB8IELHoEPL/hRSA6zLSGPRrokKLaVb8T0A+
 7hTRsvOpmK/IX1Xt2RPvifEc+IkoRMfzp3BrGvZyFm2vEwxP35Mze5OUVAPhdCfEMg3qmuEEz9/
 oXeGGXni+2SIp/vbQrYBXbmm9YSOhSOaMBa9InLKpgsiZb6K92s5Es4Ur0Fgo/FSFtePobfWIfi
 zKr2L8PhRtcuzq0gAeeh08xI/VwwwgjpMoIm9lNw9SfuYZB4GeVrlrDNrSYpvb67FVLce1Kk+3Y
 qMyTHkqbnSGxEkEjD3pUWYVU+3H2oPoY/gvWNUPzt5/6EroJSZd2sfHndb/QlrK1rxpU4BjrJtM
 zp1kHftxy6mA66R5Prg==
X-Authority-Analysis: v=2.4 cv=X51i7mTe c=1 sm=1 tr=0 ts=6a6311e1 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=dmqMg6edKZ0wKbcdjZwA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: tofCq05DfsnidirVijbhnKMMxIYSVfus
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA2NSBTYWx0ZWRfX0yuMLSQIc04O
 BvaKSuTjX9k7UvqZfCFtzJ6b4lwplCc/vNpb2QNWXkpuNPIHV+YFhDtsdLtVaUU4RvyzlbRVMIq
 cyHkDVrRs6twKZ98JiJBGEYwk3ZLnOw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240065

Add the binding schema for the SCMI Qualcomm Generic Extension Protocol
which helps support Bus DVFS on Glymur/Mahua/Hamoa/Purwa/Kaanapali SoCs.

Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
---
 .../devicetree/bindings/firmware/arm,scmi.yaml     |  1 +
 .../bindings/firmware/qcom,generic-scmi.yaml       | 27 ++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
index 6fc44105f1c3..85f06a6a7452 100644
--- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
+++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
@@ -24,6 +24,7 @@ description: |
 
 anyOf:
   - $ref: /schemas/firmware/nxp,imx95-scmi.yaml
+  - $ref: /schemas/firmware/qcom,generic-scmi.yaml
 
 properties:
   $nodename:
diff --git a/Documentation/devicetree/bindings/firmware/qcom,generic-scmi.yaml b/Documentation/devicetree/bindings/firmware/qcom,generic-scmi.yaml
new file mode 100644
index 000000000000..a50e5e8fdccc
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/qcom,generic-scmi.yaml
@@ -0,0 +1,27 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/qcom,generic-scmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: System Control and Management Interface (SCMI) Qualcomm Generic Extension Protocol
+
+maintainers:
+  - Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
+  - Sibi Sankar <sibi.sankar@oss.qualcomm.com>
+
+properties:
+  protocol@80:
+    description:
+      SCMI Qualcomm Generic Extension Protocol exposes Qualcomm SoC specific
+      algorithms such as Memory Latency (MEMLAT) bound DDR/LLCC/DDR-QOS bus DVFS.
+      The algorithm runs on the SCP, it can be turned on/off and be configured
+      through a pairing of algorithm strings with an immutable list param_ids.
+    $ref: '/schemas/firmware/arm,scmi.yaml#/$defs/protocol-node'
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        const: 0x80
+
+additionalProperties: true

-- 
2.34.1

