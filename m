Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEA24DE726;
	Tue, 22 Sep 2026 07:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790061689; cv=none; b=jrKiWmcAZv/bg1OSqE6xoZt3O2/srH2+x64zzntVx7xuY+nMCehpl9aPcZXnt6kjzBona8u+FyfQ9bmDAYbMQbSwmQG/AXuxxpfSR1+Oz7tg9rpXYX4vEyqAaRKfTJKPKCgSCOwIUj4Zn3njMtgQMvEvMZ1x5czCaPPtnfMwCAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790061689; c=relaxed/simple;
	bh=PJMjC0tdvEqd8x3p17XuWs4RBnzIIX/qiMXsELmJ/Co=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=dEKVB2o946MYIPIWKwlqz8dedvHH6Dh8sw02rTNaElDCcvZ0QHS54oHmVhClP2K7wgGPR7JsmSRfjdVZvgJ2hBasE1BQwsoU6L8ayEN46POMXtpxXFSG+Y8drYOwfUCDs03uG2+zp2mmXhy3mXW8tgWWQHMNjob5Bv1OA5ljOrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HgHw28lw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HgHw28lw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 415E61F000FF;
	Tue, 22 Sep 2026 07:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790061688;
	bh=P3w5hS8DDD3sT8l+gr5DcmwmmuQG/03rWCTnyOpJnRQ=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=HgHw28lw8gZU21mJukmB+1/I7Y+LgImIbrsYzpqC1JYiX6JXqJOQIr6GgSTSVYdR5
	 2JLP1X8leLJEZ7fDeyr9c0Nif6APkHk2ks4mjV+wlkENG+urQHLjFKzwQg4WTPaZnY
	 cOdU2pJSliIWSaocqSBBjvAfHm4LrJuBdjjBqeO/GCLfmGd0EUMF88ST0nBtteosSW
	 DJt4trUTapaNsZicVqsYPSYPlvqiplAhY4ZNLmAFDGPqdKmNEUDUiMQaqfT4t/gXvc
	 150Ihq78tULhRyM8Y5AQKGRWNWxpxIl/SA4m8IpK0lEHMfXjnvGgbwYB/UsMidTT0E
	 lnRNEdsaNgIoA==
Message-ID: <744d1a74957d0660f2aa3d8f92ff988d@kernel.org>
Date: Tue, 22 Sep 2026 07:21:24 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 17/19] drm/omap: dss: don't create a panel_bridge
In-Reply-To: <20260916-drm-bridge-every-panel-v3-17-83afb4f1a707@bootlin.com>
References: <20260916-drm-bridge-every-panel-v3-17-83afb4f1a707@bootlin.com>
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

On Wed, 16 Sep 2026 15:45:41 +0200, Luca Ceresoli wrote:
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
