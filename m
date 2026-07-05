Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753A73A380F
	for <linux-tegra@vger.kernel.org>; Sun,  5 Jul 2026 19:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280456; cv=none; b=JNqnvio6kWIG9qXKJmwVhtc0WN0G6RUgAnzZAnWdm4P9CVV2MBrXhF1EDPTLN3wL7EZCPAD1YdRm08A1hTQBZylbIVtGKfCKI3U6z7vSdyIG+/++eo97oQBeg/14U+bfYYEUcSPQMdotPkrhormOGzZTpflY44fNR1G9ELFXtFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280456; c=relaxed/simple;
	bh=MBCzqv0j+WYMFcF4TKWqHla8911PrHE8zUSaVvk5eeg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RChDB/t1Km0cVZoq4U0SclZ7NTrKnvMZtyGMg1Zo1nFbA1X7d5JMgGpfT7L3ZzcjMetDjEHYAPZzwG0JWy6WsmUh6Vu5mZ334xL8Bk4YRvN3tIXMy/+yzH+f0MoSTXKEJoo3+cOw0RdPoDdW792HMEwJZKPyAM+dMQQZdoJUXzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FtgGyEI1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C7qviGmi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FtgGyEI1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C7qviGmi"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665IeDQ42386252
	for <linux-tegra@vger.kernel.org>; Sun, 5 Jul 2026 19:40:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hN6fEXJ0a4t
	H3MRwTjmjwBZxQ0G8Nv14FZEH67BaPoE=; b=FtgGyEI14vKK9OqT430xUfOmGLF
	J5bdRwGnYlPPVp42isHulDlrVXRumzlXOnWaKAvEqFlOMf4WK0t/UVb0tPS4H/wS
	PtxzMba7S17DNMo9ExtOcv+rJsW93dNgj/CIpMpvyCzFyneGj05+u1GK8iECoqyK
	WM1mPqrqXajrrVrH8/J9pdvK2VoDaXNIt2t74egeo5x9BAqNhYqqiB5QdwrFv+QG
	jv/TZ5nh6enGJUvvqqxYx00YdVL+37mb/7PnZAc+8iS+maLp8PJIHST5NiO92D5M
	ugD1/b8iFPnLJM/Dv5JgaqSUO0Jj7Rg0n1nlkl2C0BeSOL69BMELnoL/dgw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qhnkmc5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Sun, 05 Jul 2026 19:40:53 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88aab7c1fcso3610377a12.3
        for <linux-tegra@vger.kernel.org>; Sun, 05 Jul 2026 12:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280452; x=1783885252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hN6fEXJ0a4tH3MRwTjmjwBZxQ0G8Nv14FZEH67BaPoE=;
        b=C7qviGmiEltSC4Cgo/wTu4JmZRlyDLu6fX3iQA53mNc9iDjmghT1N8l21Vjd3W3d0d
         u3qKBwuJlUN4iJrZaWa24RZmiqC67NkuYHYAJowwe1e7cNhoWPS8/4L86bkfm68mliYV
         N1JEtlvE1fnzHaWo1S86ulQOjbXbO54N9ELppItNjUiIXP1ES1nNhAOsETmzGjAY5OOZ
         /sfd4yLYcFZ6SwDT7H3gXits+7AHqpYNRSEBCTXDGBmHoDxKSsR5+paPPENNl1jt/y3n
         ne1cG9aAnDIu2Nl/xPH6S2xnjZSkb5t8Zeb7hhxVk5DZiz4FdgrdP3yps8brPftifkT/
         ConQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280452; x=1783885252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hN6fEXJ0a4tH3MRwTjmjwBZxQ0G8Nv14FZEH67BaPoE=;
        b=Pl1UBZxZOGRMLONflsR9atx0HQS0em98uL+njacxCYF+Q+dh9u5+ViL+kE9lI/KCj/
         GOk2v7W38b1Ogk1zEt5a8zTf7V0U6irhiBWR1jSHmjRZG84eL8plXBskLXogUSd5LYKH
         MYNclaDrXkqL+sKyspcQf6Tm6YBGUHHUFQ8ALE5HpEIcdvlHMBfwLNSp6ySCgeq/8C5M
         RFONWZYjRAoggSVNdd9CX0UtQRqsMIMN2bIY5fnz0m7VitrUGJQDaJNCtFqIzAczonHW
         YyK77tJ8OpPgwywVRCPyaapcCxxncp7/KJOFqQm7uvs+8QVFssqUE644wfVg9Jue+gob
         02sA==
X-Forwarded-Encrypted: i=1; AHgh+RrBKWbWwJEC66Rov7LaLObsHEbEiMkvtqOSM9KYxVWNFDh0WbfPq78lc42DNP1ICIDwbdyD2wdVgLekiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzY2JzExQ6BmJx+DBqsygUPIiVIGgN8rbQzVGrgKmR4B2Q5k96R
	T0ze+MPwFn4mOs+XEBASsJUoyJJ+YgL2qLaOIcVcE/uLC8B2ZrN96YfaXzMTAi7AhlJKaD3lcTp
	LvwehdrlzgIxsqMcObK0Xl/ffPd8utnPHqU3upKeWa7t7dsbb643ut02Ht18r8a3ekg==
X-Gm-Gg: AfdE7ck8kQ3cFJqsUllxUDfX+gdX+xo8FYM+LB41JZkIIyCDX3GQvXHslT/negHTCMT
	oE3GI5860gFPRswz9F8e1ppMnzTvonXLoBxgAuF2qQA1DdkiVWX8hc0LyZ2ByfqCDRfxw6XM71j
	uf8ynaoOWyyPb6S4UzFRSQtO92JsoHBA2oRALvAPM4aTkfl/GlckVgSp+fz4p6qR7tamYV8jGZS
	XwUwnfBEFCJ/wIl6lgtkIZXuZogSwzXNdgP5xf9kEBiuADMy4l4fvobDGNoGE4f9KXwSuM+ohf/
	V8x7xXzBB0igo86kz2Um57YmvBVEO6ptbn/tHHPu5bgYp5c1se9SuGmSreZSUWWy1PcGGg3Bwjp
	c+uL3Rv4uEl5jjdn8I7XCml47N0KXfyn9vvqTag==
X-Received: by 2002:a05:6300:670a:b0:3b4:9171:2573 with SMTP id adf61e73a8af0-3c03e4218c2mr7386828637.37.1783280452364;
        Sun, 05 Jul 2026 12:40:52 -0700 (PDT)
X-Received: by 2002:a05:6300:670a:b0:3b4:9171:2573 with SMTP id adf61e73a8af0-3c03e4218c2mr7386810637.37.1783280451853;
        Sun, 05 Jul 2026 12:40:51 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:40:51 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, sound-open-firmware@alsa-project.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 36/42] ASoC: mediatek: mt8188: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:12 +0530
Message-ID: <20260705194019.2565498-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX1VPfnyPHbNIw
 Ftg9dfdk2tTBv1802K4/Ld5/7ozOq8Gcx6Xb5JIHO6NOZhNVNbwNny3IFnK69Hsw62/b1rZTNNe
 zLVwcz+jtJHm1lVKqArjDUT4wKPLGiw=
X-Proofpoint-ORIG-GUID: mqO35de5MLvavSRlG1fFXF71XghsTjDK
X-Authority-Analysis: v=2.4 cv=J+yaKgnS c=1 sm=1 tr=0 ts=6a4ab345 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=16fIdGUa3qEwhQSg-dQA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX2R+b29hxq4av
 WxW3TuYpDe2yfq4bT/6V5nGJhkxBCoQWRJRv4RFz0flCDI9ngHJtm6m+yuBvqGrt8CXNkNxbpx3
 eeTcXk3n2j70vfHwxQj/9f/fYqLhChuxIIX8xK5cHtzeDkROPwQB14+EZxQk/QQcZKSwEoPjX1G
 8nty0PWJoLuNmJDDo3/ThLEugAG3BXwC8VAaCNazVwAVYBBIKH5oGaj0xTb63NlKpTgclwcpiD2
 D3I6aefsFUYFLP5AzIgVbnC4YgoGxz581ABGnMSY8I4aUTTzith/yj2Cp8a4JIa5LkK3bXAkhcT
 M/IVhIGG8OSYu9VELdys33AsOXU2+ZriXUdIVnWd2hck34F2bl2UIjf/E+U5KTcLFO9U0wvPBzv
 MYKfhIcgDGtNBlxg7o5rQrwmkTFP22q7ta1ayV4C2KSLLq4TWdmVfmZpT5rLkH2Dh9xG6h+e0AR
 n5yw531Omdvmx8pIXow==
X-Proofpoint-GUID: mqO35de5MLvavSRlG1fFXF71XghsTjDK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
index 7b1f5d05f4d6..ab4ce5e86b9d 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
@@ -3199,7 +3199,7 @@ static int mt8188_afe_pcm_dev_probe(struct platform_device *pdev)
 	struct regmap *infra_ao;
 	int i, irq_id, ret;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret)
 		dev_dbg(dev, "failed to assign memory region: %d\n", ret);
 
-- 
2.53.0

