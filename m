Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7A44D7D22;
	Tue, 22 Sep 2026 06:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790060233; cv=none; b=mdyPqRFeUTNkLyABBUlOeX6WE8DXeZAkW0yp135o+Oosekq/FOa3B//udllVP2XR8+5McZtop3NkLqUr8938wBlXM3gbo1eKv8/EhPyWHa8fqcpzQhWd7BGZBr8TqCooNGmEmMmzhNUAN8GazkSEd7CebAHn8LbR46gbz+i7P9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790060233; c=relaxed/simple;
	bh=1d/dvcHxVamna9owaFeoSOXs3fDbPWjgtvVHJ9x58IE=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=IttfEl0aMB7N1rQReIXj0MhZAhQuqbsaLWwOl5Feec4SN2FcplPdlH/S0bk5/Z0rFTt64CVd43gZJ/GWSVudmm6GNC1wwbk1vKBYT7kwOW76qVAiA8q+2fYknU0YSTzpSRW2g4Ek20QYS4mTewMFytD6NfrE/1yollz+67gSIik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TDo0ofYb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TDo0ofYb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14B991F00898;
	Tue, 22 Sep 2026 06:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790060223;
	bh=1d/dvcHxVamna9owaFeoSOXs3fDbPWjgtvVHJ9x58IE=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=TDo0ofYbNdfgzlG8qaMtA+hOaXzI2f+8O7RhKvtC64oAxw5fY99+Xnmpn4wuSn1k/
	 UFu1OOvp2Y+3cDkZCdyu8ToN+hSihOfZ6cIqvShfoUL3SY+CbYSlsweV1In9DuAobn
	 STQEIh6E7UqqP0lkiUPyBOVRhKndm6Dg5wROir+eZsX5I+1nyyew2NF26rf7yj3rRE
	 vIkNS3s0GDFHUxy2TYFchLghJvCIFbA6HR/9eZOTUGyPoP4f1wgH1CTIXFhybpxNEM
	 GMK6KQfYL+R/4HGOjBKfQN89DJMtXwJEDfsFr4ODWV1iocn/bH64X/PssKOFOp6jIC
	 6rraVpPj7OLzg==
Message-ID: <3925411c892a96d8e72872191a915deb@kernel.org>
Date: Tue, 22 Sep 2026 06:56:59 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 05/19] drm/panel: embed a drm_bridge into every
 drm_panel
In-Reply-To: <20260916-drm-bridge-every-panel-v3-5-83afb4f1a707@bootlin.com>
References: <20260916-drm-bridge-every-panel-v3-5-83afb4f1a707@bootlin.com>
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

On Wed, 16 Sep 2026 15:45:29 +0200, Luca Ceresoli wrote:
> Adding a drm_panel does currently not add a panel_bridge wrapping
> it. Usually the panel_bridge creation happens later, when some other driv=
er
> (e.g. the previous bridge or the encoder) calls *_of_get_bridge() and the
> following element in the pipeline is a panel.
>=20
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
