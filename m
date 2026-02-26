Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CCF466B76
	for <linux-tegra@vger.kernel.org>; Thu, 26 Feb 2026 20:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772138139; cv=none; b=MBhAw0b9w4KnWPEly3Xu6OKphn5Y1Ei2bY46ebTqyQvpLdijTqvzHrQaWXgrP9W7facdWnuXHKe+9GSCM3SAQo/rJjwCKKt2L2iyZpv3Ot8MgmKQbiSnqEGpUYXpxVnEFBbYErEayTA0iGkHsoEUI+mFhHpjUNL4sWt1rJiN/EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772138139; c=relaxed/simple;
	bh=72llYBeMoAF6pTGEyfmImro6M/l3hLKreZuJANcyQe8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tW+vOs+mB/XgQzjwwORl/BOesWW6qEcCse9zNYx+zdsDH07vCq/UQ887Iqy/r/x4w2ORbfxSk8n6A4XIH3ZB09NH06Wfn0/i6ik3UIy9BiEAnKmUzFjEvpBY0neLxexFbRZvEX5qzgpcheKDVgsc2i82QKNZ+GZ/+oZaULTwCp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m+nXQ/h3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IsoE3+hE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m+nXQ/h3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IsoE3+hE"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QHErA31826262
	for <linux-tegra@vger.kernel.org>; Thu, 26 Feb 2026 20:35:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	usK7E3cZDYS7cGE/BqepJs7NlC+aQOJyDhOPJjAtrQo=; b=m+nXQ/h3rTFw3dxQ
	JSGOSh4LDhzGg6lUTtKQprQUQaPpkivCzso9NwVdr4mg0yuoVLyMTz201Ep5+NG5
	k6N99kWHqYhZuYzKGyrLLXANeIaMSrQlmmO01Yv/M3DNPEh8v0Cp4zlsAq9eDvW2
	pQCZaFuRG8/10vZPPU5CITYTS1GiaIZPD+ooRTUe/nK+IHCJJSQY8PMo8oaUQSzn
	u5Fp+4OD5knu2OkdRcWV3uKmqM9AQ1mUEHe8PYiFrhKCJspoYz03F/wdJitwIfRm
	e/TQNcTH5r8UGOGwdL+7282+tvAsQD2Z17pKa3zN1I9W+JP/9KJyy3k8fKUvCDMu
	zEyeow==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjk2v2fjr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Thu, 26 Feb 2026 20:35:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb52a9c0eeso1487753085a.2
        for <linux-tegra@vger.kernel.org>; Thu, 26 Feb 2026 12:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772138136; x=1772742936; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=usK7E3cZDYS7cGE/BqepJs7NlC+aQOJyDhOPJjAtrQo=;
        b=IsoE3+hEEin+RaQpaaNeDALgL5pb1DBxsr9fwbg5yb4gCP9ZV+9h9579O+gOvS2ZuI
         7XKBiQTe/3O6lynLn5HsQPPJkvBxWwwxue1PkCYdsmTQTo+BB+iQKwFEpcUcL0dLfMtC
         TeWxBjrAvWeqzDJsS+z15D9tR4LBecAJn8Tv737+pE/pw/mT9j8yDw72kzK1IolCUjxT
         qE3p0hRX4duksuZCt73CR1kE9xGMSAlcjpE9335uA/S7l24DDBhz/Xso1fsTyHRyAAHN
         hbs5pTaSquK0wnNNvBYhaHxnj6IXoav5Srzwrft0GoC62TD1kMBjwDbGYZaRqpHFRY3A
         5+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772138136; x=1772742936;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=usK7E3cZDYS7cGE/BqepJs7NlC+aQOJyDhOPJjAtrQo=;
        b=GFGEvwscs0kB4fd3xMWC/GtYLgd5Ydzu0BBcwY3aRSGmqB3257OZ2aVaOHr1CgtFVJ
         VXZ41FXfENK+vmvcIJNsEEgmgvfPaSNrqmAfMaCesx/G2e/POu7SjBXs6NwxEP4uWEKk
         IhnMsEPLLvHGtDfAmCBKOqgqHWnqydIHT3AoY/IHpFkOyBP3k7htvRkr82SNKg+omAK3
         BC/Ap6NU2me4YmWSVZ14OUGR/pUxP7f4gIi6va4bkqhwiZZEKTVft882pzQlJ7wqpt29
         W7HTlqA0UMnVfCrNoCCw491M/ywLEOJixChRVIbOYVLAAtOhm6hsPutQjQ73X4lQcjoK
         xUVg==
X-Forwarded-Encrypted: i=1; AJvYcCUrtM3m2uc20acTY+HKWHgCQnzmGohfgoQYM2zMu5/FMCZ1wfq9ZRpmQSSlOWu5d+x1GRP6KffRsYc0uA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFNiESegS3X1acZ+78WltMmyb5xJZeJ8b2EUVU2IlnD9/NcgM1
	LldD4X5jByCinIw1nyS/4lwMkZolykvZLaLAQGawAsY9HsQyatroHKSK/S/fnL3OTMQJY3At5Gq
	bKWizd3okFF10WI67BCFQiANHyQIrVcmShIlHK5MgJJWNmayC8Gz31JHKc09mbO0/WQ==
X-Gm-Gg: ATEYQzxUWJTes1kEnD8aIwkkBXx+0ae2KM4NIyqhAVQTOPpbJYmubpasdcAwWDh/ANS
	EEjfpxcIL2J7oLz+KLH+BLSG7LKbTrszGU53FmpjsoqxvrDVPfXpMhDfHTZcLyzu+FuCBHTNd1o
	qIKrRGt9EKaysLanu3mbHAxWxMwjReKXtvmW6NMHWIu2FKUB3JqcPz817n5HtxAfE7CHtZ+i+/O
	W/m7p62RJ5FblIN2tOf92qHAPOZFUlk8K1lgy7mnYHDtqaQ2FBusetF126DrlDbbD/lXFp2r/rt
	N0AtabAkUKmVbtBehBoT/LlWKD45o9F/8vHh6c6MCLzAx7MewxX9Rfov/L9jUhLCADuP9IUCarG
	8JDikI1G9zPsfExjOyXF0a4ktP4IC/dXR9OM56e3lCrVkng==
X-Received: by 2002:a05:620a:28c2:b0:8c9:737e:3840 with SMTP id af79cd13be357-8cbc8e1a057mr46440985a.67.1772138136277;
        Thu, 26 Feb 2026 12:35:36 -0800 (PST)
X-Received: by 2002:a05:620a:28c2:b0:8c9:737e:3840 with SMTP id af79cd13be357-8cbc8e1a057mr46437685a.67.1772138135857;
        Thu, 26 Feb 2026 12:35:35 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b84023sm65180215e9.12.2026.02.26.12.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 12:35:35 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 21:35:25 +0100
Subject: [PATCH 2/4] memory: tegra-mc: Drop
 tegra_mc_setup_latency_allowance() return value
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-memory-simplify-v1-2-ccb94f378628@oss.qualcomm.com>
References: <20260226-memory-simplify-v1-0-ccb94f378628@oss.qualcomm.com>
In-Reply-To: <20260226-memory-simplify-v1-0-ccb94f378628@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1542;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=72llYBeMoAF6pTGEyfmImro6M/l3hLKreZuJANcyQe8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpoK6R8hJCkAW5FlTveEJHxwhE+vOMj+ICih0U8
 PWHJ0NSwv+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaaCukQAKCRDBN2bmhouD
 10IwD/9pPBmY5+Wu5iqHpyuPgQVXb8oGuv0qdsU8/dpgAomYUjkBvOu6C+Axb43nO4oxn6Y2Lbq
 ZS3Wvqkm5J+yRA041sE5ucH+Qmc1EKzv3wnCrYbNygzth2taDLXkiij5rA5aIcbXX30Ww3IcPsS
 IlpN5O/iLWkjRQnKjBq9BDpjevFkrxTuTJYPH/DZdZ7cAjX4cLYyqZ9KEphCf6NESMjkvyfsYTN
 lUn68QivF1dP3CPmvhSWQu3XlR6PtZPXSZOF6rnjm2tCwgLKmLySZMQU52L30ujiax4ot+Yu5x0
 zUJ3xQ+8WVQUsebMlgzy0p5dZHKwCYKinAaprEsa6EgRPSOaEAWLixsWoUW1noguvlWZKzokPKx
 e4lch8Lv1drR3QyqgAYldd0xJFb4cYzlW0u/BSMyI9riArTqZD1R6JVwcuQJ3xuJVvgkAA9bbsN
 xhQapyvvC3IbDdN9DmBZjnCpbhzV4wIN4hv2F7L0BfXtEuFKUMxEcRCKhphIyuTji6PCEqcRMmV
 AFV8ueNvY13/ULr7e/iCZkVOEfhSSTS0z9qPytbd0J0dHc1hvRbLnFhjj4z/Y4EEJI+LXRQpuBi
 FlKIxdzMVqhuCmSC5eNUvon9A7nj0eG6/6m5M7xYwzVURJn0ty4CBEreexfE4Xu41MnV3EWpcO4
 8Q0W55ki0TdcQSw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 0B5eQQFO490DO8sxipqbTO1Y9yJApxLD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDE4OCBTYWx0ZWRfX0+e3DeMjoHib
 cyrHFZzLD5pzPmRi3MuUOmAYX1bLRp6xS77kOUsdj7TLPDyQmCAE1Y21hwpuxYL7cBRRvYtUkjb
 5WZ6BdMuqZ7tyiS26N46qZOkUuD2QXv0tHeAnrW9G4QQmTzv/mDKP7RTGMN6bzZ4a5BDMMTnXQz
 RYfKMs1dLPDSqseIpUYVZUlM6vYYW15lBuuCAF/FEPaUumiu2pgL+qGgNQMFykXSRUhdrRZm3ri
 /SAN2SUDJs2gJMTLh6d27f4gjhlJcUgAdJkOiPu3XidDV8uS2BpL94OT6duXoxCCytGeVmAxAGl
 9FQH2XGReULoF9DK64hthu7DXcaik/1p9UHbF8uwa6ArMO1OlR1U7NSugJycgeFlnVjCcSUVZMx
 dfJG6b/7qgNwPbPig5p8xscURnnNRIhubKhV8SEvUqfMlxUQpbB8SyCPauxxY1ahfcf3JDkmaVw
 ywl10ZNoWcACxPRj3JQ==
X-Authority-Analysis: v=2.4 cv=PO8COPqC c=1 sm=1 tr=0 ts=69a0ae99 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=dQZnpKLnfvcwOwku8ckA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 0B5eQQFO490DO8sxipqbTO1Y9yJApxLD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_02,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260188

tegra_mc_setup_latency_allowance() only succeeds, thus its return value
can be dropped making code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/memory/tegra/mc.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index 6edb210287dc..c33f514fc804 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -386,7 +386,7 @@ EXPORT_SYMBOL_GPL(tegra_mc_get_emem_device_count);
     defined(CONFIG_ARCH_TEGRA_124_SOC) || \
     defined(CONFIG_ARCH_TEGRA_132_SOC) || \
     defined(CONFIG_ARCH_TEGRA_210_SOC)
-static int tegra_mc_setup_latency_allowance(struct tegra_mc *mc)
+static void tegra_mc_setup_latency_allowance(struct tegra_mc *mc)
 {
 	unsigned long long tick;
 	unsigned int i;
@@ -414,8 +414,6 @@ static int tegra_mc_setup_latency_allowance(struct tegra_mc *mc)
 
 	/* latch new values */
 	mc_writel(mc, MC_TIMING_UPDATE, MC_TIMING_CONTROL);
-
-	return 0;
 }
 
 static int load_one_timing(struct tegra_mc *mc,
@@ -517,11 +515,7 @@ int tegra30_mc_probe(struct tegra_mc *mc)
 	/* ensure that debug features are disabled */
 	mc_writel(mc, 0x00000000, MC_TIMING_CONTROL_DBG);
 
-	err = tegra_mc_setup_latency_allowance(mc);
-	if (err < 0) {
-		dev_err(mc->dev, "failed to setup latency allowance: %d\n", err);
-		return err;
-	}
+	tegra_mc_setup_latency_allowance(mc);
 
 	err = tegra_mc_setup_timings(mc);
 	if (err < 0) {

-- 
2.51.0

