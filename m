Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013079;
	b=bTtRYv4UsE1L50dOJ7yzo+0FbUMcj4WgehG0RPAmLS5MTfKuiqIZ72W46jd/linvMK6q
	 S8rJbIM4BKYNjTIfcjH1Q1TJOG4GEB/ZgRwh7zKvXabY9gInb7eodri04cBv7L9GdRpdD
	 rUbggCkC2qZgilwC5pwulAGr3mvNto8DU1fWq+lPt1P2d3Y5cepsHYLXXgkdb3w4JgzR2
	 GAFCfEdOEwgZZ4gbJdDid0fOWrIqoz+8uyMAy/2Zne3EAd81JF+UwcPBWmPi5xIAD9N68
	 A3t7P6RuctVZ7ps2FpENxI5SZuk1jNWh9vHU/ohWILB6Oa9u9SKGz1eZIEpob10tBsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013079;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dg5zkY2HMaN3S1LQ7C2wxwVeSCWjIGLxXjphKAEg1Bc=;
	b=RXxXkGe/zJDd4D01uE6HAWomt4CX/E/ehmAQHNxORe9KwGxm9/epvlOYQe8KJvP4rDyp
	 NI6AIjTURHdfxT6a18d69TCR5/VCn4gq4GVZbmnBH2i6zMV8zLigumM4YNspMPinnCImm
	 DTYFJtN2y7tsLgJ0AlpoOc6xmqe520+cS4/T4eZnnq3dPhQ554CcLf51zK9oevSxttXwK
	 yYfq02d/66Go43Z+Pv8c1dhYU65TOZwFucrmxbORudQAN1SThiY7BV02oPpH6UWu3uFHZ
	 P/6zWMiZivqbh6VsYDHTCDzjlT0W+esR7azLmJp+e49Rei2vWM/7hB0/E9ScIFC9jSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="NT/pTjjt";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N57G6O9I;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B32B6070661
	for <linux-tegra@vger.kernel.org>; Mon, 26 Oct 2026 11:11:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B32B6070661
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NT/pTjjt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N57G6O9I
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtWKV1547930
	for <linux-tegra@vger.kernel.org>; Mon, 26 Oct 2026 11:11:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dg5zkY2HMaN3S1LQ7C2wxwVeSCWjIGLxXjphKAEg1Bc=; b=NT/pTjjtrT8dYnjF
	WH6qLjW6kx2wD0tAa1EQLt5mJoBFBC278Sstl3FzSsSLBoPXgMOCnzIX09ifooBv
	7pkRxd4fS7XPQ7JUM4NjjZcmJx19Y7WHU7i6jtMBXYyLPC9T6rwbv93In7PMXpzi
	QPJAkI+be2BxxA5zI5XamOE6r6O3Kr5HDZwTNTv73jT5VrWnsFJ77Yi5yzqT9yFn
	o45rm4LsQsYn7vmIWTjo6iqt6X9ZYuPY0W1pF4CdJNLN/FLKlxEq6LFKnF2+K0UB
	5kXQZ/lskryTSgbtibVEeNId1StpbWSfS21DPbH0l2PIcYPWxAp1dLnqntim7WL0
	OGOMwQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsgst5kt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Mon, 26 Oct 2026 11:11:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e49a1d3b1so364916085a.2
        for <linux-tegra@vger.kernel.org>; Mon, 26 Oct 2026 04:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013077; x=1793617877; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dg5zkY2HMaN3S1LQ7C2wxwVeSCWjIGLxXjphKAEg1Bc=;
        b=N57G6O9IcosHOeX2GjT3OCg/jpM63H8vc5Q0O8F5W7qq9RW9k61SuXfAdOEGRteqO/
         AVIZGhN3edEXmmcClMhDpW+5Dn3jjOWNdOtGRm5JjsYFaaxEgtYzjOz2dJjYH9s9A90y
         0sc+NkhJXHIYmBQ/XZuQSrYoZnHlKo7ZEzEVbW5m8VooJqgIQwcnNiuW67wRltRtq1Tl
         wcLQ3YvszQ3WRzPp8di5ilM1A2EVMUrEUj86tpTF0HIOm+R/nDoWiNS6BnAdQPlMV2Cg
         P6wdPwgGHLKQ6GjyMGXjKmML/JSUm1ZnwIZO2kS2NBq3i1bMQTSbavt2CPOpZej03Abs
         aABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013077; x=1793617877;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dg5zkY2HMaN3S1LQ7C2wxwVeSCWjIGLxXjphKAEg1Bc=;
        b=q52lnWeGbwTLhhNWlCcp77UghvXzNgNHKOx7TUt5MqNail3KpJxxjSlxD8PrpVAx0m
         r+3YoGrmMUNliG5yGEwz8X341daIspkiuWLjef15cFUzPHglGvoz91IN7hTjLiw0Ai2d
         WiEQaPNWvBbyPrb6nnhokGcTGsCNsdLQmcJYRomHizbc3QBBbgDyP4CmiTm1Iiy4aNJ/
         Oj2yUeo0gf3YUaBh+L02XYLisGFdvow8sgrgbcWBwE0cqXdyXvtoT/O8wI4dxvPJ9ya1
         k0uZQn/GboWjoOFWl38X7yJ6Ot70N0fxkkFPhtAVBkcafg/gxs43CQDip7NKRUa5Cexh
         1NEw==
X-Forwarded-Encrypted: i=1; AKwUvByC2aTiFP1gaZl4OoxdXSgHpcX6DCAWBTC4wu/iiFEyuDzJeFVn4I3IrxuWurddbLAwuQ5/8KcWia8aaQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLt/Ivzc88/KcZN2F7CIu+npRwJOOHRWcL08v8sHHCEwB3QnO9a
	+anV7Ad856mO3vpmL6ivrXBKvazpve+c8AzFGZvpan9noXRcww4Jo9Fev5SvwwFOWw1JamdEZ/5
	54D1Zy/sitRGCNr+5Uv2w4/0k5ijz3uaBZbDXz9o4eVLDw82JsXMUOjTXMi1PLvhBRg==
X-Gm-Gg: AYBFou27MfgCqeEGxf1xZuThKxAIzoLftIMGCcVi49qWBRjQc9PvNTtfNo6YiCx4eJS
	L7yhKuV4n1B/T4iF3N92xr+d5eRcL8ALtpyX4/amZyMwCKDKYVplLaDjuEA6YU8sukQlBqRQWDy
	NF2s1eR4u1ZkEtCKVL90bvKYAt3EUmdWddRZCuvg5iXwBipIAevMRGa2tS3q962ODFkDQo4t+Lr
	aeEhBbf5nyHXnKKqYQGr87HcXdBvW2MXMgv/mS0thOggBXlzI7UP1e2goUAmVPvHP4wiDrZGi+X
	fxCOOlAUi6PYbfyZKyKCUZ+nyUFzSFBRlTnpPaDQmp1kfVPy9dJr1kQgt5vQbSNFzJrsNKqXg1J
	f2Rb9uXAHFPxsBfkOcVB/bzALcL/p3d2Bo8GGtktPXaEFzGOBDQdBgiflawg56pjZNpkDqJWCdt
	aNIbHtW7rv1Q2/
X-Received: by 2002:a05:620a:261c:b0:93f:707f:28d2 with SMTP id af79cd13be357-940ef8aed1bmr994269085a.26.1793013077035;
        Mon, 26 Oct 2026 04:11:17 -0700 (PDT)
X-Received: by 2002:a05:620a:261c:b0:93f:707f:28d2 with SMTP id af79cd13be357-940ef8aed1bmr994262285a.26.1793013076523;
        Mon, 26 Oct 2026 04:11:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:11:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:10:11 +0200
Subject: [PATCH 22/35] drm/panel: drop the orientation workaround from
 get_modes()
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
Message-Id: <20261026-drm-panel-funcs-v1-22-5e3070a3478f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6347;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pIOB3uhyuBnIv/4e7qIm3qYvTrQqV7MkFySAJKsupco=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zURNMUbn+OFPYO6Rs5wHYoMvPXWbHnPEQw+S
 eR2by97mJWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81EQAKCRCLPIo+Aiko
 1ZJmB/4pC0z3MOz+MYOvygaw89qOLA80ziZqdzL2JsocIt6Gdpqn+jXgLiKeKzfpkRqe93yynNS
 6w72Miunger/6rdcY7rRGrRlFem8FTSpCJtamc5WacQP7woDC6T0A67d60V0sA53pFs6mnPcf1c
 wmG+kc/TZizvHfgHcIsV3ojeaH0YdfS0Uw0jd5DpNQMPz4+FJ4SEOdO0N9UsSqaN8p99GLZ4wnN
 Eg7CEyx8XI/MEu4LI5iPg3mHptZfQ+7T8GOdDgkhLvNvhyz24Lm16Y6wMSjdIQKPau5mwzUKf2R
 8CvwIbzO6VH8PVQTzIyeLMh901DD8wek/BCPDasQMN/5pNtU
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfXzuTeDK9Sc4oH
 Azepq7pB2pr+ty8Vp+Whtwx6Zrzo1kJhK7QyFUmanQ5dzwyFA7RE8tWEz65SWA7m/9OqKatlkNY
 yXaxFG9ie/Pe5cSfq5bXeTn10ZwW1jE=
X-Proofpoint-GUID: ZmQpfaWxbRVDY5GQeHtGVz4ZssdyR2Et
X-Authority-Analysis: v=2.4 cv=c+8+0h9l c=1 sm=1 tr=0 ts=6adf3556 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=PL5jcg54admUc1aTEAgA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: ZmQpfaWxbRVDY5GQeHtGVz4ZssdyR2Et
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfXxAd/lrRAnXjD
 Tk8PmipSga7tznybJYq1VCQkut58Q9q3BZth1ukE1GWpj4PJ0TWnSwBbTMTXROymJ9OjbbdmNjO
 iJL/m2Bsn4DFKBgEv81h659SfXXFJNIzEIoOknjRXrTALYq4Y6AAr5aIFQDBCuyqOmhBkbkh4ro
 n8ydiD3i0Cvv0KamIGLGuN/VkhlCaG5syz0SJk6XagEtuA9DhKLjG5QridNdPkyAyvbkflpH68s
 YHB1k3TgHFyLMEKrtw2ngMp657/65Ir7VCh4sgvxuzgFDxvdGYAVC2x71vsQaKtb/ArunZigAk9
 0aeIZfoPzHv3sIr70aN+grBAPQaZyFmCHW8mxFyHzzdR6SnqNFA4dtOPPni0gPX43fwXYW01+33
 tLPxORmF0Mw1FxdpA91mxnW3Pe4bJfy0nFB/Ls7ohWjST0uvpdpsagcUEN09jWqMeQaMz5Ng4Pq
 wubnLV6H0GOHYAd9m6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260044

Setting the orientation from get_modes() was a stopgap for the display
drivers not calling drm_connector_set_orientation_from_panel(). It is
also too late: by then the connector is registered and the property can
no longer be attached properly.

drm_bridge_connector and the panel bridge set the orientation on their
own, and the drivers using a panel directly do it when creating the
connector now. The exceptions are sun6i_mipi_dsi, sti_dvo and the Tegra
DSI, which get the panel only after the DRM device has been registered.
None of the in-tree boards using them has a rotated panel.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c | 6 ------
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c       | 6 ------
 drivers/gpu/drm/panel/panel-edp.c                    | 6 ------
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c        | 6 ------
 drivers/gpu/drm/panel/panel-lvds.c                   | 6 ------
 drivers/gpu/drm/panel/panel-simple.c                 | 6 ------
 drivers/gpu/drm/panel/panel-sitronix-st7701.c        | 6 ------
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c       | 6 ------
 8 files changed, 48 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c b/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
index a70a2e58f88c..a67e0e57d8c3 100644
--- a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
+++ b/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
@@ -318,12 +318,6 @@ static int boe_th101mb31ig002_get_modes(struct drm_panel *panel,
 	const struct drm_display_mode *desc_mode = ctx->desc->modes;
 
 	connector->display_info.bpc = 8;
-	/*
-	 * TODO: Remove once all drm drivers call
-	 * drm_connector_set_orientation_from_panel()
-	 */
-	drm_connector_set_panel_orientation(connector, ctx->orientation);
-
 	return drm_connector_helper_get_modes_fixed(connector, desc_mode);
 }
 
diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index 150dff3ab6c3..681a2418f154 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -1666,12 +1666,6 @@ static int boe_panel_get_modes(struct drm_panel *panel,
 	connector->display_info.width_mm = boe->desc->size.width_mm;
 	connector->display_info.height_mm = boe->desc->size.height_mm;
 	connector->display_info.bpc = boe->desc->bpc;
-	/*
-	 * TODO: Remove once all drm drivers call
-	 * drm_connector_set_orientation_from_panel()
-	 */
-	drm_connector_set_panel_orientation(connector, boe->orientation);
-
 	return 1;
 }
 
diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index d3a4cf9b1760..493a76f7416c 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -637,12 +637,6 @@ static int panel_edp_get_modes(struct drm_panel *panel,
 	else if (!num)
 		dev_warn(p->base.dev, "No display modes\n");
 
-	/*
-	 * TODO: Remove once all drm drivers call
-	 * drm_connector_set_orientation_from_panel()
-	 */
-	drm_connector_set_panel_orientation(connector, p->orientation);
-
 	return num;
 }
 
diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
index 7bf38e96678a..9e64bdb403ed 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
@@ -2520,12 +2520,6 @@ static int ili9881c_get_modes(struct drm_panel *panel,
 	else
 		connector->display_info.subpixel_order = SubPixelHorizontalRGB;
 
-	/*
-	 * TODO: Remove once all drm drivers call
-	 * drm_connector_set_orientation_from_panel()
-	 */
-	drm_connector_set_panel_orientation(connector, ctx->orientation);
-
 	return 1;
 }
 
diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
index 37f7498449ec..92d397b131ba 100644
--- a/drivers/gpu/drm/panel/panel-lvds.c
+++ b/drivers/gpu/drm/panel/panel-lvds.c
@@ -98,12 +98,6 @@ static int panel_lvds_get_modes(struct drm_panel *panel,
 					 &lvds->bus_format, 1);
 	connector->display_info.bus_flags = lvds->bus_flags;
 
-	/*
-	 * TODO: Remove once all drm drivers call
-	 * drm_connector_set_orientation_from_panel()
-	 */
-	drm_connector_set_panel_orientation(connector, lvds->orientation);
-
 	return 1;
 }
 
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index e4629428b1b2..0bd0afbd562e 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -396,12 +396,6 @@ static int panel_simple_get_modes(struct drm_panel *panel,
 	/* add hard-coded panel modes */
 	num += panel_simple_get_non_edid_modes(p, connector);
 
-	/*
-	 * TODO: Remove once all drm drivers call
-	 * drm_connector_set_orientation_from_panel()
-	 */
-	drm_connector_set_panel_orientation(connector, p->orientation);
-
 	return num;
 }
 
diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7701.c b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
index f16e0de1ea60..b6e62a4c67fa 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7701.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
@@ -635,12 +635,6 @@ static int st7701_get_modes(struct drm_panel *panel,
 	connector->display_info.width_mm = desc_mode->width_mm;
 	connector->display_info.height_mm = desc_mode->height_mm;
 
-	/*
-	 * TODO: Remove once all drm drivers call
-	 * drm_connector_set_orientation_from_panel()
-	 */
-	drm_connector_set_panel_orientation(connector, st7701->orientation);
-
 	return 1;
 }
 
diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index da6ed31d151e..4d28efeafd64 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
@@ -361,12 +361,6 @@ static int st7789v_get_modes(struct drm_panel *panel,
 	drm_display_info_set_bus_formats(&connector->display_info,
 					 &ctx->info->bus_format, 1);
 
-	/*
-	 * TODO: Remove once all drm drivers call
-	 * drm_connector_set_orientation_from_panel()
-	 */
-	drm_connector_set_panel_orientation(connector, ctx->orientation);
-
 	return 1;
 }
 

-- 
2.47.3

