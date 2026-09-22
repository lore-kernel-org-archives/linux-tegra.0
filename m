Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C7D49F133;
	Tue, 22 Sep 2026 06:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790060305; cv=none; b=iOrs7320dLu67eRVHRVJrF64YWmqfSodrg+PG+09tzsVSqBPdkF8nO/ek6cEAE1bi1d66O1OmJC6d7flfYiCnT93ULWom1YneuTuZjgLkRKpWInbeZWFQvhkSWqrK0bfaF0U9X5L9V7S8j62tGGGAViYRLzC5OyRP41PbJQZtf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790060305; c=relaxed/simple;
	bh=7LMHGTG0pfOz+99DNL3UsTjXGEHrS6iAVQiir8GxRDk=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=uZnP1YXmvlq4poLq5m0vTst9m36WmUwwCkXEfrdjuGBTD3v3kMEHwqrHp3FSiMFxR+qy823xgidcwqvuVB0pvkoZxbc7GCZIyMW3etyh7PjuLynj57iPmT6siHN3ZYji22AeTclWBrvtYQ7xkTnoCctIEtgl4QtDZYS0xzI6dUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aD3VuPBw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aD3VuPBw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 464761F000FF;
	Tue, 22 Sep 2026 06:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790060293;
	bh=7LMHGTG0pfOz+99DNL3UsTjXGEHrS6iAVQiir8GxRDk=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=aD3VuPBw4uRmaDcJos/m085O1jdB/WoHyTw8oxovEuJzzWNHRpglu227cxnBR5loB
	 HuctMQz3HXVdgKjbrB/hssfTOZDPp+9a/J5SDPtKQCZBmPYBsgmo782+ZTh/+mhqgQ
	 +K51sbSy1crQsx1l5fT1LFHCwzqDJveo+zepTPVymKjYD9vk6nlRDnDsRnD47hrzIC
	 EDMMEOnlH7DvDdIAf6dQvGo2VTdytXs8eLach8HxyBhadOxgzDSPDDfLu8QhLtdzlj
	 FjfNhCd5QQkFV59ZPqwzhb9L7CZFUrlfEBVYSqAekd0cyTAPBcDR4w9CcalN1StCY6
	 wg1C7LHNozKwg==
Message-ID: <a1e4e49bb1c7cc8395c66a9bc6d1a1b6@kernel.org>
Date: Tue, 22 Sep 2026 06:58:09 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 08/19] drm/todo: add entry for removing the
 panel_bridge API
In-Reply-To: <20260916-drm-bridge-every-panel-v3-8-83afb4f1a707@bootlin.com>
References: <20260916-drm-bridge-every-panel-v3-8-83afb4f1a707@bootlin.com>
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

On Wed, 16 Sep 2026 15:45:32 +0200, Luca Ceresoli wrote:
> Now that a drm-bridge is embedded into every drm_panel during the panel
> creation, the panel_bridge does not really exist anymore. Its API has been
> deprecated and kept until drivers convert to the bridge API.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
