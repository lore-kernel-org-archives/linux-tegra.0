Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D647E4534BA
	for <linux-tegra@vger.kernel.org>; Thu, 26 Feb 2026 20:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772138138; cv=none; b=JNDzfiizr1U6ZgerJd3YUlvDRkkuYFFjL6WcWCZff0G14eFyh8T9ob0Hqbv77Wy74HYPXtGdRxMY6a2SUEzGTK3P0RIZAuNnJ7irk7+hjzGasrf3e4mmOtgcUvXZy3d+Xu9DI2VeiTiO6BhihoGoJQ9aypJIuIgeQw2aL/tAqZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772138138; c=relaxed/simple;
	bh=0Zqe6FvyzRjWGAvotpoptSRBvpt3d3tx5LJyWV7ns9s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QPnmbSjuxYvRqr6b8xsauo4XsiTLEFdRg/OfZ7/xIgPIauBbaAH/S2A+hHj/ihko3VxNRUaGNuFRYQfrpF417ZfS/WUGO7GAYmWUW8EGEugJFYWUi0eyG0Y8j9rUJUyTJSDLAZtdOVNHMFF6QFZxSfiClfC6fG6rl6mNy++U2P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JIUXKsGZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VEOgqWUt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JIUXKsGZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VEOgqWUt"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QHEkdI2608854
	for <linux-tegra@vger.kernel.org>; Thu, 26 Feb 2026 20:35:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fpT71Ztu8nWN2x1Hyi0OUsorDrL6JEIklyzJ4ZwvaTs=; b=JIUXKsGZfr0ppwmu
	sor7ZD8AP4wHlmBlo/KdfJIerHJ7SRZR0F1vjuEpE3SnVD2GKpDWzp36cATKUKiW
	SmKQSdKINec+QxoO4P6+Bb563x3kLwocAjnOoegqd24UF+evv2k08M9WVwuuPnhT
	w43gLJr0XaMA4PHwpmIbxxQjLunQ5zHenRzr122ykNPDUy/UHeniortE7F7eBogf
	WcKx2wyiqTLW9FolG4wkhe2KHligSAw+xJyjBwwniaUhAkF2wNNPmNEl1zSNvl/z
	HZCLxDWINUUeQ0TZxXXq2nyKsOv2qJAxRbCpOh/vpKi2Lfm+0l0Ee/lgmB80SmN0
	N5jNfQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjt7y8vn6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Thu, 26 Feb 2026 20:35:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-506a936d7afso166940381cf.3
        for <linux-tegra@vger.kernel.org>; Thu, 26 Feb 2026 12:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772138135; x=1772742935; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fpT71Ztu8nWN2x1Hyi0OUsorDrL6JEIklyzJ4ZwvaTs=;
        b=VEOgqWUtLg9O18YbWm73xPks9AqGZ78N3IPoUEuWZWWFPhp/xUZsc8UXcbFXzBJdeV
         Ac+WizHJ/pc1h/eiXZ+KML2qmrr+mZ1wmmntCTQwHurKEIMkM4358ITrw9NY/aszSNPI
         n0StJKV3u0MsSmzNcVhK2pz9mgT3VOoLvJuh4tUhQRISERyfYtEUI5qMa3xXHpYZDo6y
         a+kDkkd5EvqDI9Plpz63mj+l4ipzzYOK2uvp8lHPIuZm0X70rgm3dtcoxCL1ClRRSOFt
         2znJjWGGg8VazrG0c/uBpNgqjlD2ufk8Lturc5o93whwkJ03IxWHSKubsTKUdqJ6BKNx
         9cng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772138135; x=1772742935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fpT71Ztu8nWN2x1Hyi0OUsorDrL6JEIklyzJ4ZwvaTs=;
        b=au/ECzhdzaxE4iCh0Z/XN4oNYV9lFhgXLpVcnVXBj+PgJ4OSj0b01aZjwcoeGfBNZg
         biEc1LJ1IpL8kPXj8TEoVu2ZQ4U1CZxopnH3K7C13Mzfrdp8NkTBsFdWx8VoLBi5dUy0
         7yi1qxTIGrNCIKTk7WC9wE6LG70AvLL7b8FUU+MBNRdoECJN/8J3yRa6fvKUZdylRT9z
         ARpKeOku6NF9uQbzirkvTGakb49lg2XQZPK6Hx8dF4XXCgQ4z/FGrBXirmQS6AK+8xQG
         nqlIzCgiikXcEFvqwEWJpbeNCqukbRjim1ATrnGucGBzD/Bq8SNmCgXTLY3E1ZhXUFUR
         znoA==
X-Forwarded-Encrypted: i=1; AJvYcCWbQqO0vvyRGrLDkvLuoat0oO3jtpDIJpOhomur6al6J0UT/fFubo9qZujYxjt0MBlYo2knNPQ7sBuhqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBMQP4GohZFJIKjT94PUBiu4rcm+YJq4sFtoH/gXHGBX1nEFci
	5yDEDfXB74NoIfCPR7PwqoHhYUT6yYBaO14Nyr5A6o+tUf65DMyDE4nj4CfFcSTLilQ7C+Aydov
	CjMU4oBC+h5RVspyPYGmnB5HsE8Z+xKooP45iXKe8M/gHjmGBUmIVE0p6KvmiARVfGA==
X-Gm-Gg: ATEYQzzsJZLp79agFw0N9JU/xb68BXj+vIlST9tkA9ubqRi0/YWKFeLtTCkWMl1Xjho
	E7uz3t0chrB8KMphhM1gT6w+KsHy0X2th+iDGSfOKrNIf8lCbGTzSzO8khs5v3876AbaEcbIYGu
	Q7zxN0hi02GIqb1vDhMd0c4b7xnJ7S0vpyXNqiyhvLE4YuIvu7Fm4NUKhqlh4acsydAY9LW+FFu
	gtvf9pPiiOUwWhtBf5DUTspl7Da6laHCYMmHVNJya/ofK3M125J4rGnJYowBVvXHxfGg34JnaJ3
	j9V2ujUwqYYca5yw6oS4vfgy6Bi7N/7rLlR6HhJd/e6X6jUFLanMqmZ+jEwc9STUP1MoRapnWZ9
	OdxauHCm4myUC+2zdCqrO2vkjF/5hfbHk60XVc+Dj6j+0uA==
X-Received: by 2002:a05:620a:2993:b0:8be:88f2:5b15 with SMTP id af79cd13be357-8cbc8ef77d4mr38341485a.38.1772138135243;
        Thu, 26 Feb 2026 12:35:35 -0800 (PST)
X-Received: by 2002:a05:620a:2993:b0:8be:88f2:5b15 with SMTP id af79cd13be357-8cbc8ef77d4mr38336985a.38.1772138134679;
        Thu, 26 Feb 2026 12:35:34 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b84023sm65180215e9.12.2026.02.26.12.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 12:35:34 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 21:35:24 +0100
Subject: [PATCH 1/4] memory: renesas-rpc-if: Simplify printing PTR_ERR with
 dev_err_probe
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-memory-simplify-v1-1-ccb94f378628@oss.qualcomm.com>
References: <20260226-memory-simplify-v1-0-ccb94f378628@oss.qualcomm.com>
In-Reply-To: <20260226-memory-simplify-v1-0-ccb94f378628@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1190;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=0Zqe6FvyzRjWGAvotpoptSRBvpt3d3tx5LJyWV7ns9s=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpoK6QcGBV9mcS+jHX90AbtXAfBjY54qrQ+sTQe
 VBBNvAMYpmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaaCukAAKCRDBN2bmhouD
 1y0DD/9tzD4ggGbEducaCXT2hsGKBDrtRYR87MxO4A55ZaL7qXqY3dDY6qWk6qC8EC08oYVEId1
 RRrxKP6EaV7rZeh77Vwwo0sHy6jwLD9o6wjTPzfaLrwrm7gWzdR767U7IpCFqtOxm1jU0HZ2wrR
 Z4Q0Q/+8UeU2FPnFeVOXnlvf/CHQ2a4TU4mRofb7gkUJQzt/7OqZy22ePl/lhJQ/awIG/j5Rn/A
 w8wWhLeUXYLAVSfJsshYdfZvM7z3m+r9XOH1uxtWMg67AbqcF/qfGNn9ko94yoHC0gR0cTcDT/T
 mGCRhe6FD60vA///X8fvqLNjovPwF8xu07inToG49VH8cmLV+Kwt5pN5K3s7DDEIDp8vsX7ILmT
 6Zb3g46o+hIqNEiJOvIcEn+72+pIVOizcmhzifwEQ57asRmpHBFJdstr58zYhcrKe6mgNHWMW66
 Pu8AgXCtekf2x+GPI6TOGgpT74D3s3dWyIP7375INULHVpfpAOzDt2GfC3XuUZzqzT0JqFKjc8e
 g4c/eCdA14HU/LKHHBtOGUxVY7XEJjjjFH+OZxsjeFe/nZMeWOK+ijyOTW3yLAkKQuqxm+t3Na8
 /6NvYIzl0K1k3MTAkLHU3+pONxnW7XkMAgr8MDvRJ0LYCx/5iVGcrtULbfy0WNaks4B0vesVyt6
 JVt9WfoGEzoUVeQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 9XbQg4A86li9iAL9Ka3ZgPLlRGU7KckX
X-Authority-Analysis: v=2.4 cv=N7Mk1m9B c=1 sm=1 tr=0 ts=69a0ae98 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=HCxIvfKbU4BEwnpgZywA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 9XbQg4A86li9iAL9Ka3ZgPLlRGU7KckX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDE4OCBTYWx0ZWRfX8nKswh0TfS1N
 mgQw3UMILEk+WsPZfYJhT0R3a8RvrtyB+mK5kmuADBucPIRx0DFokjBM0u5rbUzX8CWiak/LO0H
 vdZwdRatr60yGTp2crnEg/3uGkLrvkIDYAEEjJoYbv2bE+I777SAcuZdN8HyC3hmsp58oOsulJb
 jKucKcdvbZ71dR0DDZSQBGN0xct2XX3a7EETabQjTwI+qgAbIeJqCjKPK67SvsFDfhbD5d138Qi
 zIuNxfguiYRiX2Bv/QSyednhxgoWTrg6cEcoL+ShpedsoMJrorCufJ7kHKwU6qoSOeO1eqDveDJ
 mRJ2W3/U0CMt1SJQjAnNjBNoxksxuR3a2hnbZvAVmpPelqWQBZ/zc6tmBn/InBaD/7gCKG4mG1T
 VPXT0/44ubLkoFYZqBh9f6bl7sWi2ypYBeSgdGxrV3wTc4ArYxbSwM8hdMPJN4q2OCRYZAUeiTS
 V7VQmBOsZBTZMEhtZoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_02,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260188

Use dev_err_probe() to simplify the code and fix Coccinelle warning:

  renesas-rpc-if.c:1010:3-10: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/memory/renesas-rpc-if.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index 58ccc1c02e90..0fb568456164 100644
--- a/drivers/memory/renesas-rpc-if.c
+++ b/drivers/memory/renesas-rpc-if.c
@@ -1005,11 +1005,9 @@ static int rpcif_probe(struct platform_device *pdev)
 		return PTR_ERR(rpc->base);
 	rpc->info = of_device_get_match_data(dev);
 	rpc->regmap = devm_regmap_init(dev, NULL, rpc, rpc->info->regmap_config);
-	if (IS_ERR(rpc->regmap)) {
-		dev_err(dev, "failed to init regmap for rpcif, error %ld\n",
-			PTR_ERR(rpc->regmap));
-		return	PTR_ERR(rpc->regmap);
-	}
+	if (IS_ERR(rpc->regmap))
+		return dev_err_probe(dev, PTR_ERR(rpc->regmap),
+				     "failed to init regmap for rpcif\n");
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dirmap");
 	rpc->dirmap = devm_ioremap_resource(dev, res);

-- 
2.51.0

