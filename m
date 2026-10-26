Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013073;
	b=BVSeLxkba/qEbrxN4pBFZ2rEr6RtwQ9XlmdVVYJSeMD8IA/Xsy8w9LtCLcuU57iYLpIk
	 s3TnTGQyeV4r/h1Dof+5J3ZMJWXN2CuPVN54fz9Ir/zmPIZH0oBB4/ugkMjBPa6RSCvlQ
	 83cQpn6qe75fa2SLRgOPXBif46yjBitCHAQwQwQv2UlInkQUXtEqXtjXfExnytfFkVF22
	 yM4Kt/1cfombXSXOaJDLv4gkp6G8tUpVHRXXKivIP3+Z0Oc+sUAUXnFCNss7W/R3Mkwpq
	 N9ay/AHLlFkN2Kbtt4sVVmzmtXjq/ztIBnVrALNiNZgrrhbFhBLaznOyEynVgTs27iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013073;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mvK2BhmWsNwqcy/G+J7S3TLd2RKrJI5wiEQ1uROoR7s=;
	b=ruix3ZnUqwewE51/HC3QF0BeySjh56zjvHPfAWZn0TpBLnx3uAM2D3ZDsEPP/GsGeWqv
	 yG6OaYMOS5fKewxLGE4tkUTzi83GpLLRd9UZbAgFMB9AmHF9L8CIAR6tp3OTdasEIThJL
	 qGsNdqvLqJTkh3hCBozzz9RE0XAPPjIwDPJpuRSbbDAcW4lhtBTHR4sNYAqH/mU0jmeQP
	 +eoS3jeBNyoAmZq2s3dfxB6K0sKfmAgF+BF16qj/xIWtGOPbbBkLRJzHgJ6NE+opWa2BQ
	 otnioEnLdo2X+jFtmvrfr2yxK+TP/0qXDl/a3YxnJI22JrJbKaIW2px19PNoCLi1Mlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DykbsvWL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AEeitSJ9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FAEF606F819
	for <linux-tegra@vger.kernel.org>; Mon, 26 Oct 2026 11:11:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FAEF606F819
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DykbsvWL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AEeitSJ9
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAspYM2168629
	for <linux-tegra@vger.kernel.org>; Mon, 26 Oct 2026 11:11:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mvK2BhmWsNwqcy/G+J7S3TLd2RKrJI5wiEQ1uROoR7s=; b=DykbsvWLY7taka22
	WFhCOCc+jiWbv7/S+XWueMgqhVAkqS7Phn9UFvxPT6TvmPzu3+nrWrK/NaTYUPk4
	1poFdFxFRRYKhwkQaRCLfhZ+lGWZukgtoFL/TP9nwOoxWRZLMMyAvhGWcuDDNrM4
	UUqTfwwr7Bk5CsVw0HSyroMdoSrP89/JYfqNdUkyZn8M6xZJfrxRzgah95V6rmRZ
	0nFn95+pEZHHHkoXVfVPzwtS/nYeT6tggGLrK9ZW5WQ6N3FZHJAUNOc8tx1Wzj9y
	GMi2zLhYtg+6nYRTTAW7sy6nV2gWM/wfxF52DrOi3GqThoDV0pgEh2kTo3Z9RWr5
	UjKWKw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj3u60fw2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Mon, 26 Oct 2026 11:11:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f568dee56so412154485a.0
        for <linux-tegra@vger.kernel.org>; Mon, 26 Oct 2026 04:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013071; x=1793617871; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mvK2BhmWsNwqcy/G+J7S3TLd2RKrJI5wiEQ1uROoR7s=;
        b=AEeitSJ9Y69rzM7EtwrsIgwwpRbWHGfsKAT5r56bR0ygoIZ1o/WiyjF79B7YRd0NTk
         XKG4uzZzwLQyX52T6oPA4nQyBPUtXXpSTsf+H00ka8ONXdiJfJIJpIFJI87nK9k3LowL
         KGLnoGVS+soItSz/0/mDtY1TgWPcbJaAGBGn0PIb2SbElkC3PdDMAX8GKa6pHv2CnIgl
         TkZvXS+pu29XU2RnUqZScdQ5/NBaw8rNOiaxNFjE9U22cfTECPW+HZm1DCT0yi55mI4G
         5TEd1p9KoEh7VMPOxAR5kfxuY0ZmeGuyFQVr7fn2dyoPG2InHL8dgncyPWg18XJ8fRNf
         9+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013071; x=1793617871;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mvK2BhmWsNwqcy/G+J7S3TLd2RKrJI5wiEQ1uROoR7s=;
        b=mo7oh9Wia+A6q7kfSMNs7362bYWDsYkfwQ4qVmoVJtDHWmOoJr51a+8LggqmEUEWCd
         vJbwoBYuuvH80TewJZv3BK5hkwYuK1eiEWteJc7Rtmd50uTTaz3P/a35PLx9frz+H5dL
         /jEjb7Rgg9UrTcKHl3JgS1Mpf7d3nKSrUV/FUV9vnYXzk60grDD8zod1TJDc8geU/Oa1
         mBCDHwvuw738kCrgrZlvMRToF+3S0/F/dsrpRfjNZ1Ju2/ayqib5CTBNRh7elDxp9GDD
         aaydNlmRhbngihEYO2A8vNNUSQNpAHmVoeyll/hBDCI3xCVYnOvHV9P0QZ/w/35V8MPE
         s1Jg==
X-Forwarded-Encrypted: i=1; AKwUvBx/CAbHYojzJ4rvdbRxrEvWQHhQyfGAMWEH2SQIQZ4wZBqkoiKhLouvxczt6h4D5+1sO+GszPJs+BEhNA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJv9r7UYuRN5LOwnbcdVyS8YNH/4Obk6+Uk4hmZEFGqi6rMTzK8
	i5B8kE+K9KIfkEcd8Dz/Gbjc+Lldpsu0sr87QNjSMU2np/25/IQ6NBAxkRMfv/nY0DxbhDlHO4J
	ILNVf7E0m8FJ7n6P6tyrqfTQ5Pf7xn9+u9dFTvWWjkOI/kzseTQjD5/5XaO9aXSxVYg==
X-Gm-Gg: AYBFou0FY4xHDO2c137ci/q+BODk/vKBwSnszlQhH31fAktDKu0Pi9W+At2oKjsuNPF
	/VvaV/lxndxzu/XNdMCxSlrjTr/QISRtttc2a60aUW+eVHuVGGcM7qLWjT4BPU8xVs7ImFapJis
	qp57WIiZqiD4w+/zaUqOP4pONREeAt/ISxpf0P+X4lFcmtsA3nJAp+HG8MB3Mmd9837Z4B3DKXg
	8iWpH37O097Y3QCl43HbTzczFoqDCOTYO2V7TAEvim175kwgGdae6aaqq77wbKbvVqfjvA/5lpw
	qc779U5osCSP3RMQ8P3O9glNfXzdBAN4cUHaDqiHeNziBKvoQZ/kb0g+IEIid4PyM2k5+ROSxS0
	+yubs0NMhY7nx2ulAxdisrhFtFofUWQZ7R5EZnuYmS86cQXrfMIo6o1BomPlfq0lMyEURcUvT5s
	zKHZeCZ3Rmq+hb
X-Received: by 2002:a05:620a:2984:b0:93f:4cfb:2a8a with SMTP id af79cd13be357-940ef8bea4amr938990585a.26.1793013071159;
        Mon, 26 Oct 2026 04:11:11 -0700 (PDT)
X-Received: by 2002:a05:620a:2984:b0:93f:4cfb:2a8a with SMTP id af79cd13be357-940ef8bea4amr938985985a.26.1793013070598;
        Mon, 26 Oct 2026 04:11:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:11:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:10:09 +0200
Subject: [PATCH 20/35] drm/sun4i: set the panel orientation on the
 connector
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
Message-Id: <20261026-drm-panel-funcs-v1-20-5e3070a3478f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1446;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ew/aRxbQkoMcy5WEM3fmByje6NiumMVLXKmZITcWKQY=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9Z9U4HNlYFOfzVOyJXwhnLG6uhqrdTOk9YMXLtOb0662
 FvpgL2djMYsDIxcDLJiiiw+BS1TYzYlh33YMbUeZhArE8gUBi5OAZiITCz7f99/Xmt+n7hQn7Q5
 oiVJ6pv+XP79lYExnj13dBk+zvlx6fLRCyn/vuRw+Fx35u97yD/j/XlfRYmQxlLJixKe91p0tqe
 c5VbMDC199d60Q0rhh71ExOTZ3z4aJep/k1I5+GeykeTH6E/X4xUOSAtN/HeUQ/y3pjfrhH5m+9
 3phrlJzvXT2pPCu9tCJ+lwfq+TO+11L07N79CeHVMsfs2vV13Mu0/luc28bxfrE5NyTf9IxMeuU
 1juEVsnvKDT/tOXtiVpSnOay7KtWAPdgxZvffGkvOPp2hmVu4S+8gsyH4ve/0DI2f7gRqck+4sZ
 d3jWv5w0hW3Ft3VHw6RmZ+VWc+hbNwVutjnEcjxEfGMDAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: pMLARoikrSscHPsTcHYXFhMXe03PBeqf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfXxDb15ijMXCSL
 2aqIMwSfnX31Kp+VdgdZa3MLtDQDm4B/wYn8GuXIbrqxxb4LmapUxH94emfbrbe5GRRnk/LrdCr
 Oz8r5d9CB69KDLJc3oaAxqm9d7zrCKszQUVEqGWeZWWkOw78Fi8qxjX7W7PKiJDI3mXkpjMkfUT
 wVLyfWnfGDIxasAgYRm48Vd9xtd0fovIzC2xlvBlx3uqzHXPCU/TkrImtPxAvRTOHTpIxHIAGcM
 ll8133EJNewYeetzlnk+FlrXj+wuNQWKZibI+5VxU660GsUwt9s00e0zGgerD9MC0E9Vv00Rn0U
 S8k2XZl+/yzWzFbqgvjYRGLWd/ULjIcyT8Z9ATaFUMfs66lGKdVuJTJX8EWloVH4NiWq+QLlbjt
 VqLMYlkdcvlFRmHr95DRyRlwyky2bnxDEdPYLZN2WfLWNK9UIX1qrzBc48brfnFQAH8x8MoeQ5u
 MU02zen0QfWZ3gvjt+Q==
X-Proofpoint-ORIG-GUID: pMLARoikrSscHPsTcHYXFhMXe03PBeqf
X-Authority-Analysis: v=2.4 cv=K823jCWI c=1 sm=1 tr=0 ts=6adf3550 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=uNaPwJEBfYLeFD5OJSkA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX5AnMozGySutG
 eEueS1jWXqSlXoPH8hokgejDDWexd7qc9pF66UPkf8MOFJR30CU1EKQJlCKkf2MKDky62AE/Idw
 9C74k1jZqohuLVAF66XEYz3Dm7/hsfU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260044

The panel is used directly, without the panel bridge, so nothing sets
its orientation on the connector apart from the workaround in the
get_modes() of some panel drivers, which runs too late.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/sun4i/sun4i_lvds.c | 2 ++
 drivers/gpu/drm/sun4i/sun4i_rgb.c  | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_lvds.c b/drivers/gpu/drm/sun4i/sun4i_lvds.c
index 6b98d20a8890..448e8a70b1aa 100644
--- a/drivers/gpu/drm/sun4i/sun4i_lvds.c
+++ b/drivers/gpu/drm/sun4i/sun4i_lvds.c
@@ -153,6 +153,8 @@ int sun4i_lvds_init(struct drm_device *drm, struct sun4i_tcon *tcon)
 			goto err_cleanup_connector;
 		}
 
+		drm_connector_set_orientation_from_panel(&lvds->connector,
+							 lvds->panel);
 		drm_connector_attach_encoder(&lvds->connector,
 						  &lvds->encoder);
 	}
diff --git a/drivers/gpu/drm/sun4i/sun4i_rgb.c b/drivers/gpu/drm/sun4i/sun4i_rgb.c
index 3da9a9283c6e..5414afcb10b5 100644
--- a/drivers/gpu/drm/sun4i/sun4i_rgb.c
+++ b/drivers/gpu/drm/sun4i/sun4i_rgb.c
@@ -245,6 +245,8 @@ int sun4i_rgb_init(struct drm_device *drm, struct sun4i_tcon *tcon)
 			goto err_cleanup_connector;
 		}
 
+		drm_connector_set_orientation_from_panel(&rgb->connector,
+							 rgb->panel);
 		drm_connector_attach_encoder(&rgb->connector,
 						  &rgb->encoder);
 	}

-- 
2.47.3

