Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A624EFFCA;
	Tue, 22 Sep 2026 06:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790060272; cv=none; b=bqW3xuFzxi/9Liy4erGHP8h0O5u6wR61ZVK1rPXcFY5Zdt+tuXiHj1Zyk6egXVbdhlzUNVt83iibykpERHXVuQUx5sc3JKGWUNmuFMTc/KsI/w+Y4WTITEfFO6XKjpfBEXb2BTzMl/PNuvNYkYILuukPDGCHXqN2WI5vJSVjrvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790060272; c=relaxed/simple;
	bh=XaFo5vRQ7SR4dCQLTrnWWfj7qCL414gbU8CGdH2J6wg=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=Ao4UD8eyXTuqhWWvKX6qw4KSzXNNEQzvXpwt9WVASm7BCAlzkXfCu3HqFFp5o2vg0jNuVWwxf7WOrOsUSPVGPax/xPDod9MCYTdvNQ2MMpugEv1bT9M2jrk/KX7Fg/7gE0CKo6pFadoac5AttA0J0gpWij5gtX5IQccgdym58kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YfBPXFG5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YfBPXFG5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 391A71F000FF;
	Tue, 22 Sep 2026 06:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790060257;
	bh=N3b6EWEhzvq/NJTt1sEIs90/NGjvMCZOKXCFRGdB+dE=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=YfBPXFG5JrJMz9tuRCmbAJ9OyNILSp6E1sv1UvRowuSFRcWHDtbSfeOkjJ5EM0POF
	 UuvbgJZirT9M8r60bMwAP1KAEbja4I0W+RZmGYkwrBIhMM2EGa6kK0WDN3ZzprpgUq
	 OEUmoqYl5Wvd2rBPUhCYMI3u7lwXjfNWzqx6QkSlbbW5Ck+l6zk2CBKgek6LZM1wMB
	 7Ou0hw6GZdRhsVPRrv7iMMXJG8zjN+xPuy3MrqKlEBpurCKky35Kk/RigxeHoBBpBz
	 n8FZ4a8yh35aj+P5pHEhEOaxgMUnpOkIWhsUNa3O8aJT2No7PoEyVWdzmelfns8K9q
	 ZIAD6tYeAuEfw==
Message-ID: <996d8812a53307ad7937f0c09c872cfb@kernel.org>
Date: Tue, 22 Sep 2026 06:57:33 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 06/19] drm/bridge: remove devm_drm_put_bridge()
In-Reply-To: <20260916-drm-bridge-every-panel-v3-6-83afb4f1a707@bootlin.com>
References: <20260916-drm-bridge-every-panel-v3-6-83afb4f1a707@bootlin.com>
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

On Wed, 16 Sep 2026 15:45:30 +0200, Luca Ceresoli wrote:
> The deprecated devm_drm_put_bridge() function is not used anymore.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
