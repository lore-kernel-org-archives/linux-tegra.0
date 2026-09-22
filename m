Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4A64F93B0;
	Tue, 22 Sep 2026 06:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790060373; cv=none; b=JKvOKZguWoHYM+BhnilaUjBSYeY8i1RHbbTY2riY2LtjbIZlxOnTl8tECtBeap3moCdLOZVdHcII3Uo35cL+As2dPqvDwCDUBKhTLrEa5e/XF3HZkgchFy9QrXODaMUz0xjTz+e7dtdE3kZjX69Ykqg4UfHGySlkHhPKCr+6NC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790060373; c=relaxed/simple;
	bh=RBmUb1mz+GA+GxabjOa4qaccQma6kPrXGoUM44TVM3M=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=Vy5GIfQomAlxFpACHm5n1Psk9wHKlyIVfrHCjDW8BrxVK7ejyUn9zeXwpIMHS0R0EHksogMfUPJeic3heaVblS91sOUSH6IbAGoYpixvVbnADNR6DhxD/W4KSq3TLjl0EZnLFXvlmNH1gfavuYA62YvzlMKrfI+YjiAdKQFYkDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aiZ+PbTP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aiZ+PbTP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83C8A1F000FF;
	Tue, 22 Sep 2026 06:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790060372;
	bh=M301KG+Yn2DPBFpyXd5yWuZOKhpIbr1GRV9O2ajFsG8=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=aiZ+PbTPgJGbXcZlADTpqJYNp41C5ZZ7GqNlt2I/HhsbhwezCOltkNIJvgNuDpQCO
	 ZOTB4sa7VawsPaFWE8d5ZSgZY8OdVSWa/R3obpbi2Ca/bwN4v1pCGyaQVVTUtt74FG
	 Wu+hbvpEfaE4hWmoMBPLSK+ezCu/Lawb/VA1JQeVVQyV76IOxH62JmQ3jfCRslUCCx
	 OaF2VVxkgtLPCwVwNybSaPXGE1C9OMKiPckyx6T1mciPmivusb+SsxrwMCU/Yg7f4J
	 7teSXT4/m1DgSRROwZQvysEOiKuL+wrUn508OvPqeIJvJcZ3+951GuuFdAWKEpe7sY
	 euwT19TIVVt3g==
Message-ID: <e90f4eb03768e503215c0607774b15cf@kernel.org>
Date: Tue, 22 Sep 2026 06:59:28 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 10/19] drm/bridge: waveshare-dsi: don't create a
 panel_bridge
In-Reply-To: <20260916-drm-bridge-every-panel-v3-10-83afb4f1a707@bootlin.com>
References: <20260916-drm-bridge-every-panel-v3-10-83afb4f1a707@bootlin.com>
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

On Wed, 16 Sep 2026 15:45:34 +0200, Luca Ceresoli wrote:
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
