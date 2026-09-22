Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BD42EC081;
	Tue, 22 Sep 2026 06:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790060388; cv=none; b=F6dSgh+Zma6gvu8W8LSTdE4GcXnscdJf2iLGnpuql+s/2Gg1Hj+7ZZxlhzwYIE6feX7/R9zRRi/tCUHn//J/bnpRT50qLKCgMvu055wwB69ErJMQ5MeVmQLlaxtFUkVTggaPvfwD2rUVt4jLCnci1+U16Bb4WjfVWgX7B1U2mfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790060388; c=relaxed/simple;
	bh=HDTLCXcMsflZhPV6a/dCNQca/UqslquTzjm1UiXbF/Y=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=AGbhU6Zzn0XbwQ20QBSxWdwY1og3lRqG781m1HLmolaA1wMkHzVCMKXtJlwAsz6uHTVsYO5w4fTNQbxz3/Mz/D224XXF3NVIQdst6qOcgnkbcaUWIH9KaYNkdmQvhSbCizCW3foCLb1GMzV2E+mPzfdzuTYgPcMecNY391B9Kk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iVem6NK5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iVem6NK5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D09AD1F00893;
	Tue, 22 Sep 2026 06:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790060386;
	bh=fWS6VemCJQZVIwP1tf2Y6qbGjMYyL6clHJEnGhczC3U=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=iVem6NK51SNQhuNU9/3VNzRt45Nh3hNfislWZtoOmfE7THXCD16zsAGGUJgyOvFt3
	 wdVD0fsrMS30UjrIMWvrKGGrljlPWS1gvpZkoQdsI4LQXmrxXcI4N3FY1DVJmb9dos
	 mZZqj+HRrg/38SaP7uFPmaDFMG/vuTnQ2niRfpcJGsnMtUme52+dU/Uhc0H3g8gxnN
	 LClGSi9TVUnwnihRHh/2BhAl0BENTLXhQ7LaucgwzwSe8KJhqox1Td+JU+pskfqrdF
	 b+/tQn8QyMXE1vyTktB6dkSUcqcYHR0zXRjWPFjHNZf1iW3+3GcQZz5+ywLVPz/YJ4
	 z8N+D4jV4n2yg==
Message-ID: <b55e64b4e64d9d39c2417b9713623697@kernel.org>
Date: Tue, 22 Sep 2026 06:59:43 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 11/19] drm/mcde: dsi: remove unused includes
In-Reply-To: <20260916-drm-bridge-every-panel-v3-11-83afb4f1a707@bootlin.com>
References: <20260916-drm-bridge-every-panel-v3-11-83afb4f1a707@bootlin.com>
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

On Wed, 16 Sep 2026 15:45:35 +0200, Luca Ceresoli wrote:
> The helpers are included but unused.
> 
> However symbols from drm_atomic_helper.h are used, and were previously
> available as a side effect of drm_atomic_helper.h including
> drm_atomic_state_helper.h. Add drm_atomic_state_helper.h.
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
