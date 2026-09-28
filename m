Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AA348FF98;
	Mon, 28 Sep 2026 08:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790585326; cv=none; b=cA56qyToY5EfYTHi/Aa6ATWtgTkAOojWbyV4ra1LwUBcW4kykLby9Ibsa8oDzeC2SSTEXIhrf07E45OhGpR9E0lF7VcOhEQIFOOUBcD9vt7xmhKAAv3cPbjBE7MHVrSqfnJr9lUE73SItho3+XUf2KRHSGABruyRDo3Q8Bl1Bh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790585326; c=relaxed/simple;
	bh=4TrL1LK87jREhsshgj9afbV5g3GJEMSvHjNMsw4bwYc=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=hjZcICg8tA7WAxvB5VbnFgf7qEFjgdpJ8ssnxRar/ekihoi2J+QNrrJy33mgtianl3OHB+BuL5FQ/WtQ+BQKeZtVIcPQk//Z5ofxvBAxHQUGBWnFT4MaXVbwpWILpLBZg47V/v5Y0JrzOqY8NhoNaYaxOmI3Y1W7vNLAPeyD8OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZDa58Au2; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZDa58Au2"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EB1EBC5CD51;
	Mon, 28 Sep 2026 08:49:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BA3E4601BD;
	Mon, 28 Sep 2026 08:48:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B9ED0102F1EA6;
	Mon, 28 Sep 2026 10:48:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790585317; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4TrL1LK87jREhsshgj9afbV5g3GJEMSvHjNMsw4bwYc=;
	b=ZDa58Au2RHTizRo43gJ1JRUszIzTyZQkH6fdz231iZk+mFK47kmlmDY+0VETY5yPpnsekI
	H2W47fDdg16ql/VlkfIClEu+3ESEBPzsHVxHQwSdkpqq7xS/LmLFAZ+c1Cwv0IKbwSw7wN
	UNguMPFymrWlqGCyroCsOi8X9w+cBGPYBNKhNvYG1RBg11GdeNJxoWlU5ueicQVxlBuyqM
	rssKNaxcGDmyEx8/mRYdRbY6UDDqUJjccvTKQdvCwKLp+ozx2FfNr7mFPECEsnr5mrfBuE
	Qly9BUoYG+GYmxYZ6jpGEQOn3mIhX3sFqMhz33riAziOXByw/e3sDqg5nym3vw==
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Sep 2026 10:48:20 +0200
Message-Id: <DLQTIJA71AQ1.1RASTM0D6GMGX@bootlin.com>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Jessica Zhang"
 <jesszhan0024@gmail.com>, "Laurentiu Palcu" <laurentiu.palcu@oss.nxp.com>,
 "Lucas Stach" <l.stach@pengutronix.de>, "Frank Li" <Frank.Li@nxp.com>,
 "Sascha Hauer" <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Paul
 Cercueil" <paul@crapouillou.net>, "Paul Kocialkowski" <paulk@sys-base.io>,
 "Linus Walleij" <linusw@kernel.org>, "Inki Dae" <inki.dae@samsung.com>,
 "Jagan Teki" <jagan@amarulasolutions.com>, "Marek Szyprowski"
 <m.szyprowski@samsung.com>, "Sean Paul" <sean@poorly.run>, "Jonathan
 Corbet" <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>, "Randy
 Dunlap" <rdunlap@infradead.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 00/19] drm/panel: embed a drm_bridge into every
 drm_panel
Cc: "Albert Esteve" <aesteve@redhat.com>, "Anusha Srivatsa"
 <asrivats@redhat.com>, "Dmitry Baryshkov"
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
X-Mailer: aerc 0.22.0
References: <20260916-drm-bridge-every-panel-v3-0-83afb4f1a707@bootlin.com>
In-Reply-To: <20260916-drm-bridge-every-panel-v3-0-83afb4f1a707@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Sep 16, 2026 at 3:45 PM CEST, Luca Ceresoli wrote:
> This series embeds a drm_bridge into every drm_panel, as previously
> discussed [1][2] and in previous iterations.

Series applied to drm-misc-next.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
