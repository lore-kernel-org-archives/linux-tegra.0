Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3493A4F36
	for <linux-tegra@vger.kernel.org>; Sun,  5 Jul 2026 19:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280475; cv=none; b=EvzQhZZxW1vkZbcPWu6q1/Eho1lF8gys59HB/R5qZAuzarzaLg3GAKyN4j9sYf8H/Z2Px0craE5sJyNmAN9Dl3kAS2VF146wUq6dTMIICANpwhJ+zT1fqVjgIXw9rTNm/ujKHlNr8PgtJ7A63oUAfCKuGHeYmLwboyaSGZwnqSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280475; c=relaxed/simple;
	bh=c84j3cN4itWiI6muK0J93G40mdQrPz9ghprJZVQe+x4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TwTC0xlhOgQQr7UyvxbfsXgr1/eJRV7xxSLq3a4wdcAIDtVix3kvMu+4rmrIP5CO2Z7I8vqjFpMKleD23ieX7CZI0jaIviWX4ojnQ2ICKHNd0ZHktce1CC70zjAegYLpyTPGwK/h8Fy8s82zWtq3Ql7T2MlA7ADWuHI5VQfa+RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ct1DBvNs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XLh2ed37; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ct1DBvNs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XLh2ed37"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665HiqrA2192013
	for <linux-tegra@vger.kernel.org>; Sun, 5 Jul 2026 19:41:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SRfBxbqW9Wo
	vwhSYimxYWcInLCKkOQsnOkiyjjR+6kI=; b=Ct1DBvNsXtjXHhkOELxVhlpg6H2
	368Ld+75DkSj9KAbDdr+dccgJj5ELmVwXoWTwLRHuHRoMLG38NZA0i/dYf4N1Wwc
	GWDVGhaX3gkzJ/KUCjenkhf61SCvn7auxPGY1ifqGqoeJGMpHLM7TwdqAnd1zKxe
	XDmUTqO6867KN13WAC/hp1ycv49MufxZfENMTnh8m78LYIQT7d23L1S4XHIN449b
	smnhxYrxjaGQqsh6wd2AOVf/dnd9Fv/6+cSQqRdhbmEolxNJN1SJpi8Ey2Pa0lIw
	zunl7f6VOFaCAF/wwQuLKChNn1SjxkzDZMRnVULom/ITViFNtbylQf31vYA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6uf83592-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Sun, 05 Jul 2026 19:41:12 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c9d5a5b63c5so3489673a12.1
        for <linux-tegra@vger.kernel.org>; Sun, 05 Jul 2026 12:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280472; x=1783885272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SRfBxbqW9WovwhSYimxYWcInLCKkOQsnOkiyjjR+6kI=;
        b=XLh2ed37dvHc7XzXS/cWMoiVcQ+cm55j8XQ470JYNZzOISNpVRWL9CALQnAGKO5ega
         gUrzPWIjYRv89cCGRWiwTdCWASzw14J2zC+QX1HgosWctvLA8SrhdGxwSYgGYdwAOzZj
         GHVOYGSuZw7Cm1xLqvkO8w6RYBaWqZQDdI+3RFoc3lVImoPQHTlgtpwo5di9XfqdpkE/
         09by+fK13IyTAFyCGgm7n8mmWjQN5VNU4miovhKl1q2FIY7rYGJDFwAa5ryfGuDbSHWM
         02C89cD7F54ykTRiOAh0YbF4nMvYcFWYdikw/PYvfiD6O0jOvqq41wyX0T+KviTE2IGP
         RfaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280472; x=1783885272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SRfBxbqW9WovwhSYimxYWcInLCKkOQsnOkiyjjR+6kI=;
        b=HyLAXz6A9IheLzkcSMjwiyg+Tr6ZgkDxb9ApbfinLl2kNlMvlzfxGXkHmXVeWL165h
         bXp/egd8bOesOQh1y3edJsXyIiKbGZ4uMDm/1EiVdInNNBpQH6MUzNQd9lug9HbCU8s1
         WMRF6sH7deGdFt8m7NrmSZ3xmtiyRg2E3Dv2HP3SpaIC7c1VKTivYIfj3iy9+3ytqqjm
         4DU6UoGiUx2LltP0SIqkcS/c51XcBhBZj4WrOL4G337G2KAt8+3XGLqtDBo1De+oMUpo
         Fn3x7TwrBFYP+4qO1fyIg+s0I2cyto2lW4Hf6iL0NAWIVBwf/YYHNTCbZdaO7XLKDAqD
         /cUQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp7JAyqyQRNUCJr8hnQB2bhDrm8aoJr/pV6xMk0i7fKIbTaDZjZ/gcfD6wlvqrOAwFslGWUkR9DFSaYSg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2p4VWCJpZwDNZo/sIZqPLGEZuMe9bfrSJSuoIqU+8mKwWbYlZ
	brN7mZvchDyUIwgbEbRg40zjVxlttu2DrtbyCS6Ih2IRSbLg7V3kuxOHUGPNvDCWGc0+aChr6qi
	6TNTYkinFX2/NdYD7cr3dw9rXr5FG2fvXDbL1Jlle0RTuKqgBfoBDDXXKpaeQHyTTtQ==
X-Gm-Gg: AfdE7ckJ/ocUajIin2yunFFb3fGjIZnkcleFpsP64UYBG99LIAZtAVM3euw20BTmGXb
	Jv4btP/d92Cj3qnrM1Ks2gCKHsua5AzzInCOJtFI3XxXxDuSum+jx5u7y7IiGbSdPTDTwLu11WG
	KOJKGvbYO1tTB28pssh2sqjQ/ynyPRwING3rtXh+4fcvzKsiwVtKOmB3hpyq+q8QmMw87ChHt9d
	bNsY1mMfRc1nOFhkDmG77HsgjqWRTt80YmOJkkr8Edg45I8z4wJ4dz38uq/wnWD53aHuPPUi5qL
	JG2b01nTSAHOcHBzpb0EU11yO4pmqggqiUSrtW3idsBOBYpv9MXjn+gfyXawdRAGAsB459WEJbL
	mSx0htPrHnC4GBWgA+rqqyACJe+56aWld81crgA==
X-Received: by 2002:a05:6a21:6f14:b0:3b4:8cc7:c6fa with SMTP id adf61e73a8af0-3c03e189935mr7605453637.10.1783280471653;
        Sun, 05 Jul 2026 12:41:11 -0700 (PDT)
X-Received: by 2002:a05:6a21:6f14:b0:3b4:8cc7:c6fa with SMTP id adf61e73a8af0-3c03e189935mr7605425637.10.1783280471121;
        Sun, 05 Jul 2026 12:41:11 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:41:10 -0700 (PDT)
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
Subject: [PATCH 39/42] ASoC: SOF: mediatek: mt8195: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:15 +0530
Message-ID: <20260705194019.2565498-7-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: YNJIUFs9S9X6pJGENzO99Bt3YVtuBZgs
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfXxvt4AzHyHv+h
 lteg/g0pf0ST4IMxTG17HVlVyBhQZjQhWh8ScGNArl5Y7tFEEhYc0WoNUUPRAWGXwRTG0p7bNse
 M48oCMwPMOr+KYHUfDm1hdaie9xQ2oY=
X-Authority-Analysis: v=2.4 cv=Z4Tc2nRA c=1 sm=1 tr=0 ts=6a4ab358 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=YxFYfaw6DuWYmsw8bRUA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: YNJIUFs9S9X6pJGENzO99Bt3YVtuBZgs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX3bwyeHP7sp7p
 MX9nMZuN0DOLzyDfksm6lhY+uGhMbaUF0RGNvAMa7z6bJfO/nlvckIB+F9oj52Tto5WoQmWeSev
 x2LFXObUo/qjRKQYpqWuqY7D8HoWkaco1/wHMs7/7jW3DTAfmtlivFSr2WzxdOArEmhCXacDRtF
 a3JsEF0ojoMmuI+SqFCNeaR+4NlPRQtXJInm1MqgvhhNZGeLx4RjHc+XWLr34FxEFprmYtXFMs4
 F+RoX1u06WaSpWztOhZhIP3LleQ6qzKKk3Y03jt6JwyQdMuaO7OkdFh6wwHfGfAd9rKNaT7mN6w
 y3sCjyWptWXS3v9R09ALvHHVV/ymok7mSNlkgW2tyYg4b2EvXBS4D6/8WVYn47uk5cfPcZ233gm
 2WQJFG8Ovu8Xg43S6eqb4ZJ0dd8BIx/jP+VYDBDcAPsdED+QEN8rfFDsh/JQJmRiXRgbgsjFYVr
 sfEnkYhAO/ptjwxttOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/sof/mediatek/mt8195/mt8195.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index 4d6e9300a9c0..e4b6b6c18e02 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -49,7 +49,7 @@ static int platform_parse_resource(struct platform_device *pdev, void *data)
 	struct mtk_adsp_chip_info *adsp = data;
 	int ret;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_err(dev, "of_reserved_mem_device_init failed\n");
 		return ret;
-- 
2.53.0

