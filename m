Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5333FD128
	for <linux-tegra@vger.kernel.org>; Wed, 29 Apr 2026 16:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777481802; cv=none; b=QUYVK8kXYfxIHWHNdyoBR93pTYW/JZrPqeY0DWPS/SbWvjUe7VK28M/9O5OT46zlKjMPi40WxtOQ1H8H4Sbj/W0yNYvv3btIl1ZHkQciqvhyboUTFhoYI1PjGRaO02Fhhlls8jpUE1+ZdU9kGkbams32sItiIUwZDh9uUM4ctsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777481802; c=relaxed/simple;
	bh=NWBf72AWep/GNCzwjI4vCAKDlixZxm0nmerwPB/ePAU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a4OITGjI4WWfqVdEd1M7DQgx54hS2ubdF8vVZk/caTmmAt//CrjRHPRSOQjZdcfy4eFtgMz73K4Dc5o5M5WR8RcYB9Gf5xapYzSpi+pp2Jtlvrckaqd9b8QvfLvK+o3qbc1EUSy3YjMOKpQiQwWLiQAJ3PGsQZvEqf391aXiUAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dq1aFSH9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X0AA8mdo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dq1aFSH9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X0AA8mdo"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TCecWA317261
	for <linux-tegra@vger.kernel.org>; Wed, 29 Apr 2026 16:56:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UE4TPC/ze6N
	5eKeEJMubC3tSpDtsj1UJDS1UC7SVavc=; b=Dq1aFSH9e06Koy2IfndKI5xu2ss
	mT5k7illxCmiz5dYoqRDdORTN2dMX2E7qnbH+IwIxGpTWNA40diKuJb42Lx4G5LQ
	Hwf8+I+KDV2oK/U6/1ClN/0PA0ZeqIqeGH/flORst2jFAj1JUzqRQJEa20w2/cXT
	PR9zLAleeZoeunWBchwa9Ab944NdPSHdxyPbqOj20GwhNib/+Jn9BJtgnaEeJ5uL
	7HHZoWAfu060BUUI+/wizwYnURLMx6mBPeLFfzO9xphOU/OSB5ytySQBN1UyizOS
	1Y+m9WBElYoETnWBlSJFxA+TC/0yayocOvsGoEDko2DLBAyAeRS5aAAA+pQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duj6t91aj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Wed, 29 Apr 2026 16:56:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d84b5f73bso144119271cf.0
        for <linux-tegra@vger.kernel.org>; Wed, 29 Apr 2026 09:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777481799; x=1778086599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UE4TPC/ze6N5eKeEJMubC3tSpDtsj1UJDS1UC7SVavc=;
        b=X0AA8mdoO/oQM/9W1E56HvHrEFENXXUEtStK1lGCUyWdZL/JKnUjkz3QMVWrPFg0lk
         EDW9su3JITIxy1FYmhVXtn/OlN7UNzxy9mg9tKGUtZp5ghuy3r5J0ECXa/VMcZ6ciuEG
         oOFhOfrVqZiRXMiXzzahELYIh7C/GA/suV0oVl8mDIftzcTjDGV1T5/2dUuZTeZ1WMuo
         IKZT2PD9SfSyglzC0Hg4Am4iRhcheuXSktUYlwlPBs7wQog581sg6/xXE1fOxdLZ8fBv
         56ILnS+fnb6bc+F1S5JqGyNbVvJlvnAQ33QHNK2z62FxTI6iHsexDSuHOMOOWwO0yKP9
         II8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777481799; x=1778086599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UE4TPC/ze6N5eKeEJMubC3tSpDtsj1UJDS1UC7SVavc=;
        b=JM7ZNfeUdxUTm98Bjwn4/Alu7VB+nX0e6P942W3+Tydy569btl8ZOs5i6+5Ap+YZLS
         Vf4QzQKcT5b4ylv7vwK1Jy3wsMSXg1/wIKly4LI8er+9W+Z4W3CqR6yUV2NIql2R95VF
         OqzXoPfUmBeVqNDBpJJa1qUSnLFADHd/7Ar0o7XNn06BZ0DN0vx1R/fhLM/vMFiFF7JI
         6DS4H3ALmV4ZcuDFVDAReIATRH7kAlQP8s7z+SyK5JIXxQfUur29pxKgXCFidzWncglM
         XpWTmV8Fx0R/s1aQDa/5z/SoRSaDt7PpV7GrP6xY2rqFFsOTk69RKzLqJCGz2W2Cn7nw
         k+eA==
X-Forwarded-Encrypted: i=1; AFNElJ+O/FlV97rtZwmupzYqu2HgPonHQyTF8DdpJ7/WiqhU3O2OvG4RrP3DBK53euJ2emz3LPveFBGo4h9q3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxctSJenxOliNg+RmddLM2wRDgOts0GlZbrrN2tpQF1m2C9iruy
	W0ejUvoaC1slsKoKGSGCExvi2kYbYZf9Fc+x70HHnPRj0J1PT5SkmcX7Uopwjv6aqRbilFyotPp
	R1p9w0+HA//aVuG61N+DqZAkBYTgiNKXIv47VvMoN2u686597MUFAvuO6Xzn39y4NtA==
X-Gm-Gg: AeBDievNYqbRvQkoHO6V9fLz1h8S26HW1iCrAvQJr5eEFAMSrWlpfu4gCXLN6ULDFBg
	521ULa7O7jaRWGU+hKGBEwSeBnfUaHMwYsBssmeYAynthwl4SQl7F6BQ7XmxDSk1cknGzNyB7wh
	mkxLgdkcMuDa3gNvpL9lVBix+y2abiaP0uBNRf5xPJWgbtP+AdfLgW1WKSg6ZqdotBILwQAnid+
	x5PrC4eX1RFB9z9Gv7oV72YovccvEUYvIlO/k5VZuOicUZ0bgmV1f6t++PM6N55vRSE1i6w0gzT
	NlNzsi/jTXBykAob2hy1PSycPmpFEVTvLdN3hj7+7qYTEvNvxi/C2nIs4Ew22ZMKYWkhdrAfhdo
	n3ICKRYPFctutaBkjfr0w+FC1NuMhfRLcbnukcrf+Vkk/xYU=
X-Received: by 2002:ac8:5a51:0:b0:50d:5a11:1b5 with SMTP id d75a77b69052e-5100e125408mr123283591cf.17.1777481799406;
        Wed, 29 Apr 2026 09:56:39 -0700 (PDT)
X-Received: by 2002:ac8:5a51:0:b0:50d:5a11:1b5 with SMTP id d75a77b69052e-5100e125408mr123282981cf.17.1777481798856;
        Wed, 29 Apr 2026 09:56:38 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b901a15sm52244375e9.1.2026.04.29.09.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 09:56:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 2/3] arm64: tegra: Correct Tegra234 p3737 interrupt flags
Date: Wed, 29 Apr 2026 18:56:28 +0200
Message-ID: <20260429165626.243471-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260429165626.243471-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260429165626.243471-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1478; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=NWBf72AWep/GNCzwjI4vCAKDlixZxm0nmerwPB/ePAU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp8jg9x/gM76fMemzqx4Et2S0499vrwRZkF4GeD
 ultZ/80d2eJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafI4PQAKCRDBN2bmhouD
 19KDD/9b3bk9q5fM9rpYSEOF0T1zhiY7JSCYnPFgGgMTKzSBKxCzD+IcK52UU57MEN+QhZMxaCY
 8/e3FZQcaxkrP6rbC36JRCArEhLT+StNiIlOC0Dk52RZubZXDsYfwUqqNxQA4VxroI73L/zcU6e
 Ph8iGDjAjXFjh17UbW9Orxeve80INzbRX5PUEp4RJziivXEGaALdJyZQ33Sg8CeFO5AF6u/EyhP
 aPupiX8zoNLU+h86jOnupDGA5h/u7ZmN68WnTDuvNJzLtIzjtLtry19hpgOVFbS2TXeX/oMGTpt
 hB3ky21EJOXTQqawmmGQewZ23XEueoZv5JFWbi2GjXhbce1La2X9lLTwq1lvpOqqAnvv+YMu2+Z
 XUudMWJzSTf8K9p3AMiJXcE/zxANozjXsZ+UbqKunNaCGmYFpapsgeQua53Q6DwCUUkQ899LcBx
 9O1q+wRAKATIV5C2HJIIE51jgotSo1lugVhnfyALePN3li4YNhsMWTbdP6TBjHInlcMIHYcGgj+
 pWS8UJqWDmzASWqrWJfVbkK7TYVOaJ8xxUMeSOtBOZrZ172UfygjI720EFNi2uu1yiitsQMgJ4N
 piyFydAPR2rAZYZ4YwD27UP0Lj1kjmcFgPepvuqXTHSUvCMHdNsygjDqBqDN7Up0jVwIf6gXj+6 27edXGrmSsCqpEg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: NbQEiCbSP93oR8mrZARtpFPKnYCiRUTS
X-Authority-Analysis: v=2.4 cv=KcHidwYD c=1 sm=1 tr=0 ts=69f23848 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=0oGBXvcucFHjQTZxw3UA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: NbQEiCbSP93oR8mrZARtpFPKnYCiRUTS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE3MSBTYWx0ZWRfX+Wg+ETnOU+Jr
 mXRmMlJT+FwUKV6ayL8TcNk+qGR5toGBl05Xb+oCqZcMwTtw2321hhUGLWdYUm7MbjKDW7iGeqk
 FY7N1uNGHjOyxPvAORGJzN/C7qNoatLwkYMA4mgv7b9M5InZ8z2dp81F9QhqqWze6ECW+xGpcdn
 riix03dUIplM6eGYloTIs1KjidgRyemEbQk+r9CNLG+w8D2kftNa4uumexwxnMUivUvguoFa9Sj
 4Y7sjTGUZAKLwPEtq99n8Ty7I7hNXrdeU5K1NrtY+bbZ/N1uaGtsiwVFzT0cKUQVazjIaT2+J5r
 WMme+G6KuIwH/wAQZFfG9pzlMjiLGGoa+NKXWvE9XVcecsgHpHYs1fyPt9Ek3GRwRhLtUHxCRb6
 qErE8ReUR0/yqrbSmKUMZ34+nbwWT9qDtocsjFDHEUzULvLrjbS3BFYYUSp4wr1TULcneySA8Mg
 KUW4nofNyJSBVQ9Q+2w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290171

GPIO_ACTIVE_x flags are not correct in the context of interrupt flags.
These are simple defines so they could be used in DTS but they will not
have the same meaning:
1. GPIO_ACTIVE_HIGH = 0 => IRQ_TYPE_NONE
2. GPIO_ACTIVE_LOW  = 1 => IRQ_TYPE_EDGE_RISING

Realtek RT5640 codec driver requests interrupt on rising edge, so correct
the interrupt flags, assuming the author of the code wanted the similar
logical behavior behind the name "ACTIVE_xxx", this is:

  ACTIVE_HIGH  => IRQ_TYPE_EDGE_RISING

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Fix codec name in commit msg
---
 arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701.dtsi
index f6cad29355e6..420858a8f4a8 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701.dtsi
@@ -67,7 +67,7 @@ audio-codec@1c {
 				compatible = "realtek,rt5640";
 				reg = <0x1c>;
 				interrupt-parent = <&gpio>;
-				interrupts = <TEGRA234_MAIN_GPIO(AC, 5) GPIO_ACTIVE_HIGH>;
+				interrupts = <TEGRA234_MAIN_GPIO(AC, 5) IRQ_TYPE_EDGE_RISING>;
 				clocks = <&bpmp TEGRA234_CLK_AUD_MCLK>;
 				clock-names = "mclk";
 				realtek,dmic1-data-pin = <RT5640_DMIC1_DATA_PIN_NONE>;
-- 
2.51.0

