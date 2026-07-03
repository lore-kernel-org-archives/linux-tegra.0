Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909D4320CCC
	for <linux-tegra@vger.kernel.org>; Fri,  3 Jul 2026 19:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783107955; cv=none; b=qImzyRWzk90U528kVOXH+bihGSU7sxU3Ivi5e7ry/r6cGUqcFiLHgsAJTJafheZl1Iv7NoCMi8fjT62RN2pz1QiI1QgT4Advx9Ty8D86C0s3HTKtWJJEqjh/mFltEGaBCDMf2IRhBoi3sWTfztRkKL5/3UyRHBEfjH6MKjA221o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783107955; c=relaxed/simple;
	bh=ce4q4N0ozbFmR4Y74MqhyD63KKGOf5CRYn/pTXxHINI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UiY5sbz69E+eFyxfsunw0smWJbcuaIVKpdqRWyvWel7vQRn+zSEOtPkkVEZfxZbOFGKVSNNhANsR2bixdd63PlUPBF7HXvm7pAXeae3jLUOvWE7MgJ3TKkPccMHDVpR48DNzgGHWztC7B8tBKq6jkx3yobLf0X/7k0VVBlwjdPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gb5iSDap; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OJiwmkL0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gb5iSDap";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OJiwmkL0"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HjChg686578
	for <linux-tegra@vger.kernel.org>; Fri, 3 Jul 2026 19:45:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=j1lwYspU1A2
	U5EbbDH49pPsamREmL4P/yJyzYostlIQ=; b=gb5iSDapMq7o3MqL2/LIqb33K3g
	0Pdzuw6XKQM0a2+QFEDOC9CiNfibenplvyPz8NZeAhvpQA1nFugJk21ANwSvLc/X
	ieS7pEbmZLoneOlPen31kwzLe/6r6y8sac/YejEQzsE47S6jRJpmO6RcLHfi1cf9
	Jn1LynpmVilkwQTPBjEw/Zf7dPvwiTFQxtshXlMe83IJNx+CllsXSUTdrF9wRBjy
	SHzGnjWSCQ8Sz/15QC2dKRXMO3DdtOyER5uQo9gNk66TBLFTcuPHHi7uxyN6EloY
	h1vTF59Kptrbasun+lVb/DJ07ylnu5F8XN1GIDgzYC3y5WYifMMJIL7a0qw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f64b5bsdc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Fri, 03 Jul 2026 19:45:52 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c85798977dcso1237175a12.0
        for <linux-tegra@vger.kernel.org>; Fri, 03 Jul 2026 12:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783107952; x=1783712752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j1lwYspU1A2U5EbbDH49pPsamREmL4P/yJyzYostlIQ=;
        b=OJiwmkL0b5F3pddpTySmkLK7xDLjHqzj/KLG0Q9l38L+pFCJLFIpHEqesGY0+Awn2A
         CVRJtoKnS8TCMRazpCLU93Frx724ZJKxuAK65hM5eDc2Eki3N8Ddns2IwdzEaOTkssMo
         DIRfiwKY2lRRTLUHsCMQnUrETAS83ReKqb13XE3WDjf+L/M7+vXmavamNXL8acxy/nE+
         NRkxpCIRmx60NmCxf4SOzvp2thtDJrJVLhpSV2cq4khZuJ3wk+rbr+izL9ui3QN+Dz+J
         sSXH63ylDoLwo/B4uEXqpWgobMk2dxx3n6H3V+9atQlU/NMWjsHIgubgUYjk/PBV+BGs
         rztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783107952; x=1783712752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j1lwYspU1A2U5EbbDH49pPsamREmL4P/yJyzYostlIQ=;
        b=btQKlAqtLgblz1F2Ey3xpjn4vYfJ8niSXJZ2B+gasJARRtSdXkReNVY327BIuAsZsZ
         vmqSKKouAspdTmuBz1GQqo6mWdMExIrF9xU2VigGZYeD/SeudIRf0kM1DqQR9l7/Cs57
         WXUVC0y9oX5EDy1O3PdWgApKXJpj9ni2YRCT6ltmcJki9bQDyWBfGxL6h/x6xEOfd3e0
         /CZksT/mYWW98r+M2rd0GAzUwFY0Kkk5Vw+s6KzIwEmtwC3GU4DLvxL3xu845+iMRgW6
         JUuhN0Pf6ki9bwEcSCfnZr/RNXEpIuud/jklfcovzGy6Miyi2OL0lRO8FEouteTAhwy5
         dCHQ==
X-Forwarded-Encrypted: i=1; AFNElJ/mPo580LTbNwrFsUvzfOqDXdBrkuzbWZsYnXck64CUYCwBtqe6u0VUqvriha+KFGDLx3RUBxKJ4HCrRA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx23Eon+KY60/aIzXl+gNOxvWstwyoDbaHHZ0LpSKkvGffcoDXZ
	DbT4mbwS2kd1HgcWtjJU9Ul06VEFr7dNulnR/g5Y2RKY+hU4GmB0c14XQC6u4AejCFfCdmUHvv9
	FNR4q19zZUXAh6jQWHXA23Kco9f+Lh78knKqgES7Ye58QGG4I8NQlw3lqPfCB7x1j1g==
X-Gm-Gg: AfdE7cmKFKYuH08Psjxsm6lW04J21/1gnrgynAd72ty89OVJ1uWSg/H3w+RsVBs0E2x
	f0Mqv85xFu8AIirT1ZnGn7QqEBpJ30KRzCpr8rUyhSR9Nimw4ObBSMMZ0bgIbU8jD5ZziX8jEYZ
	hEn5u10zkfOcMyaKrBDhXEoMrcx8Dt1xRBSNmwrSmMJMe3ZfGv2s7xt+fx2/9FNSmp6QqyzW4rZ
	12ge5aDV0rFlkZ+X+YhfQCdx9lNSk8g88Y90QHUVxqohgINlA7vRWizm9YXUVeDA1skE8yx8b3u
	QBCYp0EYuo01ogL4J/iUI+U72wgcky3AuPJh+uwswN8K4mMzffeImTQBZN46atkCknXKGQBBtGo
	RrkXS4w4LNBQl69b4Je2LIK95uARnR+lOuyu9mg==
X-Received: by 2002:a05:6a20:5499:b0:3bf:6c08:fb85 with SMTP id adf61e73a8af0-3c03e50d4a8mr737329637.53.1783107952135;
        Fri, 03 Jul 2026 12:45:52 -0700 (PDT)
X-Received: by 2002:a05:6a20:5499:b0:3bf:6c08:fb85 with SMTP id adf61e73a8af0-3c03e50d4a8mr737303637.53.1783107951614;
        Fri, 03 Jul 2026 12:45:51 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:45:50 -0700 (PDT)
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
Subject: [PATCH 16/42] drm: malidp: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:29 +0530
Message-ID: <20260703193855.110619-17-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfX2xVnjzrlJ+GC
 kg2G730Rhxp4+izZoKF5kNW8f1pby2cRNpHQjd6TL6/V0zINsC8rHTK1x0m/QSBH9zhKsROl247
 k6ykwEL3OROrTdcNCIEvMp+4qKlxE04=
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a481170 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=JOjAg5lxkONN77W759IA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: rUaDYTxWnw2jpBmJSJfNcKIegLrKKE7W
X-Proofpoint-GUID: rUaDYTxWnw2jpBmJSJfNcKIegLrKKE7W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfX40sPLC6Fv9cS
 eZRPmO5sgF0C9Ub3T3cpPpCPqM70ZNLL0EfE6oGY+ezbF6F8ev8vs9M/GFzmlPvhnS45P/0uHVR
 kJyXcYCX6onNSnVzO7n89xkzsI4AlRBac/cK11Pn9OGE7xKNh5hQDq7tH9yo/dTa9kgZBeN/78v
 PL57TUdJ1D5TCgPzm2vYADuYfEZUvtRd1MV6aXcimyL5ncFQGnM+OU1QzMTfKnyJZXMNBmjhFba
 XhjTzWAngIXHzHRCUJLZS2R0gCsGTya7xoHyR7AVKBj89sjdKeOvy2PV0eGIflzZu1pq3P3EnHA
 HkoIohO2jREuVtnKItrpYc3Qu/4dSMS7PxvGu/ftZ2/M8imAwCYNGn/Iv3GCFr/hktgWDJNXNlR
 kAqwhLp8v8WKldvJ4AqRIGbBPQFvUwU6sgvyyABiSeHtJ3YDN6SDrka1IDFtThgJDuhfIttBmrq
 +jzIaFjzglLHP1D7e4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030199

Use the devres-managed devm_of_reserved_mem_device_init() instead of
the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
pair, letting the device resource manager handle cleanup automatically.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/arm/malidp_drv.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index 23fa942ae4bb..3e17513c3114 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -758,7 +758,7 @@ static int malidp_bind(struct device *dev)
 		return PTR_ERR(hwdev->pxlclk);
 
 	/* Get the optional framebuffer memory resource */
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret && ret != -ENODEV)
 		return ret;
 
@@ -887,7 +887,6 @@ static int malidp_bind(struct device *dev)
 	else
 		malidp_runtime_pm_suspend(dev);
 	dev_set_drvdata(dev, NULL);
-	of_reserved_mem_device_release(dev);
 
 	return ret;
 }
@@ -913,7 +912,6 @@ static void malidp_unbind(struct device *dev)
 	else
 		malidp_runtime_pm_suspend(dev);
 	dev_set_drvdata(dev, NULL);
-	of_reserved_mem_device_release(dev);
 }
 
 static const struct component_master_ops malidp_master_ops = {
-- 
2.53.0

