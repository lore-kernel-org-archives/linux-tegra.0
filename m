Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8328A2BD5AD
	for <linux-tegra@vger.kernel.org>; Wed, 27 Aug 2025 17:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756316458; cv=none; b=KCx8Nuq55cGfGyIs8Z7ElRfQL30tSt1dszO1eneqao5sFIzB/Dy1JltitKdauu8lZv/GfG9kUL6J7sGcdJi3+JzHz1mtLUxcUzJE1R3fqBAsJ8b01uFmE0VA88L3lLjzV0rrwA8PY2dk+oyIrP/HwxYk52b+M86ZISiv13cmWSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756316458; c=relaxed/simple;
	bh=8mZSXa5tllwYg7Vri8XTHsFCezJ/LPItoC8qISf/FQg=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=u8X7dsJdRtCRazXHmSo5739yweOcGkC/ZG8Wf72iIzyGY9vaeMd4V2hRK/96mWvs2N9DZ9xwSt98AH8ELOL3mKd94HUsaMd29Q3IkJqWasF49U8oPOBqp3V+a6hwjbDbDMNIE/+BNbjERR8Ch+WQ3y4sNuwhFdnrMH/KsoeuInU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aYQoa5Tq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aYQoa5Tq"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57RGB8Qt027484
	for <linux-tegra@vger.kernel.org>; Wed, 27 Aug 2025 17:40:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9pryiKbesf4KLCmykOzJgOnqNMnr4CU7A7f1EXmgKk4=; b=aYQoa5Tqtc2tN8AL
	iq3IQTavdCc6+N80wDp9/1ryQ6rtURE8hJYJ1JEf8GeMDt8Z57Ye+hrSjWGiS71g
	dhTRly7ADDiCbZ+3yuhupKzFgyym6AZwAcOPdPXs4ELX8pirZMJET9j7BYqPdz6F
	ZDY3xCJRWorp+AKCGAuCK09e4laJy4I4REdEF1KxFyiaKUObIG+jnZSoOJ8hsS/P
	20/Lf4vNVU0EKTh1RpsR1NuG7UbcbDM0y4LlPFN3ItahZrHzGcEe80H5Dqu1duk/
	fYwIxae0xwk6pCPszhHTrzdgVA9KKBlKZFlMQ3qfiDI1b8OwiDD7D9G8+1hGmZRi
	jBWi7Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48se16vgk9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Wed, 27 Aug 2025 17:40:55 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70ba7aa13c3so5414536d6.1
        for <linux-tegra@vger.kernel.org>; Wed, 27 Aug 2025 10:40:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756316454; x=1756921254;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9pryiKbesf4KLCmykOzJgOnqNMnr4CU7A7f1EXmgKk4=;
        b=VlhvmkqIpCXTxL6H0GHsBcb9RUxCUcTxCd75n6xiq/fX2VYxkkAazE+nWNY6zOh7p9
         zD4sdm7p2dzVnR4GbFz+VguMA1G0jhaZpSd02eycSPhg/BU3VPOv1DAbnh15S+kDEOCr
         n32bGg+Khk44OyOJjBzR+/dsWFhrglllPQGSh8OGOpNh0b6uRX4EtfPZrVlsQ3MhtoDU
         2R5YXXfvNAy1j4Bq++jfPlkR5mDDu4i0ogsnkv5ocSBCgs8Sc36XMKkAUuAC/y/XkhkA
         sNmEtSvifZ6T0ygUruWpsJKh6zEu56EWYh7GNfffuyh5kOiYhtobo/k2URXvA8yCCBKQ
         hxfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXtEtrni70A/w399o1B7Z85egRI9Cud+yHIP3XC5/xLUGMAsaIyShfPbv7PvzzONRU/lEwy5iHQQqfsw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu4tgWKtRC5Ue2XBqJQBiCd1EGPcaLeMTEASI1uul44a+jLeJr
	FAu17DPZ/TtkVttZ0pNF6TzuamW2uwxxrKJuvvZQa6Oxav4sy2+wLr/+JmJy1rBWU8U+FdYYOJ9
	TKp/lHTLa5W6p1V0pE6aaxYD4y116GtYN03qZHcjUpu1BZcActsub9ebT7F7AvD8c5Q==
X-Gm-Gg: ASbGncuXXrfFcSFQtXSQsK2BqPkuT9nmhlJ77QmH+Z+BfkhjBCFGgfmLV6m82qhv51v
	50VRWz/39KYyy5auai9ZJYFlCFAjW6My1tYmTZzH6UHgy1P72MkAOvZ5M9sRjF4/qeQ77zuCQpK
	+PW5T16zaXY9wZHm7HZByUhOE0+e7ZR3FxuvAMgUc5TSpXkY+iNLGTvQxPDqjGB1xETgaKkmzYk
	BbkdFE6bexO/HYfQ7DjOK4H/fzuVNge6oviWWHWdml9hqs34NdNGEFw2UmJLUWEhD2dFRuDoIQl
	2lXPmRvH0b2ux7ICMickRvVbz6YsQ6tdjFMVNNJLikqdOwQaBohNLqnMBh63e8CwXfGlsmLBWoY
	9j8SXnGEi+KllpbWwTqdpNg==
X-Received: by 2002:a05:6214:27c1:b0:70b:5320:d416 with SMTP id 6a1803df08f44-70d970cd29fmr238271576d6.14.1756316453902;
        Wed, 27 Aug 2025 10:40:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhCi0u3Z5H0bwldj3p8+1IvfpKHSh571vUpFu3K1OKrspl//SOwGcmP4Yk4ANptZX5dCndsg==
X-Received: by 2002:a05:6214:27c1:b0:70b:5320:d416 with SMTP id 6a1803df08f44-70d970cd29fmr238270536d6.14.1756316452731;
        Wed, 27 Aug 2025 10:40:52 -0700 (PDT)
Received: from ehlo.thunderbird.net (85-76-46-56-nat.elisa-mobile.fi. [85.76.46.56])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3365e5aa917sm28124531fa.41.2025.08.27.10.40.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 10:40:50 -0700 (PDT)
Date: Wed, 27 Aug 2025 20:40:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Louis Chauvet <louis.chauvet@bootlin.com>,
        Haneen Mohammed <hamohammed.sa@gmail.com>,
        Melissa Wen <melissa.srw@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Manikandan Muralidharan <manikandan.m@microchip.com>,
        Dharma Balasubiramani <dharma.b@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, Liu Ying <victor.liu@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Edmund Dea <edmund.j.dea@intel.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Sui Jingfeng <suijingfeng@loongson.cn>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sandy Huang <hjc@rock-chips.com>,
        =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Hans de Goede <hansg@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?ISO-8859-1?Q?Ma=EDra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
CC: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_01/39=5D_drm/atomic=3A_Make_drm=5Fatomic?=
 =?US-ASCII?Q?=5Fget=5Fconnector=5Fstate=28=29_early_return_consistent?=
User-Agent: Thunderbird for Android
In-Reply-To: <20250825-drm-no-more-existing-state-v1-1-f08ccd9f85c9@kernel.org>
References: <20250825-drm-no-more-existing-state-v1-0-f08ccd9f85c9@kernel.org> <20250825-drm-no-more-existing-state-v1-1-f08ccd9f85c9@kernel.org>
Message-ID: <BBD9E72B-B1B6-4072-A465-68204879684C@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 9MS4woLWcj6HZtbBsvtroHk3qhaQ9-5Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDEyMCBTYWx0ZWRfX4szVi9UdtcJ1
 s8mxpu86rhDQN6/bfpGAWC+cnLvRu+wS4KQRG5Lg2OfZu/hCwy3jtsCjzL3/DNmdIfLbPA+WcaU
 9OYmLJAUUXrBiuRIwkFxcQyu68bSA2iZlQQ5PYvQQfOn3Xm09K7y8Jy/DYIPMGt0ALZoo0ZKjTh
 R/siCRICxthfAkqsX0V0rVgN3gKTR2MtaOfUi0aBMVZTzb0IAftzyjSHVYIH8HmHXMkW0oaoCKT
 tLO1Cv3nd+ZYVA7oCAiJq6dTuRyEQ84l2Wu5MEoyz7PmiJrxbsXlAX7bkYcqqWZXUxDJEQaWv7K
 qXZT0a4QKts/+wI6WGjIjQRYHz2wMrtUltqfPHJ2WoxToiUC3NH+H6PHWdlaohNXHIW+PAi7jYq
 USj2Xf8s
X-Proofpoint-ORIG-GUID: 9MS4woLWcj6HZtbBsvtroHk3qhaQ9-5Z
X-Authority-Analysis: v=2.4 cv=CNYqXQrD c=1 sm=1 tr=0 ts=68af4327 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ntis2/2Y3p1p47GkerkPQg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=puQWGBksFvoA:10 a=VwQbUJbxAAAA:8
 a=V78A4Cvkybgf4icwE48A:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_04,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508260120

On 25 August 2025 16=2E43=2E06 EEST, Maxime Ripard <mripard@kernel=2Eorg> w=
rote:
>The drm_atomic_get_connector_state() tries to lookup if a connector
>state was already allocated in the global state to return early if it
>was the case=2E drm_atomic_get_plane_state() and
>drm_atomic_get_crtc_state() behave similarly=2E
>
>However, and unlike the other two, drm_atomic_get_connector_state() will
>do that lookup after having called drm_modeset_lock(), when the others
>will do it before=2E
>
>Let's move the early return before the lock to make it consistent=2E
>
>Signed-off-by: Maxime Ripard <mripard@kernel=2Eorg>
>---
> drivers/gpu/drm/drm_atomic=2Ec | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/drm_atomic=2Ec b/drivers/gpu/drm/drm_atomic=
=2Ec
>index cd15cf52f0c9144711da5879da57884674aea9e4=2E=2Efe21f154e0fa030f85fb3=
d6d35e2684adcf36e26 100644
>--- a/drivers/gpu/drm/drm_atomic=2Ec
>+++ b/drivers/gpu/drm/drm_atomic=2Ec
>@@ -1128,10 +1128,13 @@ drm_atomic_get_connector_state(struct drm_atomic_=
state *state,
> 	struct drm_mode_config *config =3D &connector->dev->mode_config;
> 	struct drm_connector_state *connector_state;
>=20
> 	WARN_ON(!state->acquire_ctx);
>=20
>+	if (state->connectors[index]=2Estate)
>+		return state->connectors[index]=2Estate;

Unlike other DRM objects, connectors are dynamic=2E There is no guarantee =
that at this point this array entry exists and it's valid=2E You might be t=
ampering with the unallocated memory=2E

>+
> 	ret =3D drm_modeset_lock(&config->connection_mutex, state->acquire_ctx)=
;
> 	if (ret)
> 		return ERR_PTR(ret);
>=20
> 	index =3D drm_connector_index(connector);
>@@ -1150,13 +1153,10 @@ drm_atomic_get_connector_state(struct drm_atomic_=
state *state,
> 		       sizeof(*state->connectors) * (alloc - state->num_connector));
>=20
> 		state->num_connector =3D alloc;
> 	}
>=20
>-	if (state->connectors[index]=2Estate)
>-		return state->connectors[index]=2Estate;
>-
> 	connector_state =3D connector->funcs->atomic_duplicate_state(connector)=
;
> 	if (!connector_state)
> 		return ERR_PTR(-ENOMEM);
>=20
> 	drm_connector_get(connector);
>


With best wishes=20
Dmitry
