Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DB14A4EEB;
	Mon, 21 Sep 2026 15:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790003205; cv=none; b=e9CrZRPQqSg4HmK9AWNvicy4vtLcpi0eQ2k8nw8rihCu36fhhj2YJxa9FjCtX/cN7PbhtZ3jfjekWLYnPwvenoV6VlN3UpVLEVOEcSVe4NKOac3oSdoqH4BhX3sv/FVcYNi5k/JnLsHxY7IkqlMMJJTykz3VfkrEXpBlWShBTKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790003205; c=relaxed/simple;
	bh=1jLAiCnwt1whMpBCX7C/KQQWOghwYhJ5LTnw5RbhGsE=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=knbudwVX125VBKRH3UJ4f4uoASPY6kaXZU/oIjBL7GGrK1kB7nfZpz4xHLWAQefxaNTKte++cxDW+NfrOJtgY0NYbDStF3GMizbAjugZv4RfI0KSKOpXj0RiyRNONYZeY40eOg7SU8aeSKqtGCrv6o6h6+AT2DLGuZDZK5/W38U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QbrOP9K9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QbrOP9K9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F14961F000FF;
	Mon, 21 Sep 2026 15:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790003198;
	bh=AXxmb0gF+pS9vq4zS1CUd/UcL72lEWczxTcsxmxGaGc=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=QbrOP9K9xjLENQIIaSS3pfeUmLoYYtxGB3M9GG3o53ff2X6veTOv5KxN9tdBtIKDm
	 mKgtiLkSBBlpT1XW67zugVMkoZMaF4YAROfpoUZkri0In+gYZdLv2vdw8Td+apTxrl
	 1ahiiFs1FURw2SLCKJr0OIC/Xz8QCFrgGJktU5LbZIvuTYVcW57UG7sFa5BwpcSlbx
	 5cefrrhXs8fo5+HeDxIzapj5TXFe0XabS8VipqH2H1D/u0h74IuzTBN9srfGUD7a0A
	 FibZqRx0RBW9y5wWh8oukULXn0nUjuH50tVoyufY9hqG1qiZDWEcTnUftJHQigZfzI
	 u1q9w/F48jD/Q==
Message-ID: <8eee1438c2ec64e3127ef730fffefa98@kernel.org>
Date: Mon, 21 Sep 2026 15:06:34 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 01/19] drm: of: move drm_of_find_panel_or_bridge()
 from drm_of.c to drm_panel.c
In-Reply-To: <20260916-drm-bridge-every-panel-v3-1-83afb4f1a707@bootlin.com>
References: <20260916-drm-bridge-every-panel-v3-1-83afb4f1a707@bootlin.com>
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

On Wed, 16 Sep 2026 15:45:25 +0200, Luca Ceresoli wrote:
> We want to move drm_panel.o from the main drm module to a new drm_panel
> module, but there is one function in the drm module that calls into
> drm_panel.c code:
> 
>   drm_of_find_panel_or_bridge() (drm_of.c, drm module)
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
