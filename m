Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4613EFD32;
	Thu, 23 Apr 2026 13:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776950374; cv=none; b=A7uWA0DTcz4ZLbO9vbx7e8igaWHbHjNmyolkYhl2HggNj3sjY+v+iN3DpxeKT1PD1SU3jKgi3mcXThDTCwlP8tQWgPXRfAjfxfrL8/37XW9RoA+NlUHifi1TGR+CujdvigoBVTDb8Zi3ImC/CrFQxvbMY5UVDaecjhXwEKkyfJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776950374; c=relaxed/simple;
	bh=+v1IGGwBlD7W1TrUt5/g/toItgrGx+CShEQy9dqBHjY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=ocTHWn7Mok1Ao89PSZCvDfCLXISwRodfYyUTuvwl0EYXOyF911+dwkaMDBA8lcOJEz1aIH5jH00C3b1lJou1M+Y9zqI+31w6iSLi8JPnWI7GYLzOD82ik0O2VCZVALS66m02+7sdJke98jgnMNpmdFLurlXzIlZIfBkPpy3strg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CHffhXGz; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CHffhXGz"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C1232C5EF12;
	Thu, 23 Apr 2026 13:20:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6500E604EB;
	Thu, 23 Apr 2026 13:19:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B727910460BC4;
	Thu, 23 Apr 2026 15:19:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776950366; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=N0czXPTCBLd6Via7w9anQbZ1SyEjDMbKmYb2klNRSzM=;
	b=CHffhXGzBeQ87qx+VLT/QJwCaDtokpzRnxIGgqeeBGcHmpx9dkFTQezMvWUYtBFalmt0ym
	ZlPNQeOk5Q1kth18AWc/K+W7Raxp9+99ljR8+PbnvhlipPqpO27B6VpRihKIXQayDAqgRG
	da/TeGo6hU5ux+mR4M6i/8AmHfkbG+YJihJqxxPpKk1ng/qYjjX625VUgLNqxJALo9M/FP
	rIln33FBGqBltj0d5nmulxlKj/OYQmYlq0XBZlKDps6B3HZSM/rShXabOS7pnFzpExVbdP
	stMHIMq4UYNiQX+If3xxxJ52QyUsGZwDX30+01HblvyxBtNmG2GoUDU/v0ZI4A==
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Apr 2026 15:19:03 +0200
Message-Id: <DI0KBQCGJWIC.1TNNX177Z8ZNU@bootlin.com>
Subject: Re: [PATCH 35/41] drm/rockchip: lvds: remove now-redundant call to
 drm_connector_attach_encoder()
Cc: "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Sasha
 Finkelstein" <fnkl.kernel@gmail.com>, "Janne Grunau" <j@jannau.net>, "Liu
 Ying" <victor.liu@nxp.com>, "Douglas Anderson" <dianders@chromium.org>,
 "Laurentiu Palcu" <laurentiu.palcu@oss.nxp.com>, "Lucas Stach"
 <l.stach@pengutronix.de>, "Frank Li" <Frank.Li@nxp.com>, "Sascha Hauer"
 <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, "Paul Cercueil" <paul@crapouillou.net>,
 "Anitha Chrisanthus" <anitha.chrisanthus@intel.com>, "Chun-Kuang Hu"
 <chunkuang.hu@kernel.org>, "Matthias Brugger" <matthias.bgg@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Kevin Hilman" <khilman@baylibre.com>, "Jerome Brunet"
 <jbrunet@baylibre.com>, "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>, "Rob Clark"
 <robin.clark@oss.qualcomm.com>, "Dmitry Baryshkov" <lumag@kernel.org>,
 "Abhinav Kumar" <abhinav.kumar@linux.dev>, "Jessica Zhang"
 <jesszhan0024@gmail.com>, "Sean Paul" <sean@poorly.run>, "Marijn Suijten"
 <marijn.suijten@somainline.org>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, "Sandy Huang" <hjc@rock-chips.com>,
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, "Andy Yan"
 <andy.yan@rock-chips.com>, "Thierry Reding" <thierry.reding@gmail.com>,
 "Mikko Perttunen" <mperttunen@nvidia.com>, "Jonathan Hunter"
 <jonathanh@nvidia.com>, "Icenowy Zheng" <zhengxingda@iscas.ac.cn>, "Jingoo
 Han" <jingoohan1@gmail.com>, "Inki Dae" <inki.dae@samsung.com>, "Seung-Woo
 Kim" <sw0312.kim@samsung.com>, "Kyungmin Park" <kyungmin.park@samsung.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, "Laurent Pinchart"
 <laurent.pinchart+renesas@ideasonboard.com>, "Tomi Valkeinen"
 <tomi.valkeinen+renesas@ideasonboard.com>, "Kieran Bingham"
 <kieran.bingham+renesas@ideasonboard.com>, "Geert Uytterhoeven"
 <geert+renesas@glider.be>, "Magnus Damm" <magnus.damm@gmail.com>, "Biju
 Das" <biju.das.jz@bp.renesas.com>, "Marek Vasut" <marex@denx.de>, "Stefan
 Agner" <stefan@agner.ch>, "Jyri Sarha" <jyri.sarha@iki.fi>, "Michal Simek"
 <michal.simek@amd.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Ian Ray"
 <ian.ray@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <asahi@lists.linux.dev>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mips@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <linux-rockchip@lists.infradead.org>,
 <linux-tegra@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-renesas-soc@vger.kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260423-drm-bridge-connector-attach_encoder-v2-0-2ae6ca69b390@bootlin.com> <20260423115334.444750-1-luca.ceresoli@bootlin.com> <wapbiwxou64emxlt6oz5slst3nvcgvs35hvhpz7v3wmwp33bzc@mvdog4t7un6m>
In-Reply-To: <wapbiwxou64emxlt6oz5slst3nvcgvs35hvhpz7v3wmwp33bzc@mvdog4t7un6m>
X-Last-TLS-Session-Version: TLSv1.3

Hi Dmitry, Geert,

On Thu Apr 23, 2026 at 2:42 PM CEST, Dmitry Baryshkov wrote:
> On Thu, Apr 23, 2026 at 01:53:28PM +0200, Luca Ceresoli wrote:
>> drm_connector_attach_encoder() is now called by
>> drm_bridge_connector_init().
>>
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>> ---
>>  drivers/gpu/drm/rockchip/rockchip_lvds.c | 6 ------
>>  1 file changed, 6 deletions(-)
>>
>
> stray duplicate

Due to the long Cc list, when sending the series with b4 I hit the mail
provider limit, so patches after 34 were not sent.

I then sent them manually using the good old git format-patch/send-email,
but in the process I missed the v2 (heh, b4 is great at automating
that!). So patch 35 got sent without v2, and then I resent it and the
following ones with the v2 marker.

Sorry about the noise!

I think with Dmitry's all-series R-by this whole series can be applied at
once (I'll wait ~1 week before applying, in case of more comments). This
will avoid more iterations spamming lots of people.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
