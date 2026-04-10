Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1D63A1E8C
	for <linux-tegra@vger.kernel.org>; Fri, 10 Apr 2026 11:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775819456; cv=none; b=eSXoWyC1DaKatlovQDEegbxEZRzcjN9KkqzyZcAwhvMmdNIH2ZDCjPZfjoyEdEdCJKDGWTyjlMLommqJxrJCnO0hdDka6z+7YZOA6m7770+NOIUUppYGkgalgYeNe1dsjOTMoVxNZiVRXPl+xRc2mXIN5mS3DS84LwmFCx9Qlr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775819456; c=relaxed/simple;
	bh=xohaJJ/Vd5K7luswPwLOO91QBTnQ/Q7IO5bM4YaGh48=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YGAR5fT/4APDNrlC3A1XJ1Dr+H9i9ncZkIQfA12ZO2Ji4k3jL9EkJYa8j0TVycCrGcHHvnOIGpHmV5dmnh7KYq6Dw+S4MSYzGSIp0uTXCDV6v4U+l3ZmIGnGGbt7sFBw4gZmrp2YKbBkTJKR1aP/bL/m6lcJ84Lf1nDzBU5hPBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CBPsv6Qo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fmMprULa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CBPsv6Qo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fmMprULa"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AAD9dd2698253
	for <linux-tegra@vger.kernel.org>; Fri, 10 Apr 2026 11:10:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=D+w8deWDxQW4rGNLFSOjvSPuzOmrqVDGRwR
	hnd9eFA4=; b=CBPsv6QogQAAX7HXLjEqijSmwHPwoUahh7v+cAtwb0hvorCkhKQ
	VY1QJpXO+yoPAd0wmvzUaxbGVlUSAnvC91c/CZ33fZmCum65XgBRNvhhYRxDbAgZ
	Mf+J7ccP4KJPZZ4XucaxF39mkJ6N1XWbUPZL3yefLZF97EJpGBNJvJ8IEIK56FKW
	1NOTNqwABw3AAJdpz4Yia7I7LInAsIB5IY4Xyf8qwAGOtH1Lgr2hjOx/vWuuhOLp
	2LnfybN+hRcXnAAGO5Kpw9OPhtuALkSOUNFEo5kPGgG5PJ88wAnknAjfEL37/Q5x
	18u+eWhCOUadBdGoD/rK9KWoZO2J74JYHvw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4degt9tvr4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Fri, 10 Apr 2026 11:10:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b220c72bbso32638601cf.1
        for <linux-tegra@vger.kernel.org>; Fri, 10 Apr 2026 04:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775819453; x=1776424253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D+w8deWDxQW4rGNLFSOjvSPuzOmrqVDGRwRhnd9eFA4=;
        b=fmMprULaNUq86qv3xSFxi/yYkOcfCKaSHzjyhxoNbW023HfGC/QN0fiXdCxP9+sGkU
         OnPkZ/9YIl5a0cxYv168LifMUhD/nzI/3oxiEaSDJtlBCF3soAdV0i08vaPDSMkTlT/+
         X4kysWJjBeHjUyTDvlEjvozeCMX0utRUzRe26COgrPUA8U5ivQKILqlRd57AGIas9Dwi
         lUPVjRI2a9g6KHpLnS0dWD+cXYhCMpIeRwC6qoXyuBfrx1hOcKwzByWwIqJpjShkfdil
         v8LoURJX3/a8pI0soldIMnS8IaiDF4MYhUopkzcMdzZvJFfT7if0LO+3KZ30TsBR/O1W
         c4wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775819453; x=1776424253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D+w8deWDxQW4rGNLFSOjvSPuzOmrqVDGRwRhnd9eFA4=;
        b=C3TKPBIUi3Bx7DrRVH+5508KKzK4ny4c1TQC9x/oYcbUmVi5yozNpgmL/+vduPhUwJ
         raU4xssQ8ROwONwrDcFOXFyQYY3AR4NFYxh+SDQqKPp3zzTRqZBy9dFmP8Ka9LBsNKD0
         2AscQ2uaz6XHQZ4RE1aN/LfW4BhqIMIXdFpB/kfCNA8eXic/RTeUQUOw2U1W8SF5WLew
         SZKK3WMYevsvgGXrC+g5mCLk9hHDSAAlX5e2TAI0I2PFIXts8Ls3vnYmW8mFMmPe7P6I
         w0vZHc5WG8e5J++0SHOwP1qHpNncmdGq/hx3I6/CRN55+2iQYLSVur3GJyJuQTxrjYQr
         0N7A==
X-Forwarded-Encrypted: i=1; AJvYcCXJYTrU4kqarLLlpEAdfu3yTOuAJT9wCZom4uSTpp6HMfe1yQjKdXO3vNXnqnTfB4moM4Wr6atJRleXWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzW6x2gNkVh6P1ACmAwro+HZjvfMMecplhLrIllBreEn/LtexKo
	o5id68Iy1+31Mj/FuAqvfws82SOwNLCO6jKIgebydezRAcTpIVrGrD+p/HuQ/+WRuksEqY4CnDm
	eFvRlhwMpaQb/Imc86JQ4P0cw1Nxan2cQ9sfD/kdyt8XFu6kLFSshjfsMyPZEynZgfw==
X-Gm-Gg: AeBDiev+oxWIDp7yhh+RqJEBeeQAa1vr8yxLhWhk7jLj1oM+RI+3HdWA2VUyqmMUFvQ
	xo7Z51yNf4HfEdv6Dx3t/oC8LHOgz4QQ4unrxN+P4NopC5vwxyFkSSaCseqEt6uZcGjDHwg3KQm
	UCLxmvf+Vmp28WeAspS1TL9dFZ993F/1V6erd0/sF5oaeBpnjn0OgWcYumS3JTOzHf1StM3pSoN
	O8zLz609a+q65wXD1d8iLFQNEXRzI86rVGP6OUEaSlhpUbSsg2ijiPmGe20uKNJ4t+MfG6Zprpv
	3xS9gAfWJYDaHWikfYSLqdWMzqneIIrhplmCiv/n+J5yXobKStEXhX7RqDgdmlNtQa+xuiLc1tj
	BMh/OColRcdXdLalQY8Qt0ejkwEY31I1FzUB8
X-Received: by 2002:a05:622a:6794:b0:50b:3c78:ddef with SMTP id d75a77b69052e-50dd5c0b176mr27942021cf.41.1775819453392;
        Fri, 10 Apr 2026 04:10:53 -0700 (PDT)
X-Received: by 2002:a05:622a:6794:b0:50b:3c78:ddef with SMTP id d75a77b69052e-50dd5c0b176mr27941781cf.41.1775819452978;
        Fri, 10 Apr 2026 04:10:52 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5888acbsm77585265e9.1.2026.04.10.04.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 04:10:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] dt-bindings: pinctrl: nvidia,tegra234: Add missing required block
Date: Fri, 10 Apr 2026 13:10:48 +0200
Message-ID: <20260410111047.309798-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1816; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=xohaJJ/Vd5K7luswPwLOO91QBTnQ/Q7IO5bM4YaGh48=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp2Nq3TbQvfeT/V9Dr0X1l2LrGZJ/6b4QixF8SX
 U78HCbPd6yJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadjatwAKCRDBN2bmhouD
 15i5D/0ZyYpyenFwAEQ0gw5p/fsg9YOkzYwn+iSFUxH16S8cPHq+8oZLTzthcsYVYrzaAH9S7rP
 nwwOizOVANpL+cauk2lEu16zwbsoSHIsTWb0E78nl+zwi0Gt6pPmfOLEtA9JD9EEVIOg4ycZnvF
 iS5Ryz5KGgfyzwpSrxMqt10ouwHaUbjoh6qqm34HfKTS1q8cl1g5OR+i3HSK5b9xTBNnndA9QOv
 3GJL524asKczv9N8wZ+e/qTdCO+D4lbbpKrR0lNDkLMwtEqIR8ApvlqWpIo1OkHBjyglvPJUj5L
 3ek9J+Ao5dnASu0upjiSoMerY1P1tepAAEDz13yYnP0/cCepGS9wLWhkF6Zk9dtcA2ANgtIo77q
 blrhmCNFA4iZ0DYDooOYFcutRweonvrqRblplyKn4nWBlo5YPGNbBPqOw1HOuxFFT+ZuAFvwZBv
 5X2pd82AFOyHRc5cgspN2yo7UhRmesqnumkDkojHD17bIUAfXjilPI4j0fti+oOCuTm/XYYwlW5
 TE3cVxXVeeptWk07EvNjUPI82LhN6z13ZfweLewyhHw7TATbS7zjho88KzRSijh5diIAon+7ghR
 EoAXCXsgRECNOp6UED+/8plPq6CwhjSemTgDWctp7NVXeSgtyVSYdC8hOx4AaHjG97SbntVRHFV nhJrLA0qEQVLWZg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDEwNCBTYWx0ZWRfX7A4RDfsrctBY
 grnA9++JGFcmhMp68BO049CU/LPTo6G4QtKpTeQ0foxKstKTDxV3mDQO/a3PxYE/VaeqeK/Nr/A
 R2V5Gq5CFu0FxDY+V2gvGpuMYLJD+DjcO9RM2syLHo2q9xPFnouOlbe05ZzN4ODD0h/NziMs7uA
 NHNvqX1ma8d5n0Q5WJxoo5nSR1YsSByLrq/K3TO3gtTUorFsVg/cnQ4LCueLbhDeqWAJ+TmNR5u
 asMUgQMwiO5AOMq4CK3fvCaLSjxaXoZeiCsW43TLfeeDmmLqunuDnIdNWXkXotbLuHpFvv9+WHG
 WySvJ9V39EEmX7qhltk12ztaKNhUDwrLjhHyq8jhdoCBjEwpBw//EAQWkTHE00ypyFzbhtX+iOx
 K4FEjzRBisVBioNxnBzTxOu+mBIhlnsHqzmvht/nrcCOrQOlzwLnSB9648FLujhkk9jDD2QbYJH
 fNrTsRNIRMSOczPep6w==
X-Proofpoint-ORIG-GUID: XR-C-fOULXMR2-4FvR4Kvbom_jxRchP5
X-Proofpoint-GUID: XR-C-fOULXMR2-4FvR4Kvbom_jxRchP5
X-Authority-Analysis: v=2.4 cv=BJyDalQG c=1 sm=1 tr=0 ts=69d8dabe cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=ssE5c4dyhQVGikaba9YA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100104

Binding should require 'reg' property, because address space cannot be
missing in the hardware and is already needed by the Linux drivers.
Require also 'compatible' by convention, although it is not strictly
necessary.

Fixes: 857982138b79 ("dt-bindings: pinctrl: Document Tegra234 pin controllers")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/pinctrl/nvidia,tegra234-pinmux-aon.yaml          | 4 ++++
 .../devicetree/bindings/pinctrl/nvidia,tegra234-pinmux.yaml   | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux-aon.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux-aon.yaml
index db8224dfba2c..56fb9cf763ef 100644
--- a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux-aon.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux-aon.yaml
@@ -58,6 +58,10 @@ patternProperties:
                     drive_soc_gpio27_pee6, drive_ao_retention_n_pee2,
                     drive_vcomp_alert_pee1, drive_hdmi_cec_pgg0 ]
 
+required:
+  - compatible
+  - reg
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux.yaml
index f5a3a881dec4..bd305a34eee2 100644
--- a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux.yaml
@@ -115,6 +115,10 @@ patternProperties:
                     drive_sdmmc1_dat2_pj4, drive_sdmmc1_dat1_pj3,
                     drive_sdmmc1_dat0_pj2 ]
 
+required:
+  - compatible
+  - reg
+
 unevaluatedProperties: false
 
 examples:
-- 
2.51.0

