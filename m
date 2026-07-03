Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E475733A9CF
	for <linux-tegra@vger.kernel.org>; Fri,  3 Jul 2026 19:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783107884; cv=none; b=EslElil3Qh64cKvEaqpIgTPRFK9DM+CRLD8qPD+Dg8GI5KZ2obSptsny5y/e4ueY5Aq1rJI96B5OwM0WZ6vUHVf2Ah31+pZH7XrA49gvQZ1EVUpx6ABihelYVxO/ThE7ftCk0wBkulipdiY7+rsBLgb8Noq3OZWVCIi+tk//upw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783107884; c=relaxed/simple;
	bh=9VHUN3wrrOaDoWZFUjd59Z16/VB9m0n20/OUvZSYBsc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sJJQAwI/Dd64ikFOXQpripK9p+Uz5tnutFuZs3cb3BvFXbHGHki7hj2IkbMaL1IPCsUOP4GSYhPqcwWkmUG9MWJouzHR+/zXK9D+0J5FrnddOsaXX2lN7xD5AcBY+pR8Vk7BHz35befarWL9JznbeO/MWHZ/gr8uGSf+yhr1jDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iY4Qnsy8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g/Yo003C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iY4Qnsy8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g/Yo003C"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663Hir9S685485
	for <linux-tegra@vger.kernel.org>; Fri, 3 Jul 2026 19:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Lv1Bj12YhLZ
	GN3CgybKSi/9TGsT3eAHwNaLR1ZhFDGs=; b=iY4Qnsy8abrOAIAfFH+8FxIw6mq
	Qv62w0poHuMw3XeKHTxiiEV2i9vgpiWUQnAMxg15qwpuMbCD5LHMmPAbxups9U6+
	8Kxg3VkqFs14Nvi5hRkCGUDPNnOZSfE9BVxjERFNOsf8El+epCrhEeCuyT5bWuEx
	xVZiMuzcNy/l+EOoJk0aX1Nx3Nv9PBByY67N2PgW8n4JUwsFXE0n25h4bFlL+ioR
	1v/6f5QLgOyzaQa8dDpqtELNoL7m4lg79GgByHgwIpYh0c/MZ5ZJFB7t/TSt75zB
	Hq0jvgAaxsGIXA6rrVFftF0Whkpojf4qBmtL0jrhsU2GaWU1Wh0ht1sDqrg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f65qckey2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Fri, 03 Jul 2026 19:44:40 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36d97955899so1306723a91.0
        for <linux-tegra@vger.kernel.org>; Fri, 03 Jul 2026 12:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783107879; x=1783712679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lv1Bj12YhLZGN3CgybKSi/9TGsT3eAHwNaLR1ZhFDGs=;
        b=g/Yo003CwpJlMufo82XbV/gGpTb0ngiFBDXIWu/vk5EnQ8RDvilNV1FCYVUgrwk/Fv
         6hWDWXSRuPa1cse9w3V3zpEB43LNGI/tSl9qyAjYzfpZ91awXsZv2uAR4RgLXvavduE1
         +P37WeGUOoa+HQi75Dnp8TyIV33O8ybohHS+zrrM6EJsXFgpAhHoWtdW0NKhWMcep1Of
         qDGdAvyvWHQITflpjthLYqEfMtLP5OfYzwzGcV9ie8HGHtj0nQy9bZvscj0K6UUS81G3
         eZaNTno/irq1qdEqKULzc3rWHww++SEs6wRMWawgoq+NwjbLnGFK5nKUCVA2xgwt+4Ks
         dIsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783107879; x=1783712679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lv1Bj12YhLZGN3CgybKSi/9TGsT3eAHwNaLR1ZhFDGs=;
        b=PT9b2nZUTxecacnUD9WrK2hFXJVzF1FD8Mwtb13Mo/WGGiwXEcLkfrrxcPQ9Dmphld
         2nK+v27Bn+yGbStSLG8NhCqtqTEaeOOuQR1v9DfVSzP+uGlTp8lIv8AkDgCnErutcL46
         sLa4YPsEHq/hEuGCPUhAjZc9XyZxyJSflsvgEx/LQnklU/QdHXvAb5V3y8iiu0jS+Wxl
         Ji8JIbMpq/HcVJ50ynuBGyBZ8wvuFsfKRPK6JR6N5O5H7t8xSFmfAsSfjFWKXGmqSYe2
         F7/7hnGVdgKy24nhpMfP/yPkRa2CJv3CkcMDMVqwJRAayXOvezsdSG/NqfgUY3DdejmZ
         Dr4w==
X-Forwarded-Encrypted: i=1; AHgh+RpgTu/RGY0dfBcHmrxwZkDrs+GoJKXx8Db9FK1Q3AVk2LElnFsl3qZTi2Uh59cCzvqZLAY9c8nrcvvLaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdgLNldFARNbNr78XUY7dKJfDZhJXyhRgGoM1ODU2oCSVkCKIF
	azf3bINy3L3h9Px066AHlcEjgUBtFXlwXOft8b+3AT2fuWKo/moufd4v+nmuL9PNTJI8yD6Nky9
	hkws4URO0VU+nb9kn8E3FBtAt6BQp7JqB15u9uSmJ2sIACToArokkMPU5I4sm22WRHQ==
X-Gm-Gg: AfdE7clIVdAKzcS1cNr/oGtII3cMYvrWKKtcbAAyB6e/wj5LaqgH6+avWNKM8ZMDFjW
	LB3a2B7rBEUHR40uS1A7jNXfU77RoK1j270hTmWhob1+Jl4dfvnUFcYiSMcrkFvjm1c6zmQ4kvU
	yfG/Y0M9X9CQIf/EwaVThESIOrX4NfU7GL9w8TnVod/VB2Ut4KyBbfPqkdPveLEsPBsS1UJp+p1
	Iuvi62ciCN4dxhj2lEYIYfCJ9eua1SiA6/tNpxCoB5qAwWemtf5A0ABjuDOmAK7EJkZWIpWtEpc
	CV2OGeQUNFB6osTmKAURL6pZejgGl0OiPMz314ToF+sQuS/CLE4OU95hu+8+hAudu3egiwcflS5
	3WxN2Pd0duJIysGgd8Ld1mCfZNDbFiFg7kNpj1Q==
X-Received: by 2002:a17:90b:2886:b0:368:d839:28d5 with SMTP id 98e67ed59e1d1-3829f0074b6mr775654a91.18.1783107878945;
        Fri, 03 Jul 2026 12:44:38 -0700 (PDT)
X-Received: by 2002:a17:90b:2886:b0:368:d839:28d5 with SMTP id 98e67ed59e1d1-3829f0074b6mr775603a91.18.1783107878394;
        Fri, 03 Jul 2026 12:44:38 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:44:37 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Paul Cercueil <paul@crapouillou.net>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Eddie James <eajames@linux.ibm.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ge Gordon <gordon.ge@bst.ai>, Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Shengjiu Wang <shengjiu.wang@gmail.com>,
        Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Peter Chen <peter.chen@cixtech.com>,
        Fugang Duan <fugang.duan@cixtech.com>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
        Fabio Estevam <festevam@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-media@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
        kernel@collabora.com, linux-tegra@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        imx@lists.linux.dev, sound-open-firmware@alsa-project.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 13/42] media: nuvoton: npcm-video: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:26 +0530
Message-ID: <20260703193855.110619-14-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-GUID: J7Mq_qhMAkLUaiU_PwmArvM_ksgJFptz
X-Authority-Analysis: v=2.4 cv=Bb7oFLt2 c=1 sm=1 tr=0 ts=6a481128 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=iFm4xv_JmjgOdRhw77YA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: J7Mq_qhMAkLUaiU_PwmArvM_ksgJFptz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfXxOaShzxndzBD
 5wUf/a2uciSAPhnrYyxR1BoPEE/DFEeEP4354Qx4du7qIzd/EE0yJysXdPcMU0WHITbp1O+ycM/
 64/Q9dg/G1L86avaR28VzXgdfZE/Oobh03ndxNT8x1lx1UqryrTiuMa+2bZi5ES1ezVvH+9zd3I
 ReTb/pHd++D44ex36P0HGswX3A0mm/v6cuXAzVS+A2bHIwR26bwCnKXjamiMRSUlGvDclFPs4jI
 /8BmBTUbm7IX2WZT8MUJ0tnUp7+RGAUbqRs0ncUOjEzEPzEbPewO9aXZ789FDyVIzEBYpP3TPzM
 jV1BqU6d6iyxPtfXeoqqT2mRP+S+U7p4Hq6jk1N9drTFNGuhOmZQXNMiXHL69yoWP40SEl7Qxcc
 OdrdnMtXMPtbGHy9qwfx793CMzhDAgZDjwQjALVuGDcAB2RYLFFXeaXmOawTgeGLBj3dtKjrMj0
 EBam06kOh2pzoxLXp+w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfXywEb15pmFw68
 bCUi/99GnF93eAHb8hpDIGCkVhA8lFmKLd45jWbdFpRL5P6y/UICf/PaKVyh06skwv45r8u+bqF
 bmS8fJmYG1x3nSl9OTBjylKe142be0g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030199

Switch to devm_of_reserved_mem_device_init() so the reserved memory
region is released automatically on probe failure or device removal.
Remove the four explicit of_reserved_mem_device_release() calls and
collapse the now-empty err_release_mem label into err_free.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/media/platform/nuvoton/npcm-video.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
index 52505af35c08..6786736c8f07 100644
--- a/drivers/media/platform/nuvoton/npcm-video.c
+++ b/drivers/media/platform/nuvoton/npcm-video.c
@@ -1715,17 +1715,15 @@ static int npcm_video_init(struct npcm_video *video)
 		return rc;
 	}
 
-	of_reserved_mem_device_init(dev);
+	devm_of_reserved_mem_device_init(dev);
 	rc = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
 	if (rc) {
 		dev_err(dev, "Failed to set DMA mask\n");
-		of_reserved_mem_device_release(dev);
 		return rc;
 	}
 
 	rc = npcm_video_ece_init(video);
 	if (rc) {
-		of_reserved_mem_device_release(dev);
 		dev_err(dev, "Failed to initialize ECE\n");
 		return rc;
 	}
@@ -1789,13 +1787,11 @@ static int npcm_video_probe(struct platform_device *pdev)
 
 	rc = npcm_video_setup_video(video);
 	if (rc)
-		goto err_release_mem;
+		goto err_free;
 
 	dev_info(video->dev, "NPCM video driver probed\n");
 	return 0;
 
-err_release_mem:
-	of_reserved_mem_device_release(&pdev->dev);
 err_free:
 	kfree(video);
 	return rc;
@@ -1814,7 +1810,6 @@ static void npcm_video_remove(struct platform_device *pdev)
 	if (video->ece.enable)
 		npcm_video_ece_stop(video);
 	kfree(video);
-	of_reserved_mem_device_release(dev);
 }
 
 static const struct of_device_id npcm_video_match[] = {
-- 
2.53.0

