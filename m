Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072FD336884
	for <linux-tegra@vger.kernel.org>; Tue,  5 May 2026 10:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777976902; cv=none; b=ND4vLwR5oNlLYIqj3GlBj6MIOlU/j054H4eK+Qflwnjwyp7JXBcnK5lCJ40rmJakPpb7gj8MGz8ByO9PGslMgA9+ligC8wJ2CQZuK3bIFqcOCRWXuLD9hjscTwqYLQRazaNtPGlZDU49wh8qM8CRBOYsIQnl75at8fDnyxUGH10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777976902; c=relaxed/simple;
	bh=yrkwkHJYfYh4Qd/e6Jm0X0iKhU1/cDPw/TDKkqjnpUg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T2SDRqfliUV+7VF1iGk6hSc8YqPgmiLLLlqlgFbXcpW0p9AT8w5kJJcj4bBi0pU8Qk/+Qfhd/n9GjqnUs+AkbAWyqHjqdVFEHFm71fTzVDlSJqrQGSCWwIjOYHKduSWYAfQYxCI/xLK0f79gz5fdZCpb0f3OpgJlRJ0nf06lSKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E0a6wCbd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T8obVCXS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E0a6wCbd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T8obVCXS"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645A4Oxb3741190
	for <linux-tegra@vger.kernel.org>; Tue, 5 May 2026 10:28:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=F0yHkPJ2+So
	SmvwYpxfgmYiW9SG2320qnH+LsMaHO78=; b=E0a6wCbdIjr2WquOQ71GnfL9AVE
	vrQq1bGSI4eCKxCxPPcQAbREs38xzniMOeeNXAZNYR/VyIpYStzgQDR4Vvx2QwAT
	xGXg6V6tcJcwNLSbaUlj3acAP8hRCOoODvS86/LVmPmc7koBnihm63vcfk/GSp1M
	V+JlskZ2ekidRagRq6IMG5GeOyQ1h9TO3IWLKfEM+ZY+VkND2C1iGXBqMDP6SXIs
	QZB2RIRTwAs8Ve6n36KEnFfNz+8fF8YhVOzqPMmlqW96UjMKVzI7iwJc7NVSFfbK
	sr/YXWfKCIBXLu/XeDj9affZRjwBKp5czWgg1bliLamNb0nBs7IJaFyzbCQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyefq83fy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Tue, 05 May 2026 10:28:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d9a6a853bso122883601cf.0
        for <linux-tegra@vger.kernel.org>; Tue, 05 May 2026 03:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777976899; x=1778581699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F0yHkPJ2+SoSmvwYpxfgmYiW9SG2320qnH+LsMaHO78=;
        b=T8obVCXSWeVnoBfeZ0qzKezABN67oJcP/zib9kEE5gBl/OwxXJJZbzCcKryMhY+I+Z
         f/X5Y/8D0s/LSfCnESP10tiHEP/nYJreBkVsdI+52WSkjSwJwgyshJ3z11MWlejLebQw
         OG+alb2QD8xDVqNno6VE9FEq5Gq81DaV60xBtflvYxbZDg6KrT04RE9H7R2kOzQYKpEs
         ls5c+uIWANgenUauDaLEugYG5P/LI1r1yiAxTVyd0OiyhdL2vcddQnNHEpDpbXmAF18n
         XlHiDL+BnIdRIvd3I8zVn9KhFgIBLUgEM5MdGQUNdXezbPvyA12oT58fam/hCAclctm1
         8vDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976899; x=1778581699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F0yHkPJ2+SoSmvwYpxfgmYiW9SG2320qnH+LsMaHO78=;
        b=DJNz5Lg1W9QFV8tiyAquOBlR/yt7YKP3PWy+rAqcvKZgh75Y4khqgIgMA0uP54Cqtb
         4nVEXbr6xnc0mVg3lUJeXJDGQQOBUb14rmufCKdw8o8yDfOfyU7sEwMg9smq4jwQupF1
         E6YrNYKou4nXYjpLFHg0SKuBt8W2oVErrUoVbQGSMY2OBWmHnVfALHtcFdPmTuCG3jNj
         dNUW2tDCuCIYPTOw+ygmMpw4tuyw3eNjH5auZX23GUXc0bKVJa/8w9qTkBD5eOCQIDiM
         6ZJUyml4FAJBRebuiSoaSL7VCIRoBZTRpSv3O7ISi8xV439yJei0fRS+Hg5ZTO1UAtYk
         Avzw==
X-Forwarded-Encrypted: i=1; AFNElJ8XboI2kBIaV4aRom2k44gqi00D5f9wx5sdmVyubN3M4DzGCn1WXRcePOmPjb6Qut71WMDy1Yz6WtHnMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlbvJ+SuDX0pksbYSWoPVaWI774YP/tZA73p4OHnB6Wra11adH
	dSoLCuo1hadoIllRUkbqmGKzCI0F7+2vlA/aocOjl/P+pj8kTy8pl2cMnC16UPlrkvMRvLjIEW+
	fAn1IZ73jWqyZlx5SVSjt3qfAKM8c+3bS2AcFRAXnBsL7/4Cg+x71n32XW5i+3dUPJA==
X-Gm-Gg: AeBDieufKRb6QbSKWWgPDqOy9JOsh0LC8acBn/x4WCQVHuP3WJSE/4mNnf/dk8tPnci
	KtzeZ3aUpaxwVQtR2A5wIqiiakDrFTuGizmCHWEO0EvDWkPlYqokUJSNRrQ/oE9Jii17Nlr0ScL
	nAZeYnoTPfuDFiJ6OuwMiE5GG/GM00TSel1LeyZhdgymdwf4jA2GiyEi2Z2m/wT7Pofj+/sNNa7
	W5v3AoRe7CTxB4iEwuI9WqfPT9eE55+d5mEYppp+XBwMm4zpx1tVB8QPT4Jvl2Ads52lqIZxdCA
	KzpSnuE8iVx5y6HHdZKU2cESyEve/xj82ML4ImTPxnckPc3ZRnjS/5PIOKxpeRUhs6m7YDsSIF0
	rT6K4rgGO8Or5rYvxH2F/cnlr4hZtDncdKOoWNtgTbpEYeCw=
X-Received: by 2002:ac8:5ac8:0:b0:50d:9b07:9c46 with SMTP id d75a77b69052e-5104bef2b99mr203902101cf.33.1777976899477;
        Tue, 05 May 2026 03:28:19 -0700 (PDT)
X-Received: by 2002:ac8:5ac8:0:b0:50d:9b07:9c46 with SMTP id d75a77b69052e-5104bef2b99mr203901151cf.33.1777976897898;
        Tue, 05 May 2026 03:28:17 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48af0d5a613sm140661845e9.2.2026.05.05.03.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:28:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>, linux-sound@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] ASoC: rockchip: Move MODULE_DEVICE_TABLE next to the table itself
Date: Tue,  5 May 2026 12:28:05 +0200
Message-ID: <20260505102803.183455-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260505102803.183455-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260505102803.183455-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2939; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=yrkwkHJYfYh4Qd/e6Jm0X0iKhU1/cDPw/TDKkqjnpUg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp+cY01NKoMVb6JQS8/2Bllf0JN0WwvF2MUfjEC
 At0QVkx3JyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafnGNAAKCRDBN2bmhouD
 1xOeD/9pigHD500nSIQ/Gkwl0OOWr4qe4DQ2RsBsMwqJKZMddixBg2k1WVZCFvImq/1ykutfGWB
 zvKUxottxASvb05RWbhFezZvPiZ92vw8G8/QqtVFsfo8FmqjaBw9bqCJfBO7Byw73eoAi0+A6HQ
 3ROLUywFOoHYJ2CA/pYG7XN/JSvl16zIsfzXJPiKPp0On/y7g7imf2dCVXDLpH3NhdO7ZCSdYDm
 NuizWjY58Tds3uN3/R9dXMVcQAIZbjfLU5+GGg/fzwXsqzd9zIL9MGFTvwpSYjJKNwrHLeAFK/O
 XvQQOtS1mcTMidOoxhd1JsKVdYPmpe9CU3L15djpmERNX3JkgSnrW4C9BjXujwXSZgU9SgDPSy0
 vK8b50I22tU2NXSpESXtWXIUT1glBCCBGa23RcyeP/ZNl+9uDuJufX4Fl943V2ncZgpEhna9Ruk
 jSGMjbFlJvRBY+bJtylBzTZMyRTp4xSEwVfVeiyjSbRrRQDwFYHvoSMgspGUT2hndhjcDDuUHqP
 RGVuxiGngyaiTFx0TlZA5tGvdiZCgYe10cx12PG8UkKANVHLslC5HU0JSnkfVkiyr8eFhDhUonH
 llndMTKQU64VP50PXa4v8GD9IWPCHcDMaomes9je1XMCTH5c3VQsoE1H6hDEoijVxc8l8WOf+IW jV5EH8oLlHvC8tg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA5NyBTYWx0ZWRfXzP9wALJqfU9s
 wH3lKizUQTyH1dFQGm0EaV1vvOcjGxGxr2M0tlk368b8iO+R6LvqRCGmzZVApPDmuKGaIJuyOpL
 owT0+sVKSvUrvpKiHSOxFxSY5mQNoed3gWjgkQVeiQSOYXA8u1vHbm0mTItq4r87XSOpu+3zXC8
 FcDjEoc2vWkICa4H5RzOgc1ov/ztSrqACnCTKsIsJIUH+fD7y8vbRxx+R5xcpJtD7zb8t7sX5XE
 h2p6EyMJbqZuqDllrQtNwPTjKhQH+I8Wj9j8SwC/Eeopzoi3GvTtT7+uImZQpcxU886n9Yw2P/n
 pCE7cJ/wGujdWjb9I8zdcTi0dQA1Uyow4S2drQ8BDbPd+bfBYFboIni/7/rCnJon7bcH9sxmHCy
 THQMl4W/B6wYa1FMImvO9yI47Cz9z/1ljUM6YxBexKykZCfBUswPEqe3aEHAjLGZZZAQnZVymgJ
 0XES8C8bRECAJfoo1NQ==
X-Proofpoint-ORIG-GUID: 4AoPv7DopUMRrupqh-9w5bc2piCQAu-A
X-Proofpoint-GUID: 4AoPv7DopUMRrupqh-9w5bc2piCQAu-A
X-Authority-Analysis: v=2.4 cv=edoNubEH c=1 sm=1 tr=0 ts=69f9c644 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=s8YR1HE3AAAA:8 a=UPwjdVLwzqKTMXskr54A:9 a=a_PwQJl-kcHnX1M80qC6:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050097

By convention MODULE_DEVICE_TABLE() immediately follows the ID table it
exports, because this is easier to read and verify.  It also makes more
sense since #ifdef for ACPI or OF could hide both of them.

Most of the privers already have this correctly placed, so adjust
the missing ones.  No functional impact.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 sound/soc/rockchip/rk3399_gru_sound.c | 2 +-
 sound/soc/rockchip/rockchip_i2s.c     | 2 +-
 sound/soc/rockchip/rockchip_i2s_tdm.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/rockchip/rk3399_gru_sound.c b/sound/soc/rockchip/rk3399_gru_sound.c
index c8137e8883c4..b80acb221d24 100644
--- a/sound/soc/rockchip/rk3399_gru_sound.c
+++ b/sound/soc/rockchip/rk3399_gru_sound.c
@@ -606,6 +606,7 @@ static const struct of_device_id rockchip_sound_of_match[] = {
 	{ .compatible = "rockchip,rk3399-gru-sound", },
 	{},
 };
+MODULE_DEVICE_TABLE(of, rockchip_sound_of_match);
 
 static struct platform_driver rockchip_sound_driver = {
 	.probe = rockchip_sound_probe,
@@ -624,4 +625,3 @@ MODULE_AUTHOR("Xing Zheng <zhengxing@rock-chips.com>");
 MODULE_DESCRIPTION("Rockchip ASoC Machine Driver");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:" DRV_NAME);
-MODULE_DEVICE_TABLE(of, rockchip_sound_of_match);
diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index 0a0a95b4f520..49ff86b35ef1 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -662,6 +662,7 @@ static const struct of_device_id rockchip_i2s_match[] __maybe_unused = {
 	{ .compatible = "rockchip,rv1126-i2s", },
 	{},
 };
+MODULE_DEVICE_TABLE(of, rockchip_i2s_match);
 
 static int rockchip_i2s_init_dai(struct rk_i2s_dev *i2s, struct resource *res,
 				 struct snd_soc_dai_driver **dp)
@@ -878,4 +879,3 @@ MODULE_DESCRIPTION("ROCKCHIP IIS ASoC Interface");
 MODULE_AUTHOR("jianqun <jay.xu@rock-chips.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:" DRV_NAME);
-MODULE_DEVICE_TABLE(of, rockchip_i2s_match);
diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
index fc52149ed6ae..28fa253a5187 100644
--- a/sound/soc/rockchip/rockchip_i2s_tdm.c
+++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
@@ -1040,6 +1040,7 @@ static const struct of_device_id rockchip_i2s_tdm_match[] = {
 	{ .compatible = "rockchip,rv1126-i2s-tdm", .data = &rv1126_i2s_soc_data },
 	{},
 };
+MODULE_DEVICE_TABLE(of, rockchip_i2s_tdm_match);
 
 static const struct snd_soc_dai_driver i2s_tdm_dai = {
 	.ops = &rockchip_i2s_tdm_dai_ops,
@@ -1442,4 +1443,3 @@ MODULE_DESCRIPTION("ROCKCHIP I2S/TDM ASoC Interface");
 MODULE_AUTHOR("Sugar Zhang <sugar.zhang@rock-chips.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:" DRV_NAME);
-MODULE_DEVICE_TABLE(of, rockchip_i2s_tdm_match);
-- 
2.51.0

