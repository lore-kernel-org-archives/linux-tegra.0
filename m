Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F7033F5B4
	for <linux-tegra@vger.kernel.org>; Fri,  3 Jul 2026 19:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783108105; cv=none; b=ZbIxYKi1PyaOCMS/0A7RCKajGa2k8V2iHaXaS/IQq4spNPb4cKxboy2fyEdYL0/zA60BjhOaolNGsT5meK9muhn7Edeymd7u3cgIxSgb1rVkSdjATUCb7QuSWJEyA7seYfbYPTDjSq/RVwRFv8O7KwZTU+94vj0QusNgpByEdH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783108105; c=relaxed/simple;
	bh=PUUEAh0o9l9vti9257m/CVSbH/19FudOK0Fd7Mw04O8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ie9QN6Jkm/n/90SM1dfK3r+Twa93lSKqqQ2fjEzmEafvms//dkkAL7s+CcZZkB8syGPFVhA4XJr+ZPpnMVOQZXz9G24OhDKvLTkw4K64/T8bGfnn7Anxf89kc8YQXdg2+LfqS3lxaLcuTt92NPk415Ze2xqHewFLcTWbMdzXSww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FSL4OW4s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RaV8A/Qf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FSL4OW4s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RaV8A/Qf"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HiVOV675115
	for <linux-tegra@vger.kernel.org>; Fri, 3 Jul 2026 19:48:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=05KKm/2fQBz
	iycvO0o5qtmP7hJCKgsH/Os/8U9RN5hA=; b=FSL4OW4sqkH5b5j9AIsw/YhH1nf
	ibgm5Unh2DNBArFuPePTEp7ydMwknI8hVtfX3hafu/sPH/fll/+Yol1Nt4cgUW3O
	Q2oC0AjaQcNbY6bV1u3Lrt7No3E1HH/aXPsXP7AZG4RXN8ivUpyMfu2BoEamWIFl
	NW3X3tStizixNie01eHQ9xV+jNSuNRjFoUEqBSXss9qBg6i4tK2kHk4NWRI7Hght
	D9IYQ+nKevxHW9yac3lGAA5QYlnpXFWRGBioWY+Th7V0jEKaJwNAXJ3PPQeJmZTX
	xFvGCoL556Tc+tATu/JtYm9O8HvYscVvC/BQqEq/B3XicM6VWsCrI2LiN5A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6ckj1hgc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Fri, 03 Jul 2026 19:48:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38127ae6b99so1229085a91.1
        for <linux-tegra@vger.kernel.org>; Fri, 03 Jul 2026 12:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783108099; x=1783712899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=05KKm/2fQBziycvO0o5qtmP7hJCKgsH/Os/8U9RN5hA=;
        b=RaV8A/QfA2stA8Z4sxwh8rxIg/rUG98xRGyMnDl52IGOpoT8wBhxybc0i/SuyS3Eyo
         UBoouRI6rB1H5/DGVWlA551pWKu+3qzQFa613wF42MnyerlNVU68LsmpvtL/DX8WT6v9
         PYk60NPC6FNClUpj+c573tk7lg9zzEOWHffglb+lv7FQNHaocOrqOzu0CBOHi80XyLUr
         OaziJ2NcPKEN9NecWsPDGvFBbHYLnLhtArGQF2VBSNcxwrYiNU5d4cMEo+1N3GtEXcPO
         M1vne/F4thBlLSFaOZVGZ1X4+5+7a0sgZ3k8u+uGN39RzreYmmkeXTnLLPYbKK7OxM5Q
         w4Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783108099; x=1783712899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=05KKm/2fQBziycvO0o5qtmP7hJCKgsH/Os/8U9RN5hA=;
        b=WjWUa+zd6QXsi3ElVrCCSUDKcnlFlthD4JD/ZMmPjJ/fn0rnrZOvkTVMFuxT7xasU9
         JfWco3juWaiGrpIL/JtqZKc5Md5qP57HL2XGdicCQWNdpCusNp3j/bOgTIANhlKp6bnQ
         Q/XesOcVUrgVCE3dg51vieYwp315AQCu5pRLW8cD1wuX70zekxDHiZfYpHC/gtDQ9GFb
         kFKqkkAMT8OkGflHKtfHeBcvR1THY2H+I0gPSW5XqtLK7x7UUu5byOs3SVj8LZ2LW4Vv
         uQ3N3YadwL+Tolo3eTH4QkUYhCxW8oIxr6DUc40Uk+2NfK3OlJMNZf3HK6Rj2Z/bZlz0
         klvw==
X-Forwarded-Encrypted: i=1; AHgh+RprhpyXyd/qsuzH2LucPoAwmnXiO+adT5lTJ3YpNtcmKXccK2OhfSneCNURrcOcFfK0TAazwzvayRCLoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzN+buknpyN6S5Vp5QAVGqVpSt98SEptYjtQFODAKG3C+MKbLp
	PHKBcrmZ78JZ4T85ex3vxrCiRUppvsD5yDnMVhDxFr8/BHVb6qgj3mOqUFkS9FOippLklP0HhFx
	xIBchjkl6bhSi67G3+UB/Wtl+EXwzgbXsgRMf/NzkXT+FrugED/0lMNVZvfeh31J7bw==
X-Gm-Gg: AfdE7cl/grwAZOiYmsSNJWVxTCGZecaQm000M4oICIOCs0yar0qiMiykHlkKLWCb5ID
	GAYZ/QE9Zv9x9YBBw3PuBDHMdZx4b6ZWnZscfafVbgG4FCNQuCKKqkAOvQjJ+Z6F8E1VLYBavfc
	t8/CvU39xIQ4b04SKM/ihobieyIp5jDeF2oHP2H+vtQMmhAAUYU1LSwW56jKRNvLG7N6ejnMPB5
	/Sc/H0DbewYJwPqH25DCcMHRFxYDhACgaQ0MPfNu+a922URafzmBs2tk9EqDywaub/8cbUwKb0y
	atYnL36ZxTZIQfpdTa+VdShM8aA4+0otWtag6FdUeY98j28toTZH4Tix/8NFdGIdY205SrJx1sh
	nPz5O+SFBgQLt2QxFbc//JOxwYQQgYqzaDcxF4A==
X-Received: by 2002:a17:90b:5106:b0:36a:caf2:3815 with SMTP id 98e67ed59e1d1-38112340885mr6289044a91.15.1783108098270;
        Fri, 03 Jul 2026 12:48:18 -0700 (PDT)
X-Received: by 2002:a17:90b:5106:b0:36a:caf2:3815 with SMTP id 98e67ed59e1d1-38112340885mr6288938a91.15.1783108097697;
        Fri, 03 Jul 2026 12:48:17 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:48:17 -0700 (PDT)
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
Subject: [PATCH 22/42] media: mediatek: vpu: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:35 +0530
Message-ID: <20260703193855.110619-23-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfXz/O1kZ28FSFh
 l/6WwDQ0M++hO+pRsh4VRoLysW20VEM/D2L0o1Em7eFQlGQWR4DCMtxldqsvrgHRkShn/12HMxJ
 U2pu+bNkfniapCIid+KH0TE0aC769Kc=
X-Authority-Analysis: v=2.4 cv=E8v9Y6dl c=1 sm=1 tr=0 ts=6a481203 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=gqQKJLWYzfjTGvuwkdcA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: eiY2KtoPWVMJnYglMaHyNlaRiW8ihsRp
X-Proofpoint-GUID: eiY2KtoPWVMJnYglMaHyNlaRiW8ihsRp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfX+KUz+z4ZdpLm
 W57eJYgxaObCW8uriEQi1Lo9ccOBo9bz4kp/fhxFg25fe5V/uQ6pvGipDFIQG5Fe9PcVoIdtkpf
 V9KIwrwlnxJ3Gy5cyNejJ3+QhaXKtU3ieaAZVOp/hVUZGzBiRmVkmcd39Ps1VgIY0+UO3QP/qpP
 A0ikf/SAkwCRzAkKa6KEmZKAdSYllDVmOUHfda84skgmi4cSl7SG0q7h63q1aFvXtjf0pXXiTzC
 +lV8o8IFw/6UEAGdhaQ7z/WRWjpUd3m8PkqrxxA7AoDUZVvR8AAKUPbGqjh+qVy9/fT/+zP3DMF
 RqMGaJo1OxRqgSTRNOz9oFXRqe/ra5WHxRfWyxEIzpVgjyRQ9NkXAYOKPbTgNFnl5yekGxa3RDS
 E+FRo2L3/bAxlx54h1av86LJ0nMOJVBv1O7y4/4SHlIx84kj8z7qhfURswpG+iYO/jt4rSgPMsh
 i8xHyIjFdFhGVat8PGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030200

Use the devres-managed devm_of_reserved_mem_device_init() instead of
the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
pair, letting the device resource manager handle cleanup automatically.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/media/platform/mediatek/vpu/mtk_vpu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.c b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
index 8d8319f0cd22..557bffb2c2f1 100644
--- a/drivers/media/platform/mediatek/vpu/mtk_vpu.c
+++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
@@ -888,7 +888,7 @@ static int mtk_vpu_probe(struct platform_device *pdev)
 	dev_info(dev, "4GB mode %u\n", vpu->enable_4GB);
 
 	if (vpu->enable_4GB) {
-		ret = of_reserved_mem_device_init(dev);
+		ret = devm_of_reserved_mem_device_init(dev);
 		if (ret)
 			dev_info(dev, "init reserved memory failed\n");
 			/* continue to use dynamic allocation if failed */
@@ -930,7 +930,6 @@ static int mtk_vpu_probe(struct platform_device *pdev)
 free_d_mem:
 	vpu_free_ext_mem(vpu, D_FW);
 remove_debugfs:
-	of_reserved_mem_device_release(dev);
 #ifdef CONFIG_DEBUG_FS
 	debugfs_remove(vpu_debugfs);
 #endif
-- 
2.53.0

