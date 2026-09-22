Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DBD29DB8F;
	Tue, 22 Sep 2026 07:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790060987; cv=none; b=NibewHyTT7Iy5VduSEkhVFn9AXPIZSzSKwwwrEUcRU/SY538LMRyRjYCXUJhf/k0D4JGgw1xRq3RKlWHosYbuZEdVC512hR9axsoch1342wimIVXO4p1awmOnQqTsztI6yRNfWsmNxzFdcFzAmLcMJ99MTEg6GBon5DxieSivDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790060987; c=relaxed/simple;
	bh=rcFewv9OxapmeYE4E1fxP6conHMDHSDBlxWDqmo7ljw=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=ubNwOsYXSOgPTad98ObpOlMd5v8qzBuK4PlM5IHsHsRZYwHutoBk58qq7EE4LsplEVXl8x/Oth8irpnnCpGabIGV++Aj8q+sQnn5lPk3gyd4Uue/mideaDVT5PnIimLPRFLwFkLc5AAzyh5lT+aurBQViifBQ+6tgLorharRLAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EBphDY33; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EBphDY33"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AD0F1F000FF;
	Tue, 22 Sep 2026 07:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790060986;
	bh=y2GGkrgzKCsgm0mwf6UdJFHfN95qxznzs56jCuPDyFw=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=EBphDY338h1X323tWP1cLxM2et1PqxVvsgo6xqwgld5xaEIPOb+VThqfivND4ugAT
	 8i6MaPiC07iPrjefCXEdKl0AybWYuoyRyjo4gOJ6Ip2+PniX1YOnyoIb9Ui40sgIvO
	 2miUtk0lbPFbAEeSjAVn5gF9ZqO/wG7WIzN1OcArF8pmYZHYtmGx8sY/nl8C4t0zK6
	 IKyPWGKm8AweRYEalzbwsykmKumd0k/sig1a0ztd8xsONgsEDzhEHC1POHcL/D5NUV
	 jIjcDd5U2fDg5m6oIegk+jwz9qXgrC6MQVqqzWRNt6CLaFj/YUNCbNGiKBamFyBO4P
	 58PtuvgAvPi2Q==
Message-ID: <ea873a72b009d3fc34feab6bd3cfaf01@kernel.org>
Date: Tue, 22 Sep 2026 07:09:42 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 13/19] drm/bridge: fsl-ldb: don't create a
 panel_bridge
In-Reply-To: <20260916-drm-bridge-every-panel-v3-13-83afb4f1a707@bootlin.com>
References: <20260916-drm-bridge-every-panel-v3-13-83afb4f1a707@bootlin.com>
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

On Wed, 16 Sep 2026 15:45:37 +0200, Luca Ceresoli wrote:
> Now a panel_bridge is automatically created for every drm_panel and the
> panel-bridge API is just a deprecated wrapper to access it.
> 
> Update and simplify the code by just getting a reference to the
> already-existing bridge using of_drm_find_and_get_bridge().
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
