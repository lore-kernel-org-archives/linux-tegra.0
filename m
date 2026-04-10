Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119AE3A1E8C
	for <linux-tegra@vger.kernel.org>; Fri, 10 Apr 2026 11:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775819458; cv=none; b=Q6EDV8yQkDFuflqLgH3jll6PqcU7xtq4DjdDO+VIjiuxy0P9EK5tBs3FPGa41kxixqQINEKAd8oW3d2THhIi4IUjUiy7FCLop9FwklBVOy68FhQiSGE+mZBIe+gArihnNf6mm93PMCu5B9QjG96Q3DMJSP8j8omwY3kJsAHUl+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775819458; c=relaxed/simple;
	bh=81m559Qm6SjLLX40vo8GQTMVfwyBMUS0e1HYD2duGuA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JxrK07l5BgC5GpMAZN85RCo2xBlUqraXBCQcWAPSh6b3u066WVkQcmg8SPtwCXh1L3ggEr1kLdK2eKEvDF3AG+xyKDJuIpgcoY0EupLbp98Qh2Qi9fcCdUsfDMR31TDApUJXKgm83keWv77mGWsc3GBHCyz7V/ZiJ3gQZhjdY48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JV2G9NGQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AiPq1Jku; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JV2G9NGQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AiPq1Jku"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A7tkID3934665
	for <linux-tegra@vger.kernel.org>; Fri, 10 Apr 2026 11:10:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BG5SUK1DsCV
	NFWbXyc3Qfhvj5m8rTy0XKTDLJjT37mg=; b=JV2G9NGQSy3buTAm16imzxdr8CP
	+yQDeB/Qzkty9/F/IdFw1BrLstc/Vk1pm/0/NPX+P56fNNRwLgAOd6q9uk8ZY5re
	uNGuU9E/iqmNb9t+MywYlq06jykJvpshxSSMpr90NW9ULgqJKgSc+bAm72ckKsik
	dvwi0D8oK1ikVUEWhIH7Y53ePYN7ak8B5yUh+JYLJTAtZWLYkct0FjHZzLKqKMKw
	+QJnGHrebD+k3HTovCEXrwF0dEZjp4aJLcCizzo/U+bPmBi+PJuFPsTZobMpBE91
	92rX8GOr6V7IPhE0wxMFRQikoF8+n3kCX8rX10LyIfR9d6kNda4zVp9lhSw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ded5sbsnw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Fri, 10 Apr 2026 11:10:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50da529ff48so50217641cf.3
        for <linux-tegra@vger.kernel.org>; Fri, 10 Apr 2026 04:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775819455; x=1776424255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BG5SUK1DsCVNFWbXyc3Qfhvj5m8rTy0XKTDLJjT37mg=;
        b=AiPq1Jku97Z7qogIq1jMQ0AMk6Lw3iShnUAJlCAEv0EjkEmq+3Qr9LrI9RZDuR/+GN
         hKCuW2MmH/vZwrgTZPK/NQWuxAzmACm74uMbWbCdLpekNVMbSreExhsRNYDXFkO44qSg
         bsA6NgKR10MDCZ2yq9hXWsHphi/qHLcNal/vvxzxkqzI82TS/2nyEsDkOOCtt35XGPSn
         tKnEipc8FE0RbFKIGlZf6Tr0SYtMPvj+1OKiWfDY1U1S9vpSQNk0TQ4Mr3NQqCJSOT6/
         ZypOdJLjBLbJb6EuaTppYmSm1R6iBACTwqVNN+rOhSF2+gaeD9D0wcGpMa+3DzRgnDJ3
         Ln5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775819455; x=1776424255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BG5SUK1DsCVNFWbXyc3Qfhvj5m8rTy0XKTDLJjT37mg=;
        b=Aw8+3g/CLIABpqd3YolmL68RQchOGw0nq9CBiJM9wBmk5UNhfLPO5OiWRl5uFtak0Q
         xFLXKFd/Z/JmE4noxWOFTk/oDpYjSsgb1i/ILczXnVrsmMKNcvp0XkBE6gtyhe936nUf
         IoG/J+1HuwQ4mGuARQatDk7K7UtEYxqFamOPLbSOmU1kATY0tgEr5GQ4EglunIHwZQOy
         UdqNCjPzG6XlCL9NGRgx0GKmTjBBm+uH5RxFJToysXKGPbjMXJn0hm+MPmE3YZprzX/N
         nGVG5mKYe0Qib6sTR8Y2en1J4rvgfuTgwWZlUnE4L5CmH6CWxFdhXCwCkvyRcOkobhk/
         ZbVg==
X-Forwarded-Encrypted: i=1; AJvYcCV1XTJi/4qhpd/o3YpfhbQgXbV1O6SJx/sQKOlKRuJ1unv6qzoS4dHPIkGcQiSnnf7cXfFdkAOxLOPZ1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyU2gKuMmF+wCQaYiiV0sLf5CrztJt0qxTGi/pr9HKs0TyqwxBL
	LIQ+fpx8A4eOdtI5S6t0K4rADIQhrqt1g6sUTVLfSzr86L5CS0pVDoH8U7RhBPigNskw+Ub/7WB
	kiyKssCGi4h1TXoyH+qUQleNCUe3nFmpmJuInMD1bfB47e16MZhDK3UWAUGelMDdgCQ==
X-Gm-Gg: AeBDieuyjQqNx/MfLcXBKCW0YB7FIY4PIAZ7nGEjUM8BwbfFXY3mIdfKuo6G64gNpxI
	V7PT//A7aZBdVstmByMebU7gE0QannATlo4VnuZ16opt8kGLALSriSFCDHrSSKB8SiBKL5bJ/Hu
	NizGHruz/M6kuvaZqthEu49AJQPqBYAZmN1xqRJSiQmw3Rz0rC0RM4gaBGH02S3lcSWNT8iYGGz
	6OIhxzBj2Mj5jQQDs7JlK5een2g4/Wb2clP0BWyF8IeDzDTprTBPZkolVmZqoCHNaAKHcHEVJCT
	h8ZQsEN6NsfBKGkQtmg6xfTf3Vx3nMkv/4NHTDuOw5Oe6/zBUmPABKa0dc2V2vvGBnMikYXZXid
	f+cmo7HGvHIrxcuAQJnlFSxoAXTFl9zbqjXwg
X-Received: by 2002:a05:622a:90d:b0:50d:b030:fc6a with SMTP id d75a77b69052e-50dd5bbe532mr41414611cf.49.1775819455405;
        Fri, 10 Apr 2026 04:10:55 -0700 (PDT)
X-Received: by 2002:a05:622a:90d:b0:50d:b030:fc6a with SMTP id d75a77b69052e-50dd5bbe532mr41413941cf.49.1775819454879;
        Fri, 10 Apr 2026 04:10:54 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5888acbsm77585265e9.1.2026.04.10.04.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 04:10:54 -0700 (PDT)
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
Subject: [PATCH 2/2] dt-bindings: pinctrl: nvidia,tegra234: Correctly use additionalProperties
Date: Fri, 10 Apr 2026 13:10:49 +0200
Message-ID: <20260410111047.309798-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260410111047.309798-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260410111047.309798-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1438; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=81m559Qm6SjLLX40vo8GQTMVfwyBMUS0e1HYD2duGuA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp2Nq4FY3or+M4f5GQ3JJAbgnqoheseefPUNYfN
 YKJiGBNTZiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadjauAAKCRDBN2bmhouD
 1z1dD/9RfoDDf5mH4lwBRNwWS1oSKdY3K1HmQ0KN63DoB+kCrOKjTPRGVo0+Fo54tzhPEs7BG16
 xL7rZwpZXIPzcp8bePJSiuLZ4lRNTdndxtFK9iBMsIfSJdpknmD+30lcq0wAWx91zRf5xYwqSUd
 ZNO1CnDAx8lEpW65suAt7Bz6mr3sexNrvqkeKRi99O0W5RyAtGzdMKvKgb9KLKr66vO4Dd+uTYS
 O6U1+5U54TWryqcTS8x2ahzuq5Yz12E83KTllv6n6KuUdc2dQ7AVaQ+gsDAGJk4V865FYcFTT0U
 aYXqQjjxTxJrRas4TKx/6E3F83DwtZMRmmvhMxDWYn7Z43EqvDLnOet6A7LxczhNgpeWWouvrTQ
 fPbUTfm/0/2XKOD9xZ4oSwCsUpD2YlheXQ2G0DWf5yKh29FSPrCPSV1OvDg06EnWglhrkZWvixP
 oR1Zoi4Vjbcx/uiMMguuV0v4BG3QPm7fxcaWhSY14BVm39ig5PcYD+RQ5EhM9oD9YArMkc79CLH
 eCwjHapxaczA4eOcmChi6aeqJ3QdtSMdywLV+pTNG/blj41+rOpaaWM30JVEsgHb//SlYzDEk6q
 OZqFkw1ZO28VUNgmeRGkh1VgtR7E5a2WhuzuSUG6D4EnbwzII2FGLGQU688uALrfGg3VcdvdJsl 8Elt/cWsQUlWvkw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 58EXvIbpgx3NxILOY1fsrA7pgLIez_wt
X-Proofpoint-GUID: 58EXvIbpgx3NxILOY1fsrA7pgLIez_wt
X-Authority-Analysis: v=2.4 cv=Ko59H2WN c=1 sm=1 tr=0 ts=69d8dabf cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=yOyev7M9wBkhzMrpsB8A:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDEwNCBTYWx0ZWRfX1AClnb+8k4yv
 rAKSG+YVs4gImcuZG12Mf0E3xB5yObTMBPSz6F7oM6Gj0qGkpafSMD1CoiEDwDBAJDWMHH6n589
 0AsAOmbFO2149s9aiMs72/LTCGfRo9XIuEcKyaAD2fnDD5amhWg94V9nyah85xPvpNHgNJmpJ8R
 2bgdGIvgMO5VIsTrZ4HetfyqBjtau09gKgZYhMK8QMJVVGOaA4AtayP+bLTG67sT7Jb9ZcBF8hz
 BsdsxdxfvT7HgSfxCMWZEmrCt38RoNPHoeeeaQk0yBYU3a93+aoBWylGiAFT16ajwGVhcGqPwwO
 1WjqEiE/e1r6fhNS9ITpfNyPdn+3ESngqhpKSakGX5NEnTiEsRt4l2lEfwyVgjVXsgOrqnXTHQe
 R/NVyfezr0toDax2uve8cHys2NtzubF8d8bORTDHAQYctpDQfS4mYwlo7arBJF0dty5ps0xSh49
 JQRQH3wscnVuQuNO7PA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100104

The binding does not reference any other schema, thus should use
"additionalProperties: false" to disallow any undocumented properties.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/pinctrl/nvidia,tegra234-pinmux-aon.yaml | 2 +-
 .../devicetree/bindings/pinctrl/nvidia,tegra234-pinmux.yaml     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux-aon.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux-aon.yaml
index 56fb9cf763ef..4910dc8e8aeb 100644
--- a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux-aon.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux-aon.yaml
@@ -62,7 +62,7 @@ required:
   - compatible
   - reg
 
-unevaluatedProperties: false
+additionalProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux.yaml
index bd305a34eee2..52b3d40e8839 100644
--- a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux.yaml
@@ -119,7 +119,7 @@ required:
   - compatible
   - reg
 
-unevaluatedProperties: false
+additionalProperties: false
 
 examples:
   - |
-- 
2.51.0

