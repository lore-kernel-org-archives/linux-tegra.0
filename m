Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013042;
	b=UAvb2R1L2UmNHchvQmAUa0KG5rGqDe5nZuNWsLC2kC8KhHNC89wu2w47jZY9mUDnQZAx
	 xVglQIqeWtL7uD/7EfoaR9UpX7idGICZzZgJfH4XyQOyEmeJKhtLeRiYe6knBJibmhRrs
	 WQsdp7Rre5RakrWKdFYuAqcKsN5RWI3OB1VYubIH1YElp6o4xn1thCRQAy7/gLvJCI8dT
	 3COxq2uiNtREsuHQu9Rujwv/7H6wNaN0cxPxri1295/32VkjBKZBsIp0OcOHSi+D6gDhP
	 RKGA9eWvX0OOu/IFx9xFT6cI+ZHHrk1wTo4/WyUtGE741bsNGXEJP2nGOK+5mht+bMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013042;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6GdmF5pi7yEsCg9Rw0PC8ebq7FPRGO6BmW9vfgGGb8U=;
	b=F2ZN2Cc0LbQKcpuLmJUfzUAXtJS7/X7/7vK+6F3aGXBMJSn6OWu5q9+n9JL3cK92jkDw
	 jtxsZzBFFZpKtxu3bnFgKXo8MZcDWkmhUJtIDpV0kHTaOVMuVW6nA0WqzYBhlolboXB6T
	 KsXg34/obYvuKMrRpp/bthoF86Rt4bPSZKIb7R+6nu9FZ94Ol5Ud7AazldD7GD43NApF/
	 Id4BUqed1l59Nwl5fCjGTWoPH5JzAgAvgTUM6T9g2LxS/vQIjEdLFM/w8rn73wqToB/I7
	 gK1m0LSKno8WIk/1fHoyYsHV8cmFpK9EYs6gdneeRocvAeomLOX/iLsGQ/irOxFxSYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eHC0sjpF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IET7cFxH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F69660A6F50
	for <linux-tegra@vger.kernel.org>; Mon, 26 Oct 2026 11:10:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F69660A6F50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eHC0sjpF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IET7cFxH
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtMii2009915
	for <linux-tegra@vger.kernel.org>; Mon, 26 Oct 2026 11:10:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6GdmF5pi7yEsCg9Rw0PC8ebq7FPRGO6BmW9vfgGGb8U=; b=eHC0sjpFWy6lZkCF
	g9ttsTSmQp/2J04MhM4gBm4sr3cOzzALY6+oTw3QLWZj/4XmP3uq3nnH1s8/pG/p
	sYwvGCDFKelPEYdRlvjslA4Z7p8xCRKJqy5eLLiizfn8HSQvILMH5W0z8ZuU7uF4
	GoJ0BaG4R3DkoUJvxqvLnQlp0BDI9AgaeWyi27on4wywqrhYX2w/Se9rYwSEKwPc
	CZDjCZZKyge9oU36U2QtOmw58F9V32Xn3QnlpHlVkTZhtxUsJNaZeV1iwVJIdNHE
	99X8QqGEY77z6IuYIg/r7/N8nKJJVbR3+V0Xmb5Zy+tpZ4x0ExYsest1Sku6pV+q
	J04aTg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgn27x2rx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Mon, 26 Oct 2026 11:10:40 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91c61cdfb0aso14547666d6.3
        for <linux-tegra@vger.kernel.org>; Mon, 26 Oct 2026 04:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013040; x=1793617840; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6GdmF5pi7yEsCg9Rw0PC8ebq7FPRGO6BmW9vfgGGb8U=;
        b=IET7cFxHC7Z3zBRuIIBMsU3KYirJpiq370YfmJJKoREzAbdpY6e4uHnhdLUz/aec9m
         CRapcJjvNkf0GdFJfKJdQMwMo3THTb9TTtCtAlLr2vx35BTLLSPYDffY3EfR8Fydyvnu
         ORGBSxfOEgrnyZ64683s/wWB0SsOK+Pb/EkYf3IBQCUhjb/P+N0gsNV1TNhdB7j99tdL
         tFvvJlVvZ9JeGgmgYADZMzPeibiPsP9bM5B9eAWKviFTuvcedJ0j9yU7r61aDFHHw8fv
         ZqZn4c3EyDmzzoOf48hRe54hHk/5YaCPFqgvKh/kYv5Vd07Ev8Qcm/6MV7jquQy9ye6T
         YXSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013040; x=1793617840;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6GdmF5pi7yEsCg9Rw0PC8ebq7FPRGO6BmW9vfgGGb8U=;
        b=ieHVybNTg0wiHPCxzHZRmk3KgNw05JG39dSArpnlstrqx+eWMM4bdxaOvX7IZuMdny
         40+jZb//OxRezaRRECcNz8dy/hfvoDcjJ//PC5Fpr82l4rrCzdHgjqhDQZxD6nKpkGXh
         6vLF8o/0Y8mtbyZNUsxsd4QBUDVeOHrb0Y8tRdthSfwu7Y0RpLQfTtYErgnw+vGVBcuw
         wKverT07josdvwwxhMhCEuEjCd2Z5UGTGRhR22rvx82GfppVnFKXUdIXhruuNeAFMs2L
         LPoJCQu7Js0WroIpLFZX0FDJLA4oV9hIbcGfKofWL5c6DzMsTDgdgTpyNTs504DYsh0T
         AUlw==
X-Forwarded-Encrypted: i=1; AKwUvBxMTMRSHvm+sm0/Dm8PWdgN9RmCmjFXhYfUZNVSqI0Rmu5qvnwTR20eSIKNnL0plWgcZf6I0dbG6qLQZg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLGGkw3Dng5XuUZJ6N/OeYeD5UFGreKkqMOnEkDDE97YT3p2ucv
	9/4PXykCecP9NixhJHuLDK8HGOSZPpRnDV7eGFrrRO3T6lpCkrNk2uNBnv8z5Ow9yjc+SW2OUsn
	nX/0N0OrFx0MEQF+Ro0gN/r/HUOEdb8S7ckZTQtTYxY9oWxIl3GdXXbg7IG1UurbObQ==
X-Gm-Gg: AYBFou17HvIOBPIfx9JMWjA9WTwetiES0Ze4PsBe7qczxSZHgXk7ci4ngn4Z4sREch+
	eFLWkzfBCR9m6Lv2qtdSQMVQQFwwQotSLTFwAoy8ejriN4gO7lquWlcAcXp788+pJnNQVqqpy0k
	pw+ItV8SmXhfOcVOmisIQWY01uH0UjAeLtUjDg69JyBEVw9VqS9im+MIkXMIayr2PZcnFRUsRAP
	VmX+0VcK+7BnD9Xun7i4zgz6P3/6OufsKhJUt+t7YJSj06tWrpj251rM0USm21032EI5Eh6/KLP
	dV4dL/aMj9q5X46qEFmYPZlELagtKEz57N0059esz7fEzRKtrzy1GpBS5Np0IZXLs0qvcb6blD3
	ngV5c7HgionRgK6E0K7Ee4psQStRL8BcseNxjJhVUALztXdvsgEqAlJV8vtY8lidMb8S0Qh8rBh
	2PJGAUPCriaKoo
X-Received: by 2002:a05:620a:4586:b0:93f:5ac:14a0 with SMTP id af79cd13be357-940ef9b6fb7mr901748685a.67.1793013039639;
        Mon, 26 Oct 2026 04:10:39 -0700 (PDT)
X-Received: by 2002:a05:620a:4586:b0:93f:5ac:14a0 with SMTP id af79cd13be357-940ef9b6fb7mr901737785a.67.1793013038981;
        Mon, 26 Oct 2026 04:10:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:09:58 +0200
Subject: [PATCH 09/35] drm/mcde: use drm_panel_bridge_add()
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
Message-Id: <20261026-drm-panel-funcs-v1-9-5e3070a3478f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=921;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZbTGn0s45rat3TeuZ2gFUOSQlpst/5WgxsMTCJu8VCc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zUJP3v6BZfeC4OFDrgkWPjUT1uCkaMqjHRVf
 A2tXDwlDjmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81CQAKCRCLPIo+Aiko
 1XkgB/9JEwLFkiFvNLtfnxESm9XEbnCBOdIvIQKtoxuj4kTs8hnTLXQlTz5Hzr2kUFMOQlpSqRf
 xv9ERSCZw9qYrIrAuufxZ2T8vMs3Bjvii6zCKPdB2cVNjXz+nuCWQYKWWcpXcg9xca++XYSRsE5
 awcQqb6mq/YRDLPMpnbnCLP1Fh1zY38bjUeY56X606lSWioHGxZKxNjqC1ByedyyP4NsZFiOK72
 feZ8/uEcdZEbry73xa/aVOClo7qCAto6buhgLmjhnzbaAleT80MWB7YJGHOTzueYLr5/DSHzjJp
 ReU4PLvlOtFhS5w2Ytx9LA/4RXok5fGUyvuLce8MIiC9khXu
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=G7GJgNk5 c=1 sm=1 tr=0 ts=6adf3530 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=icLbHSj0goCFzy7tGMwA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: Ouz3StiPrmuimi3-0GJvJtNV5lIrZbhm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX2XFYyJT23z8S
 XO/KAo2Z7APViQalMVPejGJRqqkKNoPlSAlNKt9DNhNHZpR3aoLZTlLHj3+VUTnV7o2Rq3a8YBy
 FLrkZiKmbQyJO4ndysAgZBiJ5LmMMiA=
X-Proofpoint-GUID: Ouz3StiPrmuimi3-0GJvJtNV5lIrZbhm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX9S3v1WXWrmmO
 2XFxXo2pK15heP4fOaaR57YJOL4wHY+fWJBVrnPBFfJLjd2uaPiuC4ArDAEg0MXTGIZWAaYFnOW
 MSLIZxwp727PfI9/RBgGCdMtzlkHLLwTDlub98FGucI+JGTFg3xMclMjOppGGCAscbFBbMaOhIu
 yUJEZvKnqm/steNzkR87az8ao2sDwyS+sG1fEfzaS62CI9KuDkJnHHYIHjIYneRJqxRkksn3ju0
 igfvBtyFbF/6dlojaewe3a9viWAOasoa196pDczzRCHu3UcmBfUVV2gAKFTLYUPbRn8lPNa0n21
 YMLD7YKln0VLXuA8KvVmy2yYIMoWcUOWjkj3zVoI9L5sxWuIlNPD9nk5hmoeBZZJANXJtSqXA/F
 DOU/nEwpQcZ/mjuG2tZcXl0mxK76PCLQT8aGFx9rB8B3hbKFsM61K8h9hzban0YDSQLoY5kKRHr
 341rDCfWQoHcs1gD5/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260044

The connector type passed to drm_panel_bridge_add_typed() has been
ignored since commit b7797081ccfe ("drm/panel: embed a drm_bridge into
every drm_panel"), the bridge always has the type of the panel.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/mcde/mcde_drv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
index 759e279b645a..b5bceac608de 100644
--- a/drivers/gpu/drm/mcde/mcde_drv.c
+++ b/drivers/gpu/drm/mcde/mcde_drv.c
@@ -151,8 +151,7 @@ static int mcde_modeset_init(struct drm_device *drm)
 			return ret;
 		}
 		if (panel) {
-			bridge = drm_panel_bridge_add_typed(panel,
-					DRM_MODE_CONNECTOR_DPI);
+			bridge = drm_panel_bridge_add(panel);
 			drm_panel_put(panel);
 			if (IS_ERR(bridge)) {
 				dev_err(drm->dev,

-- 
2.47.3

