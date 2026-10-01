Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EC648987B
	for <linux-tegra@vger.kernel.org>; Thu,  1 Oct 2026 06:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790837969; cv=none; b=dr/gkzXvt2/V3K4Yve3eiLmhPHV5DNXt2qTf/812MN/dPPoldvMEw4Co37Did8ah/q1uu4Mx3FwujKkXmpdECQoop9KFt6yluyzEqB4ZvfzmVX5/q+lJsi1cOaTdB2ZTVMEgta3EtJFewdGezIfFgQvkxXvCuBDIC1ehe3/i2HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790837969; c=relaxed/simple;
	bh=adKEV0wp8fnkm3B2gVtkxUbYQ0N4xZbbOvQZcLnu0xk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FXbOMbWE7Uh49HL3mCtp4WuB3VozATyiZRgCo1FZ1iueg6TbjoBhM9UAUO+VvbeJAWwufEdenHBnQydvfveBmz0OuC+zGM9fFdophm2UAvH0tLOzGphXpP5Od80LBSBQdsZg1jp+Ti7TstLQXSO62mZiEHckyYUup4HGmp+QBuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZTEqIekg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZTEqIekg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B32D61F008A6
	for <linux-tegra@vger.kernel.org>; Thu,  1 Oct 2026 06:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790837966;
	bh=adKEV0wp8fnkm3B2gVtkxUbYQ0N4xZbbOvQZcLnu0xk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZTEqIekgpZghTg8Qn8vwEmbcMeMYl2MORgJxn3aIHii9lmlTTHXZULIZaVG6qSbBU
	 P1GpvEyVhrBhMi/mxpGoxmyOhDj0twY5/81waMYx34MNJYpyJW/LGUPeAxIk4Gb3tS
	 291yIQxl1AzJd+hKdqlRFd6inzcyYydgb3tNfWPDRy9FVVDUzeGQbpXp2S02THGyJO
	 cBNMWgzFXyDjGvG+KjD2jVAWTdEuZ5SPtgBv4hf/VJBW5T/eR3p7ntSCwVWjJbxHS/
	 EtdsuoEljzPiJkqs+B/W+oywc3R6jty9xcO198geJNwEC8Z9ZM5JTuumBUxhIb+jXo
	 21JWDU1ZRilHQ==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5ba3e27d525so1237886e87.1
        for <linux-tegra@vger.kernel.org>; Wed, 30 Sep 2026 23:59:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByoEoC9mXrl4TmqP0QJATBmDFwZFqrjGqqD+aW+EC8dhD/zv92MVw+3tCe2fy78QCKmtfzOy4LcCjrJog==@vger.kernel.org
X-Gm-Message-State: AFq9FYL37zokJQYXeZKiIu3E5sTE2suZDJ8Mk6hVWqbR0QY4KqyDNXgX
	nriWO/4hYM6W2wASlwUo+Ia6yAOyZWcIZCiqicXMdw59plk0j6T7PGstSZDORfYczHs9O0/bF7k
	VJ8WfnqTb+5gHCceCtJIFRFpmXdgCYJM=
X-Received: by 2002:a05:6512:3ba0:b0:5ba:3b01:36a5 with SMTP id
 2adb3069b0e04-5ba405ee75amr1389712e87.14.1790837964923; Wed, 30 Sep 2026
 23:59:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916-drm-bridge-every-panel-v3-0-83afb4f1a707@bootlin.com> <20260916-drm-bridge-every-panel-v3-7-83afb4f1a707@bootlin.com>
In-Reply-To: <20260916-drm-bridge-every-panel-v3-7-83afb4f1a707@bootlin.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 08:59:09 +0200
X-Gmail-Original-Message-ID: <CAD++jLkhYNZ4R4Z60zTzNoZwCtk4rcL-pCbgdHpNEzV-4oO_Wg@mail.gmail.com>
X-Gm-Features: AclHuK8feDgrhg1tWHz9y2oJ4IDmaC5Th2MaGXRPg_l1XDpQ6IeWaj3r9RadEo0
Message-ID: <CAD++jLkhYNZ4R4Z60zTzNoZwCtk4rcL-pCbgdHpNEzV-4oO_Wg@mail.gmail.com>
Subject: Re: [PATCH v3 07/19] drm/panel: deprecate panel-bridge APIs
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Paul Kocialkowski <paulk@sys-base.io>, Inki Dae <inki.dae@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Sean Paul <sean@poorly.run>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Albert Esteve <aesteve@redhat.com>, 
	Anusha Srivatsa <asrivats@redhat.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 3:46=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:

> Now that a drm_bridge is embedded into every drm_panel, the panel_bridge =
is
> not needed anymore. Its APIs are just accessing the embedded drm_bridge
> transparently.
>
> Deprecate them all, encouraging to use the drm_bridge API.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
