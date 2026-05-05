Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D153246FE
	for <linux-tegra@vger.kernel.org>; Tue,  5 May 2026 10:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777976899; cv=none; b=uKmSsYbPLd2pK6PzrNSDL23+OsnOZhoOlZoVVK8JzYwzTHAXMbuFFBDcAEhB6n8teyvoiQdZhCASACuv+12VjVwy77cnJMDq0ky5JPjIYZXCUx2Uut3/deDHOmTCK9GtBXMPEHaEFmK4Y+AIFXu4gZ5GwO5R078WsKfb0J+7ot8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777976899; c=relaxed/simple;
	bh=XVPD+W616R8y/3NolQ5AG12OfNJrpdVU9osOz5k7zUo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PPkMgBDzGXIdJOmlOjqSryPRYRZuiGdATUhVzU/jVRZsHyT8oIX6a5NEscsl6inpt/L0XEs9WUXAoeBQi0flRZ3HfUYUIMcza0jGeX9UL49xZk7driephsaEUbnQdL7VKhgihrTOeeyRTSkH/3E2NVxaotpNHr37SSKCSfJnjx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bNvpU9mv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LSzovF1e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bNvpU9mv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LSzovF1e"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6456llPi3187611
	for <linux-tegra@vger.kernel.org>; Tue, 5 May 2026 10:28:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=U5kZwARyzl50XHwnIIgnTM4EUs3/eZVvYSC
	UYEqXM1o=; b=bNvpU9mvouLG/7dPG9Ma7uCaJFIPu/2iXuOdUgE9938x9791Y81
	Du5g4RPzNfZ3Wkg2ReINzGoTrhSFh9HGPEMZmrjC47mxJsjN4d1pgWIG3jFTfxpc
	0aA5UBk639Muu/pzr89RfUX4jeHtcnuUJGVVP4Ko2ALRJjKEeL/WsiKZMr83X2AM
	1H68bNoYHl4twkt4xCQUv3DX32dCBJ3J8WGrhuK4uhAtMH3m21eHA2pb43NXiGis
	sGQ/E+BnopElT/e2PJrfpK7gzC/Lc8bm3Yy16HfzEn+nrGN02WBWUt4iPC+E/l6c
	EigN3JXycdkUML1kMAucJwtyVCMne9WPkbQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dybkk8t9p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Tue, 05 May 2026 10:28:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fb007bc36so126851301cf.3
        for <linux-tegra@vger.kernel.org>; Tue, 05 May 2026 03:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777976896; x=1778581696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U5kZwARyzl50XHwnIIgnTM4EUs3/eZVvYSCUYEqXM1o=;
        b=LSzovF1ehgszKWANpgOp7dUP6D2U/zGscLEOEaJkhEF6pTI8WFpPw5jZpJ5iJ9cHI9
         Aer/2OO8nlLTsdEOMxJ/jJjJTNGCScGwkZd3AZVDjxS1aumYGvOxYiPah4trgWO0UO9Z
         hBaEw4+SyqklXo8094Ru4mUnt8oiraG3tqVcXDHvp3hTIn3ZTh/F507ZFWiQhKS79O5O
         jrgWwmsTirwQf81gfsm2ak0mzxBvsclppRjFFSt81WIjmryoxfXxl/r2t1i9T84qfUi1
         yfjdoCLLpafNoNCmqbtTAnB5ZeL/le6Kdyi/+/e2BZzFevs7u2L3jcCtmddCfmJf4cO4
         v7cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976896; x=1778581696;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U5kZwARyzl50XHwnIIgnTM4EUs3/eZVvYSCUYEqXM1o=;
        b=tYa4aXIfQGqsRhhkDH9zT0AsTtI/H687mkbZpMIPzBq1jbjbMbmd4r8n38vuyS28dd
         ziHPVMXVAAoNf3MA9RnF2lxloJaILEQzqBrTVCNyQUFjH1cNKhPBDQmNY3vp77QFSnaa
         fzHhqnd+yb+tseFMkCJmshxm5SvM/FO3ElToKdLLA1PQK+cdW1kKZ262NwpJPV+fts/N
         zN4+bopiB9qiIOxq3LlwwtUAAqDc4LDNR8YoP6lh2D+xz7VTp4uYAwHKaDxrFrPSyt+l
         tTGeOMKZ3RIotPzmiyjyemWmaBVGZzepfRHtUnXa1vOkBoe2XijeRtmjntSvmQzyGwuf
         jHgw==
X-Forwarded-Encrypted: i=1; AFNElJ91xtWYudOZq+D7AobVkf1i8BVzVdZqimBAKUWrTZZBgP8ULUdiHWm+e3Vz6JO3lExihcrC6Czqd658WA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3qDoufy+3N04gKB068aEmv3mECmM/sgc4B/ewda5xTlLgXTMe
	BjKs3GmXl0mg+yOwAjSVwsQZx59/H3CFi8cVL19jI0lQTz5zRE0uzP64tYDhq1QILrY7Cc31hiU
	BGAgiYz5xFSzaFUJEsIC+qftdCLuRPGxN37VHUeaYpmWneeERepuYoewNKp7+3kbn9Q==
X-Gm-Gg: AeBDies6F9u1Q8Q1U+NyuAp/9zGY9M9QaHclBqHsISKyTldMh/yoQXt8rqxhb5ZWlQL
	8nO13nC3qsRqRdTmJ4H2zxtem6bqnQqLXFmBiDGlORKtT9gPgFiOLLT0bsuood0juyf4TDPaQJ8
	5B5KmC3Qy3U5lkrrD+JdC+Kgnl3rpMCQyOg2gbxSjXc7e593g/IsH/jhkaeV3SJo0bZZL/ri4y9
	6QK0lHHBEq+I5hcI6M0HRgkWukaYg3A+SCSS52UGFwSQhcb1Z/LGelZr2Wp+dAcCJ3Kc5Z0w7YB
	wAqXn8GafQLNtlR49H6/wlfmWCSLeetG7++YJ3Ry5590FqXXWNtaTc849HOKNOFmVSNyTOyrUPb
	VgK4l25tdUbbL2Ndi19pCjwibjhPTxoHaqF/UwQPX76TgYvw=
X-Received: by 2002:a05:622a:2304:b0:50b:86f5:8fbc with SMTP id d75a77b69052e-5104c034745mr195430541cf.51.1777976895995;
        Tue, 05 May 2026 03:28:15 -0700 (PDT)
X-Received: by 2002:a05:622a:2304:b0:50b:86f5:8fbc with SMTP id d75a77b69052e-5104c034745mr195430191cf.51.1777976895389;
        Tue, 05 May 2026 03:28:15 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48af0d5a613sm140661845e9.2.2026.05.05.03.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:28:14 -0700 (PDT)
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
Subject: [PATCH 1/2] ASoC: tegra: Move MODULE_DEVICE_TABLE next to the table itself
Date: Tue,  5 May 2026 12:28:04 +0200
Message-ID: <20260505102803.183455-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4190; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=XVPD+W616R8y/3NolQ5AG12OfNJrpdVU9osOz5k7zUo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp+cYzGhX9vBzZinmPzQmxC1YRTCLeIfGMsAgSQ
 CuPZALwv+CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafnGMwAKCRDBN2bmhouD
 1yB6D/sG86we9BBj1y7ZakpR857UpaCg961KT4yS8rXNLZX8PwEQXk1kmGhbypYl5BwQLlQo/Nd
 xoKUC/YSn80w71teMhyUrBS8rCS4kZiQFg5+G9pnBwL13hf5YaOhUYecI9MZ7b57uAOl0LnMJLs
 NyxFCmCvy+kTl7UpLdBQ3JG4brPkyHR8tQWagBP2/mGabQa4KJLVNRBAmX6xbVbFBY7ZGX9R661
 qBJQxTlJHJ/QoFydP/OznA/LVedghRIwfqpdgpDNR3du+f9QhtxCMaW4R4ymNcuaH52P8i+cI5Q
 eXit2jRzGBujRnlIyuiuvaEMBtIH7Uw8i+EQVXIfKSDk9DAm/zNixUG3sJlmHtNDtd1rS08d2zX
 KEgKpyhq9s+7TJHW12o2uhBoX3FsIsweIB1fxg7JCY26o4+h8GGMacRCgCUti7pQnGCEaW3vOx1
 aksHBOQDd5PyVz4he02viSTqsh+o/bYXUZx/UsLqOeMg9gGPK04AMV/8peJQvzH9r2e+wIn9fLP
 7i2aaawOY8edXRtDDN6HOIvS02iuRfrGwvil99v7wBKtSZ3wr59gM/Yldzv1PDUveEbthbW9NCf
 OUk3j4NAHxAnEyMNnLvxq/OaZOQyPKzFKMjEAyvOUovISkjAM9UTJZqrgqqMubD4Z+pusUCb4EY mq1MJkn0mN96ntA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA5NyBTYWx0ZWRfXyjbUOfcS68EY
 QZUFsAqmmgg4V8rWd0Um/0I0Va12egxlEsdLOcuvt+8mOb/k5cFu3K09tulvAaH5mHuKSjT92rp
 H7/89EThK5YcSgc0NXxJX0QzaejzgN9nZxqhJYH/9/oG6+BdL+v4JykQB8oGlHc9Sx8Wyx9CgOI
 E14D+R4kTWxnmx/imJwMguWvxUDZGcBJbPf+gFoPEnzV7bGhkO4VIX/4AgqMfObu4jnllPqm0LH
 5BcGlhus+9Zo7e9oD6s/zW2sgLmK8EuD/XH0RxAR/vJscDa5ZzSnkefZyYZDDvaSaM68NFU6iwx
 g55H9hXYzYuDS/T4bgoBXUHRInMB9Jj09lF3q3/uXle1iEHEaOmXy/MrDWqagNHI4HRFiDUYSB8
 ezc2Ut+1lqZv2zjfX80Ub+AbnpQ6vOsuQo8hql0NsKXFI3Bz3AIa3Q1nBOcw3I0agd0JCiVvvj4
 MnCqVOB4hy8vz5Kznwg==
X-Authority-Analysis: v=2.4 cv=SPBykuvH c=1 sm=1 tr=0 ts=69f9c640 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=Ikd4Dj_1AAAA:8 a=jFLt6X_-GGHsf4P6n_8A:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: pw7p5X5dXnHLwI_ivJ-kX6Y6zpo5tima
X-Proofpoint-ORIG-GUID: pw7p5X5dXnHLwI_ivJ-kX6Y6zpo5tima
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050097

By convention MODULE_DEVICE_TABLE() immediately follows the ID table it
exports, because this is easier to read and verify.  It also makes more
sense since #ifdef for ACPI or OF could hide both of them.

Most of the privers already have this correctly placed, so adjust
the missing ones.  No functional impact.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 sound/soc/tegra/tegra20_ac97.c | 2 +-
 sound/soc/tegra/tegra20_das.c  | 2 +-
 sound/soc/tegra/tegra20_i2s.c  | 2 +-
 sound/soc/tegra/tegra30_ahub.c | 2 +-
 sound/soc/tegra/tegra30_i2s.c  | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/tegra/tegra20_ac97.c b/sound/soc/tegra/tegra20_ac97.c
index 08c58e8f3c22..0df1fc64f532 100644
--- a/sound/soc/tegra/tegra20_ac97.c
+++ b/sound/soc/tegra/tegra20_ac97.c
@@ -441,6 +441,7 @@ static const struct of_device_id tegra20_ac97_of_match[] = {
 	{ .compatible = "nvidia,tegra20-ac97", },
 	{},
 };
+MODULE_DEVICE_TABLE(of, tegra20_ac97_of_match);
 
 static struct platform_driver tegra20_ac97_driver = {
 	.driver = {
@@ -456,4 +457,3 @@ MODULE_AUTHOR("Lucas Stach");
 MODULE_DESCRIPTION("Tegra20 AC97 ASoC driver");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:" DRV_NAME);
-MODULE_DEVICE_TABLE(of, tegra20_ac97_of_match);
diff --git a/sound/soc/tegra/tegra20_das.c b/sound/soc/tegra/tegra20_das.c
index c620ab0c601f..b48cc4a6967b 100644
--- a/sound/soc/tegra/tegra20_das.c
+++ b/sound/soc/tegra/tegra20_das.c
@@ -188,6 +188,7 @@ static const struct of_device_id tegra20_das_of_match[] = {
 	{ .compatible = "nvidia,tegra20-das", },
 	{},
 };
+MODULE_DEVICE_TABLE(of, tegra20_das_of_match);
 
 static struct platform_driver tegra20_das_driver = {
 	.probe = tegra20_das_probe,
@@ -202,4 +203,3 @@ MODULE_AUTHOR("Stephen Warren <swarren@nvidia.com>");
 MODULE_DESCRIPTION("Tegra20 DAS driver");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:" DRV_NAME);
-MODULE_DEVICE_TABLE(of, tegra20_das_of_match);
diff --git a/sound/soc/tegra/tegra20_i2s.c b/sound/soc/tegra/tegra20_i2s.c
index 51df0835ce3e..d9ab210ad69a 100644
--- a/sound/soc/tegra/tegra20_i2s.c
+++ b/sound/soc/tegra/tegra20_i2s.c
@@ -485,6 +485,7 @@ static const struct of_device_id tegra20_i2s_of_match[] = {
 	{ .compatible = "nvidia,tegra20-i2s", },
 	{},
 };
+MODULE_DEVICE_TABLE(of, tegra20_i2s_of_match);
 
 static const struct dev_pm_ops tegra20_i2s_pm_ops = {
 	RUNTIME_PM_OPS(tegra20_i2s_runtime_suspend,
@@ -507,4 +508,3 @@ MODULE_AUTHOR("Stephen Warren <swarren@nvidia.com>");
 MODULE_DESCRIPTION("Tegra20 I2S ASoC driver");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:" DRV_NAME);
-MODULE_DEVICE_TABLE(of, tegra20_i2s_of_match);
diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
index 51e5ab6c276b..ee68f28852c4 100644
--- a/sound/soc/tegra/tegra30_ahub.c
+++ b/sound/soc/tegra/tegra30_ahub.c
@@ -509,6 +509,7 @@ static const struct of_device_id tegra30_ahub_of_match[] = {
 	{ .compatible = "nvidia,tegra30-ahub",  .data = &soc_data_tegra30 },
 	{},
 };
+MODULE_DEVICE_TABLE(of, tegra30_ahub_of_match);
 
 static int tegra30_ahub_probe(struct platform_device *pdev)
 {
@@ -684,4 +685,3 @@ MODULE_AUTHOR("Stephen Warren <swarren@nvidia.com>");
 MODULE_DESCRIPTION("Tegra30 AHUB driver");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:" DRV_NAME);
-MODULE_DEVICE_TABLE(of, tegra30_ahub_of_match);
diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index b121af9ef8ed..1d7b3aed51fd 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -402,6 +402,7 @@ static const struct of_device_id tegra30_i2s_of_match[] = {
 	{ .compatible = "nvidia,tegra30-i2s", .data = &tegra30_i2s_config },
 	{},
 };
+MODULE_DEVICE_TABLE(of, tegra30_i2s_of_match);
 
 static int tegra30_i2s_platform_probe(struct platform_device *pdev)
 {
@@ -567,4 +568,3 @@ MODULE_AUTHOR("Stephen Warren <swarren@nvidia.com>");
 MODULE_DESCRIPTION("Tegra30 I2S ASoC driver");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:" DRV_NAME);
-MODULE_DEVICE_TABLE(of, tegra30_i2s_of_match);
-- 
2.51.0

