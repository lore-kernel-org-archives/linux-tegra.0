Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7F130C15B
	for <linux-tegra@vger.kernel.org>; Fri,  3 Jul 2026 19:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783108150; cv=none; b=isXZy8H1/Ar/+swsn+6X3H5VYgYMJCD7g6bwg87O9ijIXX1wfyVbtPnZsM2O3z68aTuUIUwv/ILTrIm5+WYpOpcJERsQTXNxiGOYVaytXXbj9jMTtc4vF/vN8qxIS9q27Z4/uezd9Bh4ZioPOPWACtL9YgoDjDdtqQwAAiMTODw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783108150; c=relaxed/simple;
	bh=nKUUCUPIco1ip4w7PkPucTmimjJQ87wHPgacKzywqAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NIbLED2GzeyxatCPZpTRAdMmXyH9wMNDJfFs2RrhWMvzop7yJGRkkbhU+eTZgM1xYxUkRHS642P5F57IUV5UUBZdHb+I5KdyKKL1ALrnLcQXjZetQIyb4wZngFM6ZTE7lXWqnz0iOLQf2zLKpmfNTs7hFwbW+85mD9YNSgWovm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S1EkCV5n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X0O024im; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S1EkCV5n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X0O024im"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HjI7v547095
	for <linux-tegra@vger.kernel.org>; Fri, 3 Jul 2026 19:49:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qrLNvvBd1IL
	tTArtQX8hnsFClrmyzhIwysun4St2jcc=; b=S1EkCV5ncADGpatu+eYZt750/gJ
	LNLywLK3880MOVcH/tdC1TcI+OqeOew5eBqmPBQw2WxbhuKJxdDehFccfF1Iw06A
	ah4T8eIEryoVXAk78NJxSVoqTVGOs88jJDt6BItnQh/marGnHSf8MAYdrnL+EvAy
	X6tFzBtTSIu8UyHQ/B433/b2JRqYdep4RBZUNOlTI8pJMS+8R3opxr2x38x/E7Ig
	o3oGK6JEOl8FvcuYjJVxSgdKyDxnHNT4LXiEu6qE8OpEDqKzfYrsezcTm8AvWFnP
	9MSzx/BgCvxY+6M1AZ4K+vK8GI3ISog4BM0DfWHZ8CqfNzkkcsMDn1W9VAg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f682btrnm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Fri, 03 Jul 2026 19:49:07 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85a298cd62so796562a12.0
        for <linux-tegra@vger.kernel.org>; Fri, 03 Jul 2026 12:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783108147; x=1783712947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qrLNvvBd1ILtTArtQX8hnsFClrmyzhIwysun4St2jcc=;
        b=X0O024imOTidHKp6ZOGZuRgKCTt56pHfCwCU5C3tac3W4sw1zVHLW7HGq3oiIYItxU
         HS18AYb2FgliwnM/cHreIoN0zDR+J5fqh7B1NBh/gu2e38wOxfFodhg+hKUL4rd4ii2P
         CbcT2qab57gYFRuqUhMlY0L6z/U+KK9KZ6nRYNvpfiCY7OW3vpYYUZ8+g1d6rISfDvUv
         h/Hp5YfPoaUyZksDzX9T+mwaxnbXCL6ZfXW8bggf45yZnPYlmxsp422K52jCEqku6edf
         mfdEfLtHkNxsPaZt6yYgER4CJM0lLPa/auIM07b59uJnRG1JZRftkp3fAngHPoiXODZ2
         9gLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783108147; x=1783712947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qrLNvvBd1ILtTArtQX8hnsFClrmyzhIwysun4St2jcc=;
        b=gBFuUHSY0WfP9njnm6Rs3b1yymke0h5ps5KrFFVHuSm6WFeXI7comLWoNCwB1S0kqg
         xZNRqo+LN4HEWudIXm50tkDDnlZR2fga4ZZ80pyH1pqaj2xy/qGhYvB0mxS3h8vhFVFo
         9osTf9fE6FOo0tn/E9PgtfqG/bRubnMiesxJfWI08+m+YW7prLt4/XlJrRFAndtP+I1F
         GdzV6sZ6/KUa3KPw1yDMN4gvukzPeWXREStsHzKgSYi5nWctjQibxhq6bzBy418BNSyD
         cxotTpTk8276ZwbPTuL7ZajmzCaxRiQde3NohJQ3tgLfZA1S0/1nCsofjoKLlONMDE1/
         wrOA==
X-Forwarded-Encrypted: i=1; AFNElJ/NQLR2ToOi9nGS4RAL66WwiNy1PT3PE/romtr0XngPDw2XKDSaXwdC6A5lCATg0HdBNNcCfhhsC44FKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxA8EUvVZmI8VlXPff0Gs9vP8sH9+UMJ5diTPwAOx7zeyJL2HFr
	0ba9+TDt8uwiloZT350jOCudvZXKU/yc6VY0pRp5hiYn00JVB71zreJfL/gyraCtdq0BtZ6Z2Ly
	6c18/BxbV1DwAL0bQj7y8j6TjOfwx8Uojmn8H6YHhfaWVoLaHl3Tb/RvvGzO7rqOWYQ==
X-Gm-Gg: AfdE7cmLsaFY/DgF4OjoJuSnLxdgzZOoXgVY+KBC/TmHiWzPmOvUlrxy4nC0saqb1da
	GGJDbNfbTeMCxW4MVcnreU4C/xK8LDp03YIOsvW6NtYWkbPPJsEg44S1u1NjAyTO01e1yuda4SU
	T21wFXIeEkU1P3wQ0LPmIU6TtAyZZJDWsZuiTYD8N5kkyjmy5vbxbKXU4vIiBsRcXUU1uQxVT/K
	N11O3eme2kUa7+HRfvcuRe71CnsMhRW9Ov4xMk8Khmf+9VXsn/49QFvGot22mOxMWdsQSmPx+2Y
	EtF3qQJzZpo9bt2QPoYZNKobDyCX/vLxsT+h17fx3ITh8HR+EhwR5Yr4xYwNtO8cbZQS2xVZqxY
	grELTkVosoV2hZXFhaE5XlEPIHnxOJL4Rozuq2w==
X-Received: by 2002:a05:6a21:6e48:b0:3bf:6c04:a816 with SMTP id adf61e73a8af0-3c03e4da45cmr721937637.55.1783108146910;
        Fri, 03 Jul 2026 12:49:06 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e48:b0:3bf:6c04:a816 with SMTP id adf61e73a8af0-3c03e4da45cmr721855637.55.1783108146324;
        Fri, 03 Jul 2026 12:49:06 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:49:05 -0700 (PDT)
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
Subject: [PATCH 24/42] remoteproc: ti_k3: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:37 +0530
Message-ID: <20260703193855.110619-25-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfXzEVNRcPY6DTy
 oU/vBx5SU4SHbd1eKDbnPhhqnf/O1M8Vbi0rsgE17bvbWFVFFFBfSqqvVDpkHxPk9VQUsGZCYXC
 hd/YzGafSORMuLb0/A1V8JNWvS+UCvyhoJSEKcAaXdo345G3Sye8rPA6cwE2rCONM/rmzrDzSPP
 1X70o7sEmZetf0CwC+P2BHE9rmRwmR89mRmtdk7sbCx0tQYftoY/1jNVJu4tHUqCb++sd+gKalo
 C49zbnj/qAVcd7HSS+7z7cVrr2K5eFiyUeI6zp2ejgbJ+sl3BIk7lBqo8E6IzuCBfC6UBc9LXDd
 lo4SYFSqd3CQfBOMc6hdRq2HJAxQXWD1JdVfyzQcmXPztM37lCoziY49FibK9Xuu6pP9XRaYOsn
 Wmp4vDuLho7t5mM2jq7kkVLXS+shq/pQUJqY+NIzhfU/AQfIPFctrVS+MrJhwf5DnLd+uu5rp/N
 3AeEj8QmBiA3n/A5Scw==
X-Proofpoint-ORIG-GUID: cBP_7Gv2z1kWiFeSMFmEaCw_kPWM45Fj
X-Authority-Analysis: v=2.4 cv=cc3iaHDM c=1 sm=1 tr=0 ts=6a481233 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=7v6Lk8RlztZ-GcM17LUA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfXzQJntdE8MFnP
 aDj7gnYOhjuUholGAN3t8QQMXe8WSvR7naCfKbUQYe/sJTTs9ffMK3kSSEhY64Vkrl6Cz+hrrhF
 pNNQe1L4WGAmgzoA1rEVAj5J0XqVoQg=
X-Proofpoint-GUID: cBP_7Gv2z1kWiFeSMFmEaCw_kPWM45Fj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030200

Replace the hand-rolled devm wrapper (k3_mem_release +
devm_add_action_or_reset) with the standard
devm_of_reserved_mem_device_init(), letting the device resource
manager handle cleanup automatically. Remove the now-unused k3_mem_release
exported symbol.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/ti_k3_common.c | 13 +------------
 drivers/remoteproc/ti_k3_common.h |  1 -
 2 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index 3cb8ae5d72f6..f08b9e373220 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -458,14 +458,6 @@ int k3_rproc_of_get_memories(struct platform_device *pdev,
 }
 EXPORT_SYMBOL_GPL(k3_rproc_of_get_memories);
 
-void k3_mem_release(void *data)
-{
-	struct device *dev = data;
-
-	of_reserved_mem_device_release(dev);
-}
-EXPORT_SYMBOL_GPL(k3_mem_release);
-
 int k3_reserved_mem_init(struct k3_rproc *kproc)
 {
 	struct device *dev = kproc->dev;
@@ -486,14 +478,11 @@ int k3_reserved_mem_init(struct k3_rproc *kproc)
 	}
 
 	/* use reserved memory region 0 for vring DMA allocations */
-	ret = of_reserved_mem_device_init_by_idx(dev, np, 0);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_err(dev, "device cannot initialize DMA pool (%d)\n", ret);
 		return ret;
 	}
-	ret = devm_add_action_or_reset(dev, k3_mem_release, dev);
-	if (ret)
-		return ret;
 
 	num_rmems--;
 	kproc->rmem = devm_kcalloc(dev, num_rmems, sizeof(*kproc->rmem), GFP_KERNEL);
diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_k3_common.h
index aee3c28dbe51..9a58aeb3867c 100644
--- a/drivers/remoteproc/ti_k3_common.h
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -112,7 +112,6 @@ void *k3_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len,
 			bool *is_iomem);
 int k3_rproc_of_get_memories(struct platform_device *pdev,
 			     struct k3_rproc *kproc);
-void k3_mem_release(void *data);
 int k3_reserved_mem_init(struct k3_rproc *kproc);
 void k3_release_tsp(void *data);
 #endif /* REMOTEPROC_TI_K3_COMMON_H */
-- 
2.53.0

