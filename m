Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889A64B0C9E;
	Mon, 21 Sep 2026 15:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790003314; cv=none; b=eE47HBjilpclI9x+Sn9nZcUGZG27Ba8acJs/3MMxv0fQtB4rS/RRfndRWFZ9KYuK72FP/GAut3LL5YXwJtE0AIQdP5sDKAzigRNVjfUm+7+QUgSR6owupC/jMzwESBR/xSr9kXUlhaDsU30jMfKUXQSHhniTrH7ZJnuPgqhdzuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790003314; c=relaxed/simple;
	bh=kzDnc5lvItBUDngVmmupbIrY+jhCddiSWbaRwsT4lfU=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=brcKdhCOsv4fp82GZaVHU0VBlSQ4DBV6y61hfolD2nVTNDi7HRBZ8EpqiLCVj5ox1PZF3OJ0uYrINAkqH2lC3p2wLZfr8NgD0GxCCzNJY0VrfzbOGfcyN8T4RbAdFRo0Bu+TyMo49pJhTpKugWWh0yxVZDBwhGfFuId8lDXTHkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aZb+4j4+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aZb+4j4+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 922D21F000FF;
	Mon, 21 Sep 2026 15:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790003313;
	bh=9TmjMGDTZLmhGHy1jeBXvh1rXJH717aBKG34mJksDgE=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=aZb+4j4+OEWOE4VyDKl4afl8agNHzGeV4p+zI+BQvAX0/I8owT1oRDJw2glrNe72y
	 DQzbASxzCYYsmB8hlA9196jbLcM89nSmWVSYU7v1zBocI8GAYTE2PEXv3UUQsUoY/G
	 VLrZNq4TrzYGFvxMntWnki2G9GV+R7A/bI9Vho9DdX8rWEYe4HWGTNsuMsR9QW5b5O
	 RkyhjjbdUKVhNtTrBUOROUGRuD2pqYCo/ISyQ9V7trih7T3dgM8/YdxPg6Gk83TBa5
	 hmDuUlJyr3+/Su5WAh6+6t4L20vNOfPSzMswtVQTTSAka2FzjOXQT6zdq/MfQvDA63
	 j8qAwZZ+VAgjQ==
Message-ID: <77aa7ff935567f8f6e8a0f74fd276b95@kernel.org>
Date: Mon, 21 Sep 2026 15:08:29 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 04/19] drm/bridge: panel: move all code to
 drm_panel.c
In-Reply-To: <20260916-drm-bridge-every-panel-v3-4-83afb4f1a707@bootlin.com>
References: <20260916-drm-bridge-every-panel-v3-4-83afb4f1a707@bootlin.com>
Cc: asahi@lists.linux.dev, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, "Albert
 Esteve" <aesteve@redhat.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Anusha
 Srivatsa" <asrivats@redhat.com>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Fabio Estevam" <festevam@gmail.com>, "Frank
 Li" <Frank.Li@nxp.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Ian Ray" <ian.ray@gehealthcare.com>, "Inki
 Dae" <inki.dae@samsung.com>, "Jagan Teki" <jagan@amarulasolutions.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jessica Zhang" <jesszhan0024@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Jonathan Corbet" <corbet@lwn.net>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Laurentiu Palcu" <laurentiu.palcu@oss.nxp.com>, "Linus
 Walleij" <linusw@kernel.org>, "Lucas Stach" <l.stach@pengutronix.de>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marek Szyprowski" <m.szyprowski@samsung.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Paul
 Cercueil" <paul@crapouillou.net>, "Paul Kocialkowski" <paulk@sys-base.io>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Randy Dunlap" <rdunlap@infradead.org>, "Robert
 Foss" <rfoss@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Sean
 Paul" <sean@poorly.run>, "Shuah Khan" <skhan@linuxfoundation.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>

On Wed, 16 Sep 2026 15:45:28 +0200, Luca Ceresoli wrote:
> Work is in progress for every drm_panel to embed a drm_bridge, replacing
> the panel_bridge entirely. However most of the panel_bridge code will be
> reused for the drm_bridge embedded into the drm_panel, so just move the
> code there.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
