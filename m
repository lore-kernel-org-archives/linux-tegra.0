Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCFD4657E3
	for <linux-tegra@vger.kernel.org>; Thu, 26 Feb 2026 20:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772138141; cv=none; b=DVOSReg8fKz/NsM0gPkvY/7qf6elsbX2QuGiCu/YGhIozpYMJ6vJNrbNOLpz8T9jKB5/5hJiFaoTEnA0df3uNWRrQr5ahs/EaV9rhK03HFAsO18qm5/VeFVdVrVvwwnUX2F2lTCUW1ZbMWl5piBxcVm8PfScos15TIt5Ju8ovNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772138141; c=relaxed/simple;
	bh=wI8N1Hv7LXlOJ28LYx20pimVn81c6bgfbNzc7Mu6M2k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U0YYdvA3lGfMpNwKoNe2tIT761X7U4GM/DUWIBlH5jBiHeX3JJFb7FzjpmEbYQ3Z7OysQXKf/PVjr91qD7hgRlwuh1t/6Vevm8TmrA+03QcR0kJb/HDuesh4c0nQocRpJ/YpYdHaAaUovA4JSLZmW8qXIIbSEsqeWPiv2GKdzZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C7xW66dQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZqQTmhZf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C7xW66dQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZqQTmhZf"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QHEhYO1258253
	for <linux-tegra@vger.kernel.org>; Thu, 26 Feb 2026 20:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A15zvfoArQxLgmElGooT5MY3XQCBo7OYnzqWjKul5ec=; b=C7xW66dQZLZYc/kp
	Zbf1lmZtHq281c8hqua1WW4vL8MgR/zIHt2tgbtJv3NGd//z6myHkciaEIqkYXcu
	9B/xE57k+yrqAzfakViRZnIzsbUT58HhqGYW6YVKhF3MUaSvkUKqItPGyfPHT8QB
	KpR/iiq7SYCj6DjV1a0hamSUdUIkDtrZ1KY5QujMJMXUIICB7GzrInrieQF62znD
	qiKu3IjajbaZM/a8eScFeREyXDyiBRbYN1Mg0MReqbodGQ4sExTEOQuxpuamFaik
	ObckUSfkhSsKOi5fXPttEeVUbS2JCTSOR11+Fa05ym+/jucePQtjQjoKBNSyHKCi
	XiSgLw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjc0gbrcf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Thu, 26 Feb 2026 20:35:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb0595def4so1145101885a.0
        for <linux-tegra@vger.kernel.org>; Thu, 26 Feb 2026 12:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772138138; x=1772742938; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A15zvfoArQxLgmElGooT5MY3XQCBo7OYnzqWjKul5ec=;
        b=ZqQTmhZfpVgWavlrg9kmJHUBPRP4BEd+zVAiEnF3w5DBHlgJhY4f/n1szJvlke6Yod
         rUpoJNZ+s64oYlVCzUZOlz4Ryy8mGa1pMakJ69p4bS4SvLLQO0cuTrpTcLLgvz36Mc3y
         PHUO2iBAFDPhnTJ8wMK1igc0o8cj7EdWuxNtPhHlI3KZ9KpzDldqmW7jX0Sw6wszCNb1
         v2+A3eODXTETdrxcPyVs1i3UJN0ebIO1uHHVojma6omCvBWMk5BX7fqL/8DW2j36+uUt
         hmcd0YMS29AC/LO9XX0o8OFfAJzEOPTjIbkrMYBHle8EqtYQ7Jmx2QkzL1vA+dPRuYUL
         m6Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772138138; x=1772742938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A15zvfoArQxLgmElGooT5MY3XQCBo7OYnzqWjKul5ec=;
        b=JdnLN8b97Q3vTETq9sDbgT0/87qHI8L9EkAVHKM9DYqi9PuUQmdAkq3Xk4dkRbcrPz
         9WO8MjcHJNxfInzWbXv07l66GAkO0THtDlxajmseDrC6zXNrBAhgpsQ/SahA/IPJyPT9
         5XO2I5rywGnXwHcjPvVAgLsu7SCr+lt15dXZFIsTXVa4UGlVwGxGSjanH3TaSahrtLWa
         HGP4Kj6I88HjZ/MHMEjM4RGNCxpYNMJwPa3T3/9NlB2wojH/kAf64HDNwer0B2r/0SJm
         2lqdgNYM5P5RVwbriyTuBIiN69aW0DNFMpQ8qeuwN7NZyBotgx2oWwmO3FqUegML14NB
         BDwA==
X-Forwarded-Encrypted: i=1; AJvYcCWb48qLd8ODznoXc4joINFxZEPMKKSJhi04N93OhHbq6zIk1mOIcZEcXMs16K7zDddKCgMoR/nm9T/QEA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb6/Hv3SccHUgaiQaBNXvwk1jXag9XY0BopRaL6M4voWvzb7L8
	wRKs3hUOiNGHO5orrWzdcJmsGHpH0NSdmqn2srE97MFTvJdKcBYi6kLuCqCDiaWd56IBnl6uQlc
	/fUw0odRXwOjtnLvhi56FJgj88at+v0mybrTJVS86fNrA5TOvlQf6rMWpsmJJeLE0LA==
X-Gm-Gg: ATEYQzxrgltxfVwq9dacxGMCmTEe06E2ASjW2bZ6wxvT6F1F2Z+oC1nMvixIyIgHW46
	Hiyxva+p3wQ/WYMc9WC4HcBG1wCzJD5sRLkI7TkEpxrOPhVjR+VUaknMfxqSRmdg7Xlwm7396qW
	D6RpZ+bYZAyVD3pYS3/1QxtDhukr8H5nG3ylprTmDeh6Xytm01B246uQgioU65ADEhVjxrwCr/u
	lpBTACqp9jOozKx/9ZxPxW6Qdm6PL/l899xXJVB07d94GwjmVlMXYfVK+0wPYD3vfXFa+Jrwssq
	VL2yYptvpaOC2+ewJ1NgIeR5pj0Zl6VbQrbScS+k0UQ0Z7GQ1N2pL9i6u5F9cP/OSgOvlKZJvvE
	wZGjBOvwfyWjsc6LDdT3+AQXa8aiRAE06yCwV2QKXeXJryA==
X-Received: by 2002:a05:620a:258e:b0:8c7:e8c1:ea05 with SMTP id af79cd13be357-8cbbf352299mr195591085a.7.1772138137999;
        Thu, 26 Feb 2026 12:35:37 -0800 (PST)
X-Received: by 2002:a05:620a:258e:b0:8c7:e8c1:ea05 with SMTP id af79cd13be357-8cbbf352299mr195587885a.7.1772138137571;
        Thu, 26 Feb 2026 12:35:37 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b84023sm65180215e9.12.2026.02.26.12.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 12:35:36 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 21:35:26 +0100
Subject: [PATCH 3/4] memory: tegra-mc: Simplify printing PTR_ERR with
 dev_err_probe
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-memory-simplify-v1-3-ccb94f378628@oss.qualcomm.com>
References: <20260226-memory-simplify-v1-0-ccb94f378628@oss.qualcomm.com>
In-Reply-To: <20260226-memory-simplify-v1-0-ccb94f378628@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1348;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=wI8N1Hv7LXlOJ28LYx20pimVn81c6bgfbNzc7Mu6M2k=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpoK6StMYbZCuasFeI+l0KVe31IekhZlN8W3X7o
 pdIuHUsYx6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaaCukgAKCRDBN2bmhouD
 18cCD/4hHsRAYAlXl5pAi9+qbzaKcW6rXQc+CH6GyKklBKUnIdfMQi4pQlGslRAz2EgqQzC+AHk
 uF1KtY38XVS5RiI0FANPlCT3P7VB5CxtwMcDmZAbpWeN5AUehSH2YrnNExaFBbbmwKJDpHMlNOz
 T7FVI5b3ALwyycVzkMXdCzVKjkEfQPLE1R/nKSyLlb3DTc5umMtI2quGglPmixc891X94dipmD4
 u4WCF41asqtHHdt7s0LKkKbqr3Sciw+LEs/F2oGYy1QeRLwZwhwQuNHk8aHLBcMtWfnLGh2eNe/
 sKrKvG1Dw1W6aqInc0xZbL2TIBtg7xYqDVdRs5V2JHhEnkxpRY0LMWX80QB/bNv88Wx/3BqvXdV
 +WPM+P/aPMGprYgeERKwwIOYWJKBf5V4W4+9L2x3YxEYaDNMYZVm3NLlR8ueBlRjuSpueyTTzBd
 MSrTWAwd32oBIE5FqgzicTBQW29huO2yKQoWjnJPK3ZJhG8tU8csCFGjKJDAzKRk+DU78pTD1t1
 ZTuEhWYVN0+6fYmSYP5t//QGKnrLNjdLlxVXIn/avxeNmtF+U4mdurHyK+C7TMCsE7vUePwAnb1
 Ixc0qXt5y5JpvvTYAPo8O5PPbwRNGhc8Rye6PL/9oUbSk+dPCFlXehW65ELXHIMUxIglxR8JgaO
 guDJZ4RlW8yu1oQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=XI49iAhE c=1 sm=1 tr=0 ts=69a0ae9b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=HCxIvfKbU4BEwnpgZywA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDE4OCBTYWx0ZWRfXwFDosuP3bgQf
 pLlWswtIc8YNhWJUyy0uDkGMqafFYA5pe3u59mSEOuxhQYo2SHK0834lwaWT2dXInwJZcyPYlV2
 FDHK9KYMwR+os1bPx/wY27AiWIY6P6aNQ/FGrWcr0L7wth0/Im6oRHuss5VBQdwiw2Sfe1gtfD2
 Gi0zqsh4Jl0t92iI45Gs7cI3ITdm75B2l69nNmLmckz9MQyeU3qFaGcxC1/D0254Y3XZwVPlAj4
 DihQSRENyQPeVN0z3pr+j215z7NXWAkrkdsNt7AEpXv5JNHdagSIwKAh4SjyDt4Sfc4SWSkoh+s
 A1ObLSOmx2pBnsXcnxFScDLIdOlo2HWBadbXGCOmXGeCAAKvkFRfjsoNV1//QWaJmWvmwgLdx9J
 MU8RHAy8hh30N+BH5nx92OLqtSnNSquWxDBMRs6yqhCFkfEOxkIyDYJq/DmdXpsmOtwenbuZncz
 ErguMYGj1MtjrbJZZHg==
X-Proofpoint-ORIG-GUID: hLReceVF3SAoKfIyQXDeA5TllzooF0-t
X-Proofpoint-GUID: hLReceVF3SAoKfIyQXDeA5TllzooF0-t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_02,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260188

Use dev_err_probe() to simplify the code and fix Coccinelle warning:

  tegra/mc.c:513:52-59: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/memory/tegra/mc.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index c33f514fc804..1dc516a5be14 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -507,10 +507,9 @@ int tegra30_mc_probe(struct tegra_mc *mc)
 	int err;
 
 	mc->clk = devm_clk_get_optional(mc->dev, "mc");
-	if (IS_ERR(mc->clk)) {
-		dev_err(mc->dev, "failed to get MC clock: %ld\n", PTR_ERR(mc->clk));
-		return PTR_ERR(mc->clk);
-	}
+	if (IS_ERR(mc->clk))
+		return dev_err_probe(mc->dev, PTR_ERR(mc->clk),
+				     "failed to get MC clock\n");
 
 	/* ensure that debug features are disabled */
 	mc_writel(mc, 0x00000000, MC_TIMING_CONTROL_DBG);
@@ -518,10 +517,8 @@ int tegra30_mc_probe(struct tegra_mc *mc)
 	tegra_mc_setup_latency_allowance(mc);
 
 	err = tegra_mc_setup_timings(mc);
-	if (err < 0) {
-		dev_err(mc->dev, "failed to setup timings: %d\n", err);
-		return err;
-	}
+	if (err < 0)
+		return dev_err_probe(mc->dev, err, "failed to setup timings\n");
 
 	return 0;
 }

-- 
2.51.0

