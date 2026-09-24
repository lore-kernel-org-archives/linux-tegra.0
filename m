Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F823DF019;
	Thu, 24 Sep 2026 07:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790233319; cv=none; b=nld9slEeM4mcDcsa1TGy6J6AQl7w2hWwPtosfcD4FOsOEp7tltMpupGYA1SsXTzcIfgSg0mnR1EW9n7PUoolr1fDF4lm/PufTgwGB6kktX0S5x3XVGvzV+H/Kk8RL6EcX5tBzzQAlDEEj3zRn1H9tB6NJJZhrwBM5kz6lTYOJcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790233319; c=relaxed/simple;
	bh=21vHPs+cccmI0GIDrI9wBRtngdr4EBlpl0EvM5Z31P0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=fizDNc3pNoHXrAPDf0Kzv/ke+PFF16UeAjwB+6VZwWlGf7efM7kPL+WROqRzXc31wnwanfybbH4osmEPu5gxJg2MW18ez6Ex1ia1cnGjtXgbUE18PFMd/HwZIN4PAPQu+k4kNPkgzYxo9jKv0neeYYSPR1hSSAsM2vEkd2oRjb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VfDv7S7f; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VfDv7S7f"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2A3521A0FF5;
	Thu, 24 Sep 2026 07:01:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EA2AA5FB45;
	Thu, 24 Sep 2026 07:01:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B2EEF103294A6;
	Thu, 24 Sep 2026 09:01:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790233298; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3oGwBuyJVzkAjrauN/FxJTxwMCY3sLnXn9ixXjUrD2A=;
	b=VfDv7S7faDApBOx+DPqMCyWHBKUPlODcB1xuNfsFjM3RNlzyRMcdJhIP0bigttbKx1o5jy
	+B3mEF8B/s9ysd2wfnmGpCg4NZheR3VGvS94Ic0SKnLPviSK0O4PMC4viKTqfmdCj+9vMX
	uaR7ncMHlkENvjrtg1sfppR2+2rB1w3yNHl15P3vTuCFyK7Bv7Ut1MV2dfvSol7696XXmK
	vqgt//ttjMMGzJqmyWKqUW/+naiLm3TqTzPFnvGHAOfowEfbjOv664AYGg+P4m03YFGXZS
	W/ZrKJoYs3u+wZqS+nmUIHWaVMRI8biPPQkNoSk2GzQUV+7Bbe8V7J315PgOJg==
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 24 Sep 2026 09:01:18 +0200
Message-Id: <DLNCQEG62F5N.O98WAO4U2FJO@bootlin.com>
Cc: "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Jessica Zhang" <jesszhan0024@gmail.com>, "Laurentiu
 Palcu" <laurentiu.palcu@oss.nxp.com>, "Lucas Stach"
 <l.stach@pengutronix.de>, "Frank Li" <Frank.Li@nxp.com>, "Sascha Hauer"
 <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Paul
 Cercueil" <paul@crapouillou.net>, "Paul Kocialkowski" <paulk@sys-base.io>,
 "Linus Walleij" <linusw@kernel.org>, "Inki Dae" <inki.dae@samsung.com>,
 "Jagan Teki" <jagan@amarulasolutions.com>, "Marek Szyprowski"
 <m.szyprowski@samsung.com>, "Sean Paul" <sean@poorly.run>, "Jonathan
 Corbet" <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>, "Randy
 Dunlap" <rdunlap@infradead.org>, "Albert Esteve" <aesteve@redhat.com>,
 "Anusha Srivatsa" <asrivats@redhat.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>,
 "Ian Ray" <ian.ray@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mips@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <asahi@lists.linux.dev>,
 <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
 <linux-tegra@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-samsung-soc@vger.kernel.org>
To: "Maxime Ripard" <mripard@kernel.org>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 12/19] drm/mcde: dsi: don't create a panel_bridge
X-Mailer: aerc 0.22.0
References: <20260916-drm-bridge-every-panel-v3-0-83afb4f1a707@bootlin.com>
 <20260916-drm-bridge-every-panel-v3-12-83afb4f1a707@bootlin.com>
 <arInho2bsfJiCgjV@houat>
In-Reply-To: <arInho2bsfJiCgjV@houat>
X-Last-TLS-Session-Version: TLSv1.3

Hi Linus, Maxime,

On Tue Sep 22, 2026 at 9:09 AM CEST, Maxime Ripard wrote:
> On Wed, Sep 16, 2026 at 03:45:36PM +0200, Luca Ceresoli wrote:
>> Now a panel_bridge is automatically created for every drm_panel and the
>> panel-bridge API is just a deprecated wrapper to access it.
>>
>> Update and simplify the code by just getting a reference to the
>> already-existing bridge using of_drm_find_and_get_bridge().
>>
>> Also keep the "connected to non-panel bridge (unsupported)\n" error logi=
c
>> by using the drm_bridge_is_panel() function.
>>
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

[...]

>> @@ -1102,40 +1100,21 @@ static int mcde_dsi_bind(struct device *dev, str=
uct device *master,
>>
>>  	/* Look for a panel as a child to this node */
>>  	for_each_available_child_of_node_scoped(dev->of_node, child) {
>> -		panel =3D of_drm_find_panel(child);
>> -		if (IS_ERR(panel)) {
>> -			dev_err(dev, "failed to find panel try bridge (%ld)\n",
>> -				PTR_ERR(panel));
>> -			panel =3D NULL;
>> -
>> -			bridge =3D of_drm_find_and_get_bridge(child);
>> -			if (!bridge) {
>> -				dev_err(dev, "failed to find bridge\n");
>> -				return -EINVAL;
>> -			}
>> +		bridge =3D of_drm_find_and_get_bridge(child);
>> +		if (!bridge) {
>> +			dev_err(dev, "failed to find bridge\n");
>> +			return -EINVAL;
>>  		}
>>
>> -		if (panel || bridge)
>> -			break;
>> +		break;
>>  	}
>> -	if (panel) {
>> -		bridge =3D drm_panel_bridge_add_typed(panel,
>> -						    DRM_MODE_CONNECTOR_DSI);
>> -		drm_panel_put(panel);
>> -		if (IS_ERR(bridge)) {
>> -			dev_err(dev, "error adding panel bridge\n");
>> -			return PTR_ERR(bridge);
>> -		}
>> -		drm_bridge_get(bridge);
>> -		dev_info(dev, "connected to panel\n");
>> -		d->panel =3D panel;
>> -	} else if (bridge) {
>> +	if (!bridge) {
>> +		dev_err(dev, "no bridge\n");
>> +		return -ENODEV;
>> +	} else if (!drm_bridge_is_panel(bridge)) {
>>  		/* TODO: AV8100 HDMI encoder goes here for example */
>>  		dev_info(dev, "connected to non-panel bridge (unsupported)\n");
>>  		return -ENODEV;
>
> I wonder if we still need that branch. Every panel is a bridge now, and
> it looks like we don't have any specific panel handling in this driver,
> so I guess it supports bridges already?
>
> Linus, do you know why this condition was here in the first place?

I had the same thought while writing the patch, but I chose to be
conservative.

Linus, unless you have more info I'm going to apply the patch as
is. Removing this special case would be welcome as a later patch.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
