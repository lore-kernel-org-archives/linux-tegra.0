Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404AC2D627;
	Wed, 29 Jan 2025 08:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738140709; cv=none; b=pvfDZuhfMi/7ETYiAxwGKeaOcWAr+k0DE1fTVMklIb0jRuH9WCIYJmhnpTXyeW46QNV34hRK5Ttl6ZJPy7vF6WMfY+JMCiNTz/4sRoKiOAf9oX8bFxUzD5HlNNx9z2t+YuUySIt51Qn5FD62OUm3sUcOPMOTsqdm//kVHL8TerU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738140709; c=relaxed/simple;
	bh=K4w3bUSNuMoGr2Kig4zaKtlQZ0vMGzt2g+mK00D8dss=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jz4NH8xiXCICIPZe0yPMsOnurEZSMQwuMpnxKEdbx4P0ZpEtEzE/7yZjlPTg5tsudjpwg7uD18SmLK7Hi0fveEDqQZ23H+d5AndiIjHL6wRAUebF1zXsDv8aDYMm55IW0t8QsmDcDUcEhg8iqB6sAGg9nmb87M2Q3ReKX3oqky0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=tMvjzHGT; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="tMvjzHGT"
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50T70Awj014044;
	Wed, 29 Jan 2025 09:51:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	K4w3bUSNuMoGr2Kig4zaKtlQZ0vMGzt2g+mK00D8dss=; b=tMvjzHGTjT58kuPG
	X0FNR92wGAnCeJMLNfeQFLG0aDfxwj/uiGbml2Ii/aOgWYwPzqCvNSKYu4GqOQB1
	q1zub79jG4YxfVTmRzRjhsB+0NFWyp48k9O6ZEYsIMKxNY2J/mhhgIeJ6OrLvqo3
	XiabZikb1wAXVUlZonEdRkJ7cBZsOTPLe9GSPXYeYVWaleVh0N8Kj77R2pgesZ7X
	Ga/mTCjDbvKDu4U8caR4kWuElNBbKqk0rjZNvInU3YgFQoW7db0zqsD8Ws6CJOHt
	kG5vTlESpG9lepXzb7FzZ9WgFpxyOQLUtHyCGovn59v9A9BRx26SxRnrp2kjgeKl
	zKhhZA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44f41325qu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jan 2025 09:51:28 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8809B40054;
	Wed, 29 Jan 2025 09:50:43 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8E0912ACA61;
	Wed, 29 Jan 2025 09:47:36 +0100 (CET)
Received: from [10.129.178.211] (10.129.178.211) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 29 Jan
 2025 09:47:34 +0100
Message-ID: <5131c24e-fb8d-45f1-9b1b-e65b2613e85f@foss.st.com>
Date: Wed, 29 Jan 2025 09:47:10 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/14] drm/stm: move to devm_platform_ioremap_resource()
 usage
To: Anusha Srivatsa <asrivats@redhat.com>, Joel Stanley <joel@jms.id.au>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Andrew Jeffery
	<andrew@codeconstruct.com.au>,
        Stefan Agner <stefan@agner.ch>, Alison Wang
	<alison.wang@nxp.com>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Tian Tao
	<tiantao6@hisilicon.com>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Sumit
 Semwal <sumit.semwal@linaro.org>,
        Yongqin Liu <yongqin.liu@linaro.org>,
        John
 Stultz <jstultz@google.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp
 Zabel <p.zabel@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Neil
 Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>,
        Marek Vasut <marex@denx.de>, Shawn Guo
	<shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix
 Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?=
	<heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Orson Zhai
	<orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan
 Zhang <zhang.lyra@gmail.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Raphael Gallais-Pou <rgallaispou@gmail.com>,
        Yannick Fertre
	<yannick.fertre@foss.st.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Jonathan Hunter
	<jonathanh@nvidia.com>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Dave
 Stevenson <dave.stevenson@raspberrypi.com>,
        =?UTF-8?Q?Ma=C3=ADra_Canal?=
	<mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance
	<kernel-list@raspberrypi.com>,
        Jonathan Corbet <corbet@lwn.net>
CC: <linux-aspeed@lists.ozlabs.org>, <dri-devel@lists.freedesktop.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-amlogic@lists.infradead.org>, <imx@lists.linux.dev>,
        <linux-rockchip@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-tegra@vger.kernel.org>, <linux-doc@vger.kernel.org>
References: <20250128-cocci-memory-api-v1-0-0d1609a29587@redhat.com>
 <20250128-cocci-memory-api-v1-10-0d1609a29587@redhat.com>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20250128-cocci-memory-api-v1-10-0d1609a29587@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01


On 1/28/25 23:29, Anusha Srivatsa wrote:
> Replace platform_get_resource + devm_ioremap_resource
> with just devm_platform_ioremap_resource()
>
> Used Coccinelle to do this change. SmPl patch:
> @rule_1@
> identifier res;
> expression ioremap_res;
> identifier pdev;
> @@
> -struct resource *res;
> ...
> -res = platform_get_resource(pdev,...);
> -ioremap_res = devm_ioremap_resource(...);
> +ioremap_res = devm_platform_ioremap_resource(pdev,0);
>
> Cc: Yannick Fertre <yannick.fertre@foss.st.com>
> Cc: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> Cc: Philippe Cornu <philippe.cornu@foss.st.com>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>


Hi Anusha,


Thanks for your work !
Acked-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>


Regards,
Raphaël


