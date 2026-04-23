Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DEA37BE89
	for <linux-tegra@vger.kernel.org>; Thu, 23 Apr 2026 16:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776962793; cv=none; b=Ph+xSd0N8zTMMlWz1y7t7QFYnJrPWeZbyzehfQ6WddSQE1utlZyZdijIL3l+BXss9LTYGvYpW4/8eFtvCpqiD4+/kRUk4sqLAZgSs0YkIKIRH0Mr237osts3wYlDiv+d8e7O/KcG5R5xxai1hl/rDgfz7pacg1Fq2fdkpllJzLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776962793; c=relaxed/simple;
	bh=S05j6aseg7c7u3xV5vOsljLds3FQ6L9R3JcogXmLNZs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=fXda2TC/s2mN3W2UPPbbIEqWOErU6zFCMY9URt91WUc5q72IxH/n/wfpiN0KkLkXXmrXO81Jqa6YVGcvuJ0qstzVY/ES1ghM6I7lkQe7N8SqR//FgU8SPuPayGCHQAELXud2scR3PI8ErqOzSH8+dUgYLpsBIgcY350lKUTUbEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=2l2tjOxb; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="2l2tjOxb"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8204BC5EF16;
	Thu, 23 Apr 2026 16:47:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 11F65604EB;
	Thu, 23 Apr 2026 16:46:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 66CE510720005;
	Thu, 23 Apr 2026 18:46:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776962785; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=S05j6aseg7c7u3xV5vOsljLds3FQ6L9R3JcogXmLNZs=;
	b=2l2tjOxbp/muwVUTt1iYaIz8b7OLe+mJ2gwHjUl/Zi9B+c+A9VYP6Ja5C2fCxD7EBcL8KE
	tj9o1FWt6yl5MwmosOaOCmM5hg14Gf6FQCD6xO4NlTRrX8rWJO7AXZiqzKJUGSdGNfq0dX
	90/Fet3eusoHdXKPgHJviW0bm/BmWmkW8WJGQJXu+6RINWTT2CgIMhDV/YcJ+q/TJAH7GV
	wy8CB9xvhkE+fTuzqLnN9+emGn4BkhcJVhKXnLTSZCbNekK5oVrGCbiUFXMRSBxTBCE1Lo
	fGJwcmZCjXWgzqASXiN/aqIJ5NiJ8amWgtQeCTnheHeEOAEeGBshs0HQdugKjg==
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Apr 2026 18:46:00 +0200
Message-Id: <DI0OQ6JRMPTR.1FP9UHPJBYI7M@bootlin.com>
Subject: Re: [PATCH v2 00/41] drm/display: bridge-connector: attach encoder
 to the connector
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
References: <20260423-drm-bridge-connector-attach_encoder-v2-0-2ae6ca69b390@bootlin.com> <wanzalswb3lez6kyklprqojcnidab5fkxgu57lfka45w2rt4ic@xdatq5o7yiub>
In-Reply-To: <wanzalswb3lez6kyklprqojcnidab5fkxgu57lfka45w2rt4ic@xdatq5o7yiub>
X-Last-TLS-Session-Version: TLSv1.3

On Thu Apr 23, 2026 at 2:45 PM CEST, Dmitry Baryshkov wrote:
> On Thu, Apr 23, 2026 at 11:16:54AM +0200, Luca Ceresoli wrote:
>> This series simplifies using the bridge-connector by removing the need t=
o
>> attach the newly created connector to the encoder.
>>
>> =3D=3D Series description
>>
>> Currently all users of the bridge-connector must call
>> drm_connector_attach_encoder() immediately after a successful
>> drm_bridge_connector_init().
>>
>> This is an unnecessary burden for users. Move the call to the end of
>> drm_bridge_connector_init() so all callers can be simplified.
>>
>
> I don't know which one is more correct in this situation, but let it be
> R-B for the series:
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
> Feel free to take the msm patches through drm-misc-next (A-b).

Meaning: Acked-by on the msm patches + Reviewed-by on all the series,
right?

Thank you very much!

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
