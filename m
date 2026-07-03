Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4170D339875
	for <linux-tegra@vger.kernel.org>; Fri,  3 Jul 2026 19:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783107834; cv=none; b=a5PnhP6jj0lH0mMOBmJUktH3OiucVne6eZPJEGLLZzq/wugkdilXjk60Td0Ih6YNS26Se+SN6933s+L11FEwYNk7QQLL0ix8XVrDPEuEFIIT3Bw76tjXLbWsU5wn2/qua1XUXJSzNUP/yPe3votQAPrAnBQR1exNMDSvo7Y2wVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783107834; c=relaxed/simple;
	bh=zR6KGG6/ye/5BvzdfcDU1hVmZYmoWsy3oRIIdPe1Zgc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fAEjex5fCfgr6WBB/iysh4ZfNPe2yajySqeXPOahA8lYz6T7uGft14XeojsR0AjCywY7HttojS1khgosC7ZvvVuGnmYcp68h7TFniS7STj4qBkGfOjuQkGpXcqw6mRyFm/z1ipUlkxf2Dy7UmBQs8FzOTH1SqNIk2eD6HMsVj1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g0ZwbQ4F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W5np3OnE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g0ZwbQ4F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W5np3OnE"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HiPwu545528
	for <linux-tegra@vger.kernel.org>; Fri, 3 Jul 2026 19:43:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qmmZAG95RTp
	/pup9Fv8our6A1N5cYoYLphw9GF6qKjQ=; b=g0ZwbQ4Fxp8RSCKppF0JkCpG46m
	IZL9lgpKtB2MG98fMp2Eetk6x/jUKWM9B4iLr2cyr0TggLUR42uycgR+HH6LVl1q
	qYaTOQFAA2HFvhnn09kA6DLClNJHb0JXw09KSUoMXJMm+0bW1nLBMzPxA86Vo40d
	IgZgqc0zloikkecM4YZLO9hc/3NBCSgblYtyVpg9UiwAyDqhm5Ayk0BIEVQXJ7vL
	wiXAZLl3svEFwMdtZXugflcoEO4rEJtFXd8dSRtQXTMK6SSN8GIzUnCNLmi4KNg2
	1PW6qN7usOBiMmNv3KbgswGU0zdTnq7gADJCvnJBxW710nhoN1OmKi1P0Ew==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f682btr33-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Fri, 03 Jul 2026 19:43:51 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38096521198so1451118a91.3
        for <linux-tegra@vger.kernel.org>; Fri, 03 Jul 2026 12:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783107831; x=1783712631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qmmZAG95RTp/pup9Fv8our6A1N5cYoYLphw9GF6qKjQ=;
        b=W5np3OnEQ9hHKemi7IDk1NPI18wlWdtFBP5uImk7dyqwWLCZlS/f7W7zQwswa0P0xD
         5qLRjef3GwQHOf+fawNXuRiEAEBSvLikvMcDajb37DjHaYiHCaO33XI8U2hru2HOIRiv
         0zhQiKmJNSYrUcKHlOWkd9PIjBJP1kXlctY0fue7SUo30UqSW9vBx3qavbH3u5azXFwy
         TdTpBOX/s44xVOwjUOwuAn69zpP6IHF9CTwGR7h5MoT2C7dfDtfkz6wX+rf4M5Kb46E/
         ieqjX0iXPnkBlTTmroo1R05XbrYYmP+eLr+8OTNozRNlhFcaBIUzNkhM3kVDxxLoyZpF
         StwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783107831; x=1783712631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qmmZAG95RTp/pup9Fv8our6A1N5cYoYLphw9GF6qKjQ=;
        b=JElDOcSrKfSJrBHi7AcvGdIa255HfD73P2yZ98DKI+Q7HMqRvyY0a25qcfQRUjtYfq
         17tCNbuAOLGUs1DqQN3W+59xPlGlTNgwvKiylTv9Pv7rvMNl7I7GzD1HUHwVBGKm89J1
         f9pfm54sw8v6gSwg0qLvjgOOSq7Xm57GvzIf2ykmOYt76aj4Oh+y4onwZFljQcF+5Fve
         DLjtPXqHMb2GEsfy+IieGOOJUbq1Vn9osg/vG9XVJsorRyQM4rrPMUnEhrq7UuSwXkUr
         ZiAkeSJzyVi+YCji43cJjgqzOH3ciqq0NdZv4+3kFIRIhGqwy1+f/YymoJaYgINUKkDJ
         CA8g==
X-Forwarded-Encrypted: i=1; AFNElJ+Czm5MZc3by8QnD3Stxb1S8RJ70BV3AlR/CplDdqT6Qv4p45I5mET3vc12MDiUBBXs94tc0pQynOeeAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9SysljW7U3vsl6BO5ygaDlNBohJJLkasLLQXV3pdAHGS4Nqtr
	f9lMvFTElMokFPxg26I3W0oejpq7OZSN37vcR98etFtToPXyCYVDzyjw/KcNBKJB6IUIMKojroT
	18Dy5QRhXCZO2e+CNsoBsprn00rl0OJ5q9PRGx3bDbUoJlEHa8zIYe9kQS6h68sVgfw==
X-Gm-Gg: AfdE7cmP382gc0Xf/3If0GIyEVUFwkLOsyi9IVtQ/jNc1tFa8GK9cCBmr+g58+xLKFg
	lrWOSc773w4+clcfkQxCU6Vhs4piIFFP6/tkvXkd0X2I3YGtQctShZ8/9tGOjm6kEg+bX6scp8q
	+zSWro1TJR1WK2i/se0pBOaB1f5m+2vauG3HRTp4KhpAy72WmGulnQJDABv2rodLc/P2/pKMLAo
	iA+GEWMAUl0m99nv1thFv77QJTHgb29DWjWGvyP6WBbSplk0bJN1jPlIhg3IktoR/aVKCML9d8u
	wFkG4678jZ93UmnrqdN3/8zJ1h0/jhHxxPuU+X12fsK/9ZGTqBq0iuLNLkYpG7W3xkMsfH/7G9W
	GAK9Wgtw93gnzfeWqgoyVLT2wOGp3ZIju7SV/7A==
X-Received: by 2002:a05:6a20:244d:b0:3b4:8717:1c21 with SMTP id adf61e73a8af0-3c03e4e09d3mr691190637.35.1783107830609;
        Fri, 03 Jul 2026 12:43:50 -0700 (PDT)
X-Received: by 2002:a05:6a20:244d:b0:3b4:8717:1c21 with SMTP id adf61e73a8af0-3c03e4e09d3mr691085637.35.1783107829862;
        Fri, 03 Jul 2026 12:43:49 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:43:49 -0700 (PDT)
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
Subject: [PATCH 11/42] remoteproc: mtk_scp: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:24 +0530
Message-ID: <20260703193855.110619-12-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfX7HRdHZK4ezlM
 DtYpeLcDYVn8f6AwCQg7WD99zUh+7m5dwL+SlNQH0qD4oDOtstp9seOB/oTSfZHG4Yt15JsHybo
 n2UbAiwJ4r2WxMRHTkPPpaqBhMNgYQ9RzD8mhHgfzwUSqC6+AoKBpyPXGbujBfEhDtgwpd418Bd
 1IDBt5KDlQRZMw/YmK42XrR6Omh3NWtur3G/rvQ5K7ZflnzORImuNR1utFoDojETkljnZDG5/Ps
 efBl8IALrk7Xzv5VqhEbShb6ftfrCdKIXhcRtY3SZGVxHq3h694oOXsqR81bch0W7xjUq1Hc6zi
 KyErEBjBWPRi/HudPNcjL4zPX/8h8tyllpHPuWlXY/uvghM2TvPQlRWplKZ+28lzkws9BGpgNyd
 bqyW3DP5XWgt4sNGqpl68MEuOxz70sV6EHfODMvoLxl5ysA/1T+8rdkGFJf6T5HkN4ZASoMo1hR
 m59n04tCCUCcM6y+PhQ==
X-Proofpoint-ORIG-GUID: 1b0bBXAdS4T8vXIFolFR7OzmIQ-EnyEe
X-Authority-Analysis: v=2.4 cv=cc3iaHDM c=1 sm=1 tr=0 ts=6a4810f7 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=PC9_zsTzMDnykp_yU_MA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfX8/QYlxBQ13XI
 8tXlQnkMbzBEjq/RPyoe7TJHyijI+IJb9TLMsLXDlPtPlg6L+SB8FndmV6CGkPUwTLZ+hTe7Zx5
 xd2BiUQs+UzKnZni1tr78U5lU0X8fdg=
X-Proofpoint-GUID: 1b0bBXAdS4T8vXIFolFR7OzmIQ-EnyEe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030199

Switch to devm_of_reserved_mem_device_init() so the reserved memory
region is released automatically when the device is unbound. Remove
the explicit of_reserved_mem_device_release() call from
scp_unmap_memory_region(). The DMA coherent buffer is still freed
explicitly there before devres releases the reserved memory region,
preserving the correct teardown order.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/mtk_scp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 85a74c9ec521..a4387649ad7f 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1027,7 +1027,7 @@ static int scp_map_memory_region(struct mtk_scp *scp)
 	int ret;
 	const struct mtk_scp_sizes_data *scp_sizes;
 
-	ret = of_reserved_mem_device_init(scp->dev);
+	ret = devm_of_reserved_mem_device_init(scp->dev);
 
 	/* reserved memory is optional. */
 	if (ret == -ENODEV) {
@@ -1060,7 +1060,6 @@ static void scp_unmap_memory_region(struct mtk_scp *scp)
 
 	dma_free_coherent(scp->dev, scp_sizes->max_dram_size, scp->cpu_addr,
 			  scp->dma_addr);
-	of_reserved_mem_device_release(scp->dev);
 }
 
 static int scp_register_ipi(struct platform_device *pdev, u32 id,
-- 
2.53.0

