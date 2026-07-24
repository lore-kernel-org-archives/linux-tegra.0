Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CAA3AEF2E
	for <linux-tegra@vger.kernel.org>; Fri, 24 Jul 2026 07:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784877595; cv=none; b=U3+WM0tD+xgikV6M0uw/JS+IEfwLy7QjgWCZiWOdRPknQeXgHzVQp4waqs9uui8iMX8VDlsufTB4KtFLrT0dbZyzGoj7Ykmwyw9K8Ex5EmZ/zXtcCpz0eBFOCE0c1X5fxzJg3SscC+7mf/SGYRtp4wVq/4O6PBxDa5+ql3VqbNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784877595; c=relaxed/simple;
	bh=wZDWaODCyzp7t+O12ZO+CiytzMHhYNjkW2d/5Umhqnc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JDlGd4xjgFkn1jyJmtcNd5Ufl9qKSHqIZUn0nmom9IEP3DLmCF8U2LBvQAlnKKwCCuty38wA4ht+bgOGDV1sjVjBFzholTfFNhi7GKjiuEArb3h1cSMiqtV+icMaFwYzS11H06/4drxrvyBGA9S4U6ppkSz9rsKqIw5FpkF1U94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SRfReoF3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KKmOYCHw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SRfReoF3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KKmOYCHw"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4ljq53140400
	for <linux-tegra@vger.kernel.org>; Fri, 24 Jul 2026 07:19:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	85c6fMwpf5j2iCdGRa9j4fuKaRpGB/lUr0+dZdRrE2s=; b=SRfReoF3mUtI5cLQ
	iPa1Rfmx16lH4+oLCZeIV0lGWOxyE6tIQVHkKpCPQXUCzkD/zdTgTqbfSTlHOkXc
	Ss4E3udo89bT2J1Yn4NNVJs72qofDVhIpC5xoDYT3GonXUzZelCynprqMEg414tk
	HbsrwjIZFhBLJaFUgee9nc/uwLm+hngYoczJDGbQzTYvTEUepKY0fXLCKv4pWEzF
	8kuQoXKADivj9b2CSh6704160BqH6mdmUwZzk1poOWGybNxGb0nFZrlE6i6NEsQN
	WFoy9QEBwJpDxEjKw+F43/jjw0v6Ypzx6t3L+g0E2SbGU+YHfbPPYRrNvdBDOBOf
	1NPkKw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkn9a3b2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Fri, 24 Jul 2026 07:19:52 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc6dd43737so3048315ad.2
        for <linux-tegra@vger.kernel.org>; Fri, 24 Jul 2026 00:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784877592; x=1785482392; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=85c6fMwpf5j2iCdGRa9j4fuKaRpGB/lUr0+dZdRrE2s=;
        b=KKmOYCHwcSY/4zb9Yo49a5ubX/piOxsKUOt9CDetJtW0fgglKuU7Cd4OF6cTWl/Z8d
         o/U9lGI4XBGp/jKxkX6z6mxmrK+JJmeNG3MOueYggF+i8Qv3E3SOLvcf0qeR86rq8/0/
         GfVBdicXsUNO4IMNXaotlEeEo0KnnMg02Ix8YyVQwfNFoCgihEc98/E/Ii9U5SJBMC4t
         JU37FjAWoPfGvoaIPfVnuHfVo/UqocO2QTVJfm91LqPZslc1vzJb1uy7MFyUfbFbJVqx
         nY07XdirKhWNfsSHrxYsevrj9kYceLON+uMF4tYP9md1Y8rfxknl1LRW0wqtGSdad22K
         IKsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784877592; x=1785482392;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=85c6fMwpf5j2iCdGRa9j4fuKaRpGB/lUr0+dZdRrE2s=;
        b=hBQhxOZetm4buZsbg8ijEpbgL/AtOKH0qdPilZBQLZtj2kKsCXtkzxXccEA40KBymU
         xkzSeWoJhiOKs3kfZ5niGv/xd3SAGItZenj9eccYNSnLfzqHpC+xz0B/sYmjVI8ZU6Zp
         qrbRVhfMYDkCYFKeM5Y391l77Y61x+zsMobpq+zJg9Q7ioDSm7XJzHfbPHyCwkRpIMto
         4ksug0vD9ahv2U9DmwW3FLR09R/oLNrQ9IWI7XJU2tcJfubtQt2HblgAJB6cpEcgEIrB
         kTkxqqFzWShds52E5RWJjGxNbYukE5Nzy4PR1QqZySMQ0GiFZ2mJCCC3oaWXicgtlyaP
         EbbQ==
X-Forwarded-Encrypted: i=1; AHgh+RqPJb141p2pcfg+L0U5n9Dg/PolXWcI+XnR2si39iJ/3ZKdtL1am2jWqYrycoBTmSpTdSJRjt2mALxpBg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxfb+z0i7VNWJi+egy0krA1A/5sjRHIBr3v00V6z6P625epM7Ar
	vk87ED5WT6gvKJRgY13lxgY8/nFGseAu09C9xhnLVAsRTY27mLlGeopaAiYmvfBdpX1cZhCd31X
	Yg5f33hW4bnJoZD80jP+XPTMEhAbH4HcUquLjtawJxyWgZncggCtrIVMBmsBXSEd8bQ==
X-Gm-Gg: AR+sD10op3qJIuidKIfw08iZXQCjSe7J92s4qXZyQ47AMsT+QXkGWd3N8XVm/UaPLQs
	qbtYk4X5fq+dj+pw2gv907ZrA3v/8+FQizXDSdCuqP0YA22SoYCX1fA0mbWW+zeopFyocJKe70I
	h4YFxKfNJ9/eRUgVWAtbHyBNFjkLFgyqUvHOUqaV+4QQdJZ8r8yK17oxglzjONcZSENuJqHiFb9
	Hkc2uzdehGytAnjLSUQgaHhSwEJ9qVKJ5bqvpuKRayiJvgIkzvgRStBl8A4qQuJoNzdZ05AQrA2
	GPgQfmj+q5+83mJmCsGD4JicSTelmtZvZ8xTYdvLcUnQAxjpwyUeIDmCjNmf/FBTP/Z+x5Qbu9n
	clJsRZXIr6s1rP+mQ5XqGNNUTjYvxBJPR0dZSD1S7lG/XS1nV/PzJbnA7Nm5B3wZmWbxW8sU+GE
	M/xGXRssr0oeoWsWZujCc3MDxoPHo=
X-Received: by 2002:a17:902:f693:b0:2cc:d192:50b5 with SMTP id d9443c01a7336-2cfa75078dbmr74555865ad.34.1784877588432;
        Fri, 24 Jul 2026 00:19:48 -0700 (PDT)
X-Received: by 2002:a17:902:f693:b0:2cc:d192:50b5 with SMTP id d9443c01a7336-2cfa75078dbmr74555095ad.34.1784877586957;
        Fri, 24 Jul 2026 00:19:46 -0700 (PDT)
Received: from hu-ppapaniy-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efe3afbsm45993805ad.33.2026.07.24.00.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 00:19:46 -0700 (PDT)
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 12:48:14 +0530
Subject: [PATCH RFC 09/10] arm64: dts: qcom: hamoa: Enable LLCC/DDR/DDR_QOS
 DVFS
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-rfc_v8_scmi_memlat-v1-9-cb732bcff1f4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784877514; l=1007;
 i=pragnesh.papaniya@oss.qualcomm.com; s=20260120; h=from:subject:message-id;
 bh=8tKdt4fKJhT/tYsqDka1HLDRza+yiVyfZcS7BTSC5l0=;
 b=ElL7bMtCXym3FQCEHsNOAZ7OqHreyEim7+hA/4Ik410F2ff4uLS6Ygqlqda19xM3CYybnTvEV
 WCJ5kWpaYhwCMF/CKunvlKt6HUtpNwDIoAQtQGMSPWQdpDEw01Z8B8w
X-Developer-Key: i=pragnesh.papaniya@oss.qualcomm.com; a=ed25519;
 pk=09P9nFmZLXJ9+4Jx10ZK5rIW0Fmk79A/DLErm6aVA0c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA2NSBTYWx0ZWRfX6K+E3G1XMe6M
 9VgIeD5ggkTIPBGkuAki6PidPXkoFBq1tF1WPBY1HtLKfH/P2Pn4yTW4+M7KXZGnUZLBaPRupH4
 m8ECeLCMLiLtdWCbL4YpY5XIcMHSrUjI64WkbM7dajkoJnMP6o3bzXkLF/htJuXqJquIW9oDttj
 CDCQOqe8dAX8p09JrMaMp6INRbXlBo/JbgRqKEZGftu/ehQ8qArw1Je5MmYJ0rZWxQH1CUYbolX
 L90QsNrykrJcJjA8cP3I0JRwxcsu43PSAAU6hgH263ACBVUTkfeBkyHSg4FHHofzLw3jJculy/x
 44wLsNGe8LkhvkAFc8qzjsoioMsKycOVR5Ojh0v+bslNBo193dFu17PinL7Y/z7Om1obwFlP6zw
 Q6QCNcXBUSFgmz4q6+fR17QZ54+5ynVe8P+PGX/2cF1vUKoOAk0Ow8cPLT72kYjmCLtPLVpH20t
 bar9g+9hUsMUlZKSJNA==
X-Proofpoint-ORIG-GUID: MuFhIkMUwKriFQcq0JGDUR4PjlFhZY85
X-Proofpoint-GUID: MuFhIkMUwKriFQcq0JGDUR4PjlFhZY85
X-Authority-Analysis: v=2.4 cv=WOdPmHsR c=1 sm=1 tr=0 ts=6a631218 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=8E_iI_7X9U7aA52Mj5gA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA2NSBTYWx0ZWRfX/FvBYS0eAlTr
 UdHlEwxw4Bte/VpM1hbXxXo29gNQ9pu2pRv8cKOqD2XfcFFh/jIQ/Zix/VP0lm/xVCAl0Hnujv2
 EiTF6ISxque9s05c28IiM3akO9yp6ek=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240065

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

On Qualcomm Hamoa SoCs, the memlat governor and the mechanism for
controlling the LLCC and DDR/DDR_QOS frequencies run on the CPU Control
Processor (CPUCP) and are exposed via the QCOM SCMI Generic Extension
protocol. Add the SCMI vendor protocol node required for the QCOM
SCMI Generic Extension protocol to probe and get functional bus DVFS
on Hamoa/Purwa SoCs.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 09527dcf9576..e9e75c4c4da6 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -340,6 +340,10 @@ scmi_dvfs: protocol@13 {
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

