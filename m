Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C5D39D6F6;
	Tue, 22 Sep 2026 07:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790062113; cv=none; b=Ki1Z6rcS8kBZS8twvQybv2+HB4238jDKPatYxMx5tXY+hpGXnJzPhGlInnO3zpn17dYy44Y3MCV1N+EiTf8SCtZso4MKTFWV2nWf1Bjg5wbva3KwBGdHrmBo3hUmIK8QiSyB+FA7UzqF5eT+IRu8+HJYFfZKc4WizMWhW7VPgCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790062113; c=relaxed/simple;
	bh=MNW2dzG6pcpEavKZGguDP74vi3LNwv29iDiCZEufv9A=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=rqPeyLJTwerHMejH6mMLrx2bS+84pKqgMayRreZhgE9xEEFL+pBMMPaSS3CjETGPfbT7s3eaB5J2a17O3ge0BThsVC6x4yXOqDaxIPs/NJLV9pxkTUic69vYHCl/XRoIGAe40N1cw4G624zd+hxF0jR42MlqEk/6Ey4Z7/sQLPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YkjQqzpt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YkjQqzpt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81BC11F000FF;
	Tue, 22 Sep 2026 07:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790062112;
	bh=3ux+jnjvPDKFrFGj72qL6Pn667s3hOD+uMkfDVfth4w=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=YkjQqzptaJUXFmAbBCfQSoebYMNmQsBJusR+FSLllKUHPSDR/AL2tHFk2zhwxNU7S
	 ZJbfZu40Jiy9uENTSiPYc64Lcx94x7gvgq4r10P5tkVhjAckhpA4rHtOHP7iC6JGCQ
	 uruJKSCufdGIu8+GqNCYguivLSOkrO0PYzcv9H55HdbBwhc6XetHqFpIs8Oz8ocKc/
	 F+pwW6p2nmFAKy1+wl1R8qwJYF0XfLNQ2Ch9HnpJbsXLnOpMgTo8k355OEsqvk9tSx
	 U6dZz8YsyfwjZP7LWG98ep2jcL/q999EvT9I8Pe5W0ao4g0y1bjIvrcA4zQDS96MGd
	 aUi2l2X0SuTJg==
Message-ID: <c66e59d50c98b5bf862c687ff9ec86f5@kernel.org>
Date: Tue, 22 Sep 2026 07:28:27 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 18/19] drm/tve200: don't create a panel_bridge
In-Reply-To: <20260916-drm-bridge-every-panel-v3-18-83afb4f1a707@bootlin.com>
References: <20260916-drm-bridge-every-panel-v3-18-83afb4f1a707@bootlin.com>
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

On Wed, 16 Sep 2026 15:45:42 +0200, Luca Ceresoli wrote:
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
