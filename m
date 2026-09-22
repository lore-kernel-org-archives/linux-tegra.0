Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8424F93AE;
	Tue, 22 Sep 2026 06:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790060291; cv=none; b=KdksxuYwCQQiMHgDBNu1v0mF+DlPtgNe+Iqu2kD1cV44FIRS3zksu7BPlJOfpACOQxcHuu0Ko5R3PnqH2x0QZ/WeYU2suAL0RYN1bUQcQds+HFbhT2ahbJpWoKvrqzva0P/qSwB0M9o8OnPcCtBu1Hc72/YjgPt5cdV0DXBdJnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790060291; c=relaxed/simple;
	bh=EUhdkfTfZYkwV1OMbcAcC6Pw5pH0JpuT7NkR4uZdKPc=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=ckgXPXAlEEJ2xEBP8hkwBBdrRMVUmcflcX6rO/jKxEkhmmIsHKmGx79hdj2MqxeNSrHaNnptGq9MhO1g3kXXhtlNzFEAACpR8cXwullU8vIdgmxn9FOdt7l0zexZ4BMhVgZ7tTcJNIVOPoHVStiOddFHfxxHCAG+saB8GKshKTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JftsdkfD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JftsdkfD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 363FB1F000FF;
	Tue, 22 Sep 2026 06:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790060278;
	bh=EUhdkfTfZYkwV1OMbcAcC6Pw5pH0JpuT7NkR4uZdKPc=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=JftsdkfDUeoe7XikNfywfFBvp2aJTpTnEv9wPYh1I/6gXECPMaLgqWgeQfdQHlYUU
	 i/TbsEzzct7jm56kCKmJ0tWA1ypE958tuvSp91KHOI0+1afhdOMNOjLozs78MvopHo
	 SVnzPLIPxc8dQCVXJPprD7nvslYc8xU5fRwA6RrbTivk5IfZsZpVK+0VVyk8vXNUG+
	 3AVspVri2r9QHBRskn29ScBE2kcH7Kt+knwYB5tjlXfiWQQQRQoN8Qt1WClc+CSwlB
	 MQLhOFKJM13m8XT5XyF1/VT4M01hyF0TRa0GoF6KpQLQ1PKyCvjI67eRmBva08atlk
	 AfMHWYL56HNFw==
Message-ID: <fcdb76ee38c6ab63727d8f526a2f9208@kernel.org>
Date: Tue, 22 Sep 2026 06:57:55 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 07/19] drm/panel: deprecate panel-bridge APIs
In-Reply-To: <20260916-drm-bridge-every-panel-v3-7-83afb4f1a707@bootlin.com>
References: <20260916-drm-bridge-every-panel-v3-7-83afb4f1a707@bootlin.com>
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
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>

On Wed, 16 Sep 2026 15:45:31 +0200, Luca Ceresoli wrote:
> Now that a drm_bridge is embedded into every drm_panel, the panel_bridge =
is
> not needed anymore. Its APIs are just accessing the embedded drm_bridge
> transparently.
>=20
> Deprecate them all, encouraging to use the drm_bridge API.
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
