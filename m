Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013022;
	b=BB3PG64IuvInx+IwpoKGaWe5noNHo5/Rmkg8g2IcjwLeIkMHjUibdIMvM4fePF8g80LT
	 p8gK8IsLXWjrYM8vLVTfKSOE2UUXDw4jIbhXTGuY1CrT01ITyNEvkGDSD76XNlQV0AWxX
	 LyvQlseAug6O3RbzVE8m62xkld2Di0NGslzEUcW3cRv/l5N6Y8t+Et9pBQEiSGLsybuC3
	 D2bntYvs8XFXa+Y5cWLSFDIvzwd8D5g3erFrnpRwHptUL1A7jNf7d9xn/IgHDa2thsUp0
	 s+kXYa2F/90vXT/F+YBPdS3TQzoSBTJshUZhSA0h1I7zcKxXJM+PeIJR4m7AkuWOhjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013022;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GN8AjaZA2KV/dRc58kbCFKDPB1a4uoE8ENNZKwDJCck=;
	b=2vB5LDsrKKQGiukO5GASzpzDUOZZD7bZVh49W8sfuRFAOlp+YMcwlxUXIdTiQyM3oiG9
	 kYUhngbEsH2Ow0v/uwqs5piHk4X+VFu7HrqQBj7BNTczHv+EB4xH0Jx4ACd3Ghhgm6aBq
	 RtxeCnWjl4jxXunem7hgdfZ2Y3B3tuFBoMZBSF1bR2l0SOBdndM96O6tBza096agZYBMi
	 sEfuzZi70h/qJ8AEaIzy+fhda77BKOWCl8TDCQFataHtKdWhc3CcyF4xqIn9oyHYziDMK
	 suZTTk1V82z/vygY46UfciX/GXCbvzuzEvPSX1L+shp5ANSed74qJGet6BbMHrczj3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ECUUVF06;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N+dG3hc9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B990A606A328
	for <linux-tegra@vger.kernel.org>; Mon, 26 Oct 2026 11:10:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B990A606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ECUUVF06;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N+dG3hc9
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtYL41547988
	for <linux-tegra@vger.kernel.org>; Mon, 26 Oct 2026 11:10:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GN8AjaZA2KV/dRc58kbCFK
	DPB1a4uoE8ENNZKwDJCck=; b=ECUUVF066jvbqQJG9QaidJNgZqka7pJ7uTZDAf
	l4jWr9mREvagPO1rBdPa/0vh1A6Oi6BYXcJ76lze5gh2H4snVK5z4taBubEEL6fw
	efgMw/ggF8ufOEbjSPXjquIiojjAjQFe3mEc17+CwJCwc1wQTcmTW9sCwr7Yg78V
	1mg2HfIFi01K3N/MYd9ER1Q/2f/mNYffrHO1osVJ95FwL6KMjK+X2vFoflwIfmvB
	DZn0n2JKmfz6+sJGnknhumjjRFsT1KMiRigMZfId5NFp4uEZZTrGRxzT19hDaVLw
	J5++pAlxiGOyLWqSxnLxPDIaLIrEWNKPukkz4Fc0rU8DN+8Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsgst5c2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Mon, 26 Oct 2026 11:10:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f559420f3so267881985a.0
        for <linux-tegra@vger.kernel.org>; Mon, 26 Oct 2026 04:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013020; x=1793617820; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GN8AjaZA2KV/dRc58kbCFKDPB1a4uoE8ENNZKwDJCck=;
        b=N+dG3hc9I/VMdIS7abDa43eb3PforAkBmjJVxcWPaSLhLp4ZZ4UT4n61OqsMaW7SMd
         b8vgH3SIiIcVLkWhTdrDFmJNMEvmAuGEzKdKFQfP9s5WTWAM4T/LxHBxYeuqb3QQh6Nd
         +EClhftX7AITjSsaPtmL9z9XqBQp44cJYbfZOkQ9BVFpT2SxcVNtzwnKXPECWCj/e2wE
         cN1RLxss9FOYi0t0MeOU8JSQLZJEAdwuPlP/GPRe9r6i0NwZCUL/gstnrLZhWJVT5rtX
         9q30MSxTSD3q4Nfo1O81ThAVbZWaenFlHolyq8LdJcAz3uRoEFcsenriFlobc1G17mfk
         4YDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013020; x=1793617820;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GN8AjaZA2KV/dRc58kbCFKDPB1a4uoE8ENNZKwDJCck=;
        b=EVI5DQva8aQB4aKcgCZ+RHWtx9lJimXn7vPOKMKv5mKZXPBe7ue2KgPP+n0d32mnqR
         1IobNpyEdxLuU6XYl3nq5uxNaZrdAO4+ApIe943/zTp3zaLuPFxpzlS+Y+HP4qnbxWPL
         bwp1ro3KDktGXiuf0Wc1uFueGfwOdR3UhsjemDfjZDup31gAMH8th48XyqmE+BifTGKS
         SXJXjx1F+CjkwHyBhc2q5D53O9RB/zi6JFbROYW53BwNhNQ0U0UtNE1dgWneGhnLtlAQ
         Jv8SCQ0wnEF2XxXQVWG7QPlYkUy6p4Mi7ynG/+QVuyCyFS0wE2fCIELGkURHSy6S/b2E
         XHpw==
X-Forwarded-Encrypted: i=1; AKwUvBy8p/vSRBi9mfvdQpqhe1LM5Xd6tASGiDPbnWrx1dVwOewnQ0xriIKrc7sTyY2/9dbraJm5Xl3MNSyW/A==@vger.kernel.org
X-Gm-Message-State: AFq9FYLa71N39ej8ufVCokyZ/0W2BdvROPuwmuDliO9viPs62YUuYRO7
	H3CFhZ5uiz3uxMPni7sszoIm51FqBhpt5HMjDJZHnFhAQBd49sQWF3qOxDyY/A4GJRZrV+X9zOG
	3lPfNi1n/rfFe8eJgNXs+6WABSq8EjJQCgrhEZWVo7ceqlq8IaJ52tnoUclVYs4MYTQ==
X-Gm-Gg: AYBFou0mCuGwck1EMwvy4TGcPBMhVrzNldao9G57AtetAUJ7MtIQ82ZT0bB4+Hd94OP
	6aaXCViSALq4F6ASQA4FHiZmga5t/T11AK5gBGyxtuSbDQ/IjH+nYXJ4mEEYxsQibm2gJVasjGb
	Ee4TLQZa81a4CyJHfqLAzI60mswmUCkWneRTXrgq0YwkbaZ2QSrPwKggCF8ghVd+psjjdAQ8gF3
	2VBZ2wM+X8S0ZM1iwIUHmjZM/CZLRKfHJy6TVz5RR832xQPUXnnrTZjzQbpPxGeIoUKl6EilYD4
	+Lr1jnnVBDc8Bw6uKDq71ayEjJzXFyJFjoPFvA+zYHG3b6fqY4LHLysRWSQ1TtED/F57LhoCPme
	+YxDlLyh9Ah4Uxs0j365dRqd1aYZpNUPhZKg5mVGlpyQLWEW0t/uDjpvMcHyivu4G1DXJD0tnd8
	KVbwCQZdWJ1ypY
X-Received: by 2002:a05:620a:4592:b0:93d:f7ac:4706 with SMTP id af79cd13be357-940ef7d3955mr1003486285a.9.1793013019238;
        Mon, 26 Oct 2026 04:10:19 -0700 (PDT)
X-Received: by 2002:a05:620a:4592:b0:93d:f7ac:4706 with SMTP id af79cd13be357-940ef7d3955mr1003477485a.9.1793013018435;
        Mon, 26 Oct 2026 04:10:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 00/35] drm/panel: let the panels use the atomic state
Date: Mon, 26 Oct 2026 13:09:49 +0200
Message-Id: <20261026-drm-panel-funcs-v1-0-5e3070a3478f@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAP4032oC/yXMTQqDMBBA4avIrDuQWPy9SunCJBMd0SiZWgTx7
 o11+S3eO0AoMgm02QGRviy8hAT9yMAOXegJ2SVDrvJSK/1EF2dcu0AT+i1YQeWNLRrj6qpRkKo
 1kuf9f3y9b8tmRrKfawPn+QPncvtCcwAAAA==
X-Change-ID: 20261013-drm-panel-funcs-0fbc59bd8790
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=15762;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=WbLlzAO9RXIQix7Q1voClvMQtNLZHdIsKY6Rg/IyJX0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zUBXY1ouoWCjChMbl7mPq8TiXrQG0qEmSuBj
 cIC8Sn+ZbGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81AQAKCRCLPIo+Aiko
 1dQUB/9qeMU54/7a41w3LggyOuuJS2TWEjfaEkAz3vTHLeEOZdJEKcwwj/v6PiwY5h0mF7Z9qLi
 7i36b+iEFTnQ1p9fUulKSuzDYoHDSty8Pd6ZqJApSQuPeavAAwDjtidScu8A4alj2wvst2+zriN
 cYEAVtja0KZSwkywSpgTy+RQDnRMy/bjOew6XlEnJ8EX0SP+w8uFxpa4ppk44/vv44+XmtSshzu
 6rzUjzgvFid2h1yBQLRvbtFrWG0UylcqILraFA8LqBVM6+HexmsPyQA6SCZRfOHRIHrhbnkGVec
 vUw0rE6XdvS+rDC6BFfvPggvoUsrg6fblExDHIlL8p9NY2Hx
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX6B02l36Mv2PB
 7c7QIGhS/avJYXjqJQZTXwT5LEOenWTh/mf5o/Wr8+S3SwxpKiZy2DOWXwTUMRxq3k+vwVGWCPe
 8Q2bISbdW8h+BByT8GOs6ebON4HC1Q4=
X-Proofpoint-GUID: vokYx6P95s8lDbZvTPFajACePuOHpIH1
X-Authority-Analysis: v=2.4 cv=c+8+0h9l c=1 sm=1 tr=0 ts=6adf351c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=scXMUnCTZPnnbQHXwmsA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: vokYx6P95s8lDbZvTPFajACePuOHpIH1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfXxdzRdsNVEXDh
 46iSjYRZWe2TTzACwETIEyTzDP76QeTaxV431Jinb3uE9P37uTFYuiaCoqKGQNRAZ8MsfV2C/oQ
 qzXlAgOf8RDs1c3OIgVyISK0NQ54m1fd8Ueap53bPgArUVuJ7lC4RCRLqlhEe9EQIpPDnQuOGvl
 TzOHiJXhOGwX6+ghfyGPd/F86u4uiDnJhA+ultNW+x9HXCFHOfPlUIAd5r78u98dmhgpQa6Oma1
 0GQat5eN5YPLDr2zyzyLVAq3eSwnsNXNI2KHPK8s8+N4b/lYGV4pIIUoTHFx9WNBQfB5E8GL8sd
 pXo+viEB19ity48nyPfL3ejxUWY/wpkyMXhxkXy2zjTzmdm899Pq12qW3h1qgVs2OTsYwP5J6eZ
 sWYXik5dZKzLxBElBI8a81B8aIlbCVzOzfELH2+n9cJzfGZGQRsbrQ31GicleYpMJGr3ymSNCdH
 LArD41zgNrl46GINrng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1011 priorityscore=1501
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260044

The panel is the only element of the display pipeline which never sees
the atomic commit. Its prepare() and enable() callbacks get nothing but
the panel, so a panel which has to be programmed differently depending
on the mode can only guess it. The NT35950 driver, for example, saves
the connector in get_modes() and reads connector->state->crtc->state
while being prepared: without the locks, from the current state rather
than from the one being committed, and with no way to reject a mode it
doesn't know.

Every panel has a struct drm_bridge embedded into it, and the bridge
already has all the missing parts: atomic_check(), a state object which
can be subclassed and the commit passed to the callbacks. Rather than
growing struct drm_panel_funcs into a copy of that, let the panel driver
provide struct drm_bridge_funcs for the embedded bridge. This is opt-in:
the panels which have no use for the atomic state keep using struct
drm_panel_funcs and are not touched by it.

To get there the bridge callbacks become the entry point to the panel,
with drm_panel_prepare() and friends calling them rather than the other
way around. The panel core still has to track the panel state, notify
the panel followers and handle the backlight, so the driver doesn't fill
in the power callbacks directly, it wraps its functions with the macros
doing that part. NT35950 is converted as the first user.

The bulk of the series is the cleanup of what the panel core and the
bridge need from the panel driver, so that a panel providing the bridge
callbacks doesn't need struct drm_panel_funcs for anything:

- get_timings() had no callers.

- The connector type was stored both in the panel and in its bridge, and
  the display drivers could override it while creating the panel bridge.

- The orientation was read from the DT, stored and returned by nearly
  identical code in more than twenty panel drivers, and some of them
  also had to set it on the connector from get_modes(), with a TODO
  asking for a better place. The core reads it now. It is applied to the
  connector from the new connector_init() bridge callback, which is not
  specific to the panels: other bridges have properties to set up on the
  connector being created too (HDCP, DP link properties), and currently
  have nowhere to do it.

- disable() and unprepare() returned an error which nobody could act on.
  Worse, a failed unprepare() left the panel marked as prepared, so it
  was never initialised again.

Behaviour changes worth knowing about:

- Panels with the rotation property whose driver ignored it now get the
  orientation property. In the tree this is the Motorola Mapphone panel
  (panel-dsi-cm).

- sun6i_mipi_dsi, sti_dvo and the Tegra DSI get their panel after the
  DRM device has been registered, which is too late to create the
  property, so they lose the orientation which the panel drivers used to
  set from get_modes(). None of the rotated panels in the tree are used
  with them.

- A panel implementing atomic_check() can only be driven through the
  bridge chain. The display drivers calling drm_panel_prepare() directly
  have no commit to pass.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (35):
      drm/panel: remove the get_timings() callback
      drm/panel: remove the unused struct panel_bridge
      drm/tidss: get the panel type from the embedded bridge
      drm/bridge: lvds-codec: use devm_drm_panel_bridge_add()
      drm/ingenic: use devm_drm_panel_bridge_add()
      drm: mxsfb: use devm_drm_panel_bridge_add()
      drm: rcar-du: use devm_drm_panel_bridge_add()
      drm: rz-du: use devm_drm_panel_bridge_add()
      drm/mcde: use drm_panel_bridge_add()
      drm/pl111: use drm_panel_bridge_add()
      drm/rockchip: lvds: use drm_panel_bridge_add()
      drm/rockchip: rgb: use drm_panel_bridge_add()
      drm/panel: remove the _typed() panel bridge functions
      drm/panel: remove drm_panel.connector_type
      drm/bridge: anx6345: set the panel orientation on the connector
      drm/exynos: dpi: set the panel orientation on the connector
      drm/fsl-dcu: set the panel orientation on the connector
      drm/logicvc: set the panel orientation on the connector
      drm/stm: lvds: set the panel orientation on the connector
      drm/sun4i: set the panel orientation on the connector
      drm/tegra: sor: set the panel orientation on the connector
      drm/panel: drop the orientation workaround from get_modes()
      drm/panel: read the panel orientation in the core
      drm/panel: use the orientation from the panel core
      drm/panel: remove the get_orientation() callback
      drm/bridge: add the connector_init callback
      drm/bridge-connector: let the bridges set up the connector
      drm/panel: let the bridges set up the panel connector
      drm/panel: set the orientation from the connector_init callback
      drm/panel: make the disable and unprepare callbacks return void
      drm/panel: don't hold the follower lock over the panel callbacks
      drm/panel: route the panel calls through the bridge callbacks
      drm/panel: let the panel drivers provide struct drm_bridge_funcs
      drm/panel: novatek-nt35950: provide struct drm_bridge_funcs
      drm/panel: novatek-nt35950: use the atomic state to select the mode

 Documentation/gpu/todo.rst                         |   1 -
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c |   5 +
 drivers/gpu/drm/bridge/lvds-codec.c                |   3 +-
 drivers/gpu/drm/display/drm_bridge_connector.c     |  12 +-
 drivers/gpu/drm/drm_bridge.c                       |  31 +
 drivers/gpu/drm/drm_connector.c                    |   8 +-
 drivers/gpu/drm/drm_panel.c                        | 653 +++++++++++++--------
 drivers/gpu/drm/exynos/exynos_drm_dpi.c            |   1 +
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c          |   5 +
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |   3 +-
 drivers/gpu/drm/logicvc/logicvc_interface.c        |   7 +
 drivers/gpu/drm/mcde/mcde_drv.c                    |   3 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c                  |   3 +-
 drivers/gpu/drm/panel/panel-abt-y030xx067a.c       |   8 +-
 drivers/gpu/drm/panel/panel-anbernic-td4310.c      |  18 +-
 drivers/gpu/drm/panel/panel-arm-versatile.c        |   4 +-
 .../gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c   |   4 +-
 drivers/gpu/drm/panel/panel-auo-a030jtn01.c        |   8 +-
 drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c     |   4 +-
 drivers/gpu/drm/panel/panel-boe-himax8279d.c       |  12 +-
 drivers/gpu/drm/panel/panel-boe-td4320.c           |   4 +-
 .../gpu/drm/panel/panel-boe-th101mb31ig002-28a.c   |  33 +-
 drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c     |   4 +-
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c     |  30 +-
 drivers/gpu/drm/panel/panel-chipone-icna35xx.c     |  24 +-
 drivers/gpu/drm/panel/panel-chipwealth-ch13726a.c  |  24 +-
 drivers/gpu/drm/panel/panel-dsi-cm.c               |  11 +-
 drivers/gpu/drm/panel/panel-ebbg-ft8719.c          |   8 +-
 drivers/gpu/drm/panel/panel-edp.c                  |  53 +-
 drivers/gpu/drm/panel/panel-elida-kd35t133.c       |  22 +-
 drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c  |   8 +-
 .../gpu/drm/panel/panel-feiyang-fy07024di26a30d.c  |   8 +-
 drivers/gpu/drm/panel/panel-focaltech-ota7290b.c   |  21 +-
 drivers/gpu/drm/panel/panel-himax-hx8279.c         |   8 +-
 drivers/gpu/drm/panel/panel-himax-hx83102.c        |  22 +-
 drivers/gpu/drm/panel/panel-himax-hx83112a.c       |   8 +-
 drivers/gpu/drm/panel/panel-himax-hx83112b.c       |   4 +-
 drivers/gpu/drm/panel/panel-himax-hx83121a.c       |   4 +-
 drivers/gpu/drm/panel/panel-himax-hx8394.c         |  24 +-
 drivers/gpu/drm/panel/panel-hydis-hv101hd1.c       |   8 +-
 drivers/gpu/drm/panel/panel-ilitek-ili7807s.c      |   4 +-
 drivers/gpu/drm/panel/panel-ilitek-ili7836a.c      |  24 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9322.c       |  12 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c       |   7 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9488.c       |  18 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9805.c       |   4 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9806e-dsi.c  |  18 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9806e-spi.c  |   4 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c      |  31 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9882t.c      |  24 +-
 drivers/gpu/drm/panel/panel-innolux-ej030na.c      |   8 +-
 drivers/gpu/drm/panel/panel-innolux-p079zca.c      |  10 +-
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c   |  21 +-
 drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c       |   4 +-
 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c      |  12 +-
 drivers/gpu/drm/panel/panel-jdi-lt070me05000.c     |   8 +-
 drivers/gpu/drm/panel/panel-khadas-ts050.c         |  12 +-
 drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c |  14 +-
 drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c |   6 +-
 drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c |   4 +-
 drivers/gpu/drm/panel/panel-lg-lb035q02.c          |   4 +-
 drivers/gpu/drm/panel/panel-lg-ld070wx3.c          |   4 +-
 drivers/gpu/drm/panel/panel-lg-lg4573.c            |   4 +-
 drivers/gpu/drm/panel/panel-lg-sw43408.c           |   7 +-
 drivers/gpu/drm/panel/panel-lincolntech-lcd197.c   |   8 +-
 drivers/gpu/drm/panel/panel-lvds.c                 |  25 +-
 drivers/gpu/drm/panel/panel-lxd-m9189a.c           |   8 +-
 .../gpu/drm/panel/panel-magnachip-d53e6ea8966.c    |   8 +-
 drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c   |   8 +-
 drivers/gpu/drm/panel/panel-motorola-mot.c         |   8 +-
 drivers/gpu/drm/panel/panel-nec-nl8048hl11.c       |   4 +-
 drivers/gpu/drm/panel/panel-newvision-nv3051d.c    |   6 +-
 drivers/gpu/drm/panel/panel-newvision-nv3052c.c    |  12 +-
 drivers/gpu/drm/panel/panel-novatek-nt35510.c      |  12 +-
 drivers/gpu/drm/panel/panel-novatek-nt35532.c      |   4 +-
 drivers/gpu/drm/panel/panel-novatek-nt35560.c      |   6 +-
 drivers/gpu/drm/panel/panel-novatek-nt35950.c      | 168 ++++--
 drivers/gpu/drm/panel/panel-novatek-nt36523.c      |  24 +-
 drivers/gpu/drm/panel/panel-novatek-nt36532.c      |   4 +-
 drivers/gpu/drm/panel/panel-novatek-nt36536.c      |   4 +-
 drivers/gpu/drm/panel/panel-novatek-nt36672a.c     |   4 +-
 drivers/gpu/drm/panel/panel-novatek-nt36672e.c     |   4 +-
 drivers/gpu/drm/panel/panel-novatek-nt37700f.c     |   8 +-
 drivers/gpu/drm/panel/panel-novatek-nt37801.c      |   4 +-
 drivers/gpu/drm/panel/panel-novatek-nt39016.c      |  12 +-
 drivers/gpu/drm/panel/panel-novatek-nt51021.c      |   4 +-
 drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c |   4 +-
 drivers/gpu/drm/panel/panel-orisetech-ota5601a.c   |  12 +-
 drivers/gpu/drm/panel/panel-orisetech-otm8009a.c   |   8 +-
 drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c |   8 +-
 .../gpu/drm/panel/panel-panasonic-vvx10f034n00.c   |   7 +-
 .../gpu/drm/panel/panel-raspberrypi-touchscreen.c  |   7 +-
 drivers/gpu/drm/panel/panel-raydium-rm67191.c      |  16 +-
 drivers/gpu/drm/panel/panel-raydium-rm67200.c      |   8 +-
 drivers/gpu/drm/panel/panel-raydium-rm68200.c      |   4 +-
 drivers/gpu/drm/panel/panel-raydium-rm69220.c      |   4 +-
 drivers/gpu/drm/panel/panel-raydium-rm692e5.c      |   8 +-
 drivers/gpu/drm/panel/panel-raydium-rm69380.c      |   4 +-
 drivers/gpu/drm/panel/panel-renesas-r61307.c       |   8 +-
 drivers/gpu/drm/panel/panel-renesas-r63419.c       |  25 +-
 drivers/gpu/drm/panel/panel-renesas-r69328.c       |   8 +-
 drivers/gpu/drm/panel/panel-ronbo-rb070d30.c       |   7 +-
 drivers/gpu/drm/panel/panel-samsung-ams581vf01.c   |   4 +-
 drivers/gpu/drm/panel/panel-samsung-ams639rq08.c   |   4 +-
 drivers/gpu/drm/panel/panel-samsung-atna33xc20.c   |  14 +-
 drivers/gpu/drm/panel/panel-samsung-db7430.c       |   8 +-
 drivers/gpu/drm/panel/panel-samsung-ld9040.c       |   7 +-
 drivers/gpu/drm/panel/panel-samsung-ltl106hl02.c   |   4 +-
 drivers/gpu/drm/panel/panel-samsung-s6d16d0.c      |   8 +-
 drivers/gpu/drm/panel/panel-samsung-s6d27a1.c      |   8 +-
 drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c      |   8 +-
 drivers/gpu/drm/panel/panel-samsung-s6e3fa7.c      |   8 +-
 drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c   |   8 +-
 drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c      |  16 +-
 drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c      |   8 +-
 drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c   |  14 +-
 drivers/gpu/drm/panel/panel-samsung-s6e63m0.c      |  13 +-
 .../drm/panel/panel-samsung-s6e88a0-ams427ap24.c   |   4 +-
 .../drm/panel/panel-samsung-s6e88a0-ams452ef01.c   |   4 +-
 drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c      |   7 +-
 .../panel/panel-samsung-s6e8aa5x01-ams561ra01.c    |   8 +-
 .../gpu/drm/panel/panel-samsung-s6e8fc0-m1906f9.c  |   4 +-
 drivers/gpu/drm/panel/panel-samsung-sofef00.c      |   8 +-
 drivers/gpu/drm/panel/panel-seiko-43wvf1g.c        |  22 +-
 drivers/gpu/drm/panel/panel-sharp-lq079l1sx01.c    |   4 +-
 drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c    |   4 +-
 drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c    |   7 +-
 drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c    |   6 +-
 drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c    |   4 +-
 drivers/gpu/drm/panel/panel-simple.c               |  53 +-
 drivers/gpu/drm/panel/panel-sitronix-st7701.c      |  28 +-
 drivers/gpu/drm/panel/panel-sitronix-st7703.c      |  22 +-
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c     |  35 +-
 drivers/gpu/drm/panel/panel-sony-acx565akm.c       |   4 +-
 drivers/gpu/drm/panel/panel-sony-td4353-jdi.c      |   4 +-
 .../gpu/drm/panel/panel-sony-tulip-truly-nt35521.c |   8 +-
 .../gpu/drm/panel/panel-startek-kd070fhfid015.c    |   4 +-
 drivers/gpu/drm/panel/panel-synaptics-r63353.c     |   4 +-
 drivers/gpu/drm/panel/panel-synaptics-tddi.c       |   8 +-
 drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c       |   4 +-
 drivers/gpu/drm/panel/panel-tpo-td028ttec1.c       |   8 +-
 drivers/gpu/drm/panel/panel-tpo-td043mtea1.c       |   4 +-
 drivers/gpu/drm/panel/panel-tpo-tpg110.c           |   4 +-
 drivers/gpu/drm/panel/panel-truly-nt35597.c        |   8 +-
 drivers/gpu/drm/panel/panel-visionox-g2647fb105.c  |   4 +-
 drivers/gpu/drm/panel/panel-visionox-r66451.c      |   8 +-
 drivers/gpu/drm/panel/panel-visionox-rm69299.c     |   4 +-
 drivers/gpu/drm/panel/panel-visionox-rm692e5.c     |   8 +-
 drivers/gpu/drm/panel/panel-visionox-vtdr6130.c    |  20 +-
 drivers/gpu/drm/panel/panel-widechips-ws2401.c     |   8 +-
 drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c   |   6 +-
 drivers/gpu/drm/pl111/pl111_drv.c                  |   3 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c  |   5 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c   |   5 +-
 drivers/gpu/drm/rockchip/rockchip_lvds.c           |   2 +-
 drivers/gpu/drm/rockchip/rockchip_rgb.c            |   3 +-
 drivers/gpu/drm/stm/lvds.c                         |   4 +
 drivers/gpu/drm/sun4i/sun4i_lvds.c                 |   2 +
 drivers/gpu/drm/sun4i/sun4i_rgb.c                  |   2 +
 drivers/gpu/drm/tegra/sor.c                        |   2 +
 drivers/gpu/drm/tidss/tidss_kms.c                  |   4 +-
 include/drm/drm_bridge.h                           |  23 +
 include/drm/drm_panel.h                            | 219 +++++--
 163 files changed, 1080 insertions(+), 1532 deletions(-)
---
base-commit: 4305aa866f20288739b680c75fd44d9f029b0c0b
change-id: 20261013-drm-panel-funcs-0fbc59bd8790

Best regards,
--  
With best wishes
Dmitry

