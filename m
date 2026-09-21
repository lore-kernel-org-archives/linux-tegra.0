Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F124AF668;
	Mon, 21 Sep 2026 15:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790003225; cv=none; b=ugxmJzjveJWfqNp2DBkaF6/90zbrap8ywwkqzc7+5UxCMTJgYvpjXzffx6yCRvsavtquXtRGQd3godda7AakLT255eFRYKJjgxbSuUl6D/nh3CCi/KtgN03o1xuTj6fdKOMWO5d86o0arw6MBvq0aH+9UvWib9BgyNEq/I7Y7mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790003225; c=relaxed/simple;
	bh=xoh8hNlkdJsPsW0jTH775tm2AXm0GgjyIIc++D3mU5s=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=PttjM2n+CFZsylB3kF/Wn+r0ek40GiTlqvGqX6ZalxTbLEFATeqnXoavHvrfy6nhPCqwvib7DlvKi2EvQTxpyEjZnZXG5aeSVRngDfzVAUrnovBfK1lajtZF5Udqq4dD/ESoyrIvtB3e95iG6PD2SWgdKDHOfUAO1SLOkd4hSHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lOrHKfrb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lOrHKfrb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA3C91F000FF;
	Mon, 21 Sep 2026 15:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790003215;
	bh=/ziQ3NW1LSgwDZe9di4b6yJwonh0oLPcxYpWPZN+JqI=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=lOrHKfrbJ7ahQcwnnVS4kIP0s3GNfPmgrb5Y5k4SU7coJMk/sM3m7J5uNTGZy+lmM
	 0ObsoCjw2DRp/0lyLYnfcxU5EmuG93OuYOzlVfvf45toocfFbh4FwxEJo+VtL/R1aL
	 4bdqbNGArvBVflbHpdfdKJold/G/S1evziVMvUrmrwd9/HWcrOmWCfgIRgW4TgKDhl
	 wOjKrBLFmkAyh1M4z1ir11oAIaYm+pGCodpG6qgf8l5jKu/0b4akexj8ufqRvrmecn
	 JZJoeuDKeXgS5XDwMUZfo3fzsaIEKAFekB2/UC5fJhjcYEIHwCREyGJc4DbF7qyvhJ
	 sB0WK9InErSzA==
Message-ID: <0e6f063b7e128c3713b68d217342f9f8@kernel.org>
Date: Mon, 21 Sep 2026 15:06:52 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 02/19] drm: of: remove now unnecessary forward
 declarations
In-Reply-To: <20260916-drm-bridge-every-panel-v3-2-83afb4f1a707@bootlin.com>
References: <20260916-drm-bridge-every-panel-v3-2-83afb4f1a707@bootlin.com>
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

On Wed, 16 Sep 2026 15:45:26 +0200, Luca Ceresoli wrote:
> These forward declarations are now redundant after having moved
> drm_of_find_panel_or_bridge():
> 
>  * struct drm_panel is not referenced in this file
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
