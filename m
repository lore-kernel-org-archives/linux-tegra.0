Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514053CA4A8
	for <linux-tegra@vger.kernel.org>; Wed, 10 Jun 2026 08:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081574; cv=none; b=DF96vnyY47Q3g0wM+XE29iu8p69h5qXIyhWmOL0yE9lX9GxMgNPNmgQF2KXKTvrNlyENrOAJW+tRApVDkCF0BAsECjA+siRvZbnitcrtRauZU7jK/bKzBR0mFTqQL2ONlToW2A76V5SwZ2kTu9h5Ngn8BtY27wDNbVXSrx8xPQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081574; c=relaxed/simple;
	bh=mcI/q+LhnTwFsgpuGRD41S+Cl+laWlV+orMRVBKD6W4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OVMihTvHZbFBhsLRJJ3HLd2LkKVjxRU+NuzTRex6w3oWp95QE2cecdmRdmqDoUImtuEemN5AGzfKID8u3THDuMMBppiMTwc1FwLssilDqLeuBV5FxqjvFLBorEg6NxdkjB8Z0sulVgb9G4c5mzE+pRkgavsDFda8LKSThF0Vk5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mdg5+8jK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=elh3IY4y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mdg5+8jK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="elh3IY4y"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7hdMi531330
	for <linux-tegra@vger.kernel.org>; Wed, 10 Jun 2026 08:52:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oSuOxyqohNyFghg6trX5SYjSHgMDEUyPSbSYNvimIaQ=; b=mdg5+8jK1Yod+3UB
	MKGxGgARMLz8SkRgI1AC+ffOj9duVH/OAfHgUH2xzdvKJ5raF5UlbOTRlhLIt2OH
	SP8NzjxFrruVUr5sJ/lOpv2SsTniOF8KJfVteZuBtFvA1iiNNNSx+xPCkZ/f7RsW
	sEaFXWH/neuPjJASaEeHsK0l9OSqjmhoOpMPWtM4JIzKZPpLVUynlxDvTG7cHFA6
	+awq5dCep66R4z1/tDoHRKEonOzEXNd5iBRs7yuAeMaCtVlXU37po4qSxyVP/qRg
	OGPtoIY3txYizcUplhvHvwlA4Rz1nLd3fxv2fEkjo0+rAdYP85vLs+0eXSjKxdFV
	xhePCQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq0m1ryg0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Wed, 10 Jun 2026 08:52:52 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0a81c1738so38551525ad.2
        for <linux-tegra@vger.kernel.org>; Wed, 10 Jun 2026 01:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781081572; x=1781686372; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oSuOxyqohNyFghg6trX5SYjSHgMDEUyPSbSYNvimIaQ=;
        b=elh3IY4ySrbmlLm9peNP78J+QMmJPpwlWmLCzwqy/ZSpq7HlJFbTxgfTyKxy4+HuU3
         5NcrVusSykm/WIceVRVks4CRI/+Ci8HF6awHyHCk9PIl9hRzC9u3ABXMxAKcy+H2S0ww
         7wMl7bguotUI+kU4iOGULVnc5tcg8QKF/dMZWUiDepigrDN86nwteUpsPHMwsnfmq7ST
         CJ/y0EJwzmVVps46DACJCGQVKoNClhMlBdA3P/xBUgGZbTlYNjY29ZwRgjW7NIyixM3p
         KzzCf0daJXwtMAkk+gPwux9o1lm1szNVgNXJ5+lrrJYd79HbdVaI2G5Xm0aejb5IGUET
         Tj9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081572; x=1781686372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oSuOxyqohNyFghg6trX5SYjSHgMDEUyPSbSYNvimIaQ=;
        b=SoITn7rr+tKG8vzBxw83ysqWzw0mupiU5oIt8i89TgeEcd8vbKsrkvC9nea3HAAc/d
         whfpZxVqS3yoIiz8/vED1HSe9ZfEUTMnluqn2D8pUwqRnMNzn+lPTkD5cQag5m7dPApX
         tRPw2SBzzjxvHATootbpbE65bnJ3zAe6tVVWr16mcX4QQQfoIDSxVRqzJRyBg08HO9Sg
         1h9rMZkvnuhz4zC09KNVnQxcRdFEXMWN4xaV8cHd7GouNprpJQxweZKXk8U9H19zLpw7
         G1oXes/y7HyAnQnb/bBl6/2aOrULuEQdZfGzgKktWVeCieQ1LFSxqKTmb551v/JJfBUC
         eE5Q==
X-Forwarded-Encrypted: i=1; AFNElJ/kLXYOSPfaPiXvJOo3XNX4zPyOhLeArXGTany2QSXjwq9m/2gLeep4WK58nwWwVyjahdhDotFMIZdI0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YykgSGK9ktiuqDtji/sQ/yI2035ewGM1iwyKQ/EgHH973QYPIFy
	/YTRrUhD9IdHdsH+LuMXFyt8tMXNbKefy6nYl0MZf20G0IV2r924rQZ4MSp+WZdKyVwZas9KyaV
	YBVtF2Em8Y3Zjsgsqp/pWhLb/Y6GFbozdYA0/ErhIb0Upjkrb4AXOsAr+ka/OrdKXzQ==
X-Gm-Gg: Acq92OF/gKEqqaxOzRN82DReMtb0eH7rFz4uqw+y0G69U0I6DtU8hdiTBh3T1EvqgkL
	8WeQEnP8RIRwk8lyvTQ5IMzSMmN7nLB1x+DPzJu+sMoPnrZFbbmN+htZzjQaNjfeDgQhu7S6OxN
	Ak1Si3f4CPujMFUMgzzfDi1lv5R1aQXqLzJbEBI5jdedvM9btlH3sfXzgeTL9JB1a8xQwMgB4BR
	Z9pttxN3Dq/DfPEZ+J4WhGTstBhfEQgx49U5izVEzziEvF3TzYQAiHf4mnGDOhMlQUkctjVdYrI
	uyTRJRwBjusz98ZR9Bx5VwCFGTjiImlViL5yhcVzdT9fYIuJyht+pD2CFZgB+ZJdBxA20ehvcmA
	JrXB2UmW7vwxQl3tx0BSFF56Vc9M1/uJ4fUETmaDhKJLell/1fq8cM4Nd7M8OUUeVcuSetuHKeR
	9lO/hXOqXoBOdtObLc7BPDRcoWWxrdV2iXHhVVnez4BVtyf+5EIjHKhzliLdI=
X-Received: by 2002:a17:903:908:b0:2c1:a19:8396 with SMTP id d9443c01a7336-2c1e80ff89amr302918835ad.31.1781081571972;
        Wed, 10 Jun 2026 01:52:51 -0700 (PDT)
X-Received: by 2002:a17:903:908:b0:2c1:a19:8396 with SMTP id d9443c01a7336-2c1e80ff89amr302918445ad.31.1781081571486;
        Wed, 10 Jun 2026 01:52:51 -0700 (PDT)
Received: from hu-ppapaniy-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c24edc8acasm114618175ad.45.2026.06.10.01.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:52:51 -0700 (PDT)
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 14:21:35 +0530
Subject: [PATCH RFC v7 8/9] arm64: dts: qcom: glymur: Enable
 LLCC/DDR/DDR_QOS DVFS
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-rfc_v7_scmi_memlat-v7-8-f3f68c608f25@oss.qualcomm.com>
References: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
In-Reply-To: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781081505; l=2333;
 i=pragnesh.papaniya@oss.qualcomm.com; s=20260120; h=from:subject:message-id;
 bh=4Fx1VL1dpIFfd4Qo0Yj/taSxtHb2Ax1sJaQX5XeZ+Cg=;
 b=BjKyZHKjCreiepd6S07vHbcdWfLq7M5XFoZPL3rzrC1KJGYL3mrnWvPRBNOAo0xvsE9tz7sup
 Y1kMzGHyWhRAn852ChSaz7twP6WkOVL9Kxk3S+FaEq5bGeKkbeTRDZI
X-Developer-Key: i=pragnesh.papaniya@oss.qualcomm.com; a=ed25519;
 pk=09P9nFmZLXJ9+4Jx10ZK5rIW0Fmk79A/DLErm6aVA0c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4MyBTYWx0ZWRfX9tGrdH/wN3ny
 KvSmR34gcWQTBTDVSVbv9mJIOC6f1NoVdH3VnBUJEZRT7qYKMmQqjQvygIgV98jvDpGiGXovlco
 P9NA399n9zNt4CXpY7Ft1VE2pxG9g0ofEGl3TVQ9sv5BgbK4rMl0yJH3H/QtyfmVYGJsetRuyn+
 9PgN4qA8F7lHw7pfQPabSPurE68JWZd3y4Zw9lyyRLsAvyIiC3vAk2yF87QC8bMfAcE8cEkE6mp
 s04jT4vZFHK7BxN/oXzMIwtkvluTDrAff6LGSC+X6ynW48+7LhpryAj9iV1oY5HQyN9dG1zJM6t
 m50GcaQGOASElnUeXSAYE6u6973VQKWf6Ta6y1hsrtvhHu1lj22s2RZZZxC5euHAMcp7kwl+H6P
 RN/lhIoOOrgNfxcImyMUsTf7q+dkjs41nVxdQ74LMPWtXIjcj8uuB2nOOsHy89Citz/JNXT9wnS
 tBEUrhO8BQaE/B3/GNw==
X-Proofpoint-GUID: Qd3O5opIX4TvZvKFv6jFUoS_k17nM_n6
X-Authority-Analysis: v=2.4 cv=UdJhjqSN c=1 sm=1 tr=0 ts=6a2925e4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=-olaiSHPbsRiaquSn4UA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: Qd3O5opIX4TvZvKFv6jFUoS_k17nM_n6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100083

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

On Qualcomm Glymur SoCs, the memlat governor and the mechanism for
controlling the LLCC and DDR/DDR_QOS frequencies run on the CPU Control
Processor (CPUCP). Add the CPUCP mailbox and SCMI nodes required for the
QCOM SCMI Generic Extension protocol to probe and get functional bus dvfs
on Glymur/Mahua SoCs.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 41 ++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 20b49af7298e..c0edbfefc39a 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -396,6 +396,20 @@ scmi_perf: protocol@13 {
 				#power-domain-cells = <1>;
 			};
 		};
+
+		cpucp_scmi: scmi-1 {
+			compatible = "arm,scmi";
+			mboxes = <&cpucp_mbox 0>, <&cpucp_mbox 2>;
+			mbox-names = "tx", "rx";
+			shmem = <&cpucp_scp_lpri0>, <&cpucp_scp_lpri1>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			scmi_vendor: protocol@80 {
+				reg = <0x80>;
+			};
+		};
 	};
 
 	clk_virt: interconnect-0 {
@@ -6919,6 +6933,13 @@ pdp0_mbox: mailbox@17610000 {
 			#mbox-cells = <1>;
 		};
 
+		cpucp_mbox: mailbox@17620000 {
+			compatible = "qcom,glymur-cpucp-mbox", "qcom,x1e80100-cpucp-mbox";
+			reg = <0x0 0x17620000 0 0x8000>, <0 0x18830000 0 0x8000>;
+			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <1>;
+		};
+
 		timer@17810000 {
 			compatible = "arm,armv7-timer-mem";
 			reg = <0x0 0x17810000 0x0 0x1000>;
@@ -7103,6 +7124,26 @@ rpmhpd_opp_turbo_l1: opp-416 {
 			};
 		};
 
+		cpucp_sram: sram@18b4e000 {
+			compatible = "mmio-sram";
+			reg = <0x0 0x18b4e000 0x0 0x400>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ranges = <0x0 0x0 0x18b4e000 0x400>;
+
+			cpucp_scp_lpri0: scp-sram-section@0 {
+				compatible = "arm,scmi-shmem";
+				reg = <0x0 0x200>;
+			};
+
+			cpucp_scp_lpri1: scp-sram-section@200 {
+				compatible = "arm,scmi-shmem";
+				reg = <0x200 0x200>;
+			};
+		};
+
 		nsi_noc: interconnect@1d600000 {
 			compatible = "qcom,glymur-nsinoc";
 			reg = <0x0 0x1d600000 0x0 0x14080>;

-- 
2.34.1

