Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA9F331ED7
	for <linux-tegra@vger.kernel.org>; Fri,  3 Jul 2026 19:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783107786; cv=none; b=Uy1jOCPNWErKPMdbByfE55xKyYDgrqCbKJdYbuTS3DY0VILfCI9oyksWnESsXlY7HT+f77PSn0jh2p+wlOSdj0RVOpNBT3lhz6DcmoY+kZQl0jajSVEzi/Cq78iN/DrOgGl8qJV2IzmzjMjbf+m/+KHWVufLq2PT6YoTzYcySG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783107786; c=relaxed/simple;
	bh=EDsJOkMjiYiz6OkhRTOBP+Vv9glaMIUvzF16vJsaLys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rMexW0JQ/YRZ8PYvNx191EVvNgdEObBx6NFCVG4TPnrDuTYofZJSfiYQ+VG+TdxCC58ge2SDDNcAMZO6G6BNOh+3CvcnY5gldZO5pQ0rsfWcIW1RTVW4vDm3i0SBv60I0K4ayYo3x/3mnG2cv+wFc4tjMMw1rNUU2yE+6Eu7Tts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dBy/JQfo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=duQr2h9T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dBy/JQfo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="duQr2h9T"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HihVL547021
	for <linux-tegra@vger.kernel.org>; Fri, 3 Jul 2026 19:43:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Z1EEVIKsLJK
	Ugc5TxRSkb+8QfAsvTDn+685DsfCzyOg=; b=dBy/JQfo/vmPcUgd+SG5C/HFppQ
	VQPpo60m5XuLLe8IZz9VmkujdeOWKORaedTIbeEBXY3MrqaFrb5buG/dtNw1flVa
	gmLIGrbmt1RBL2AacXvRap654MDBA4a6SeaUuliy+gHrr788pt04eMSI9xpgs33+
	R5AZgG4+5VHgVaE2/+1DnI3BIA5lvOsSyAeCDfw9UMvsglqVfpNNovb5N7PeoTwg
	ln+ebK3WQ+ukRC6+S/3BEacZiLuSKmeNDsLRfTMLfQIiHJVlcehaxynQlPbJBxiI
	lA6TlzgWIpcuF6cQsHlG+pIWLBg20HuTazq1cz/Ht4OmvhKuWxEpUIEngyw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f67j02vjr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Fri, 03 Jul 2026 19:43:03 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37e24235ce1so1245527a91.0
        for <linux-tegra@vger.kernel.org>; Fri, 03 Jul 2026 12:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783107783; x=1783712583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1EEVIKsLJKUgc5TxRSkb+8QfAsvTDn+685DsfCzyOg=;
        b=duQr2h9Ticy2uQDCb8Ub4gcdN31PT7fD/Q5vPMc8pJPKHPLwqotNqvPS+yJbzss4sm
         symuZgxGS23uqjxGs2o5RP+K9iaOXnPsfOUVCJPC1NrwdiMPSz/jODGif0SQG3Xp9Sdo
         S5EB1ETlyP2xgwHVoN6gebZWJGGtLE1ZujzHspyReMewOR1XPo8kGHHmCPGo+kbG0FKC
         U/g1G8vCDKdTG04Hgy6t9R2WlvwY8JNBTq6bmnQx15rwWecyAktn09SQBWbV5ifoIrrd
         o6wbhuDfOnx9T9bQ8SN0CgYbbk8uNe7K/3pQ0wLDeI275Vl7vaAKl4g5xOjui7t1+q1S
         Mn+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783107783; x=1783712583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z1EEVIKsLJKUgc5TxRSkb+8QfAsvTDn+685DsfCzyOg=;
        b=ppMWIcGQis+3JztVVpWhjXWaDpP0jHv9rJ6/FAADaKzDzr5UTFsGeW4meMdbxaYvTL
         9SIMTwlm7tFLAayVhqXdDvnjA6qOfId1G+7MeMHtCuigP9lv8H3Il/0tBxPrPlpAdOIj
         KXNjIxW+9kWp/JYX1KgNorzV5Kl2vhLLY3ihKEQAQX5KnzzJro/jFBTMqZ4w56naBljS
         tkakwyMeClY+wqyZHZJfG86expZbavwGlpDfD4WEmXXCuyzhz1Jt3jjaZtsDkzv+Zkpm
         no+urGcEu8WL/HTF1AMgiCAxp17OorwxcovWVevcFKsv1qr+74T85FBreFLJ0w0YOdIz
         LyKw==
X-Forwarded-Encrypted: i=1; AHgh+RoAqldv+EpWZ8DY6gmhJk8PTDSSX2y5uKJBMODF34IoxbjtZqtYxGiX6D669XBTFl3YjoN/s8nqJbcw/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxrKU7vzx3KURu3pGnFbxpdrwGFnu9nKjdNsiaBJDAZL61otoK
	gLIIpiUWncnflL3zLatQkzniwwCKJ1tcFqrb8t8ic8h6SKqLxtImKgoKWZiqlQf3qwQvPzAXNs1
	usesk9gW5zUTyGNO+70nY36XJRx7WwKO+S1U7OPt9vBmifgIXyeJj88CiAQd9MawBcA==
X-Gm-Gg: AfdE7clxJ28E82vVMLYQx25V243gS6eu5t7kfDY1pnVsLSOWV7lBOyN7LUQi+Vf3aOc
	ozd11pRv6Q4XVdfcXJL5uLqW7W5v1WvNltTVXyP1Rktk6vXRSVRWqelZa1ncs2xlJ7ZVnFsl3lc
	4kcvkFkrUbcer6lidAxleeZIswdBq2+/Muf2FeLviFFuEj2hbqZlBwv6X+QYZ336Gvuxynw73PS
	RS7qR0StbnF7U4LdJomQ3mMBF3QgbYHc2p/s91evOeCqF8vk3cyHm3kfiRoO8DzL2CGZ1u01QrC
	lYVhohqejGG1h+70Cgc2qlg9B2iNpYkoWrDO5R7/Luott7Kc65Ut8gUkhdDv4J3zyR8Ag7Xx5lH
	pjGcmP4BL/iKryaUquzJfZNm3HWYtn3rHcoGkgQ==
X-Received: by 2002:a17:90a:d40f:b0:36a:a16b:5f6d with SMTP id 98e67ed59e1d1-382807aa1b0mr732933a91.7.1783107782567;
        Fri, 03 Jul 2026 12:43:02 -0700 (PDT)
X-Received: by 2002:a17:90a:d40f:b0:36a:a16b:5f6d with SMTP id 98e67ed59e1d1-382807aa1b0mr732847a91.7.1783107781822;
        Fri, 03 Jul 2026 12:43:01 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:43:01 -0700 (PDT)
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
Subject: [PATCH 09/42] drm: hdlcd: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:22 +0530
Message-ID: <20260703193855.110619-10-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-GUID: S2BUsxXBM9FfmL3MW9XVcR_htqfiLhYS
X-Proofpoint-ORIG-GUID: S2BUsxXBM9FfmL3MW9XVcR_htqfiLhYS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfXx1ahWAoZ4W02
 oBgNTsNXVVdZ4sG7iWUspJzWhaC2qHQq7N4Af303N4ACxHb1bwY0kR9X6plJZ9N+w3Nd3BLaoId
 2Wi3kkqyTrgedei8GrIBy56LrHDNyJI=
X-Authority-Analysis: v=2.4 cv=Yuc/gYYX c=1 sm=1 tr=0 ts=6a4810c7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=zu8Q1U5i7KxegdXecekA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfX/7ZuFLYDMtQN
 C0jHnAi7G3kcuvBsiGa/s88ONSsWInzWHXlWyhqKR+C8YPQbTjqhMq5DSYQV+U263JAORW+g+FD
 ZqBmaxPr5HMVuDURdPfyMgiAzNKLs00D9EmfidyifGgOl9qeIyihNrrXUCU+GYXCRceLduuS1GK
 hun8RIIvQH9XObqP7XFoIPr4Ge1WToRQgQ1Kicc6Wtt5DgzjjYZ3mLIiBE4N7XQ8ULZcP173Yna
 1DkMS9Q6QthLAMz7YpZQGYI61yM0hnhAhE7s7X0IvOinkJcJAYq+WFiwmMbaPJTzDDy+5uyqVYL
 QP8fhNnSs23VqL+UKuKPZ8Gz0Ghn7FP8BmdJeXHCFL6wQbRNurALnTbFbkzYhk1QQab0UjMcl8I
 HwS/04LGPh7GPmBqczXJpS9no711syp6uDVxSBpBJF31WV+tDvyFbyiQlorP/s1QnL9JFhQx66c
 q8eikxTilLtfJi8MAFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030199

Switch to devm_of_reserved_mem_device_init() so the reserved memory
region is released automatically on probe failure or device unbind.
Remove the three explicit of_reserved_mem_device_release() calls in
the setup_fail error path, the bind error path, and hdlcd_drm_unbind().

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/arm/hdlcd_drv.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
index 81d45f2dd6a7..67466fd441d5 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.c
+++ b/drivers/gpu/drm/arm/hdlcd_drv.c
@@ -134,7 +134,7 @@ static int hdlcd_load(struct drm_device *drm, unsigned long flags)
 		version & HDLCD_VERSION_MINOR_MASK);
 
 	/* Get the optional framebuffer memory resource */
-	ret = of_reserved_mem_device_init(drm->dev);
+	ret = devm_of_reserved_mem_device_init(drm->dev);
 	if (ret && ret != -ENODEV)
 		return ret;
 
@@ -164,8 +164,6 @@ static int hdlcd_load(struct drm_device *drm, unsigned long flags)
 irq_fail:
 	drm_crtc_cleanup(&hdlcd->crtc);
 setup_fail:
-	of_reserved_mem_device_release(drm->dev);
-
 	return ret;
 }
 
@@ -316,7 +314,6 @@ static int hdlcd_drm_bind(struct device *dev)
 	of_node_put(hdlcd->crtc.port);
 	hdlcd->crtc.port = NULL;
 	hdlcd_irq_uninstall(hdlcd);
-	of_reserved_mem_device_release(drm->dev);
 err_free:
 	dev_set_drvdata(dev, NULL);
 	return ret;
@@ -338,7 +335,6 @@ static void hdlcd_drm_unbind(struct device *dev)
 	pm_runtime_put(dev);
 	if (pm_runtime_enabled(dev))
 		pm_runtime_disable(dev);
-	of_reserved_mem_device_release(dev);
 	dev_set_drvdata(dev, NULL);
 }
 
-- 
2.53.0

