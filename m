Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2E337F30E
	for <linux-tegra@vger.kernel.org>; Fri, 24 Jul 2026 07:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784877584; cv=none; b=IMvkZpKhnYgELdsQJv/QZEQhBEg9XFDhlIx/pQElADgy9Ii6do0rzD5gFcl+WAAZrMq82AAGwYDcEMs27A7TqyKULnCKtCg8eZyPmtgJgbhguQGpUlfE1/pFOu1QrB3mMxQdMNc1vlheULC9cEGwr3BbCg9YqTa8FrOB0scnoOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784877584; c=relaxed/simple;
	bh=Yo9zeGbwbXV4rUNiXUL8lzuk9/G4RJrD++wGm42RLkY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SMxnNS73s/xAZbW7Qd5qbVatksetpSdtWmWEgB4iWCFUJwMhR5qvO7lVipz35zmBtHuvCKBIJ7l78RYI7jj1IlzYNPSRP0Odwvca41MBVR0iTTUGI/gngoj6tF2jYO1LmBYBU53lV8bsRn4fQErlFobKjO/95se8DrIEG71x3Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KNjt6WWH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IdI4RXAZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KNjt6WWH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IdI4RXAZ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lOtq1992302
	for <linux-tegra@vger.kernel.org>; Fri, 24 Jul 2026 07:19:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zNUV/8sm81bezTrvcZDm6VKxqfl3WlqL5X0WFl+eir0=; b=KNjt6WWH5tvWXHe7
	unp+sXXcCLjGMuI07DlpqLnEuuZXxTbUeuBRjiFsDdILuuYdT6RQn67fhXiTDbnn
	1aNbWS2ZakqlYwG2BK0QFViz7UIx7V8dMELyVBz9DApu+AWSKN6YynjDr37j90I0
	FkmjaPqC7NzrAqRbzFP/F/PY1ghIyIpf8UGtcDzUdgK3MYkX1Lri0k5OXQGRi5U8
	/Vck3er5tUHatkQMKo0SfbU7fWPIJpMH5dJGg7QQ7m5c0lXDH4xhBHqEvAQGNHu2
	gyeinpp3e1p8LAlj6bhogJ5aqft+nvxtHTtK2zcdg5i5jvbMDxaUsJJ/uOGFJe8M
	PJ78Og==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm0p50mes-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Fri, 24 Jul 2026 07:19:41 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cacd6d37edso2659265ad.0
        for <linux-tegra@vger.kernel.org>; Fri, 24 Jul 2026 00:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784877580; x=1785482380; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zNUV/8sm81bezTrvcZDm6VKxqfl3WlqL5X0WFl+eir0=;
        b=IdI4RXAZpOW0EDICt/VpuNhQybe4b3bpYGrvjeE2RHYq5dHNhFfK6V9xODT/ASa6dn
         C3WRf5Ibv/mfrkJLn6ujw2eru8s7i53sAdgf/+a/8RGVbjTEHq03ldz776uh7yEASuyC
         5zKgLpfXk6WC1ZEucYNSXqK99vC4J6A6EySWEQYYTXtpNzFmM22+81uWChzmjI/PklGD
         0y0e/WwKWicQVENyheBsJ8XQThZm3vajziWk42Jbd8DEfb2ZSYBL5lvuhK34VPJ+TELe
         q3Yg2axkyKVrpLr5ESEZOxO1csX0AKTNbGYgPYUitennVbd3XDr6unxH/mn++PisYd95
         aIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784877580; x=1785482380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zNUV/8sm81bezTrvcZDm6VKxqfl3WlqL5X0WFl+eir0=;
        b=exfdprqBR6HqawWvt09dLHPZ7ZKnVtr10IAB7Yeal66KU9oN1Yoa92RRsqVkycaPWg
         kBAPEA8i3UxRHD0el6BzPp4HmAWxJphPOZK4UHkHq3DvJPONIFc2sOXDaJ/OPptlJRpu
         qRz96xhjI8+CIphFMUt8LVquNmh93a56hK6xqGFWSTOs94TH4URIK3+psN441X7bwd5y
         LTe9uM/0tCkeMrap8n8Ql/7XyR5B+yRIyF2M/MZ7cFmkBXVvRgjURKpm+xjZHxgRKJ01
         1m1kVZ8ESomvfW6qryNMuLMKPqPWWlDadaBLlc+lSa8GCU8USAqx0HnBR3mwl++fyivk
         JtCw==
X-Forwarded-Encrypted: i=1; AHgh+RoKp6xj6cv52OdEbULsKe6sWJpnhQPabHFLsH5Cbtj4w2zHKHdP6fNYlT71DVbOEF1FtqLYt3iM87vqZA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3nx2N1wCim6K8uSvGogQB0/CJa0rtyB8g8XJUqbotRPK+kQeE
	aHOkGvssxTp7pa5UVucvn8YNzGQfvIdcE53sA0m+iFh8xatYwZPf23263AKBbxyzPNEUU1VIHnx
	rLweMooz8onKyKAP6hwniMtjWvmZCJBK9ewylD6EFrzMZWhsdOFBR2RTYHEj98bGy9w==
X-Gm-Gg: AR+sD11BjHU1kyHhn/2MxYO6wUscennS5azUPSGxPp6plbsOTxNnsC58/pqZOgqTPFI
	ngzrF5lZU7xxywvAlDs7bDrDXsmh0r04p0i+lT+n6NOEOAXnqSbUuWTWDh8kQZWQNZ6edAZ2Qqu
	FWivRmyrGi22HFJ3Rq3sSHOjihrjPGVVi+aF3KK51nP4xcMjRhVBnTq+2Vl1LpheqgNNHuwGSmr
	KUd6JGO8f3VnzFR+d9flgPzPJ6Y+IscQVBfDamOu93a97d+VSUUWfNNxY3e9kBU06gYJH37oEDI
	4GeqHRH/JVpBWDaxjTJf3WrZUYDSXNBAjIP4lGvieeuCoIOyg68i4qsfyBR/rhrdSdJiN+ZxTUt
	+Xsqn02+ZkhAY7kYKD1N1f9stfgKjjHmihlkYs7vxTOzaBDNuh/ysXP/mWnDgfI+8SIAadaQTn5
	7oYC0B1ZL6NfO5KbdaNAO5xbnpY6s=
X-Received: by 2002:a17:902:e850:b0:2c9:9a19:df with SMTP id d9443c01a7336-2cfa71dc761mr69959865ad.18.1784877580391;
        Fri, 24 Jul 2026 00:19:40 -0700 (PDT)
X-Received: by 2002:a17:902:e850:b0:2c9:9a19:df with SMTP id d9443c01a7336-2cfa71dc761mr69959385ad.18.1784877579885;
        Fri, 24 Jul 2026 00:19:39 -0700 (PDT)
Received: from hu-ppapaniy-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efe3afbsm45993805ad.33.2026.07.24.00.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 00:19:39 -0700 (PDT)
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 12:48:13 +0530
Subject: [PATCH RFC 08/10] arm64: dts: qcom: glymur: Enable
 LLCC/DDR/DDR_QOS DVFS
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-rfc_v8_scmi_memlat-v1-8-cb732bcff1f4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784877514; l=2333;
 i=pragnesh.papaniya@oss.qualcomm.com; s=20260120; h=from:subject:message-id;
 bh=aJgvkeU1hYS46AIZM4QP3B9a00RqrtIO/xjx76HW+fg=;
 b=hyNDpepWQq8DZW50Hf0XKBhuQW9YP8x4gP2ntWFWx1ni2fW0+zMs1ZDdZWb3Acb5szBESdj+M
 y7/hPXttUVHB9YFZsF5+60PtQo990FpWQysl1rMZga50QkgkPksdsW+
X-Developer-Key: i=pragnesh.papaniya@oss.qualcomm.com; a=ed25519;
 pk=09P9nFmZLXJ9+4Jx10ZK5rIW0Fmk79A/DLErm6aVA0c=
X-Authority-Analysis: v=2.4 cv=Pq6jqQM3 c=1 sm=1 tr=0 ts=6a63120d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=-olaiSHPbsRiaquSn4UA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: xYNFLHNqkxqLH_hNjJOFhtqduqXtTPVy
X-Proofpoint-ORIG-GUID: xYNFLHNqkxqLH_hNjJOFhtqduqXtTPVy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA2NSBTYWx0ZWRfX3jq8E/vR0p34
 KWmA+tmbQQZJ3ipplCxvqCPucwAIv5ScrYJQjalVerRJvvv7ZpjUOQ8Q2v8CYwqjdnA0BQ58WSx
 FY+64uotdnaXp75w61zKxGsoBHX3kbQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA2NSBTYWx0ZWRfX6g7195YkoHhd
 EwE7XIkNKOL5iQuSriNd0PN+dIhUkLk/gJMPMaAYUiLIcHsPn/cBklP19bBUsjlh+NY0uqwMhZ7
 u0628Syv82cZWLY0CLaN2WiFZUxsMR+uEMTv+Mj0Cn76A1nq1959F31uhWjkZUupVYRffbiPk2U
 JQqXWLp5PIwirMWcm8/dOWYkM0GUwWvyCMkHi4XGX8hx7DydDVY1rr5RKnfNYsfOJ2MvorYHkDz
 O19QB1eeQcrgJU9EMKmGHYnEYkWT58iFlbJOIu6ha+uc61SCqjpBCJuIQ9EAuxCN57ANIKffBwp
 2LSVY3yeobJke4eiYA1DkuWrsA+cLnDRgxr5qc8Dz3HQg2paGPPvsEVks3K31RP4o0tq+bmNner
 jj4uhJ67OFRieLdSFDjAVgSbzGhblJz5br0GO/Dxdu2hIA5kakqAO8/RrOq8N+Jbx8Jm8p0HOe8
 Q2bsxqo0m5fN/XAo2EQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240065

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

On Qualcomm Glymur SoCs, the memlat governor and the mechanism for
controlling the LLCC and DDR/DDR_QOS frequencies run on the CPU Control
Processor (CPUCP). Add the CPUCP mailbox and SCMI nodes required for the
QCOM SCMI Generic Extension protocol to probe and get functional bus DVFS
on Glymur/Mahua SoCs.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 41 ++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f32af66a3f1c..32ac471e6727 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -420,6 +420,20 @@ scmi_perf: protocol@13 {
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
@@ -7658,6 +7672,13 @@ pdp0_mbox: mailbox@17610000 {
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
@@ -7842,6 +7863,26 @@ rpmhpd_opp_turbo_l1: opp-416 {
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

