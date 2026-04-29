Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BB9389119
	for <linux-tegra@vger.kernel.org>; Wed, 29 Apr 2026 16:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777481804; cv=none; b=jkMs4Y432NOQYr9GyKm6aWz9Qj9p0aCQxkPxqZSso4NpW4CKBnAWO4BFCcxnF2OapGXsam/GNA6nX/Jdb9USSUN02zKbc4p+Ugxs15ylKUYLrEY0tME8n6F7C7tTEf7ZPBFx2GDHk/L3C4g9wYQwyhCCorcrjbbAr2yU1UDr74E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777481804; c=relaxed/simple;
	bh=O6UMSFTnhxwEIUIyjWf879JJEfeCNDY4InCZhec1AD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K8fA7Ev/4VR7QFUA8OX+2yKQSpfsGikla166NzcSbxJJGBqaVaOYhdVaTdNHX3/+/r+xN6btBO5Lhv7RTUMalmwb1ojFcHGqCqyi41POHI7EkckRwbCmG+tlCmAxKxkOV8NjXe0GKeRZ1QyJi6E4StRsVS1IU4OwXFh+lOkfNQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a5EsxLBn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EU5BwRV4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a5EsxLBn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EU5BwRV4"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TCMJjt2485472
	for <linux-tegra@vger.kernel.org>; Wed, 29 Apr 2026 16:56:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qGcyRIPyiqZ
	tMqgVEL9A5k5N52jjl1pb5SLLAIAAH7c=; b=a5EsxLBnUr0PZO+ASIxh8OK/bv9
	KgkhC31r+owxBPXvqua3um6dbI2rgHqD6niMrrZlZyjuaOvhUNYk5ARTVf+wc73t
	fWod/0WiPdxFQX5BbhyGrN6xc0NuSUqVvW5jeVoi/WvHz3ZpkR+gO/Akf1TSbXIu
	a1RXOpv9QJmPDK2iwP1OMugxESgEH2lCod7v0o5a6Mxt7Z4t/Tc4nNpIqmZxAwqy
	uLoUABeCsOfnbtQRY2GBTl4f5ADwLH+D27Qu7QrlC1yCJmCpBi/S3xkPXMTFnWkv
	D1u6bcExuuRf6mg9vaFgGrVibtPwSINcBcvbvqxRXHGzjAOJQXGkAMpkz4A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duhx913c4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Wed, 29 Apr 2026 16:56:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50e575a50bcso147378491cf.0
        for <linux-tegra@vger.kernel.org>; Wed, 29 Apr 2026 09:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777481801; x=1778086601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGcyRIPyiqZtMqgVEL9A5k5N52jjl1pb5SLLAIAAH7c=;
        b=EU5BwRV4rLkZjfv3NWgOC4JXUhb8g86CbflukOY8fPStWwfKE6tem9Ad6lB9crVjz5
         sB8gHxvLOmIdz2zagglv2eqSSYM6ITc8jOyOXDXE4fvw//7q5mXwZ+MJF78YMtic9jKh
         UWFaYsdcop4FHlYi9eF7Nhjzm6a/3aUjqTKpz7bDc4gFCMXPnsIjbG+/ch3V0uzTLBZ1
         bszuxkq98UubC/SINgB/B0zjmGRqACyRCZtlh6Humi7F8Kx4OOM0fs/UPi86pi6hy1c8
         mp+U1hWkAdsCX9EhGTslO+ymWODMlR5rHSNZDSk3gRipmHsvMeVE10JtqU5vfqrma5Eh
         5uCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777481801; x=1778086601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qGcyRIPyiqZtMqgVEL9A5k5N52jjl1pb5SLLAIAAH7c=;
        b=Sszej8vXFcJSjs9SKDNiP7YsnaXXdPTEcqiUeCYTswJ/Q2PkHhpKHDLGjKB+VdiTZM
         z5kR0zUV4WjTRyu02H58H2f10YI3k8qwG9WlmP+Z4TB1Vu8emIAqqlT1ZwOGpEhVkcx2
         tb8i3yWBSJwr0Cj9oeEXGnTkNxuPCT5+fgB3cHUhgF7ErTmsIEa6d6KAxUkBR6ldOm8E
         B0XEswvC90At/uF98H1v1+sg0jeaFFp76/VtWX39VdGdW901LViBn+3VZP+KAb5PnFRt
         IqjnlVxLA25ifdxO/vWvHj0bhGmS05vtzm6cUt2yPs8suLcwG+P7acH5Nw2lbeUTIhid
         ey+A==
X-Forwarded-Encrypted: i=1; AFNElJ/WmuCvlfByvktiikSqznPT7JfnX0V3SlTjrc1OhPnl7yJzpyOZZmBqV1eV9UmP1fvT5v69el5au3DAcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgPiMa2DBq/1/gfhz6ypqYnYdIN2U+Nk0cH6nkunMkkTvwvFw6
	N8W3gTvqp1zlZbc5LlhMyPbQ+Z6bHlzLBRYOFP5tyTnaejDt83trgeH+qqAR7W+kqwFZ07Se2qj
	Qyt/CQidq6b5cBLbn7QQY5NaRsdnueSARXWGa+1FvwFFb/sZJY4H2VX6tYB6Prq8I3w==
X-Gm-Gg: AeBDietMukLGtwHB4XLiOc7aSN+td2bwH90FxbYwli2K7vmmBwl/gpsrGgA5EygrBqx
	y1n+gkACaFgFKrUf+EQfpL6xpNHbY2GPTFqP+6tFT0wm7znv/VdqD2d0imHDIBxku/WbsgU95JR
	ZS1xcO7zGqi/EuVWba8qHplhfRaXJBaN38xwPGoz91LDz8V6gjqzIYGcJaBf9rsidCTNTq6YXEZ
	01ODxajt8zIjrTyhEQmnZ5+3QpRPMc1+Pu5iqvRwE7ZmrCI+1Mv28ZOMJgdX/NqlZTwsKlfZ84U
	cM2X279VIp1oU/qBiCg4z5ejpfXmAbJHDjg3Bb4djBu9Scpk7BbbmKrh9MZZw37cGMrSi5y3n0q
	MgaNKCgxK/cJBvk324KB5NHvAdVgmbDTnCggZpehvbYBRuv0=
X-Received: by 2002:a05:622a:2289:b0:50d:83d7:686c with SMTP id d75a77b69052e-51018a35800mr74782321cf.31.1777481801241;
        Wed, 29 Apr 2026 09:56:41 -0700 (PDT)
X-Received: by 2002:a05:622a:2289:b0:50d:83d7:686c with SMTP id d75a77b69052e-51018a35800mr74781751cf.31.1777481800717;
        Wed, 29 Apr 2026 09:56:40 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b901a15sm52244375e9.1.2026.04.29.09.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 09:56:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 3/3] arm64: tegra: Correct Tegra234 p3740 interrupt flags
Date: Wed, 29 Apr 2026 18:56:29 +0200
Message-ID: <20260429165626.243471-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260429165626.243471-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260429165626.243471-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1446; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=O6UMSFTnhxwEIUIyjWf879JJEfeCNDY4InCZhec1AD0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp8jg+sBjL1x9qBy9hSajiPcCArCU6D68CSZ2pi
 MKPDkrXWLiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafI4PgAKCRDBN2bmhouD
 18NLD/95lvaSIPPGxR8ltyT5UCBv32PR10Qnzmk0Asif7pjCqWLMBjHuZYcnLZJQlithUUIaz7d
 mZuaUiVTj9OJ9jVtwWleQTYCeiUE52ELBpMvW239NqlZF7PFBMYhhqIbm5TTltv3AUJA08xgPyV
 dPTDiqGlXLmM97U2RSWudgMTo1CInWh4klwc4/mJhEp3GUeQWgmAQYNhP58Lubh3W484j0lTIOY
 TqaxzZyz2po2JBYC8SyxhZmhsK2/pnSzz1ASMxyfuPaBfKZP7qMLYdoS8luhHgg+9klUHOg2oSi
 UqfpXe/9Ud1kBfHOEiuQaFfo8lM6WEcMv85w5qmXA4etlCaK5JSkOCuQg8buqW13aCvAJWMwfbx
 14tay1RFCEHO/t0XPa6GJcZjhgK0VW0rPxOuIEMvRQLZFwVG+5tROodKTctboTGxwASuV+PIY9s
 NfNZsvMraEZKN7ZzblZdeTsgxM2Mj5m1G4DHWMkJs2Ie+yYwmav3lPzutN1JE18yUKP6r87z8Ux
 LvRJdn62B3lLU9Yyz0h9g7dqSIbfIW/P5o5LxInjCYqrWdd9lwWcCkKVkJHjfYBk3kZLD8s2Ag7
 CQtSsPDw3kgjMUGdEkPi3YOt6acQGm9jrjF4EeN6Y8CPvNlTbCgccng5iyoxkpvZ1xXcbMZl2Ge mLKRtPZiy6Vna+A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE3MSBTYWx0ZWRfXxLJGCzNgKiZj
 bcmLoINQsV2leoVSMdFK2Mbg8XD36S0Ih7L7jIJIvEy3VgqD4LePCHSfCHNJuFGQgw5IVz1Zbbt
 ZAfzHmC9xk/sYQ2naqzwCJG9VktsICacIQAVSPBxfEy2ynqaQBXLS+U0rY73i0f2W7ZMlftIx41
 1+2R4q7VIio54aze4maR30LM2B6LpRDtAupAmrq2MXX4hMUaRfWcTdcJvJlBOLJ8PsP/xdSTx//
 1dbAJNLNU+/Z/JxkamdwW1Vi5YTwXYgtvHTbSmeNH/zSMNUeY3O9x0J41+uTx8mes/EFEr6fSMX
 piWfLVnbs54/FsiVZVT/V28vod/xy+g2wz7CntAPBlwXSbRcN5nh37bqSVDuRnOmvwHUZDufk2K
 AYDrC/AO6gyqrs1eo3z9190M8GOd/F16F/dAwkedHFMDuk75pb5E535WIGiGpwb9HR9TPIGSGq5
 jWopeBUg1xkz1jEUOLA==
X-Proofpoint-ORIG-GUID: Sv06cX_A6SWS2-RN88GNGo916FyvdNi-
X-Authority-Analysis: v=2.4 cv=O5oJeh9W c=1 sm=1 tr=0 ts=69f2384a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=0oGBXvcucFHjQTZxw3UA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: Sv06cX_A6SWS2-RN88GNGo916FyvdNi-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
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
 arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts
index 9ce55b4d2de8..97cede1fcb70 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts
@@ -75,7 +75,7 @@ rt5640: audio-codec@1c {
 				compatible = "realtek,rt5640";
 				reg = <0x1c>;
 				interrupt-parent = <&gpio>;
-				interrupts = <TEGRA234_MAIN_GPIO(F, 3) GPIO_ACTIVE_HIGH>;
+				interrupts = <TEGRA234_MAIN_GPIO(F, 3) IRQ_TYPE_EDGE_RISING>;
 				clocks = <&bpmp TEGRA234_CLK_AUD_MCLK>;
 				clock-names = "mclk";
 
-- 
2.51.0

