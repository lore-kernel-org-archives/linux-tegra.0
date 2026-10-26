Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013031;
	b=j1Q1+qJiJ6OBCXsWiz6ajhUjO1j6ctQlQshwEdvQlHC1sRGvbYVc5MPRwJ2xP5TdmF3f
	 +56hMAIC4X3yCNN9BVIPdcqQA5qDnx1Df+gGFDnOS3sXEjhRZM737f2/lJ7g411rIR8zv
	 mYs6XzxeQoBSwonCALy+bTdyBHlrhIQcmC7XHVjzpe2Ac0wMtEwhkJZHMB3ZnVTUT55lB
	 ncDVobdxiI5yXdapQ2Usq+dPgUwp3MOKM2e2M7E37iuTjXD261v9y+9Y7FxSf3NjYUMOd
	 Q1PMlLRh9C7npNwY/GaBIuyB9fvK5pm8Fhes5OTuHQsAzekBYvTl4Ar5F42xJw0qP9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013031;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zgBVubvBrzvafXQTnrX5uUX3XOFZecFzhwSw3E4Y+cA=;
	b=xJ/RX3rH+gsr2/cyG4GY553Aa3VM9fJfn1kKlT6bVZh2D85ZKokWeJVyOdU4WB4IjOlT
	 TPcH99XWNmCGFksKI3CQO0xVqkpAxxsM5VRWHY8ErLcqSNBzPz5vSM169GMpQuIqNPNq4
	 gYg+7Wdk/6ljReWkyCI9A7pG7ge513KFyh/vCBUWHv1N6EZ229TgeFOwg8y225w2WXzkk
	 Ctal+VmMafdF38Out9OdQ/+Lm7XOwECqtgNXGS0TZ51iatRImt/wlh28zqMIE+xk4vuME
	 wz9wsJ+OxAU1zS5PU2OqY4VBtbxoEnSsBFbXsD3AcxL0sR0cSd8pc0RmCxDib0K5GjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="hTKcX/hv";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KaCRc8p+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E39660A3806
	for <linux-tegra@vger.kernel.org>; Mon, 26 Oct 2026 11:10:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E39660A3806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hTKcX/hv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KaCRc8p+
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtKWh2541823
	for <linux-tegra@vger.kernel.org>; Mon, 26 Oct 2026 11:10:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zgBVubvBrzvafXQTnrX5uUX3XOFZecFzhwSw3E4Y+cA=; b=hTKcX/hvAbobszuB
	YPUN9EjI8lUgXGaC8M5LNILHs8TL1bq/LJVtMRCzussCz6i0U9wHqU9G99Dspll/
	x8WMfGaAUJ+nWN1dgVbMVSKshSw86xJkj4Zu+nZ7O9ZQkUmHFJpt0V1046Lwv9MT
	PKC0YSQQXkLvGehjQeXA+e8FiYRcHYLguWQD0Vg+5TVWr+8zy6AqSUPCCZxWrdoe
	9S/cpu9OQXeZKF/06S3n/R38aAD23938C1PbH9EVO3Vg4CQ0grzV60XtgWjHpCxc
	GX8dXl/enh24KBXe8QUvPpW/P36r89+zz8lLLksRgSNP2ZSIVniDzsSJCxMCPsFj
	iJXK4A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsjda5fg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Mon, 26 Oct 2026 11:10:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f32050e72so631859185a.1
        for <linux-tegra@vger.kernel.org>; Mon, 26 Oct 2026 04:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013029; x=1793617829; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zgBVubvBrzvafXQTnrX5uUX3XOFZecFzhwSw3E4Y+cA=;
        b=KaCRc8p+GREgiBdI4hn6G3AqOxQfDEQV09tq9JFSJAqPI2oEy1KCptHC468GzLq8JH
         SqE/ih2R2nZdf3vbNWUH7+rtVd9K8CmOVMb9SLwq1GyMlmye2QqT4vJ9sp0tBh6f3V6R
         J2FJ3RHkYqSztH0iNMqalcJA5DWIUJFM7x8woHL+v95SPuV0OZnZEe+74tfl37GFFkDP
         jOJYohauAbhfPwft8PBlppKDp0K0EfkXrsK5m+fBYsQSWgJ4HRmZ8TOKKQyqj8SVwdt9
         vAS6Lqh+d7tSWM/xfVSTJ99DxyFjvxySeWM0+3l2yhjuBVDH+WwDbyYvXueWvnwr73mj
         FlFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013029; x=1793617829;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zgBVubvBrzvafXQTnrX5uUX3XOFZecFzhwSw3E4Y+cA=;
        b=wKR3iDSm2Oe8s3OsfX5WJnjWJ11rb033z1tlQs6igX481j5cajXWYb/q1jAd5CVp3O
         Us2BMwAgBEZDn7G75UU6VKfsyx/CTvAhuR6VRsiSA6cyNGviPaVSO+93aKnPOdJstJLL
         z1mf3MFTh0HIq2i2C7FAtOg/etbw3vOxt0e8Kbu3hW4yZAJK633LVL02N9REK+wNsy4C
         lzdTPXzG6OmQxZNGxPWiYb+lDXo85HttT+Yh1nY//5lOzWLzbk57jMdiJbAo5bvOY2Qf
         SsvWqnwRKrnGFyeGc6YdHd2sRhUdm4UyrcRVDJ2emLcesxCyoUI3q9DcBHORUd8pu1jI
         0tKg==
X-Forwarded-Encrypted: i=1; AKwUvBwROsGzpZNsabbRzkit2CCbB8bEw2r3GwdTMDf1jR0I1sCoEfUAecV3A/KBdR38n2ZoO5BWcveZQXrulQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYK1dON2GXbhwjh0H6s3JZv02HxBRE8ZRK/QnvLDxyP6B9ugbJ+3
	l+SPW9XYamZa0ZxswDWRDCywwSkDGMmF4lTrC5DOQKXUa7AlbyNqYjsqNC3YKUORfcRgsfWcI9R
	XoB26hsOz5e9Hz7/2dD+0EYuA5/S9WawzkKA999vmSbpLLgrRfEHxEWvABxwPdGeBbw==
X-Gm-Gg: AYBFou3tuZFl3OY829TMD2Vwxsrr4kgbdavBLQf7vC5xDA+gVjT4gwrExcY1sbwGs5c
	E4rF9WY7UKLYxnVoY1UR2y1tfFkMeFexZww5QWA2GDdS84RYwSMb29LdsyHbUhIk34GQC1jK6rp
	BLpoHTRO3doXBxs3N4VwKZUYbxVUNAOg+tfC3j9174tkH/+xQb1mVj6l036lBSDCXR1pKoRLjBV
	pU8OIuTYab1+EfhnVAX1ErhtWLKRJm+gykmGJFedSb7YiGEKix1VMIGqKJaJxUDd0r/mqvjkRtD
	2nhEr2oEgp3Cj61EN1/ojyflN72APuA08S5o1VNp8B5FhSiywp2NZ6o71jKSktDo/oeH4n+Za25
	8l9tM5Uk5q8nbLXr6zGNaaBn2cb1IR+InX7PtaRXRsZiAbMcP9Wqh2lx38ZcgqJo8ROj4heQU4Q
	kks0vTursPfk7G
X-Received: by 2002:a05:620a:4592:b0:93e:bcbf:4ad with SMTP id af79cd13be357-940ef8d9147mr1045520285a.33.1793013029416;
        Mon, 26 Oct 2026 04:10:29 -0700 (PDT)
X-Received: by 2002:a05:620a:4592:b0:93e:bcbf:4ad with SMTP id af79cd13be357-940ef8d9147mr1045514085a.33.1793013028876;
        Mon, 26 Oct 2026 04:10:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:09:54 +0200
Subject: [PATCH 05/35] drm/ingenic: use devm_drm_panel_bridge_add()
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-drm-panel-funcs-v1-5-5e3070a3478f@oss.qualcomm.com>
References: <20261026-drm-panel-funcs-v1-0-5e3070a3478f@oss.qualcomm.com>
In-Reply-To: <20261026-drm-panel-funcs-v1-0-5e3070a3478f@oss.qualcomm.com>
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
        =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
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
        =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
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
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=962;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=0G8nvH2jwU/GqDia9mSTmMZmW83QA7NQZAEK4aHji8w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zUH2B0PTBBD/iZT/eW87recaBbgn603e/96W
 SBJrH/4oE+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81BwAKCRCLPIo+Aiko
 1TlMB/9HDdJGY26OzszCnJMG+XIe/mi8sSBQe6BKmfM4Dw0zRYxgcUYli+4d3Hd6z0vkmnD6VUg
 hY8k0uPIGIIJpP+tw2mKYqi7npQmbDSd/aG+qrXxjyvMN15Hj2bBFWgP5+Pb4cEGV6LptqgIo65
 y9uTDV0sHCs/SDhG8Na8tMtdh8ITqGd4b9JqIfNe+TTXNFankh4Tiw1FmGbhsuX4UXzzM7sqfyH
 GqWf9cLMnBQt6Mc7ZHhjQo4/d9l92enY+C6SZV/H6Td099rou9ZQUCRwCmOfMhNu+JAYD9bABvS
 t/uho+3UG78+0A6eAwfm6Ygm/yasQ0BrHli33I9wzRKFpmJ5
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: -vPmSdcghc9397jLgNbdS5vbiXbhnP0p
X-Proofpoint-GUID: -vPmSdcghc9397jLgNbdS5vbiXbhnP0p
X-Authority-Analysis: v=2.4 cv=a4elZkSF c=1 sm=1 tr=0 ts=6adf3526 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=nww9MsHrn8xYauqU-SgA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfXz92t1kriiW0s
 s4CfmuvT2NU2c6eddP7c0rnHYwy4MKXDEKa1jOjFxW4hV5ZvJ0BRWEGomD/MXC/3v7Zzt6ucaVx
 7ACspH2VdligZ/lpEvYLAIKAPIykq90=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX4Z0p2GNUQ4JB
 lxjEemyJ3HM0qsIT6pfXt7IYX3iiPe5h/qD1VFPS54LqLICdFbRvgYnXi8vu2MFxpT+azV8Lelg
 d8YQjOT2Gt/KlHMSig4X5wPXSVh7H5nazDOS3MtDuxBiT8L9qBzku40mOj4Vq7albw8WYOCOoj9
 zOJCBCxQfzUV5MH03pztv4ygKSZWFbiv1nQQpNwQSkBnuOMmuT3NPoJMphvhoKIssYWJC588XQ/
 lE0AddN1nrgVwkCkuy36hHo/DbUWkXpfEVRtbyNPEuh4UhzcpsVYUypHUHlWik2y3Qbd0zmJry/
 pXXXt4kMcaQIk5VB595ijw2AQqjVkAFInZe4qPmx3k6MnaOtK+86V2uBoB2Ei6MZTeESxHI4a9O
 v/i4tz1evhjBAWAKRaj+d+F787auTck47nw7Gl7okrGb8hvkI4oM7fouNeAKgbLqKKNhpeB2eKV
 aPy44h5kwNvf05tEyyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260044

The connector type passed to devm_drm_panel_bridge_add_typed() has been
ignored since commit b7797081ccfe ("drm/panel: embed a drm_bridge into
every drm_panel"), the bridge always has the type of the panel.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 625ec76cf04d..cafadcd2b765 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -1298,8 +1298,7 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 		}
 
 		if (panel) {
-			bridge = devm_drm_panel_bridge_add_typed(dev, panel,
-								 DRM_MODE_CONNECTOR_DPI);
+			bridge = devm_drm_panel_bridge_add(dev, panel);
 			drm_panel_put(panel);
 		}
 

-- 
2.47.3

