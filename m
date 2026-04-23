Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42F83ED5D6
	for <linux-tegra@vger.kernel.org>; Thu, 23 Apr 2026 12:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776948126; cv=none; b=NcmFhyKp9VnmFVhpHnV0fZM5KpJZvY9mk7WXtlH1QYTXs3mEUjQ0CwrXa/c8wcTOIMme4xDESWy9fhgLI8helNFmoSCo2FBnfOVo7BCRjCe43U+G9a+Wy7tNCMPBTDXhlP9vyqttPC6DZ1gQqW60G3B4n9YaqQkX/C2lluWcaNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776948126; c=relaxed/simple;
	bh=KFmSssNsWA8OewITIm2Bsw9eL3yfUkRv5r3J8c4woog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sdhByJTSd1UtAthnlsf2RmXDFnou235ewDHGuDsksUcJCb7ZWxEaRe+rdYyP56eDL3/Q/Qw0+7G+HLgBGBotD/yP+YS++kxpR0uoDRHIPSuBNHxb/X2mfJBIoN222fCwCG1nL+i+J8DRiyGn8ioxV/RdNgglwJGMwaxCOCD9D6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eC09PN2i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GneipI7q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eC09PN2i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GneipI7q"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uLow987837
	for <linux-tegra@vger.kernel.org>; Thu, 23 Apr 2026 12:42:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nPbpkNj9ABhjGDGvKynwI0Mf
	HPrmaa9hsgMYHe0+7+Y=; b=eC09PN2i24nCZriljMh8JR/1ApJQAbNzTeI0q3AJ
	ecYJiOJZrZDmKs0KMclx5mM5sSs8rMozaTP5vcHDvT6EfMr8LxW+x5nNByuVX5p7
	0uUBmLUzk6EA4s/nXj7aqxxQ1tinWuC2x1wOaVAMZq1Sa2VVoYq1weIuCjZxa3tu
	rhcKGUnyeKVxQZozsBCCOeMugfw36mfVVMH3UPQW1yW5HYB/X+81gylFHiXPKmkd
	tsh9Aj5mT3OOS8YrlxbAJ+oZ/Hnm54MGwRs0gB/1MQOxg9xz6RvZyFyFinuqNOR9
	QAshNI31RpsjkNwnbsfUoVnHp16VxLx0svestX6bUeFzVg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq16q3ys2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Thu, 23 Apr 2026 12:42:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50edf0245b0so93914831cf.1
        for <linux-tegra@vger.kernel.org>; Thu, 23 Apr 2026 05:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776948123; x=1777552923; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nPbpkNj9ABhjGDGvKynwI0MfHPrmaa9hsgMYHe0+7+Y=;
        b=GneipI7qlLytdTsdPt4obyzUD/iiUY8fOVnifW4n4TSvgKVLY7UMvRR+QD6EuYoI9r
         VNoE3PtFQd71tAJ0sqzuLiu8ia+OAAR6GvVbH9smBd+br+Cjjg1UKzGagqJexnhXCvrx
         q1Y5GiZsh8MxxltKeUa8pCKXSNBUs59lAIPdU3pLEc4/zUtUd/NdxAeIZTdJ4Vyty310
         7KMeUUTKZUAr0BBSGPMmVWb/bTEIEmk4NA243IRgHiiWtqI7S/Dev5JNUGF9AxaVw/22
         9LRqPMSdcDeANwpoInUyuoXwXqXjxnH5V1pEbvn7OsHe85kjdntGgP5fOy2tnizZIwqa
         4WMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776948123; x=1777552923;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nPbpkNj9ABhjGDGvKynwI0MfHPrmaa9hsgMYHe0+7+Y=;
        b=iXsxSxF7MyGSCYE4WyoSYLpQnkoBfsC4+NRe/l+ln0AFz7AoMPI/GKdDhd2Tj6ctUA
         BPGXnhtYRYmDTNypg43UFdhbeNy2DDyccsIBu1d6e6QvM9AHByJOfBgwHw4HUp/AsgBs
         +c3OIu1APBE235+XhA8NZncivJREw+iDALxrj1WQEP+bOxVfu3oA+MR8RWwgoLzY7S9C
         N3QjQZvtkSFY1DNVqYw/NpJmHB6fxCjjBFTjnUEIy7nrOoru3w/qdZ7jzTsjvrRt4CdA
         pLPUqeVp7SryxHrC8SuoW3SP/4SxeHsW7rPu+nQ759UxqR+x98nBg9kU3hnojmrinnrH
         bRvQ==
X-Forwarded-Encrypted: i=1; AFNElJ8yvye9GhKJ9wViquzaNumkv48QmUw1xc0NhMBRpTQKWc1QlXiLaDdO+dkW3jONyJ2cGkCgSVIUwoDZWg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2bZJz7oBKV96Fr3Q8UUbdQ4GItT/hLjiq3VrKfDBklqnDmkZq
	+AuXVK6oNExmCO2J4slAHBqckO+8drMK5zU1p0tUPDQ3QxLgRjdAQ0D285EPXdjiP8vnEjheaGb
	h4QMhsanY6P/G0UPoMHJRlP7ROWy0YDaxRLg/n+SrzmpbLuhp00HVzkQzdc+mMxtuRQ==
X-Gm-Gg: AeBDietMoXseCYAVIyd23OkeOYfc1q6292XnBAPVeS4EihmBxWvU3XUNjFQCeWFKkqR
	MLr+p4y8nMNZEFKAfAmOHR7W/8bNdH/Xz48gIjLIRl6+WswNs2TodpP569TB7zpnIypKscGZgYl
	4rDCdrSsTDdQh+oyDPTb70dSAwl95t52fiUfh0hUOU6FWXQ7+BeTTMRXvuAyUy02mWWhz9FPCyq
	gGEha8y5u/Vw1laTz1OU6rppe1SUwfP1pqUXijxObOPcMbSHRNH+/2CUgJXd5E62iaFoZ4YfoWJ
	rMMR3pJDCk8oIpKscv9edwDBFUxfbZEQIiJWbXnSNcRs/AK1LjfybvzR7IK9nSesK8YGwoPn9/u
	shMhnO5dR9BDYtbhZPkfzYWK0UbOeNBNLC3VV8pPGLVcMWUzyaZiwL4hQI4Ns4+nMirfyQzaISj
	8baUyNEIqvzlKRDQAUoHujWp+qNPWyPJxlUrwi68mkn+WFIg==
X-Received: by 2002:a05:622a:17c7:b0:50e:89e9:271c with SMTP id d75a77b69052e-50e89e92b67mr230996901cf.17.1776948122982;
        Thu, 23 Apr 2026 05:42:02 -0700 (PDT)
X-Received: by 2002:a05:622a:17c7:b0:50e:89e9:271c with SMTP id d75a77b69052e-50e89e92b67mr230995701cf.17.1776948122428;
        Thu, 23 Apr 2026 05:42:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc240sm5134146e87.23.2026.04.23.05.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:42:01 -0700 (PDT)
Date: Thu, 23 Apr 2026 15:41:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sasha Finkelstein <fnkl.kernel@gmail.com>, Janne Grunau <j@jannau.net>,
        Liu Ying <victor.liu@nxp.com>,
        Douglas Anderson <dianders@chromium.org>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Cercueil <paul@crapouillou.net>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Icenowy Zheng <zhengxingda@iscas.ac.cn>,
        Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>, Marek Vasut <marex@denx.de>,
        Stefan Agner <stefan@agner.ch>, Jyri Sarha <jyri.sarha@iki.fi>,
        Michal Simek <michal.simek@amd.com>, Hui Pu <Hui.Pu@gehealthcare.com>,
        Ian Ray <ian.ray@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        asahi@lists.linux.dev, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 19/41] rm/rockchip: cdn-dp: remove now-redundant call
 to drm_connector_attach_encoder()
Message-ID: <lxwchrttkseoqo4e2njsyvpgingwymabvgoqh7xmwd5ysie2dv@v7t5q4qelqen>
References: <20260423-drm-bridge-connector-attach_encoder-v2-0-2ae6ca69b390@bootlin.com>
 <20260423-drm-bridge-connector-attach_encoder-v2-19-2ae6ca69b390@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423-drm-bridge-connector-attach_encoder-v2-19-2ae6ca69b390@bootlin.com>
X-Authority-Analysis: v=2.4 cv=KPNqylFo c=1 sm=1 tr=0 ts=69ea139b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=P-IC7800AAAA:8
 a=Gxjqsh2QC4DOxsvvGYoA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: 2tHjq1YSTQ1nWOLXNcWnovxzz5KFPjT0
X-Proofpoint-ORIG-GUID: 2tHjq1YSTQ1nWOLXNcWnovxzz5KFPjT0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEyNiBTYWx0ZWRfXyD6WMCsHkSw2
 BzGZkRMDWkq8lkng7U49+5hrzg1t+U+dRcK9BPUcJS3kGOg+04Jh2BCRaRcD9iFWjIg/TiLvj/P
 DPTxtTGfT4/E6aIQnubnz7IggrCTpnBelEaLaIh2LZtwmgS+fgrhrW+BfeAWHsi/DOysyaNxmhj
 vHoxTQab/CFgCbnyFepcLl++o6nE3W5Yc0tFXYWalLxfgcooqs/GedZDkH9MMU+78aQHW6Syr1Y
 KE+4edz4MN8OOReSK+0qPc8i4dlnvOg7v4cOd1PkEWyB8hLhVFL3+rXCT3czyM6e7QhO9gHMOCE
 mrtzbfEwsGfiUy8u+yjLRTISh10JuWFv4/kJJJbncx5cIKMVmGoVxpWScRO3YK/BxhTZA8Japcb
 nd/pOiD651Ciz4jSWiRLPgkprOMmnofNo8l3ww0Sv7ChtcTNgzz1XQ6Vem4YPJnP3DAMhBAA8DP
 zlPbqTpWFR0EBM+LWNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230126

On Thu, Apr 23, 2026 at 11:17:13AM +0200, Luca Ceresoli wrote:
> drm_connector_attach_encoder() is now called by
> drm_bridge_connector_init().

Nit: there is a tiny typo in the subject, but it can be fixed when
applying.

> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/rockchip/cdn-dp-core.c | 2 --
>  1 file changed, 2 deletions(-)

-- 
With best wishes
Dmitry
