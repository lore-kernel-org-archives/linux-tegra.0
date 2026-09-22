Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23100515970;
	Tue, 22 Sep 2026 07:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790061040; cv=none; b=nqEPM+xCnU+TPgN0zGL9tRVovewNeqJfVFGx7erZqjrR8Y1AAB2nlyJoORnb5NfQ1PtQJmQJZD0bY2TJXKFprr22bRZYCjKzuASfz7qk4tSgnBHx1YajP7MSUlGNC0AESOJw7xEaejwnf8gtQPlJ6LadLPwk3+wE4fKTBpSWVKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790061040; c=relaxed/simple;
	bh=uQenjchOYHK6np6eNJ6znRE+BDFhTRFr6cgeKTYz+TU=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=niXV/M6pTCfPaED8vZBOzhHiIsfnLi93nNq3aD329INmgnnh05ZkUEdpdoagdR2RhTtZA8rU0gMKJLZfA+uzMRQVtI+d8m9/XpuKFmC3ANg5mi2JQ4qHdgp52RL9kHlSXBP6Q1R8xz1VE55r8wn0+91jgyEHbFB8qkUdYLYIy/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=USPaOcnF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="USPaOcnF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC8191F000FF;
	Tue, 22 Sep 2026 07:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790061038;
	bh=xnld5ZAMHUPURrcP4qYOF24Z0lpAY4ulw2ms2HEmYd8=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=USPaOcnFWv5cSz2X1c0SpBHsH2oHo32NC2+C2ZbXrShg0QytM9QurH/SE0bOcaTRW
	 jg/f1cGV5YAgCDaF2lesr2vUQHNc3aMyhG9dpkDA/tAilEkD8Ez7z1nhiE8OymIxTb
	 xqJgirCyLz38VVlbOblOhu3xJNpHYJFgX3mu7GFpEPabsy4zaIpI/kPQdEeKpetaKA
	 G9bCnRlT6kcZ+5SBb4wCaoAGZn4Z7qWBhUZoR29QRZdCckcYnt4gVFvMPHEes77o/T
	 MWqoPhAZY0gtT7oFrZDexh3CfSP9wlgTfVfQRJMvp4z0kU1mxxSPC3mO7Yxrkz7A4e
	 8etl154qsjs/g==
Message-ID: <c19fd59c52783ed9caa767c4bfbbfb32@kernel.org>
Date: Tue, 22 Sep 2026 07:10:35 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 15/19] drm/bridge: tc358768: don't create a
 panel_bridge
In-Reply-To: <20260916-drm-bridge-every-panel-v3-15-83afb4f1a707@bootlin.com>
References: <20260916-drm-bridge-every-panel-v3-15-83afb4f1a707@bootlin.com>
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

On Wed, 16 Sep 2026 15:45:39 +0200, Luca Ceresoli wrote:
> Now a panel_bridge is automatically created for every drm_panel and the
> panel-bridge API is just a deprecated wrapper to access it.
> 
> Update and simplify the code by just getting a reference to the
> already-existing bridge using of_drm_get_bridge_by_endpoint().
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
