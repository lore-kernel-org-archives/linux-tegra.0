Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5E733A70A
	for <linux-tegra@vger.kernel.org>; Fri,  3 Jul 2026 19:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783108003; cv=none; b=ls2Dqv7SSjzmiHK1XtBVgLmC1+k4xZPjnkOCCmmfQBlKFiQWwFV4J+80CuXlZWNIFYAYYo77+ejGVHOAg14Rfm94fKyjduYADmxplKSLFY3gywRR739YOKGAVHDsUSMUKDw6mANGrbbqDAcBokY4FwYT+Ty5YtKUX4skKSgwAI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783108003; c=relaxed/simple;
	bh=bmJzWNZOp2dOjeNu7Y3PNQKP30bPclEVOKAYetSec1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SMTZ+116pbNTZIN3RTX4mm5W0KM7qNGwRce01nEbWj3yNE+dLfPV8ii+RSVi7AMn8hMCPN4DP8RJ/WMnWTl+N386LIN8mY4GiJVz8/soLQgdfSPj/gCsTzqtLz0Yqd5jOHtCrvOTzrpqLKFp5bgDpKqd0nX/JA0n5llqXvxMy+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bgizp88k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RwJpX8Ln; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bgizp88k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RwJpX8Ln"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HiUL5545604
	for <linux-tegra@vger.kernel.org>; Fri, 3 Jul 2026 19:46:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IZtPwgb9C92
	gJ/yqDWkTjyC7j4DO6PtnB3p5BLY9VA8=; b=Bgizp88k+UDI1BLUoJla4GGkC7G
	QalzzIQo5HOKqdySyqouNh7+fTnqdoAZPLfvNE6WIQ8ehkVEc4JeRhDZ+Orcj9oI
	vlzg1Soy0q7BSmJNaInnjhEUveTV3Q088y76VQo+l5xDTYTd6AcH4BPQvyk0utHM
	1H9aAIqqRIpKRozXZfR1zAhCOSkc0A004ZMHBVJFw9l8zneQ1vJ98wBZEjm1ggA/
	YmlraZaHuss0dzpOBmhubqznt2yTpsoXkoiutm98MxUWy7jHGcVmDDxzlbDuEDFo
	bW/eC7Y1DIr5p3vbbK2AU9uyIuV78xIPfCmI/lsyvnaAL5Ox+jf8uWb4tPw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f682btrep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Fri, 03 Jul 2026 19:46:41 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38001e788d6so1151510a91.3
        for <linux-tegra@vger.kernel.org>; Fri, 03 Jul 2026 12:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783108001; x=1783712801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IZtPwgb9C92gJ/yqDWkTjyC7j4DO6PtnB3p5BLY9VA8=;
        b=RwJpX8LnAx2QqP9786MSpDcLg4Fkq3w7NjgRJZwhrm/WLIcZhdgLjhsH2bhpahWpcK
         zAHgh1OVZCN2Owe3IjrYGddTMeEgrkjpjpjKoudziWtQo5Jpe2+gf9gTOW9HxuijJCZw
         qva1k5USBZErNptZbDwZHzuoT1vYLNws8Wqee0HGPOkV1sWhE5Nbdm7E3OZcqWwYCplM
         C9XZ9JRd6POLPsLxgKXxcIFFd1iMOQ4nS6oxgHUt5Lc8WgTAlbc9S1FYzj6fO+K4nBLA
         irPQNel9l/sSom/jEH2GC9hqptzNwmw3RDL2pqdC3MDY/AE2Pqf6yfThT2HVGYigeoxD
         cpUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783108001; x=1783712801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IZtPwgb9C92gJ/yqDWkTjyC7j4DO6PtnB3p5BLY9VA8=;
        b=g4hB+rzKBX5/lASJnG1RNXk55sMDOtwO8FB75BjjP9xd9xgFhsh9Kl4jg0JO1GabHb
         2kQYa5groQN3qgJXt42gg1JqVOKnijI+mntkGorzqdJ5wCaxUvB2shZo6amOKQ02qOYf
         QbMa4oQpUNorQEobytMvzy3gltqZwYH/uKigR5DVBQra32ciV6rFGWxEf3kGMQlUGpLs
         XJ0NSRC5W7LRuL8JtLjxNlCV0TxpcjZQM2O+WUSoXG6HswdLP8IkZLmRzhoH/CEO6HRn
         7KoYNy1CZ9G2yXiUsJecQSgY0+J2q+gUPscOkJ7nuAj09aXb9oUmzxrln7VfINhw1af9
         /IAw==
X-Forwarded-Encrypted: i=1; AHgh+RpH/FabK33yzfx2cEs+tVmWv0L1rgd7ikF+NR6n82Zu/DMSrr19pAMjyJWIGRsnUKUyJQdzPR+11zPZTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSQ21Qls+DziEyRPgX27hK5lede+WISyHIpRF6eItOWFdV/bq6
	jZJC24JVgtw7mJWxgMQ/GQlld+lDaJH66GQiiPjTntq8R/2KZ6FxvM0SDY09EKRg3AS9EohzJLi
	P0NhJIad1bhuU56fCrM8ff5oVqMF63GJb80KNhGlfOwBSIgpV0kKh7amKFyJtIfCfvw==
X-Gm-Gg: AfdE7clUnsOH5CQ/HN8Qxp8OpRfhDfPutHF5nrJW6diG88Kgeu3uENU+TQd2ufiGmfN
	rMGS8Zyp5e2UMXhbJW/gA5nmwU9Ry9JxZcAjDqII8Cw9mAsXIh5FH90pD41HY2E0sz62XrQgWST
	FjTKHwU+oSWUagy3IqanIg3OO1e+29B2Sxn0diTJzVEpkfQ+hWJxjtCwwS/rexvru3iOCDEBBbv
	7s3zSE4nkDuhMG94XyK/Kt9Fs7Y3mBCZ9guAtgm1960iHvkR7U/fbuMiI8G24wrzDcw7/eticYG
	X8Ima0cyQtt1tmHqhVhVibt8kEGKS0bGI+Q2LTHEu194++i8Pph6Wy1b+sjgcPfBANpuLxULUDK
	m1EtgMQDpmFoVwNJiXJUAGjaYeUFoc2V+8aB7CA==
X-Received: by 2002:a17:90b:1802:b0:380:83fc:4315 with SMTP id 98e67ed59e1d1-3829f007711mr762832a91.21.1783108000999;
        Fri, 03 Jul 2026 12:46:40 -0700 (PDT)
X-Received: by 2002:a17:90b:1802:b0:380:83fc:4315 with SMTP id 98e67ed59e1d1-3829f007711mr762719a91.21.1783108000352;
        Fri, 03 Jul 2026 12:46:40 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:46:39 -0700 (PDT)
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
Subject: [PATCH 18/42] drm: kmb: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:31 +0530
Message-ID: <20260703193855.110619-19-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfX6dQKaVDQK6sd
 QD4d8Boj3SRgfDFyf19Ny6jS/wuQKqQ6wZRBaN0u+Fgo1XKPOWqD7m7Lfhbxjy0CQ8BQRAmE7uH
 sTUQc4MNlR9lPH7VLDtHd4jkw1AjuCoKSFGJ3n+S8KkdTMdP6cHxykRttbymFEhrMbk8Jg8wsb2
 MCXLJ9qk+cgPEyMrCssBTJxj//CecEiaijepCG5Dbhpd2AZDFcWWluZCXp9704YZAdnVvJfR2h+
 zJvPeg2vJNM/K4PX/ZWpJ/0caCcq7spwzdr1uKOjjgb13SpWfD/C/cqyY5yrLYa/Y1DFfswnYp8
 8iKjuqlH+PD/7ooXenUHEsqx0uTctSFCTC81R2Cg7BhLgnQ38S8BEzcZeJwzrFp2eaAi7cX6n8l
 lpF5rgC5fCi7jlqje6uB8CGA6ZCeibjnL9i0lVa68TjDa1oveQ75mHYjqz8qVLHRITkzu1MOkT9
 hiXJCmIcbIXhOUGJhSw==
X-Proofpoint-ORIG-GUID: 7hCCNTG2kbTOwmB-YG5bBfcyy-DSqsvX
X-Authority-Analysis: v=2.4 cv=cc3iaHDM c=1 sm=1 tr=0 ts=6a4811a1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=WgoW8aVLYYFOpEymBdMA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfX2aJwChQZie7C
 X0G4pHp9kpO4muEeyBCBOgv5FFowSGDt/45zjwUIDAYF7m08JXvY5A1FZQf/k1con7mY8y/cb6G
 /kqhlzkj+GC5b+CTLnzI0vWsoCWzcm0=
X-Proofpoint-GUID: 7hCCNTG2kbTOwmB-YG5bBfcyy-DSqsvX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030199

Use the devres-managed devm_of_reserved_mem_device_init() instead of
the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
pair, letting the device resource manager handle cleanup automatically.
Also simplify the IRQ error path since the release before init was a no-op.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/kmb/kmb_drv.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index 7c2eb1152fc2..88fe377940f3 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -140,13 +140,12 @@ static int kmb_hw_init(struct drm_device *drm, unsigned long flags)
 	/* Allocate LCD interrupt resources */
 	irq_lcd = platform_get_irq(pdev, 0);
 	if (irq_lcd < 0) {
-		ret = irq_lcd;
 		drm_err(&kmb->drm, "irq_lcd not found");
-		goto setup_fail;
+		return irq_lcd;
 	}
 
 	/* Get the optional framebuffer memory resource */
-	ret = of_reserved_mem_device_init(drm->dev);
+	ret = devm_of_reserved_mem_device_init(drm->dev);
 	if (ret && ret != -ENODEV)
 		return ret;
 
@@ -155,11 +154,6 @@ static int kmb_hw_init(struct drm_device *drm, unsigned long flags)
 	kmb->irq_lcd = irq_lcd;
 
 	return 0;
-
- setup_fail:
-	of_reserved_mem_device_release(drm->dev);
-
-	return ret;
 }
 
 static const struct drm_mode_config_funcs kmb_mode_config_funcs = {
@@ -465,8 +459,6 @@ static void kmb_remove(struct platform_device *pdev)
 	pm_runtime_put_sync(drm->dev);
 	pm_runtime_disable(drm->dev);
 
-	of_reserved_mem_device_release(drm->dev);
-
 	/* Release clks */
 	kmb_display_clk_disable(kmb);
 
-- 
2.53.0

