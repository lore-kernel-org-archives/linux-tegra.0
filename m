Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E648311CAF
	for <linux-tegra@vger.kernel.org>; Thu, 15 Jan 2026 18:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768502950; cv=none; b=fRiSDivCnMo9Chy+5TgwhGE0cLcYcie2EUSNc970O8xiES6ciAAXm62oTVSfw+smC07im4ITfZ3MCuK8VONRWHkg9nR/GkYXXLN6syCmjGRSTgj9L226i2Z9O3JJuUXTldkBUWKVywPGbapGaGXTFcSAFMHcBPaAE4NB9Vys9sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768502950; c=relaxed/simple;
	bh=DY9hBCb5faJUt/NqJhKPR25mhD8mtT8COZDItt8PUvs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QGLZHEPGybdPK2EcjJ41UAh9oAWlixmYISrnArI4McgoIWBYrkKXD6Ss26PfiQv284vBf3HUiUDp8cbIu5MQIfEG/HtGtki+E2j6n2qAgqDGPTg4CQ4hj2W3koRahABeZhx6RPrRuVRedV4kUK1K01vgug2ISEjOYlGy1jr5Fkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PwrLEpT/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HmdVMEVQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PwrLEpT/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HmdVMEVQ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFYDkE347760
	for <linux-tegra@vger.kernel.org>; Thu, 15 Jan 2026 18:49:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=NAtDEoHZn9OYnPtYADQPVu3NWijc5YTrvRP
	nj9XDSH8=; b=PwrLEpT/5DsRpJVYytaFYPMGnrmgwsCjcM4SjcWFzF2i581zXLj
	7GJ8QkppUslsGuEH5p+EPD3J/lsnn3l4bIMq0T9v0brCC/KQcyHaFIe+wz1JdsXS
	M7HD0oUIq4/n6dTfWN/TOwVIxyrAY3D1knBt/fjFW7oy5Kuj9rOYdWquPhz2d2V8
	uljK9LEc0q55PMzYidJuVdJy/MGZg0efJ1udgSmGffFbbbq3r4h/hP091STyy+0+
	a/SdGkJ/1iAYXtIlFrRdyY0k/YEXH/qxEnkavJITXUjPDavCO1dlxDKxWUn7m91E
	6/PxB3ACZP5EKWlqHO4wOZMmAoKJkOMVy2w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpy07sdmf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Thu, 15 Jan 2026 18:49:05 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88a360b8086so31028456d6.3
        for <linux-tegra@vger.kernel.org>; Thu, 15 Jan 2026 10:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768502944; x=1769107744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NAtDEoHZn9OYnPtYADQPVu3NWijc5YTrvRPnj9XDSH8=;
        b=HmdVMEVQLfyPX1dCKCG5+g6CN6/GlQoMqa4yGAbvdTUagBXxqzjOgqbZjPxyTHIeQz
         m4g6rNiGFGBTdOGgXCTpksuvSFth1LDggVWPfqM82ZxoXe/dzNl94pVh/9uFRuaZf253
         5sdNLCGCZB9n8M3iD4RyoRiUen6/Vz5QgL05Y1hFckFBEuUhnNeJiM2djpgmXOAdr8iX
         4t7BtcRFPjOYuAC1cZPKALUMw5uhlNEOQo4RlO7zGd862U+UP5FYmwkiczdLLhB3TSgQ
         OVkU3hkYtXfmt6gKCr0xk/EIICmgtnAGsJXgOz8vFVlzlKtsx24Js8Zx12rGN6R75i2z
         yTsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768502944; x=1769107744;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NAtDEoHZn9OYnPtYADQPVu3NWijc5YTrvRPnj9XDSH8=;
        b=N18ig1An4EvCt2cLHIgZaoW92P0ZH4V3+JnRIw+9Gkq/ykGi8N60rjmoM1OVI/+POY
         VnNtgeWm2wz/JVib6zXjW4rlWeTRSd/ahKsXqus3CpxitUfFv+RCNplTLMUibCzR93Nc
         +kdEtjrLc4VUSxTwT24+GRs6FZK8oTRgqNjcrZrdOjk7ZVG1xKwdVs0Vw6FAsaKTcqTf
         QGHi0siLGJKlWF6VmZRrjG6v3+pQPiTsvYspaiSRePEcN5ES3UJlYvLvgqv/MxgHlpVP
         /cSIUXWUoRY5jH+/HqSnPG6Pto2kfQiV1BKILHwL2LNq2Z6z3HHQ2h5bLTKpcELFGtAg
         AFww==
X-Forwarded-Encrypted: i=1; AJvYcCUFVxDD658GYuaWxEJWWCXq6xVoyuYRpDLKFghCR1sstdkM76Y0BqmHLNgZuvBbt6x0NcoY3nLrFkHdhg==@vger.kernel.org
X-Gm-Message-State: AOJu0YypZhS0sUjobz6pfjDEanHJ/JLxUsrvxRJOewMzSex4ElFeK6y8
	cw5b8/CbNSdxC7E9DUppMJytkcDDdbyvvokLT2NPTz5Frvnef+YSOkHWCZibvvbnkUCMp9J03Uo
	Jc6OkhuECOe3vQNqBfNdqdbbcIC9Ciy/17kLubKLI9gfWHiMIVaVN0cfJXq3TwzWeMw==
X-Gm-Gg: AY/fxX70kS3mhXGKf4s8J8GHvcoIkm/jNSGFbtpM/LMpWd/wL0HKW0IJSZaHUhtIUG0
	gApm1ezrl21RBQ2kgxPzzmV/Js/Cxs675v6YQd+Qo0ThQ9oDs+pig54fCfqA9P5mF4t7NoBCruT
	TYx6yHb7q9PN2yYapvdR4ULPwqTSkuDS7mbmw5UVUAd08zjxfhuDCVB8xtdympNPtKCbRzrc1g2
	mOQLzgOERbkfg5PFwYGG4UHW6TZ/1QwUeyTDqRoYN2oMCwDH1ILQvv2nDHgeAM6dL1iNgiQkX7v
	rFcGi880rzQkaGpu7sXBOtIMOS+03kbmPj/HHNg5zx6O6YM8DhK4JhNPGYTQBS/r8RXlCfSicZ4
	ae/YmjTQtVZje3jJjCTWrssCUnA==
X-Received: by 2002:a05:620a:2698:b0:8b5:5a03:36b4 with SMTP id af79cd13be357-8c6a677a8b0mr63461185a.71.1768502944042;
        Thu, 15 Jan 2026 10:49:04 -0800 (PST)
X-Received: by 2002:a05:620a:2698:b0:8b5:5a03:36b4 with SMTP id af79cd13be357-8c6a677a8b0mr63457785a.71.1768502943625;
        Thu, 15 Jan 2026 10:49:03 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795168c6dsm14408166b.19.2026.01.15.10.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 10:49:03 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/5] arm64: tegra: Drop unneeded status=okay on Tegra186
Date: Thu, 15 Jan 2026 19:48:41 +0100
Message-ID: <20260115184840.310191-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1299; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=DY9hBCb5faJUt/NqJhKPR25mhD8mtT8COZDItt8PUvs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpaTaIbfIIsgQATQBMAV8IgpIBxl63kwWWudj4s
 x8PAwgYriWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWk2iAAKCRDBN2bmhouD
 1yfaD/9UPkrxfrYmDxiA7ONlqfbdfXnGsl+G9q0fo8AHfqvb97rDM5LSlNmwgmMtaERBqD3aNCW
 9sPQN9OkguLOzwd/tnLnwryRFdJ2/0SzI4UJT6NKlxpWla7xagsHzk94vBd2hncoh6aE7OEVEeu
 2/IxFwOywd2ICnn2iGTeLBWw9657VDRjZ6rUqN/hgEARHhjI1FftQXfO0kjY+T0xupFPQom6HAm
 mHRsoYDU2kC3hTsIP62REv+up8iosXRhl+sJ706I1u5FevJ3PLUNGQjO8NsTzhS09skwB8XU6WO
 CwTA3I6hq/KH9r2hpssUhvizrFE+bCr86TCD/1usRvjZgrGsoTMq+D54+hpNVDYPzmqpE/i41zD
 DHX5avk8xRfwqFPB8g1WJrQcot8KKeuOQ5L3JsTN7mozsKs5WB1Qn9aeW5mBIFpRNVmB3YVFRXZ
 dIX9KRuXvcJf/M8nccFPitdbTmCN05XeUOkTg6nEQg8H+IwGDEwa8J6jOCKN3jjrxylh7J7Frta
 51g9ooLxgxQPDffnb2KaPI4qDXMGc4ynoQc04xv9lk0AVa9TTva3/ja6qDGKYBP5gFU62YFuqKR
 f1dfOaBFiOxdXmsxlFTj1HhAcBWp44YupYKq40aJKvg7OvkPOZ3BPAsYi5J1zRtMett6d1L6pJ8 UZFvvUJbZ8nrMEw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: DUi-5PypBk0VinO3xstPUL2R8bvj6l7i
X-Authority-Analysis: v=2.4 cv=fMw0HJae c=1 sm=1 tr=0 ts=696936a1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ORx1dWHOHe_Yef9wL9oA:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: DUi-5PypBk0VinO3xstPUL2R8bvj6l7i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE0NCBTYWx0ZWRfXzy3Eg14XBBek
 OpNnY4gqvOOm9Jwu4vise+ue/P5XzkTbftKhz8SIA46A3LDLyfcyb1fJGmYHeUoUuFjaAupkdA3
 Vobg9CKvthX78ITaGzlEyngFyAG7SUUGcjMRESAPjVnAN7Ot4AkqtbiuCEFgLxLHq1GE0Wnkrn8
 bkF8WV3T3um+XuHK/ytqrGlVNAp6FlQ+qlLYL/XJ/1qNu6eXZEAg/AZW58VADeVFLoCvlSKOhOM
 qCmumz72fMNKn4zYqz1oR6bukSfy6mzFeEQhHKmRaoZaoKVU99oLVOSt5chUNCoMG50y+eMYgLz
 irVn/Tzp1cBje6GUHd9OYNi8U36jqveJbvFTCV2NJa3GDuJZbCHsw1rN0HdaaM1VoyohyijeVv8
 NdteKU+mLcrdhcZuTjwms5mxzaBK5+fQMqRr6gy+nLmPRF7WkOPJX0zrNWQuzVxWX0oUlMOolqn
 r7+gs6Wo9Pvq+oRxhMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_05,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150144

Device nodes are enabled by default and this DTSI file does not include
anything else, thus it is impossible that nodes were disabled before and
need to be re-enabled.  Adding redundant status=okay is just confusing
and suggests some other code flow.  Verified with dtx_diff.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

make dtbs, copy old and new and then:

for i in dts-old/*/*dtb dts-old/*/*/*dtb; do echo $i; scripts/dtc/dtx_diff ${i} dts-new/${i#dts-old/} ; done | grep -E '^\+'
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index b00630451909..705af0373a09 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -120,7 +120,6 @@ gpcdma: dma-controller@2600000 {
 		iommus = <&smmu TEGRA186_SID_GPCDMA_0>;
 		dma-coherent;
 		dma-channel-mask = <0xfffffffe>;
-		status = "okay";
 	};
 
 	aconnect@2900000 {
@@ -608,7 +607,6 @@ timer@3010000 {
 			     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
-		status = "okay";
 	};
 
 	uarta: serial@3100000 {
-- 
2.51.0

