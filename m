Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753CD3D8112
	for <linux-tegra@vger.kernel.org>; Wed, 10 Jun 2026 08:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081582; cv=none; b=bTYzXEH0kcQGf9AqCYGszqmIRv/le4s9Dc2juA1gn3snqz2emltyLV6houxnURFxiBPoQZdRusqicF+befFgCdKfLHHR589KAiRqJuFOjVVL2qfXCEHkBhF2AuTmEhsWex/OPkXXfj7GrGZuteakUGMHW0liHrgXZf7vy8ajreg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081582; c=relaxed/simple;
	bh=Er+6CpPP1ags03vijO+dnfrgarxZPqsc+RHLcBYp2zM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jpUVXLOWSR4PJhmmgE6MiWZHzsL+RPiB5qQvP9xF9oZcprsUe42LddPDOSLahBIALImOIuthaIytH5qRMlRntb9JfbgccYWXVXRBvfKLikYGtuwp1cAEd3h2f3YW6Hd1JzYq4drILfM1Wxu7iBNugW/GQYXy9BkjOYEvR+BUWz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I5zLGlEh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E2l0fIqi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I5zLGlEh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E2l0fIqi"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7htQq3151748
	for <linux-tegra@vger.kernel.org>; Wed, 10 Jun 2026 08:53:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QVPq+6JkcreslYPvbFLt1vFStJtpeN3cu1CStIhk9yM=; b=I5zLGlEhNhmMArLo
	xScB9BRdbFxzmPwZiu6nYT4n9EKy8qkBiIl7X2tqvmDQdasx1daFB1a2WsbqIBaz
	E9W6LoJgrWghQoN0uqjzfAKCqSMKGzsh96zMLtNOnOKrmBmjbVv6ry1KjpTVqb+7
	gN8PuVsmcKXrb8LuULVDj0+qB00zK/YJBQMgpmbAlTSytWkf4el4/K1bA2Fmo9Kk
	EXlgZry4ktwTcf4HGpVQcyjBVcG9y7XwO1+ziuYVxA8jen0TECqSjG6AWpM+40RJ
	1ZOZmLNLyHPUqgWQNM5xaMQ/mhRmWi/1F/biFcmJMsFDeNlmqwuWQMvqeSlCgRja
	4ExBbQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwneskv4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Wed, 10 Jun 2026 08:52:59 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0c32f4b1bso67320555ad.2
        for <linux-tegra@vger.kernel.org>; Wed, 10 Jun 2026 01:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781081579; x=1781686379; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QVPq+6JkcreslYPvbFLt1vFStJtpeN3cu1CStIhk9yM=;
        b=E2l0fIqiqrc6nW9VozZ8GI0mrMjjCmWv4CCCRUKvizFAoxxDz6niuk7dqhU5A3w/cZ
         XVs1cuVqcxPEgLT6pboeH/xCB9IZ19/k6BHKC238F3+JfQbuXW0krVeaxKdoLDjp+x6s
         meyFxSwIxp5wi4zdsbrsPthWQCTlYSB8FvFkeZa3mds7Shh3pwnjPxZ5K8q1ZwZcjUGC
         +zRTUY2/rzmvn1O0Rmrn8g7gAv2g2zHJt6ELQQ1UUzqDxogWz0+is8E25Dj/T8MadZhg
         qzC6oXFYTcozW1r01ZmJElr5IqB8LcnGhd0x7JQ+p3bBfgx6wCG5tfTnNvccgAlnGtAB
         5Kfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081579; x=1781686379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QVPq+6JkcreslYPvbFLt1vFStJtpeN3cu1CStIhk9yM=;
        b=FZnzRdOgdU/nIWptMWJxBC2Pc4bUUPrTD1JKi6Fd6kE8ilpM1dwQjWNlvzKBGxF3Vv
         DyPtABmFV7ouW3lCzf3vzLbD0gGlNuAkj45fdzp9Vh07mxq8L34NNKwBuh8dCY19qD8H
         aFWWaoUNvGS2feIe+RsCpOSfl4rhhA4RDgIfYS1g7C9qczTNOEfSzEGBvOnAn58iEP+k
         zZw+3Bfrq5A5yl5PG/HSjHbzKgIPxhCkpI9fJC/kvnvsRRNUSp31VMNNIn8+vk1tHWaF
         xxJq5MMZB1C1y/txob1DgXT55hcHf8bu2wwVBc1+t1T5onktCBPIFQ70u6mkbkby45d0
         5pLQ==
X-Forwarded-Encrypted: i=1; AFNElJ93TXyl5nf9RyurHDyIsHfsQlqK7fNVnHtNR3vUr5ai2FclsHLd4ZEw30yHXNFZ++Uc6AiH/Sclr+m7Ew==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwhvyNFTkxSmXneo/l6ugKjL+Nhy96/K8IxK1IbBqV4ktYz0XS
	uKmjdF9hZPctD2CrxGGs4TCE85MNEQoQS0sqzHbP3X3B+Me2GhiSFIG6Y0o443U1JKdqKYCHJa9
	bngQXco4ZgGsNP92fXTziBRiPkaePodye7qFg3SEQRqCRwEnxxSmabYUvAu3MkiMDLA==
X-Gm-Gg: Acq92OF7yFrXYeyKjLdcEjs6mBsyu15gAvkH/wX1btYj+OB+DevSCXP3pTDFjJmtT7k
	4JO9mnrg/lXB4Fde3iX7bq2hQ9qaBBSBd/xTXDjvQ1zq1mXG6asB7JKHsnGwguOxOlMWixkJU2M
	VS+aCBhK055KmeSBkNJ6UreRHuyg8p/t+r1Wjv4Dxexuo3llPfRCi3cUqwO4gbzteu/YCaOaKs6
	YFR7xmWPkgs9F1Rth5P5Nb6crQG4jNRBGnsLBJvo7OYDVycuX8sSJGBF+x1wsKl2iM+Id/Zmm6t
	nmnR/27gC+SeQAdMGLn2LnveGGLF2lxfxSO8Tg9zSm4/5QISnar9cK7XpePcllUvFcyYHscRRwt
	W0/FEh4lmMQtbEmerHOVC9iKx2XWtWxYJPuIRXsM+4BXczoUfr/bnvCdsmsVd4ufktFG9sWpn3H
	5oBgpm1IeCfOA42GER86dIBpDKPbHCdcVbbNwaTAkuVa5EshatFmecPuUfoQA=
X-Received: by 2002:a17:903:41d2:b0:2c2:1982:5270 with SMTP id d9443c01a7336-2c219825471mr224351825ad.21.1781081579151;
        Wed, 10 Jun 2026 01:52:59 -0700 (PDT)
X-Received: by 2002:a17:903:41d2:b0:2c2:1982:5270 with SMTP id d9443c01a7336-2c219825471mr224351445ad.21.1781081578690;
        Wed, 10 Jun 2026 01:52:58 -0700 (PDT)
Received: from hu-ppapaniy-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c24edc8acasm114618175ad.45.2026.06.10.01.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:52:58 -0700 (PDT)
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 14:21:36 +0530
Subject: [PATCH RFC v7 9/9] arm64: dts: qcom: hamoa: Enable
 LLCC/DDR/DDR_QOS DVFS
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-rfc_v7_scmi_memlat-v7-9-f3f68c608f25@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781081505; l=1003;
 i=pragnesh.papaniya@oss.qualcomm.com; s=20260120; h=from:subject:message-id;
 bh=pXpBJ2FMnY6lmbenFJPBDk6Hui+mpMlqsnwiYYUFJmo=;
 b=uT4AQ8s4GwpWbVI++rigQjrmSyRqAQMCzp8wBbLKhIUF3mfkUffjvFW1pE/JgbPI1qyccp7MQ
 4sSndpiP+qnBIfJzgN8ufxlztds4HuRMkws/Lip7QRcUDuuys14yYEs
X-Developer-Key: i=pragnesh.papaniya@oss.qualcomm.com; a=ed25519;
 pk=09P9nFmZLXJ9+4Jx10ZK5rIW0Fmk79A/DLErm6aVA0c=
X-Proofpoint-GUID: JE_rezgkWDGTa68cSKCMkdv6R1skHgkM
X-Authority-Analysis: v=2.4 cv=ebYNubEH c=1 sm=1 tr=0 ts=6a2925eb cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=8E_iI_7X9U7aA52Mj5gA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: JE_rezgkWDGTa68cSKCMkdv6R1skHgkM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4MyBTYWx0ZWRfX7Jej/AOfto5i
 UGRXCKE9iIGgwZn1ShyAVlOboS+rqPk8a3oRgHz/JRO/4TuW1qz7ij2LwO1cka7+RBsgSmoos/Z
 oifGWruQ/ZBF0XWlK2s1RX/pewnttv2+Y4FHdPGKL91QO1EZcLjf3We6nCB+/h3mPCxRp5a6Sk0
 9PyWRBHeOPfarNbeDAZqLQ93OtC5lpGlsG6Xbu8TsTKmxiT1715FeJYxQU+LCPrlmxBPC7uRQBy
 2R/q/J10Xl1smLIUUGxcL53WnkWQEWhzesZRjNI50p79nYDsXOCUY+RhVrkjPWCq3FO1vbMRRft
 zNOpIlqSHhcdFjWGxtqL2u1HPt9OCFGWsMOMbEqz/4RRbGsrwytVVgj3O6RioCCQU4EMVhqcYM8
 am3MPh+ZjI5ieOVMmeaH8zQbuEAPwMC7q8YOjNfwcgcD7PJCPFCEmIyCeFB5/cvILBSABNzBDzu
 H0mqmbMR/sjOHHmLMeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100083

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

On Qualcomm Hamoa SoCs, the memlat governor and the mechanism for
controlling the LLCC and DDR/DDR_QOS frequencies run on the CPU Control
Processor (CPUCP) and are exposed via the QCOM SCMI Generic Extension
protocol. Add the SCMI vendor protocol node required for the QCOM
SCMI Generic Extension protocol to probe get functional bus dvfs
on Hamoa/Purwa SoCs.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 4ba751a65142..abd3e4bb9372 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -338,6 +338,10 @@ scmi_dvfs: protocol@13 {
 				reg = <0x13>;
 				#power-domain-cells = <1>;
 			};
+
+			scmi_vendor: protocol@80 {
+				reg = <0x80>;
+			};
 		};
 	};
 

-- 
2.34.1

