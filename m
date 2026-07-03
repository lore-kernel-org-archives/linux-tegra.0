Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010C4331200
	for <linux-tegra@vger.kernel.org>; Fri,  3 Jul 2026 19:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783107737; cv=none; b=tZZmVsgE2N+3USXrD42qhMnRIHIL3djQ4yvyL/9AegfYgP+uW51AtnJYFbXfCPs8G6RXT1mucPtr7Meqmz71xsw8KgVV5SFl7pSiPREUyK4z9lVO9HPhlpm2DVadvTKKuZMc9F+7J1LrrurlUZ+CUCJLSUuV0RdFuMp3FWUnoIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783107737; c=relaxed/simple;
	bh=tVq3ml5TJnZAT6aj46tV37eRc8vSQAjGRbxPs8s3WzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VCYYUaOtbUYwQ40k7p1hM0EsJ+xXDTrIYdXP6Qa0+5KgCancZLxfRvASkd2+iQhvj8c4Z1H0PfcN1zpOvU213XvFWbpmSYG0oL1joFAF0+XWUp4t4IGo7iJ0KalZ29xIjPSIAhQzG9UkhZV/JemRj1zFshVljIR+w0Z+QE7t+6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ri6qsvH0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IcGKOvoH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ri6qsvH0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IcGKOvoH"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663Hj3cl686440
	for <linux-tegra@vger.kernel.org>; Fri, 3 Jul 2026 19:42:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fk9/GLsPy9M
	HMLueq2DDIsdR8wBa5mOqZj4lU8apFQg=; b=Ri6qsvH0IQB7xkBldT85DbEuPR+
	V38c/QBjrTx3QAafrYlhGfVLLgywea6jC0l65ZPVm+U3OmpMLlZ2VV+buorCWD04
	bPspMhxpQP3PxJgSkqo5xItrUqIdk/3FX8SpHBpXs4HooIhx3sX33Vm6KIAIvuuO
	V+zfVc1wJpwX93k13QZzhz9J8673uBXFJQFPim6Amvhm2v5TN3gUh0UgLqfi+nD3
	BBivAzeFqowQTT99u2jDYsv71gJbnTCR7VBBQLywg7pl2+GwxpAmKoOyAAxYXYRC
	H0KctSWMLFGXaAlJi6ZSIXtE97kU1lZAseBWBP7EoFJBmuUPuQyLsm2DrLw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f64b5bryc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Fri, 03 Jul 2026 19:42:15 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3811279d51aso1611371a91.1
        for <linux-tegra@vger.kernel.org>; Fri, 03 Jul 2026 12:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783107735; x=1783712535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fk9/GLsPy9MHMLueq2DDIsdR8wBa5mOqZj4lU8apFQg=;
        b=IcGKOvoHGNcLLC80S7+++FQf2qzN7+JvLFj/+DYt8+QV/SBu3gx1i5wppLGtTGWcVM
         9bCaALUpOIYQ9UOuZZ8OSPWpXjF+BlpGZ4OFL7Jm7ZolCpa+GDRvLPlrakIsXppuA5gK
         w5lZSxky3BQUZAuATFICo03uByK3Vx/aM07KW3HohvlcaaROsRMVMFKZp0XTAHrgo7U+
         lA5lPecf3scNGy7X/4G0G1SAQoJ0aau2KPyjdzvfIxWwlcsvyQaYbIjJXHKss+97ZsCC
         8vmrngxQgqweeIL5VWkRn21an7vuI+fvyr2kK7HhVerj68bBl7p5z/7fa4xaBarXg/+4
         uDow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783107735; x=1783712535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fk9/GLsPy9MHMLueq2DDIsdR8wBa5mOqZj4lU8apFQg=;
        b=Q7BiiOLUlWkE6FYh2Nj4MFCQlRo3DxiaKzesN8t5RwycJwRXuAgnae/istmXhE1zOJ
         cbKwaaDu6nbSBbn7tgLLAhet0CJGri1s0raecgULfGwQSAb51jwx4WMJElVNxPp15eLr
         g/emB9COIbye4zHSyG3CXwi6WgaDXtFCP3B8BpAFSf/TJiJNPz6HYMuPuRpkj+g46BWa
         +QaQIgMwfgi0Xsovz/tA7KEzWkEyaONHFNIrluXMynHxdAuebClTLrPtIrVYK+kWdvEw
         WLYmEzaynRn91cdN/ByeoZhTlKZ4IxugIuecOO6lXxDnTxppWqWYPt4/bT5NdJ0TU8wp
         LXLg==
X-Forwarded-Encrypted: i=1; AHgh+RrjHii22qJE6jAathI5RGQFGaYhE5kKdnJ7h07PfHQgIxfrZ/zSzw31VMP2rZcOfcsGViNQ/VEubdZ5yQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6dgQXsQcwKSPgx2z08Sqsvgw6iAhoMC17uNbS4JAU71bSP9Qa
	25VTRfBQyI6MFtRJjjVnugmHUkQyTeZ0OAOu0j66jhpgtJi9x2h2Rf1RGGgqFtmWKfHXwdTe5nw
	Bl0uYau4k9e8lz15fHelAWMk27rtCcCsn120wU16cFlhD6EwjeySmMFbuVW/QSoAl2Q==
X-Gm-Gg: AfdE7ckhnvb8s+vkPwaJfKzsPPGzMCFiUHCBFUnQwk40YY6iLmHKx0miwI6qH5tV0MO
	RltRiyH/vYLS7aUyIeVQGwVBAh38agRKBxZv27a7g+eo4cSuWeOImWn46JI9JOam+o8BXT05DBl
	rlGPgHHyb2ML++QDt1UgjWTCGczcXxh+VcGMgE2t9qfBzHFwR+KU83+SENH4NGxWXaQ/VbjCuY+
	u7+g5Eac6X4VvBCAAYsEkmHODngRqYxhkfPai42MVwzbCsGqPXt4fRka4C++xfOCfQjBRKVqQ46
	A+TC8JlQQ3MnAJ6bxDrVFhF/7d4swYHREtshy7WDYE8xPrLLbjnguFqBQpv7Y9ywKilDC3OCH1U
	25tBwB9pcxZ0sG+IJp3zIssJcS9Q4z8U1LswnEQ==
X-Received: by 2002:a17:90a:d408:b0:381:854:dba4 with SMTP id 98e67ed59e1d1-3829e933299mr718670a91.20.1783107734446;
        Fri, 03 Jul 2026 12:42:14 -0700 (PDT)
X-Received: by 2002:a17:90a:d408:b0:381:854:dba4 with SMTP id 98e67ed59e1d1-3829e933299mr718564a91.20.1783107733767;
        Fri, 03 Jul 2026 12:42:13 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:42:13 -0700 (PDT)
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
Subject: [PATCH 07/42] remoteproc: omap: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:20 +0530
Message-ID: <20260703193855.110619-8-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE5OCBTYWx0ZWRfX/FH2sMgJO0tQ
 xVjU/JvstFUBmY3wCzxFhkjoo2qMvDx4lWgjhPI/cxTfg0a/K6CmRNSWxO0hnQqXdanu53jyEWP
 +/WvYQNKj/A+jtEhSaBPrA7HTowxfcI=
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a481097 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=NeIE-sOIGFWZl2hhsKQA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: ldZuQBNzp0ycvW64XZJsCsthBb_4o-vV
X-Proofpoint-GUID: ldZuQBNzp0ycvW64XZJsCsthBb_4o-vV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE5OCBTYWx0ZWRfX/TyXgngq8Vbf
 RVGqkbRBipcxI7daBRNe/e8KBQ7czervrrXUuEwX19PLhsS0aOwdsPjUNEtAJx95HvOEXzSAO1/
 slyhparFkfhbFGiry/enzXf3uEiHb3W9nahf0R1nIuX34p2L+1e6Pjgz+fohorc5NBTHiGBCeE3
 ND3PPJIBJ0o46hBvMt4iPWKnXoDa9fz7kl2cnBp9mV+mP4r9ukB4BZXBDriBHf3iVYRtqtDOGoa
 8uV9BzLuY/AL6y1Jlez0sYMteGxmsiLJgL5P0qXc6DTUsoPvUsj5ztFud1jD3pWgMWXD9HJkOqd
 Udlp05at2B6ecX7BdrQPVshAQkemiTB9CGXWBOBK8DBQf7Tc7Zl036K0xMOH2JZFHzWfD6xbkgy
 +KV4o/gaLXAELrkX8VjjuQqZHHBjY2V73tEWcrk3z+yOFGCMpSPGwPfGaZs7L7gvQ4JCP5oAVaC
 bvnYGDNRLfw+nwXIzBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030198

Replace the hand-rolled omap_rproc_mem_release() devres action with
devm_of_reserved_mem_device_init(), which handles the cleanup
automatically. This removes both the wrapper function and the
devm_add_action_or_reset() call.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/omap_remoteproc.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
index 6ed0f28edac9..74262f873d40 100644
--- a/drivers/remoteproc/omap_remoteproc.c
+++ b/drivers/remoteproc/omap_remoteproc.c
@@ -1276,13 +1276,6 @@ static int omap_rproc_of_get_timers(struct platform_device *pdev,
 	return 0;
 }
 
-static void omap_rproc_mem_release(void *data)
-{
-	struct device *dev = data;
-
-	of_reserved_mem_device_release(dev);
-}
-
 static int omap_rproc_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -1359,15 +1352,11 @@ static int omap_rproc_probe(struct platform_device *pdev)
 	if (IS_ERR(oproc->fck))
 		return PTR_ERR(oproc->fck);
 
-	ret = of_reserved_mem_device_init(&pdev->dev);
-	if (ret) {
+	if (devm_of_reserved_mem_device_init(&pdev->dev)) {
 		dev_warn(&pdev->dev, "device does not have specific CMA pool.\n");
 		dev_warn(&pdev->dev, "Typically this should be provided,\n");
 		dev_warn(&pdev->dev, "only omit if you know what you are doing.\n");
 	}
-	ret = devm_add_action_or_reset(&pdev->dev, omap_rproc_mem_release, &pdev->dev);
-	if (ret)
-		return ret;
 
 	platform_set_drvdata(pdev, rproc);
 
-- 
2.53.0

