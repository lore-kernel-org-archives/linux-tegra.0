Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449A72765FA
	for <linux-tegra@vger.kernel.org>; Wed, 27 Aug 2025 22:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756333647; cv=none; b=qCRf1n/bd+kwT48PoPT7ddm97AOgOtmzXRJQjq16qYsF3/8Q1HnsDwB13mY+0m1bNLKRJt2XwlzyB8vVcOkiGtpxrIfe0qYTWznJAWuK3SZkbzIHw8YkEIZukSOIMoE3drsznDpRKiL7YFODuGlU4OyhmgxoOecQKcfsuLQN2Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756333647; c=relaxed/simple;
	bh=39TfirOm0CvaijkhQPEcSMxZAXyiBUqSqGTWwYkVIEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OGTazWLwIxTV3jSrXoeynY+urcxVK6GGHyAx+HD7oXtp2ipHW66jCqetuEKp3Ldko+qXjuskTxfbkwuQEGHkCon83Rcc+KxU6FtPynGJmfiPk79nZEbXG+vyZwBtSfHb/noTdEFxDtF4e5MYXWdmvdTA5ebp9m6nKzywcFOtS7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N3nSP7Gc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N3nSP7Gc"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57RGLe7G027289
	for <linux-tegra@vger.kernel.org>; Wed, 27 Aug 2025 22:27:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=coI2WbZxINU7lzeYxnfoWTr2
	sAMMNa2PgUU+5RmzHvA=; b=N3nSP7Gc5TMt+IIn+qZ9uGuYzVafaBp1ac2JStUp
	K7rRbNrItFfkrE4pn3NSwfK3EJKU+G54f3mtlHj6FVmTiyk34UhAcW763bLSlDn6
	lE8nZPvaSrrbDD1z8NV8GMsE+EejI9+PUuTSSHiKEagz9bQN6sfvpB5/sPOKcU3B
	hixfH4Wr/PN3um5++i/3CX9NXOAeLZ9SXBULzqfYPbTbm7cJ0YT0lWqwC5hM7lYu
	l1sOWd/H9mcZguQFv0ANnTeWef+C8qNF9wb0KmfE+GAKuhHp+eDVTrDi1PKjuj3Y
	LyVxJjOjvzkfxEw8ajNN66YMc9YGBbuSSUh3zv0iLcgaEQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48se16w497-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Wed, 27 Aug 2025 22:27:25 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b2f7851326so10481201cf.1
        for <linux-tegra@vger.kernel.org>; Wed, 27 Aug 2025 15:27:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756333644; x=1756938444;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=coI2WbZxINU7lzeYxnfoWTr2sAMMNa2PgUU+5RmzHvA=;
        b=qGWfxxG4OtBDfI4MCL9NxaQlbqt2t793o7LYKnEPohzYb5tD+AzPtm4VnXvGK4oeH1
         vHzGkBZscu/tAriqKVL1nah3dwPmy3/osjCjwkmS8f3+B5oHWiM2FII+Lsx/ZXOY35C6
         kSUw5cFARSON/3y5bFKXXpkagjRDWpI/St0a5VTfLE3RBenoaNdOYH6UoDUmgD6OpaCh
         sfPjvI2qwLNb7NZ6ogAW6xkFNUMVPr0OGeDDO7TNB81mJhNbU1OZvHaS0SY3yH+C9pKx
         6nh9jZ9WogQ6brnNJMtWzUBfccwdzxHf8qKKJ7ukfat4MhV6FzylIBeKg5QSrHs2sK+v
         kgRQ==
X-Forwarded-Encrypted: i=1; AJvYcCU25NDGC2WJRw36wtww1zufW0AL5va4PrNw4ctxBXKjyDJ/cqX76xsxvKXl+vWjz/ek+/XTvRCWGH2v4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6dkpA6AEbuKpTN0Y4FTitTnsyM8Qxg6srI67noJYAEzMAJRqW
	cdBUQXjoT8SAVoVg/tdRazVMbQCWiGhQjED++Tew2Uq7BjBis7/pLERcMAxFsMlHqIgRsJd6LoE
	w1SmcAW1KQ+8+XTWrHuRFRG+KQDImea/KLRMTJiefMcdR9qcZf0xHZY1cnSEu5MdzxA==
X-Gm-Gg: ASbGnct8Gj3g9wBCOL0/7jlVAuWt0isPdtKHNVJMXFiXV0TZzOqZ8L2pbcBRuFdgbEf
	HEiQ0yk9O+bxxDBiQB5dLPJRneH/5Zoj3BmLl8oDo3rEh+2aUrRXc5qzxZ49ciVXXcoLiLSkM26
	fu4wZS3HZX1xJxoZSZlUJvPRh3cE7dqdZsci554r4dTl0gm4RKFPpTL+S661bhdzUibP6B17qsA
	ODbVoCW2plKJCHjzMNDugRJDj/TjlubxWJGB7Wbn8XmBBWW479n870UVF2/HgUSWVUTJyQ/ypu9
	rSi5ccnUWwvn/biO7oA27QVQkF9BLp1Tn198Xxca18UH2HjBBHLS3BT++Kfmgs0sPnfFypmeHOn
	p1gkHJPhemp9erp8Bg9QAGumdxJZRdsyDW8QhZoxGLPZZYqHPWBZI
X-Received: by 2002:a05:622a:4c8e:b0:4b0:8f6e:d70a with SMTP id d75a77b69052e-4b2de073d4amr102607511cf.22.1756333644087;
        Wed, 27 Aug 2025 15:27:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfGaJaSCsOEz0+c7R0GpHgMKXCo1cAu/f4pCkJRC2KgnMVotYeSkSM/eNVsc6qfr/OnO8xNw==
X-Received: by 2002:a05:622a:4c8e:b0:4b0:8f6e:d70a with SMTP id d75a77b69052e-4b2de073d4amr102606571cf.22.1756333643552;
        Wed, 27 Aug 2025 15:27:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-336818f1d41sm14139131fa.51.2025.08.27.15.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 15:27:21 -0700 (PDT)
Date: Thu, 28 Aug 2025 01:27:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Hans de Goede <hansg@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 03/39] drm/atomic: Convert
 drm_atomic_get_connector_state() to use new connector state
Message-ID: <hab6s4wyauqiej5ankh3gppdqkm2ymlevhrnklfe76kqjmmjqy@fptmzxpqv5av>
References: <20250825-drm-no-more-existing-state-v1-0-f08ccd9f85c9@kernel.org>
 <20250825-drm-no-more-existing-state-v1-3-f08ccd9f85c9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-drm-no-more-existing-state-v1-3-f08ccd9f85c9@kernel.org>
X-Proofpoint-GUID: I0nSydTxziAhB97c2L9jbjR48xClDoKI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDEyMCBTYWx0ZWRfX8I+LMjm18pkR
 eZw5BBgU4LGrwoOOjcrczdftPoMKTT1YmVnADNrxQ8D0XNOh7ezpt+dPj/t536Fv2e9rB28AWIG
 FystnmdtfKSiwzzvFCmV+X3SJxydc7tFO4PHiJKEQH8YmcRc17exhw/cYfTPQM8C6IwMIUEXCCn
 WPeUfY3vDj23L/ibghJci3nSiJB4LFKQKEa/j+O4cJegFwkYzRKnWMvBrgSmtfP+9Z1SH4rXLRr
 pXttGCtfzQ8eLSe2kSXYa5r8pGDHxXk7h78NcDSePWpGucObu//qUU3gYjmpThBzyd/ScQ0H9Ne
 Ivh2t9IIPnruVveNwJVo1zmz6dAp3T8C2WHoKjTPj15tky+ABde2FTKQbeBjoGll8caXnysu1M1
 plNtz2Nv
X-Proofpoint-ORIG-GUID: I0nSydTxziAhB97c2L9jbjR48xClDoKI
X-Authority-Analysis: v=2.4 cv=CNYqXQrD c=1 sm=1 tr=0 ts=68af864d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=wpE8WlYdICmIRzy2dDcA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_04,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508260120

On Mon, Aug 25, 2025 at 03:43:08PM +0200, Maxime Ripard wrote:
> The drm_atomic_get_connector_state() function calls the deprecated
> drm_atomic_get_existing_connector_state() helper to get find if a
> connector state had already been allocated and was part of the given
> drm_atomic_state.
> 
> At the point in time where drm_atomic_get_connector_state() can be
> called (ie, during atomic_check), the existing state is the new state
> and drm_atomic_get_existing_connector_state() can thus be replaced by
> drm_atomic_get_new_connector_state().
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 660b081ff5d8c39061cebfb5ea122ac1e51677ad..30b7ec05a1af07075e40cd2822ecfd67df004ba2 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -1128,11 +1128,11 @@ drm_atomic_get_connector_state(struct drm_atomic_state *state,
>  	struct drm_mode_config *config = &connector->dev->mode_config;
>  	struct drm_connector_state *connector_state;
>  
>  	WARN_ON(!state->acquire_ctx);
>  
> -	connector_state = drm_atomic_get_existing_connector_state(state, connector);
> +	connector_state = drm_atomic_get_new_connector_state(state, connector);

I'd say, drop patches 1-2 and use this function directly as is now.

>  	if (connector_state)
>  		return connector_state;
>  
>  	ret = drm_modeset_lock(&config->connection_mutex, state->acquire_ctx);
>  	if (ret)
> 
> -- 
> 2.50.1
> 

-- 
With best wishes
Dmitry
