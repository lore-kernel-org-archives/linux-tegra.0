Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013029;
	b=OLfuweMuL4uXwOFWYDBPRGcyQnDmNKTZReRLu06hXAQMGokV3t3qh4X9vVFE13gY72Fo
	 yWtPG/UvPcHoR2XsP36zS77d7SMcBU374IO4NvufVie4j1ICmygsFC/Vy2H9CTK9MUko6
	 D1g76O4+WW9nrhMgEGIsJpI1eW68UO71Ahy2dUYG11tInCUJ1HgvFwjnIgIZhHNv1ivDs
	 SqLg8ZvonD34KpftqaD3rCaodXqq1+MwApwn7LTMm5pZGFczj7GuUf9CeKnDKZaz80e+v
	 PsyCH/4dyVVnSILnqih6qMyBRSFkHbjUDxoT03NFbxABWm8HQNJ+xAQg/Rq3LnVHb/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013029;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0zCRm5eG3ghIarbZ6FN14YvdHRzJTAT4yr6CJ0tR1B8=;
	b=c81M5sM/kDOZg7e0Kv6T70GhRpRrGckyRTuFWwVFO0lx3mZdJiGL5vl31zTyY3lvWghM
	 atjLbDN/VucfggODuX4bRVyfUFrdKlUU0RIIhO7hHAvX/RLBjmk6h+I71f3or6r4Y5d2I
	 XAir0NdHPKg36Ve3otMRcE6aiv+mK8OcWvscdFy6HCo+Fea0I5mWkQq4J6bd9DfcrazJj
	 7BVOtEn9ymi8mVTQ8ssGpP9qmE11jN3DjPy0EnYV+GiNdTGQ8aWW9q//NDmoR55lzr6KJ
	 dNdzxrz7dxp6L4ZAXH4d7gwH7WBzArpl5CGAsA9V0WO6M4gngg77K/PKywtIXIjV6lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CFLsHc97;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kibrqknb;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF82606A31F
	for <linux-tegra@vger.kernel.org>; Mon, 26 Oct 2026 11:10:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DF82606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CFLsHc97;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kibrqknb
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAss8S4131453
	for <linux-tegra@vger.kernel.org>; Mon, 26 Oct 2026 11:10:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0zCRm5eG3ghIarbZ6FN14YvdHRzJTAT4yr6CJ0tR1B8=; b=CFLsHc9762okA6Xe
	DNNLTbVLT51S7Ldrrqr0IctC6YeQgidEeOZBhhNsl/MWtO1jEhxkCkW1csJeDnks
	dEGBKqWdZLh3r3PfpcqHaTbpz6kbzTOqRpNhrtCstwQyKT4mtqeKmfyztmWkHyo1
	v0uYoWoNVrrHEdqPB5uqmvExLgP5d2rIjnvCXUlOn+JV8xbF+lLiPeOObjADwzM8
	2Q7fiH/fSOgpM9suw6evclkNJbrx8+td1GkaofdOifXgCla9rJ3/nlgs9I8Q+K6D
	Zk1gS+pDJXg9WE5kvCddsHyCk9zxUc1z7WFKRbXUOVbyLIGAScUrRVGqcQbXyhRt
	slU9eA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj53q056p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Mon, 26 Oct 2026 11:10:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93caf7856ffso683004785a.3
        for <linux-tegra@vger.kernel.org>; Mon, 26 Oct 2026 04:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013027; x=1793617827; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0zCRm5eG3ghIarbZ6FN14YvdHRzJTAT4yr6CJ0tR1B8=;
        b=KibrqknblpvPvPrchhOLSZdy7GDmQWEapicqAYlzr7JNxE/AW1MXmrfz8yzb3l/LjQ
         ZLTf2MFLGqwNaNf1TrsFoHinaEX1gNbwonQp++6ud3eXo9C45WfQL6KVYWHgI6eBrIcy
         cg1RETxZCw+cHt8SVNcwYwxoeJVktwCkIQPdHzDoxDDw/8MzCkvxFXgLG1ygESAeCmZ/
         QV3/udI8rNt9Bfmka3tD2LxjypAnnBIxOn0ThH2OWP/6Ey/2F4KsePj33nKmy9IiCjGu
         KKFkBt+g2SE2WXo1fuIy5LUGrU0fS6ALCsyx8KUfdJox6cDRL8AkZYI8aydDCw1KTQHT
         DrZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013027; x=1793617827;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0zCRm5eG3ghIarbZ6FN14YvdHRzJTAT4yr6CJ0tR1B8=;
        b=qitFH3ictiIZhUR3t6HTyaby8+Y+VmWzw5B4yVwqb6+HzlVscA9yUI7OOOGr8FP0uD
         6SCWPQmW+7iOYJRu1syXeKs5puHUMNVtDu03Y4aek+/zPJ+ZtwJoQTQi8CzpILvUd4mJ
         suxdUCHPgzE211DbL3wkPdnSjKgEMgL8NU5KuP11Vals92qRq22oiCg5ECCxUeDkhgYr
         rZXkgz0FVclWpocsvLd5ciesOCpi0xrF5BoqRlkY3qRq2vlTWU1cSc4lqaekrhi+r33u
         YZtXDzmKpQKMfm967KU5hwuyzUILlUJkzQ3KLy5mjdey5Jg91vRlwXKdPFHO+DP2jSzl
         yJgg==
X-Forwarded-Encrypted: i=1; AKwUvBy1+tmKA8cL4Fpgypx34xhN/YNl4gZMEz8zvkRyvjp1FRDQXNMgGqJ4zLvKfRZlNw8fUwLSg4Ft9Du+DQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKScYsWgoCZcfeOnLLgngG0GG+YDGnbRoeddX6lB6Bi88h/fRdq
	6vQWY4bXrQ4caQIwNV+GbnCHDyDZKHow1iC7Gr5VYm1chxsps7ex7EiYFuK2Ok47c47O1oCRE6r
	xNdd2ruBu+9sa/luLCFiCx9PitsnOqDWmn48x58w+AT4AZvqdt6Dzq4wFJIIdH6c43A==
X-Gm-Gg: AYBFou3KiAjG6UevxU7VhSu1YnLy+KHyStaSWJDbUCfcTPbqyC6fXWUhOKYw3MUx79h
	w4MGm4JTxoqgYcgFFsuZlgsc2JaqCuk5zJZ+wkFFcnBwbY8EPZibyH4JSJb2vJi4hBNPouSb1bt
	eF5CKF+zTZO82ffrwvs6prqaHpvwdr1YDGG5eDv2F9CKEmn37b7Omy0SdXkXvEomcBE0Lr5rIoZ
	TmZA2tBa6KKFXVl+Z/gMAPp0+hD8s1oqBo66bCkYG0sCCen50q/lSCELyS9rwEM1KMxTEs1/M/A
	p5tS9nlM+ZiZxZZcWcWsr0/v34VIKrezP9kMsX2k/hw7lLHP931wFrGKaPUZV62JZar27KJDkIl
	zfDUEIkKnuxzA6mIizqtD4YpXcpDz8WhpvQ0N0AE9b6mDa99PH+p7am8+tixro4kUFdeYs9SaE+
	CnpZ6HicZRSTaS
X-Received: by 2002:a05:620a:1724:b0:93e:c12c:f11f with SMTP id af79cd13be357-940ef95510bmr878838685a.75.1793013027299;
        Mon, 26 Oct 2026 04:10:27 -0700 (PDT)
X-Received: by 2002:a05:620a:1724:b0:93e:c12c:f11f with SMTP id af79cd13be357-940ef95510bmr878832385a.75.1793013026763;
        Mon, 26 Oct 2026 04:10:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:09:53 +0200
Subject: [PATCH 04/35] drm/bridge: lvds-codec: use
 devm_drm_panel_bridge_add()
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
Message-Id: <20261026-drm-panel-funcs-v1-4-5e3070a3478f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=988;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=85YHjZ0NSZtOuaqrsrlX6K/Q2s50Gxv3BCx9uKSmNk0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zUHQaGfB5ccHvaFcoPYXa+Pl27bdNQhbZFQD
 EINHRC3omiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81BwAKCRCLPIo+Aiko
 1THIB/98urGNh+7LGcBXOGMeSCXA8j7jtuAjYNCtyogGq1Wgbt5YuIKgB2QYd7KnsyyIdv7g77C
 gxtAVLIC8OVYkdE2p8ulQt/i0j6QaellGDEk5S5npgvR0lqlvFjlwQOifUURtyY72RRVWkE7LoC
 W98XVFMsXP0XUKWriDGM1x6UPhlV+kCNSR5gfsqVsApqnoQsSUMvePhUoBFEK9CjRzOvPkmwM5E
 1VmboRTQ/GPNOQ0oLTM5IIqLUjZJn6evmk+ierH7n84183noH2qlgGEXO02qFJfVV0j9dJJSs8N
 EzwIZfX1H6kcdX8RaQP2fDm44R/fZkL5gChC6NBJ7pOarn0v
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfXysux6iMwi1o1
 LHQdfzqHXoQGHiQwvwIT4ti8WmY5b6ujpGQ3NA9azyU8c8UaJAGZ7JsuWTPwLkAzdTDUPDyGF/4
 xH0XtV6sH6uoIYRCPV8B/gZovZCmluw=
X-Proofpoint-ORIG-GUID: pWr2qt2qxUBhh8EXy0FcgyxRDRgu1Rfu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX2U/l3z8uXWVh
 Q9YbBLmPJSF3j2oEYKL5ELvzX8FI295X6zj6Rfs3Y5RSavEl7HRTzzV7ejur33KNe/DWbeDhV03
 QNIG70ucGgTA2CehDtpQGRVSq0FZ2dhi6stKiMcYeCWw7+ghtKtTa3Ep1XCjJ2EA2wZVsqmg2Ga
 6nQCvOOvtc13hSZicHSnxbEAsXr6h9i9TbkHbIIMUs0PvjhiTeUrn9/HE+1kbzcuo1yVyBQKnW7
 On3AmRwoU7PkLpoAtmmSXSodjSa4RAI0P3Qp5PSHMO4hxohTcRc/vp8EWyr3T3hZlPSjpgR4BlB
 CkSF1rbpDYbngbIP0kpYlIB+yFFUWGYHKMZfkuWau+9b53cF5kTd0Oe6dnq+r54ASDPUS4987J1
 kSpeLwBh9ukEjZwKKmLiRJdhdjE4j2iwU+4qO785MYN3sIqKTbj6rC0xhFlBmYgTz8PvJhHpwcf
 5YFW5hsd12O57cwSuQw==
X-Authority-Analysis: v=2.4 cv=D93SufRj c=1 sm=1 tr=0 ts=6adf3524 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=BDj7AndPpwv1RkrcsKIA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: pWr2qt2qxUBhh8EXy0FcgyxRDRgu1Rfu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260044

The connector type passed to devm_drm_panel_bridge_add_typed() has been
ignored since commit b7797081ccfe ("drm/panel: embed a drm_bridge into
every drm_panel"), the bridge always has the type of the panel.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/lvds-codec.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
index f97c8586273d..d25d8d777191 100644
--- a/drivers/gpu/drm/bridge/lvds-codec.c
+++ b/drivers/gpu/drm/bridge/lvds-codec.c
@@ -154,8 +154,7 @@ static int lvds_codec_probe(struct platform_device *pdev)
 	}
 
 	lvds_codec->panel_bridge =
-		devm_drm_panel_bridge_add_typed(dev, panel,
-						lvds_codec->connector_type);
+		devm_drm_panel_bridge_add(dev, panel);
 	drm_panel_put(panel);
 	if (IS_ERR(lvds_codec->panel_bridge))
 		return PTR_ERR(lvds_codec->panel_bridge);

-- 
2.47.3

