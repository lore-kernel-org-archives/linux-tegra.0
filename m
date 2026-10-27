Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102578;
	b=5c6kDi6bu9Qz8gFESPpIBL5CmPk5lzQn51YBuSHvUK6SxjQ8sbiYrQIA2c2fsUQokmKE
	 PoNh33LOdI0ZrzfMLVqnjDMtb7xfNOAJJF7b5kK7xzilz1FTUJmELblTXQovAX8h9Rl2W
	 8xRX6SrY2tCqxXtms3+m2RhpIjtUZ6wBr1X8742M0ONPNEKJ4qWQDE0PbZMocyiZKdPgI
	 ulAT63e+v7ZICp0D01boq/6LDe2ti+Ssl20p/LZooDb7lwsvHJmdd8Asd/f7xUS0srwXB
	 er+RH3YiPIqFsNH+RriPThse9i7jQ2jvP/YCiC3Zo0vSUvmvs94+OXZZgY2VcXB0B+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102578;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RreJT6OdWgxLLvGlC2N7bmJyUm9m4QYaD4O3KtIV+1A=;
	b=TJBwC8a/UEBZFA22m7BY3B8E3BF/UEPepqelB2bfQJ4kdJiRDFjK8P5riF5a4DLFSjEZ
	 eZ6GprjCcmMdxB4ov1rFnj5gIN6bZHWshJSj9FQ04xykmSb7thbvosJWPJmreWiK+ItqW
	 9p1ud1uRq5lPxGmEuiHrm7iplGsV0ZYboYxJV4cRjtim6aKOKWn+YdCe9biSa8KC6MbLx
	 pspGhEa7nO4adztu8B/va0pvYnlwi1O/ItSLGLogrnlTvXEYeIp8T01gCKk4/3aUSf0tR
	 Scu16NqWGTfTOE3CEZYuJRVl/AvZDiQJwKcRqCw3riDn6R9toEcRDR3oCygZM5zVNZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E+1n6Gi8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="L/wBL3yB";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B7160A262E
	for <linux-tegra@vger.kernel.org>; Tue, 27 Oct 2026 12:02:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8B7160A262E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E+1n6Gi8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L/wBL3yB
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeJC51427318
	for <linux-tegra@vger.kernel.org>; Tue, 27 Oct 2026 12:02:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RreJT6OdWgxLLvGlC2N7bmJy
	Um9m4QYaD4O3KtIV+1A=; b=E+1n6Gi8vcyP3M0k3o5Wgql4Sq04nvrDDWa2FIWu
	sLVnyHOl26uyu0ziRm33cusRsQ0idxUnBjgHJ2RO/qvSp1wHmhCKSkhP2PX9UwFl
	D8NaLY/DpIx2crNESacLyxTZ9kQuhMfSxglvu3e1a1oKGG0W6iSjx1gw/r1fp5Xd
	k7OrLdTHpGWvnjK4pATqvpF/9fOaMQ/AzNNTTONZty1mBXLBsphEF0jiM2RS8p4p
	Ry8ZVgJBxRqe4K/+tP9x6nh0kIssyfUW4f+D5JWoBKeWW8s+5tYb+3xWnGf/RmGW
	fXR54qk1SYsBEQyZhnU16D8nBTna1kcthL5pM8W1wcnJSQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjbmmbf9j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Tue, 27 Oct 2026 12:02:56 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5cf33256d2aso838311e0c.1
        for <linux-tegra@vger.kernel.org>; Tue, 27 Oct 2026 05:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793102576; x=1793707376; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RreJT6OdWgxLLvGlC2N7bmJyUm9m4QYaD4O3KtIV+1A=;
        b=L/wBL3yBsMtrQFZ9wCDcDKGR/JElC2jPlODkzkjZu2DAMuxTCFarOL0w4RqPh1z/CC
         EXWWxA0m/A+R6aH+Da+ulCLE/QCN9s4eW5/oZBHlBSMpwuWfj5/cAf9DtQ3eT9eH03l7
         ua6o0W8feTusvBj5o0iIvW2kgtnmBapQSczGkowVZp8b+fwWeHAxQyxUm0x7gptt+At5
         eVl0xRNU/6qKySgrfLoiJm50bVNxVdMEd4KpepLSYzyxlaObMwE0vvg6dSR0sI+OVA2A
         5Q1eSfeAnFh54Nzz1FkU2bDZkIyz0nTE9CvIPXxnvTNlojFgyFir0yDw+o84UUeIxtSQ
         sFmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102576; x=1793707376;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RreJT6OdWgxLLvGlC2N7bmJyUm9m4QYaD4O3KtIV+1A=;
        b=Ym5o2QtEZww71tpysFZfDYpeM1iOfEfPcUNbYAqqtLrplrnLq31gPZWQXrD/p7pCqc
         20K7SG3iww0S47HMOug/Wu8Eqtrlarf1JynJD21e1cOm40tLU5+tXIYcf8TzVXwHJ10l
         wwGb0Se5/fapSOxtj6j/+USHa156aa3gONQxgtMxLcXl5OvuTZfXVmqQlSHuIcumOE1Q
         ewtu0uWcb7LWEOpTflnAsoQR8GUZFg3nS9vJhFkwI9XUaJP+6LqkficflVGNbkvTjZM+
         0H/v6SOwqitfkM0XMYAN2YLkbr6RYifhV7ez1quX2w9wynmiWalDG11OJLxJdt/irKd7
         glzA==
X-Forwarded-Encrypted: i=1; AKwUvByeDq2f/VyzmEse9lYZTf4isPjSBnhcUe2qut6iIk1fvqhKOw6qqK8VBZT0QQP3NVDTkeUr8M0LK6HueA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKpw3oKMgNBnI6yMDK4NOv4rQMDRIQhisBYaRS90ZAC7dgXtYPl
	hJo53RHVxZxm6W5H7OZfa7Cu8qIknVyj+hWVq726dUvzNgDYzneY/zWahwrqG8wv2xbJl3HMp48
	++d3rgv/aCoD1W6+yBACSMcEgDEARpo8GEpERY9RzuuFYkTOZD5Ezw1OQ9Q9IuTwONQ==
X-Gm-Gg: AYBFou0imkGHgDvFwBgjzlBAFL7vkooIvGoFKh+szYlq7q9J8AKrfNRnG/7bB8RbZMz
	/rlrkJo8LVckBsJVHOp3TVvc1C5hBeshsugLnoPlCdv/uRJjAq8Y1QlqQYo+p5XeYEe1F+osbmt
	Yc5KmTuf4s4RMOMd0ER+lfz/394tC94UslMRxD3mq4znky+O2sWo68w3Dt3OgeE8pbpKeNTKz+8
	iGgG2mBqaCkkNi0aoAg3Gryfdky/ykBxJTbr6bjPQkB2hr6P0GCNSlQKR5YAbYdj/402xtN6KyC
	ChbV1Xwwim2nQ3gBtquFG7QsDRwWwcSU9tyQvazg9G9bbZpp9Aflw7xD8YdM+Lz5FohiZIQNGGt
	FXWSC+tfBScoh6gbFszF53qsCAjF/HVKbOGupLAFcMgt0uEbK+seXQvk96lUkkg2JRC4BvXraSV
	AEbSbGOjk+z9PF
X-Received: by 2002:a05:6122:124f:b0:5cf:dd67:cb32 with SMTP id 71dfb90a1353d-5ec3ea462d5mr652319e0c.6.1793102575703;
        Tue, 27 Oct 2026 05:02:55 -0700 (PDT)
X-Received: by 2002:a05:6122:124f:b0:5cf:dd67:cb32 with SMTP id 71dfb90a1353d-5ec3ea462d5mr652238e0c.6.1793102575110;
        Tue, 27 Oct 2026 05:02:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a9558esm2089787e87.70.2026.10.27.05.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:02:53 -0700 (PDT)
Date: Tue, 27 Oct 2026 14:02:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Paul Cercueil <paul@crapouillou.net>, Marek Vasut <marex@denx.de>,
        Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Linus Walleij <linusw@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Alison Wang <alison.wang@nxp.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jagan Teki <jagan@amarulasolutions.com>, Ondrej Jirman <megi@xff.cz>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Igor Reznichenko <igor@reznichenko.net>,
        Michael Walle <mwalle@kernel.org>,
        Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Jagan Teki <jagan@edgeble.ai>, Jianhua Lu <lujianhua000@gmail.com>,
        Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
        Purism Kernel Team <kernel@puri.sm>,
        Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
        Joel Selvaraj <jo@jsfamily.in>, Icenowy Zheng <icenowy@aosc.io>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Cristian Cozzolino <cristian_ci@protonmail.com>,
        Junjie Cao <junjie.cao@linux.dev>, Ryan Brue <ryanbrue.dev@gmail.com>,
        Nickolay Goppen <setotau@mainlining.org>,
        Stefan Mavrodiev <stefan@olimex.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Robert Chiras <robert.chiras@nxp.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Markuss Broks <markuss.broks@gmail.com>,
        Artur Weber <aweber.kernel@gmail.com>,
        David Heidelberg <david@ixit.cz>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        Yedaya Katsman <yedaya.ka@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-doc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH 00/35] drm/panel: let the panels use the atomic state
Message-ID: <cxsgo7u2hfb4jskscqcbeaaneiyfh7bdmlvku2wxwtduekwhxz@3vsizgxvekw7>
References: <20261026-drm-panel-funcs-v1-0-5e3070a3478f@oss.qualcomm.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026-drm-panel-funcs-v1-0-5e3070a3478f@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX87yIL3Vd1i2C
 Qq/wj/a2EbvsY7IuPcojFpu/vix51NbiaBS3DdBXLuip0Xf513O2LFTk6kf3GVymFrJ+b181n7X
 wr8RpZjkN1RP6ldUtygP5623R/Il0/I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfXxJ6u4phN72n3
 EEfbJIBBwfSU9+xBRNHl1598QH2WVa3MU2henIkVGEpgfKa9ze557oKmjOVQ1ceoDXJyaqy8Cex
 EV2X4bOKCKwMBsV3WE+m1S1dVZKoXYqKqcYBn3ZN9ImDn/yIuVqAKn1e+I06m2N0lau3Bv90i4p
 jYSZTvY/STPznxBhpa/g2ousEM5jnnE/Zf63RVkfcmcrOuSMFRnuBGvNdyG/elIZ3aQXyPzymSd
 ien3kMhh/wiv4II9aAW7rxjU/ThmsN9GXEYsabioKuQeYc5JoCs28mGw0VPhCV/3krtBTjaTI4s
 6xKzLPAhIu0Vy5tXBmBVGXlzT7xXV4mr5GkpwRdpDBjOyMml0Dh/g2iiP1ZHlvcfA7hS4AROtFl
 Vr2pDgVIPM2PY60Q7X+lIIysBlBnsXWcZh7CeaAlvOctreQReVbTtgce0l8iOmGnoAL+0gzzBmM
 zKGEFlnc4yDkh9/wj6Q==
X-Authority-Analysis: v=2.4 cv=PrkG/AM3 c=1 sm=1 tr=0 ts=6ae092f1 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=dDezlKT4IyV31VqxjHAA:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: HgkceN1j2L_6h2ggcaMRDF6Ne8kGBL_N
X-Proofpoint-GUID: HgkceN1j2L_6h2ggcaMRDF6Ne8kGBL_N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270047

On Mon, Oct 26, 2026 at 01:09:49PM +0200, Dmitry Baryshkov wrote:
> The panel is the only element of the display pipeline which never sees
> the atomic commit. Its prepare() and enable() callbacks get nothing but
> the panel, so a panel which has to be programmed differently depending
> on the mode can only guess it. The NT35950 driver, for example, saves
> the connector in get_modes() and reads connector->state->crtc->state
> while being prepared: without the locks, from the current state rather
> than from the one being committed, and with no way to reject a mode it
> doesn't know.
> 
> Every panel has a struct drm_bridge embedded into it, and the bridge
> already has all the missing parts: atomic_check(), a state object which
> can be subclassed and the commit passed to the callbacks. Rather than
> growing struct drm_panel_funcs into a copy of that, let the panel driver
> provide struct drm_bridge_funcs for the embedded bridge. This is opt-in:
> the panels which have no use for the atomic state keep using struct
> drm_panel_funcs and are not touched by it.
> 
> To get there the bridge callbacks become the entry point to the panel,
> with drm_panel_prepare() and friends calling them rather than the other
> way around. The panel core still has to track the panel state, notify
> the panel followers and handle the backlight, so the driver doesn't fill
> in the power callbacks directly, it wraps its functions with the macros
> doing that part. NT35950 is converted as the first user.
> 
> The bulk of the series is the cleanup of what the panel core and the
> bridge need from the panel driver, so that a panel providing the bridge
> callbacks doesn't need struct drm_panel_funcs for anything:
> 
> - get_timings() had no callers.
> 
> - The connector type was stored both in the panel and in its bridge, and
>   the display drivers could override it while creating the panel bridge.
> 
> - The orientation was read from the DT, stored and returned by nearly
>   identical code in more than twenty panel drivers, and some of them
>   also had to set it on the connector from get_modes(), with a TODO
>   asking for a better place. The core reads it now. It is applied to the
>   connector from the new connector_init() bridge callback, which is not
>   specific to the panels: other bridges have properties to set up on the
>   connector being created too (HDCP, DP link properties), and currently
>   have nowhere to do it.
> 
> - disable() and unprepare() returned an error which nobody could act on.
>   Worse, a failed unprepare() left the panel marked as prepared, so it
>   was never initialised again.
> 
> Behaviour changes worth knowing about:
> 
> - Panels with the rotation property whose driver ignored it now get the
>   orientation property. In the tree this is the Motorola Mapphone panel
>   (panel-dsi-cm).
> 
> - sun6i_mipi_dsi, sti_dvo and the Tegra DSI get their panel after the
>   DRM device has been registered, which is too late to create the
>   property, so they lose the orientation which the panel drivers used to
>   set from get_modes(). None of the rotated panels in the tree are used
>   with them.
> 
> - A panel implementing atomic_check() can only be driven through the
>   bridge chain. The display drivers calling drm_panel_prepare() directly
>   have no commit to pass.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Dmitry Baryshkov (35):
>       drm/panel: remove the get_timings() callback
>       drm/panel: remove the unused struct panel_bridge
>       drm/tidss: get the panel type from the embedded bridge
>       drm/bridge: lvds-codec: use devm_drm_panel_bridge_add()
>       drm/ingenic: use devm_drm_panel_bridge_add()
>       drm: mxsfb: use devm_drm_panel_bridge_add()
>       drm: rcar-du: use devm_drm_panel_bridge_add()
>       drm: rz-du: use devm_drm_panel_bridge_add()
>       drm/mcde: use drm_panel_bridge_add()
>       drm/pl111: use drm_panel_bridge_add()
>       drm/rockchip: lvds: use drm_panel_bridge_add()
>       drm/rockchip: rgb: use drm_panel_bridge_add()
>       drm/panel: remove the _typed() panel bridge functions

Gmail barked at me for sending too many emails for too many recipients
in the middle of the series. I guess, I'll have to split the series into
smaller parts. Please consider reviewing the posted patches, letting me
split / land the series in parts.

>       drm/panel: remove drm_panel.connector_type
>       drm/bridge: anx6345: set the panel orientation on the connector
>       drm/exynos: dpi: set the panel orientation on the connector
>       drm/fsl-dcu: set the panel orientation on the connector
>       drm/logicvc: set the panel orientation on the connector
>       drm/stm: lvds: set the panel orientation on the connector
>       drm/sun4i: set the panel orientation on the connector
>       drm/tegra: sor: set the panel orientation on the connector
>       drm/panel: drop the orientation workaround from get_modes()
>       drm/panel: read the panel orientation in the core
>       drm/panel: use the orientation from the panel core
>       drm/panel: remove the get_orientation() callback
>       drm/bridge: add the connector_init callback
>       drm/bridge-connector: let the bridges set up the connector
>       drm/panel: let the bridges set up the panel connector
>       drm/panel: set the orientation from the connector_init callback
>       drm/panel: make the disable and unprepare callbacks return void
>       drm/panel: don't hold the follower lock over the panel callbacks
>       drm/panel: route the panel calls through the bridge callbacks
>       drm/panel: let the panel drivers provide struct drm_bridge_funcs
>       drm/panel: novatek-nt35950: provide struct drm_bridge_funcs
>       drm/panel: novatek-nt35950: use the atomic state to select the mode
> 

-- 
With best wishes
Dmitry
