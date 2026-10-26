Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013067;
	b=2ZUOYxrSQ8JmGg9MkGla+Jb97/BjTSMltnKuI16pwjLrJ3r/QyCeF26UPsVQ0Zya/gyU
	 +ZOvWhERB8SP4Ib3K6q/gBl3v0KzL1eZKbo4AeiwLjoK4vBGH2EZmpcdYVO5SQzA/u/CM
	 Flt7DNVXddQRcwa82/9sKOv9DNCHclCfGE8XZ/8SF/5pKLmiWh+pIHVmhmTl4tHBXx7Gm
	 236waikE7SGDkQTdrE4e8tD3sETMhR42tgQjdhFSnTE0Oy9ii20nv/KYd7bJFgekmyc1A
	 2nd2I20SA92LoDJAkBt3duSpwzxxhX6rFOCYzMLz6qvEKrO/u/uz7dTLszlbxzcjONA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013067;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=z+AIXvczawfI8EmCH7mB903AvReMzPtUT6kwOSKhzOs=;
	b=t9/YfP4fOX36H3EJT1o7nBxMWWddEV0InJz5E9Dur7Ewnlg5Br2NkYLR7DPNwv4HEbEy
	 tGB+5QyBS3gqQAA+YeO7A8WJy/MsXP1NOEzBa9Tro4KC/sPK1qun5CgrpIAVYWMR5rbWP
	 Btd4Ta8RB3LMcwsR4E1GdFYdfEQS4tg8gkEtBUYC6bw2sktwGTLrAQJNFCklX9P+fBvtR
	 CXFtX/beXHMiSIuzqPHu5yL4SiGqOMqKM6tn99nHPXcTHUx7yPnSTmkttcqaudtpigrZ5
	 wkgkaEnjII/T6WYHGkyZ1nZFPfYZ753+aGcpbJL1JtQYI36yy5wPDawnMFn+8ytqDdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SoOl5FT4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QUnjui7X;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A391560A381A
	for <linux-tegra@vger.kernel.org>; Mon, 26 Oct 2026 11:11:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A391560A381A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SoOl5FT4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QUnjui7X
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtMUg2541998
	for <linux-tegra@vger.kernel.org>; Mon, 26 Oct 2026 11:11:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z+AIXvczawfI8EmCH7mB903AvReMzPtUT6kwOSKhzOs=; b=SoOl5FT4oUwWlrup
	w602dzJ/8d0kluDERn7rgovsGk3r3RrwLNwQY1CGhhoo1cP0kQrBjgHAValXUwzg
	/nXzV3W953+C71g7MRN0LcfE4CEo9jT1GuCfnk06b89a/woNyI++7gScIFEAXtXe
	iBU40U15wQItKd263vXug6XGe1F/e01tDeKIxRGvjOqR35y9cpdgYQXUUb8fqkuu
	xg0spNtF1KCFop80bJfrQH13wlV56QhqN8bw39wHLMVAyJMVJ5Jb1zvjAjpmDZL3
	A+U9NqRS2GAIdMQak8y8608vMdKzlSj/UtHQP2JtpbLO9fpjLmkf+VaC3vtMr2xG
	JLbPEA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsjda5pe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Mon, 26 Oct 2026 11:11:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e49a1d3b1so364859785a.2
        for <linux-tegra@vger.kernel.org>; Mon, 26 Oct 2026 04:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013065; x=1793617865; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z+AIXvczawfI8EmCH7mB903AvReMzPtUT6kwOSKhzOs=;
        b=QUnjui7X6DOl8UXWlO2p5/cCCOe6yhc7wKRF6xsZ6BehAn7hhpPi22obMG1zCZl7lF
         SIT3MofOVOePFBouO7vlF5g5EOngFA0vzGFKadMxfmGAop/bljabTMo/fYbfx8ZLhQVQ
         qPcQ28KgZHM6VYV5LDW/R4i/OfP060tC9ov7Joig3Dgg7VjdSu2OZpm4pYMkSCQefpPt
         Hoknn2mdN7Vicd00zGSgg6/Y5UplYic9ExFyzeJ35H1GC6vWxQtc3v+q2sI8+Xk4TpHh
         tku8s7E/HE/RfTwXK681E0GU1Np0Yms+3CVeiX5HJdX5VPS5DRLTawpNCSq2N0kzfzCl
         W7Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013065; x=1793617865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z+AIXvczawfI8EmCH7mB903AvReMzPtUT6kwOSKhzOs=;
        b=z498Z6cHH4ThDi+eOQBMvMsAegUJk515d8p/wJ9JgWonUSkv3Qz30rQ5/GSZi6aMnr
         tLs07IPXKfHSyoiutd4sageotW3kI9qykjuiOVd1ze1qMC681pj/JBxrvQ/5RANoIztT
         bNAzvN1v/gLM0aLnkG5ora4zKoWquUW5y4NHL0CgyOzFg4+4UKcko0ufOlq74P56z2Bh
         hjexd3QnYJylQuEMyn0IVx4wY67Mp9s4H/HFLqxUU0QYrESvAzrtz0RZw0Iiqm3CKUp7
         AlCftglNjAUyxZIwqy3lkQZ2DPKTf+uGV1Hh/AUOdYz1Qm221WFkHzjw0AK1ZADFvyRl
         7tQQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVZbUR1V9BH2lQFb40emEpOhYVP3yfO3qbT5oSMkv8osFmPn6rBlVM2VoXzaOX40RlEwY5SN50HIy7hg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLaLfMwdn0gNqG1Znmwq9QNpPAzr6PC6MIuj16i4fwyXFlL5GpP
	HR/UcJ9fealM/9diAG3OIzuGQwenCRKTePgR3GMqRCdjRKCzA5Z5CJGz2tgPgieSEJdfpe7p1Bt
	GsQMq83EMEBghU4uXpawexgLjuKycpnmvflr160CjN6Oo/o0QbdNx5+wJXiAyX5Apkw==
X-Gm-Gg: AYBFou3AaGe/FHwjqMJuaWbCsSOwxsWnHXbGHTk+7gmv3ETMaORILFqinarLiIvXqFL
	U4lJMrFi12bEBHnkXMM3+rsRZIlFCiQzTZg279zoTPIofDTYx70jpt0zmumeDHlrUVIQv4f6PSS
	etHAbVR827vxZxBp8uVy9xzgrAvHqzUUrYUxA5FRhbosky7KCLZmRlmX6MVvEyuLNDiVIeSLnHM
	fltFtr+eBsqFuOJ0xEIDdijOo/i25jI0B7C71dqFRbU1tBe+3U1WASHMuXMdMtcNoXl+6JqcWSJ
	DGbpdJU8kBui/C3bynpQza82gPKLtOcShTZvz/ONQf0UUKTxYWe2EJMs0Tiqzy5oSWFVIn7B4e7
	rtSYSiLqmBCc1Jis7zcpCtFEmzwH2yntOpcZMw6Zq2b0MNddWDIlZX7/Q+4fexHorrVOGWHPJ3c
	x7sp6sY44ST1pT
X-Received: by 2002:a05:620a:4016:b0:93c:8e3f:3036 with SMTP id af79cd13be357-940ef795b3fmr912290085a.4.1793013064676;
        Mon, 26 Oct 2026 04:11:04 -0700 (PDT)
X-Received: by 2002:a05:620a:4016:b0:93c:8e3f:3036 with SMTP id af79cd13be357-940ef795b3fmr912276285a.4.1793013064036;
        Mon, 26 Oct 2026 04:11:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:11:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:10:07 +0200
Subject: [PATCH 18/35] drm/logicvc: set the panel orientation on the
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
Message-Id: <20261026-drm-panel-funcs-v1-18-5e3070a3478f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1168;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Qdajy+ZxizCGYRHwcySOH98TyzKssLnXiyy5l4MYQ6w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zUOSPb5SkROiJ1qgWHeJ/0zI3xpF33LRg7Kl
 3E+JMtrfDKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81DgAKCRCLPIo+Aiko
 1fCrB/sG4pFH+B9sQNL86lviJf0md4fWW8kPrNEAXeSTrNauPGWoN+5qU86gqZnym81fcvJGHWt
 eidB4GCk2J5yvG2doNP8Mgu5fQwLl91HF7cy1j/D0y3dqSMl3DZ4Bx6bni/p1jmv25RYm5RDwWV
 9pUznhEgK6pJdKm5YVNoOIlduKYbWWVGMEvzwSvXdNTYFH8RiG70sb4ThrUeLCmKUSF38QGdbdg
 SqZrAkA4nt1QYH9Y9EVqohUn/NIGzsKGvBK8yURwP9QQvtHIFXvTtWwnoT+jm71gG/gkc8aAvk3
 5dwraj1xDfN8EgWs5GT3ujM5ENWatL+090SyEKJp6JNnP1PC
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: QeGzUk0cFOeQ0O_tHdcqJJvl4sbXZaNX
X-Proofpoint-GUID: QeGzUk0cFOeQ0O_tHdcqJJvl4sbXZaNX
X-Authority-Analysis: v=2.4 cv=a4elZkSF c=1 sm=1 tr=0 ts=6adf3549 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=1mv1z9nBhO4L486rGt0A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfXwnzzSme2hp1q
 s0NiXKOgAw/0MiR8/p/ERBGLnbkonfF1HqD0/wOCUukLtTgRgNWsKXH6GPLcyT8wClJgGj4Lxpd
 2CT77HD+k/2i6uT8xmqBPyCpCEbw6Fc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfXwWslY0IfIRex
 zOKYcqzI8A+p4z+eT4aggfBS40ze6XNFVE8g9FzyVvN9ygDEz+oaLu/1R+LePPzH7nI84VEy8oa
 1qGiQOVm4MqiR7lW5eejAzQRRh3LnX1OQIgxZU4qxGj6R/7PsYgKe3ALociWh54MV9Zi2VgVJ4z
 UmUe7QSCT0sY2F6elx6QwW/Gtfh5//7kZl9HE0WaW8cujuvBLs3B1oDIsKpbqiZvVOIAH/nFlY6
 8kunzgy2R6HkrC2EmsQ+QGNjCaI/JTlvxsrELlZQiZeQL8Iw7nwueKxg75ET5ueRKytCLunDLop
 /wMZ3vq7g3QsvjsIsR3GwPZ/4N+vpg/PJDrb6YTrTM/Xzh0IXv6PD+wANCqumz+OZWlxotndWXu
 mL8ZvgAFhbPRI/1x1pZvoknthTXbWMenGCNjLZs1Tco7PnV2HsLsv7dQvs/B2CnD0vNepbGswXw
 uUmzhmlUNF/jTKhoBUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260044

The panel is used directly, without the panel bridge, so nothing sets
its orientation on the connector apart from the workaround in the
get_modes() of some panel drivers, which runs too late.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/logicvc/logicvc_interface.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/logicvc/logicvc_interface.c b/drivers/gpu/drm/logicvc/logicvc_interface.c
index 81f760dc07f8..bcbb837c9675 100644
--- a/drivers/gpu/drm/logicvc/logicvc_interface.c
+++ b/drivers/gpu/drm/logicvc/logicvc_interface.c
@@ -194,6 +194,13 @@ int logicvc_interface_init(struct logicvc_drm *logicvc)
 		drm_connector_helper_add(&interface->drm_connector,
 					 &logicvc_connector_helper_funcs);
 
+		ret = drm_connector_set_orientation_from_panel(&interface->drm_connector,
+							       interface->drm_panel);
+		if (ret) {
+			drm_err(drm_dev, "Failed to set panel orientation\n");
+			goto error_encoder;
+		}
+
 		ret = drm_connector_attach_encoder(&interface->drm_connector,
 						   &interface->drm_encoder);
 		if (ret) {

-- 
2.47.3

