Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AC344B670
	for <linux-tegra@vger.kernel.org>; Thu, 26 Feb 2026 20:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772138141; cv=none; b=HEqlNFBCeo9M9y1+x/GYjBs7/SOhyotVTvZwLf6lmWjVjqYCfflLwTzGj4nlRdU0p0Ky7blB8VXbNKJ2eRI3ypdKGT8PHzd8qUL8DPx5vwoGeKVsAo4R1C3fLTQXzODCKNUN7gGrVdv8ugNTvTnbk7cQNjBjbVwMeQC7cgzHrSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772138141; c=relaxed/simple;
	bh=v7UfOXEaSyMx4gSl1uLcNMERuyUrvUeuLR7ph54352E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e3lWzl9aU7267qNrO1Ppha7OXzsujdqEkczgCItUEf2hA7wmSvw4m93zJQ6Dp0uIlGKo+Swyblx0bUGZDnqaXZ1krf6fACNULXUD3O91eOQscxS4VzaW+nH7Sc5cMFjG5iaOQcTfSdSKi2+fe4qpI3y9dcKh3i30wBSEWpr1YFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gveyhxf2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PSR3vgee; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gveyhxf2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PSR3vgee"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QHEacZ1258232
	for <linux-tegra@vger.kernel.org>; Thu, 26 Feb 2026 20:35:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VgqqZSaVU9OmFjoZOEKYaWg7lNJdBBqXPNGbuzHPSaY=; b=Gveyhxf2Vz7U5/hZ
	/W0Vb8O3bPIMtrOeMGiTIcijA/dueHfRDopB0CPOanrk6FKlace09SE3mLxKj4+p
	g91ofs2Z7AaESaAlSArH5k59o6Bk1VxD5QmYp6MKjrpRQpgx4tpaVv6cTkFGUiGj
	GKzJux0z8sOqLohpDnFX8i/A4xzOp2AiosoYeGer5N99ph1EF9E1W2G794diGyDo
	3EXBTFuoZWxY+Q8A83zSoYXsbc4zLKjJZcNuGm/bM7LtoF9xFmxQZSjKIrtWRig3
	t+WfMz6WfoA/Anx7HoqkQT2BHS4195ldpWsrOfYgA8Llr5bjuan4+mGCsAoyJdpN
	p3IjiQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjc0gbrch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Thu, 26 Feb 2026 20:35:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb3a2eb984so1440981685a.0
        for <linux-tegra@vger.kernel.org>; Thu, 26 Feb 2026 12:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772138139; x=1772742939; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VgqqZSaVU9OmFjoZOEKYaWg7lNJdBBqXPNGbuzHPSaY=;
        b=PSR3vgeeeBYjP1ladx2YwPV4gLNqD6Ieshkqcb+QZvzxtyjWCnpBIR2ElBNLVwFCQd
         84O2jdJ/3QDGdU920+QY9saaJM0QkhDwazR4EZvBl/VdzumpLeBbuEE6XqLAK+xLv6R7
         rf69oGEgPi8lJusk1tbuhqfG6Fc19EQLdhtiKP3JZP6wGG9HuKmuqNdVgVch+sTiGIkD
         ZXOJBb5oxVVsO2hFNlSAxPCkfR6DvFRJ0a9mlCiJC0ys0YB2hw7GjIljbbyxT1QJJ1uq
         S0R1q+zCWhe9k0XOFrrC+CHiJixd4Sb/69UcjTGbyOVeUqmXx9w/RV8Q0x4ZtIafLUJH
         J/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772138139; x=1772742939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VgqqZSaVU9OmFjoZOEKYaWg7lNJdBBqXPNGbuzHPSaY=;
        b=WVwA06Zao5SjtBbH642I1qisQElUMiyx/uYdcggOZO3p1o6AIZMcOINGuL0PEnv2vo
         Rcvjr62/crSAtsQiogGVEXKnnT8UeC898yETA1TCCFXkMfDVa5tIgyU/XVwVxLuCcfPG
         IjpFMj17XUG1k4isj60LzqbnbGVwT3Lkkjd8cIANHFPWH0pPX5z0J+Ze3UFqMaVznNKy
         JPeucIxdOjwggebRSoDvZQQYkMdT5XTcv8/iznMgw1Il+jthtRQmoQey3dxgqncZp+em
         eMeVTYXq0d/4tFthSHzjFvLOGDp6rFwh4dxf1oa7fsAEeQ99cSQqFFCYN87fDXijuLWc
         /kQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOEBogXUOVq/0+vTEhhKE1SxgtipzGiRo9Omn0yDHf4+qyeghTfuXty9aTqAyK9ysPEVPMIV9KKfNu5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlVBjjBJLbS71yWN3/gLGGzWiKh4/FHPD7fW3iL0C9XrXg0KHv
	rVZIS7P4Y/HBj7nAwvoaUzpy6s8a9hQzPU+cYh0NI9FxkSMfRGiHdmwURSMbwqh6H5RSEFmW4a7
	ripcHzcz7GsKBRGkjALEO5mS4lftUEMHi/9NqZpC8ElULFCL927a2QAo5Ltc1/r1b+g==
X-Gm-Gg: ATEYQzx3x92uQJj6Run/jG9aLlkb0YVP7Gs/ZBnlTDA6JCJ9+ItXl+GlQpvURG2ySdd
	Wv0Ki9ZhBFWXmmGGpoir4HmtuLCOvukF4dsxVuvW4KHXu6hBECcjT4KES7yZWUTL+efNPTZhlNP
	fVa4A5QL4pxLTiKAVpLeO5nYfWoJxxwBnhMkHgmeo5hGYS/5eOJqV808VVbWcYV7ccfGGDiWiNy
	Kfl1n3+WN4JSv/4aHK7pxLaF5syI3JuKYLJHgJKr0auZdVybO1T3dJ8yqD0mr9YCwuytiBOXvue
	v4TT5U9KyH+BzIjwA55Z0mC+75SlzmIDRkAm1UC2vDZbwlQPlt3SHtqso2m6uqGB98A+aTA8QRU
	i3CE7mn1Ja5VapGS8r8NnYloX+L1ZhU8obU38ap8grVmylg==
X-Received: by 2002:a05:620a:1905:b0:8cb:3505:443c with SMTP id af79cd13be357-8cbc8df0658mr46513985a.44.1772138139254;
        Thu, 26 Feb 2026 12:35:39 -0800 (PST)
X-Received: by 2002:a05:620a:1905:b0:8cb:3505:443c with SMTP id af79cd13be357-8cbc8df0658mr46509985a.44.1772138138779;
        Thu, 26 Feb 2026 12:35:38 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b84023sm65180215e9.12.2026.02.26.12.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 12:35:38 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 21:35:27 +0100
Subject: [PATCH 4/4] memory: tegra-mc: Use %pe format
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-memory-simplify-v1-4-ccb94f378628@oss.qualcomm.com>
References: <20260226-memory-simplify-v1-0-ccb94f378628@oss.qualcomm.com>
In-Reply-To: <20260226-memory-simplify-v1-0-ccb94f378628@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=932;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=v7UfOXEaSyMx4gSl1uLcNMERuyUrvUeuLR7ph54352E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpoK6TNqg3vPnMyMkNr2LCr4s3u+yTG0oyEn8hk
 5TGm2ktbTWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaaCukwAKCRDBN2bmhouD
 17IrD/0YpA0hFk4UaEGv1XGZlOsKaJXSESgRjR54wYmrJhCthu3OJXdV0GHjYRpbizbbreMsuld
 6VRp/Srrx2nDE+lQ3am9CtgtNzGskBEVQOrTKeukw6ls51WzAsCiD4/5CPkCThmTL81U2K/0++E
 ULtfSh4b6hMwoGvAtdU1QoLpryCk4OqAKnqL77QhPxXIUMJvhqm2tecM+kirXmiTsyWvhRo/tVk
 oxLH/ZEcvFD7W3owrwNl732VLQFy2bgppp+TpQ/Q6NOc8sQLGBdtjn5owI5UVpMeF6V42kfVHd1
 soiSn2ZdhG2IOgpo3OyoeUolW7T9B6JVBybdw5AJ0ZTuQb0nGJ+2b3MSdMvXv3OfSsuPL9t17e2
 Pkbme24rr+h6VllmCq/yc//dWwMPrEx6tTObprMWOn2+5LFs/HYMLYWr7yiN2aDFps49rY0chqB
 feFm9slB1h/DvzLa1Y4+SonIOaFkDjJggH9zfJHtrs4HS1QFhdT7a43KAZRZg9wGzuf63Ww/WAW
 rgLUBAru+nnv0PZgNVfkPncJF+3uN6137I/A1GIM8Df63NTnNpHVfG3rx60TRntS4BMtpyEz4jm
 DOoyA7MFtZ+wElznrfgvyz05zPRJjRbN6OiVdGJIAXGLGYer/YcDhgt4udxHspAtajCALtTKMOL
 bf3cTNARfT482XA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=XI49iAhE c=1 sm=1 tr=0 ts=69a0ae9c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=qFFuh79tOIMi-ktocPIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDE4OCBTYWx0ZWRfXyZLCP5HpXWch
 M0wpP2XiTj9vIQxxuylqrZ+Ej841mPdzofG7O4bPFN2EYkzVc+6vdSMbzh2NqnNl7EgY5h2j79R
 bAHCCmZ/44Jmjd5XLq5wVisjiqzj+Z8uk0UH3UpxMNIx3AdW3yvEJmoWBAvzyk3aKN7p8OcTY6Z
 pim1T04fCTAJMC94wTH9O0Apum7BYCtujdiXELDSFxnCrSQqT4bCVpbDMIgAWHvMW8qIOT23zQk
 imBR40/s9BeDZ15MIigKGGAP+StoRpvUctUx3SMsV9ZzPAUPH6Wj5KSa85oexcpUt0QmT2G3ajP
 PAZbckoTzvXr7gZZaT78MV/pwwDzKutHiv2T024cYIFDGNKgCN5TC5LUX4bo9tRDQLKA6F5nSy0
 asy+yztd32riryCmUJbKfsQSKqb3nDG4NBh2uUM4tPAWexVwR+GyKhJR8Ar4rWXQ/9aDO8UvlOT
 1z++1IeGJ44BuNbCEyg==
X-Proofpoint-ORIG-GUID: _6vDLXaQfXnp8MF7FUjmt60ZR6n_h5eM
X-Proofpoint-GUID: _6vDLXaQfXnp8MF7FUjmt60ZR6n_h5eM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_02,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260188

Make code printing pointer error value a bit simpler and fix coccinelle
suggestion:

  tegra/mc.c:975:4-11: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/memory/tegra/mc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index 1dc516a5be14..67a0b0c07712 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -962,8 +962,7 @@ static int tegra_mc_probe(struct platform_device *pdev)
 	if (IS_ENABLED(CONFIG_TEGRA_IOMMU_SMMU) && mc->soc->smmu) {
 		mc->smmu = tegra_smmu_probe(&pdev->dev, mc->soc->smmu, mc);
 		if (IS_ERR(mc->smmu)) {
-			dev_err(&pdev->dev, "failed to probe SMMU: %ld\n",
-				PTR_ERR(mc->smmu));
+			dev_err(&pdev->dev, "failed to probe SMMU: %pe\n", mc->smmu);
 			mc->smmu = NULL;
 		}
 	}

-- 
2.51.0

