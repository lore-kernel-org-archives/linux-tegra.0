Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013044;
	b=okULndqxn7GAchw0l2hGPWCfp/0fkYwlp3TNE814YHlD73Pw5l6UxrLolyGl6ZHzeXHx
	 ZZifXidRVD2jLpmajRGq07tnWblwxGSn/UzcAGLe9Geb6iIvrpOGRiL0a8C4l65lJqHkl
	 7RORROGN+/xgbBbPH9YXPJ54ObBrMEJavbxMtflypxsrH8JxHZU9dH4YFVTHd4ElxnCxf
	 Qcj3LcF4bDgnIH5IF7mBce3QVSRzodSk3NJgvSKjgIsXrUbTYdD9GDo6d8Nbj9tfVDOSO
	 vAO1+rl5fQ+SBgEbd6cbUNa90Zrqw+KjcWsNs9gj2Vprhc7hGr9jOVrTeDf1S8ycreg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013044;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=k2CxYTJXMNJu8w6PVYOlO+zhm/teDp2OHpxctIuY7Sg=;
	b=jS8CUK7n9AXeK8OxqXf2S1pfwlI0cYl3XlFcB4nqMRiAx5q4tb/gVUZ4q9in//EI05dZ
	 DKgDuSBAnwJMLODNpBVRwF8E4GRSYobOxlP94l3B8lbHzUSYHpM8TDgt6H9HOci/tCVJ5
	 WF5z785rJgj/LD6v/HFnKOBWh/ROtcbgiKfQBFQys+R+NjmMO6qPGK0vYp+MLMMybpbNA
	 VK0EN3un40WclIuSxl+AkAaxPDhCCobnxQ7hBrXf13DlE5oOzE52Ut1VEa1q/mNnb82ex
	 EsQAuKH+Q02Stw+xUFC43Rjr/oABz93TiWRy/BIXn6H0QPSEiAHP2O4f26jnP3hOelA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j6Wl2ZKT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QqfKWCoq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970E360A6F7C
	for <linux-tegra@vger.kernel.org>; Mon, 26 Oct 2026 11:10:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 970E360A6F7C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j6Wl2ZKT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QqfKWCoq
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAsu192732730
	for <linux-tegra@vger.kernel.org>; Mon, 26 Oct 2026 11:10:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k2CxYTJXMNJu8w6PVYOlO+zhm/teDp2OHpxctIuY7Sg=; b=j6Wl2ZKT98xHbKEx
	/nU1pTxuHGauwXtw97DwI2vSbvSkNprXjQhSmRWrIFQp1V4LjR4fvRC56w2wjh8V
	GRlHhqRThB+X4gBAvEQ5tqBnh4OR09YzmcJ9I23KNbAQz/wfYptN534uiKGOvnTN
	BfFyH27eQEUbzKXUnPEpzKqtodNGDgqCKXSqsVxd2nK9C1MufKc4MCnzYCfJc3h/
	QaoFUr1TY/sZ8idYP2giGyfsHLqTVD9mgkMfxnVZ/T4DE2tIfvs72stR4rioyGCj
	3Rj+Mc5PfS7zgfKojRpyH6YViZxjvPqeYx9R0/1AAXvXygbbSyv9BnE4ZfByhzxz
	LQ2URQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4cp8bbh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Mon, 26 Oct 2026 11:10:42 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91b8c60c550so75746046d6.0
        for <linux-tegra@vger.kernel.org>; Mon, 26 Oct 2026 04:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013042; x=1793617842; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k2CxYTJXMNJu8w6PVYOlO+zhm/teDp2OHpxctIuY7Sg=;
        b=QqfKWCoqkAvwoeUgCcgJlTl2k5GerAorxAviNUz6f0DM0G48NLvt3QdK64xNoNPyJe
         CnwvcaKhob8SaDtoWOn/h3/mwyWIpdqdjtq1gqr+o2LlyefzZF/jDe/FGboZI3Q4sSBa
         8AOsIj7N0leqAyV2l23oUbsdtzwgZMksAZNJRZHl9I5RR3G35HtarueUXwP+SEolINz4
         8tdOK5AIcZz/WjBRdVHEkJnZiAjPyjRTx52ulpbfI+g2TrgiaSYYhwrChk+7Av5aS7J7
         4A7FOiQKs0VMTR0EiKDCx+CLgpv+vEE9ZRcKv/lOo/Ap7GXwvMnZsqnuUQkK1yfWoICJ
         q0sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013042; x=1793617842;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k2CxYTJXMNJu8w6PVYOlO+zhm/teDp2OHpxctIuY7Sg=;
        b=L3smjEhOuuRALXHzUTeFaFnb0cUdy+xPK+u2CbWC7orWju0ppsSqOOEeZJMHAvUc3x
         Tp1RJzVeEH5uhu13FiWA3UyGPa2vCXFRylGOKZ9CWLh+FAltELfkByjrjyqJYl3Dok9o
         /GHw/skFM+ZblEHSmUK5Jk3gmYSaI+1l5tdceizFkgJLckH9BZXSQlzP6ZxzOj4oXTo2
         v4+TKX/sO2HTCISUcTe6JwsoYEB0OoDTN2CBMtamAppxdugj55hhDv3zLF80txD1C/e/
         o1Xt14ckmYXStU+Kk7nSrbgayWMOPwIVMKwlHZpTffojWL3eZtbr7VBQFcnyg2LnvklJ
         QCQA==
X-Forwarded-Encrypted: i=1; AKwUvBzXAZD/QZFGDz6cUJ9wdEHkg9e4gRkSXzD3tMDm7tBnNOp0tO1JNk39XP2xiS+75Yma9ShUYh5nnrzLEg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIFELHDUHTdEGYQBDOCCI1yi3rmTJyf4zHVt6dncDe99+4PAR7q
	d8bnKPWpkxL8ZZifJ2ZAzJbBjJ+tkLqKJ0uHj8dcu44DaPZuuwhiRLZppg9X/iXgQG3hHvCOUQT
	x7nxrE4wt0Uuq1Yr9XXjN8GtFdJ58ex1zJ9cEY5clj0YNAKSaK4467dJBEtgwFNxLWA==
X-Gm-Gg: AYBFou2J0o4K5iivjjNJHXJNcIo1yT3egkPf1hlETVMEHzySttOSdKABd78GfDV88He
	FPmLEpffP78URJdUfQtqcIRCgjlZFV3CT4PUo957WTwZgVTq0TzC6HFyIRhg0yKtM2OHTJewNua
	hMMGfYBI+eo6yGB4PUe4DvEuX69fEpFmDD2CRw5Ww1SUZbke/+smV1lagwWGUmnQOIn+Ln6aL/L
	4JK9nIEuTcfZGxUh3Ty2C4cB0GS44bpQMFt7WgMlJ7QJQjiIq6gfyyFMREDdy+uWF4X83g1ZYfU
	oQlGiTWOM2bcyBLjH859c6xyeH/PCjEDHMx7VBHokpokW38c1/Dt7mdQJymzKhInhfQGauS479u
	fGl2pWQk5k7SpquNe4JBmScv3OuUHGEp6gnfqrYKDkB61i16DyKQnfStqOl1bk9kk9JqzxG1+Do
	bgSMv6HctKzrZS
X-Received: by 2002:a05:620a:25c7:b0:93e:e531:b78d with SMTP id af79cd13be357-940ef7ca684mr861756585a.7.1793013041833;
        Mon, 26 Oct 2026 04:10:41 -0700 (PDT)
X-Received: by 2002:a05:620a:25c7:b0:93e:e531:b78d with SMTP id af79cd13be357-940ef7ca684mr861744385a.7.1793013041149;
        Mon, 26 Oct 2026 04:10:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:09:59 +0200
Subject: [PATCH 10/35] drm/pl111: use drm_panel_bridge_add()
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
Message-Id: <20261026-drm-panel-funcs-v1-10-5e3070a3478f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=946;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=CmM8Wphvynv0lIRI1+4+EqPH050ei17LGuNpAlAxYlU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zUKQ7TIU2XRP7HZmWCiTiNqZj11gfIKhJErO
 DHDY9rbRdyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81CgAKCRCLPIo+Aiko
 1YPGB/9rhW1ooU6FBzQ1pckqwHPnHHWFmRJFIB1Fpi/hiCtnjoh9PtNUR4MQKjC/rH3//hU3uFC
 nozE52P+NNx700phAyOXXZC7YRZJaCErlJn5BFFr1JiexNs20CTS6K7tejSh8TK2Y76rZUxhrrV
 Y2loDvttO806mSD/DRpUdu9ahHaiE+NhyJI0EW7G4jjWOQyvpEpueI9gklyFlhdEPlnarBK/s3f
 K5h9NwlLkyegQ9nvNlccObPXL5xrzNK+KqqmPhcUyPmVR3mJ1zA9ApXMADNC6Vdjq2EOaPrBcBs
 8rGmFy+GqfVfwsz798jK6AMPQ1yrjM6732SGR4Ykn3ZWK5IA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX/N+/M5KRHN8V
 wQ4ErtPrgapal0M1kJGrJNpdTHlfm4XmxfQbkonaGRwr6ROBjD6IjWfhDZQ7/rY2BJ+lAioZojx
 GKp3H0DLx3RlxADUwEi9cVJZdvFr1CBnUX6s6HKnV+AtOBj9l6jz93bGX2wgU++/SoWjT8woGsH
 0Ky44trJZ1aorm0KCR21PGgVnYvhonCApCU2HFy+gBi1TVJK5IMqowlY2fXgLHlw3SUSX/XnGcA
 0rliRt2f3dQG5pLW8jZafpWF6LG6XR0MsjXxbka2M1gBY5idUkEz+El1vzw1JqpNGP97/FmCtg/
 zjeeEd2ApUag6Zq5Z5S/M9YoTzEe5R3kGhaEQqqd31vnC93D4LHLwPKZQHxsOGNRd1xAKoJxCZX
 dUicK9+yDHPaOzdThSqLPO5gm47NFoj26riItuvyBAAjBipqDry8q7vKglk3kjw0xvezt5zxVmd
 CFLoZpm+wRyo+YKk37w==
X-Proofpoint-GUID: nwmhv0KEUjLwwvRBG9cNgzuVXnOBsbV6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfXwOeoJUlKRKRq
 yaDt6Cpa6ZwPZo2OS66ch6gGY9EH67RmZZC9KHt4+9/6uANUI7yewU20EhXo1/iOe7IXlX1P+75
 G/A8UDDnVA4RJJtbhGynqRdrJnQSc9E=
X-Proofpoint-ORIG-GUID: nwmhv0KEUjLwwvRBG9cNgzuVXnOBsbV6
X-Authority-Analysis: v=2.4 cv=TboDJhQh c=1 sm=1 tr=0 ts=6adf3532 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=6PQUdDDLQLJ_jpbVOC0A:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260044

The connector type passed to drm_panel_bridge_add_typed() has been
ignored since commit b7797081ccfe ("drm/panel: embed a drm_bridge into
every drm_panel"), the bridge always has the type of the panel.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/pl111/pl111_drv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
index 89d44e970510..d172cbb95d02 100644
--- a/drivers/gpu/drm/pl111/pl111_drv.c
+++ b/drivers/gpu/drm/pl111/pl111_drv.c
@@ -143,8 +143,7 @@ static int pl111_modeset_init(struct drm_device *dev)
 		return -EPROBE_DEFER;
 
 	if (panel) {
-		bridge = drm_panel_bridge_add_typed(panel,
-						    DRM_MODE_CONNECTOR_Unknown);
+		bridge = drm_panel_bridge_add(panel);
 		drm_panel_put(panel);
 		if (IS_ERR(bridge)) {
 			ret = PTR_ERR(bridge);

-- 
2.47.3

