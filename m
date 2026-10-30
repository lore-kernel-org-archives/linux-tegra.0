Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793329633;
	b=Tjy1FUazMo2hKCE0W2gTmqpd1KRr2whucG3JTNFBgpNtfSegYyvr1BuwuwBTSVjTQsof
	 9k4EthnxS1yXrH1u6H7I2Wcl9W8mwytfC0z4JkrEp4sD4QdO9E7Mx3TKWInbNYOtzmqSG
	 WIhVfGr6qpBN5F3g9cidj23PVc8nIANVEq/GkIGFt+w9irvPNLt7rSc1k8Toasx5k799G
	 Ci/Ka3CHDHCaPvdcvF9shwZQOqEtMCdSSvRcX1vlKFBtU62uIF0LZPceN47LSuIzcz5O8
	 eohFxTjoJth8XlbCOeKkbVOWGxtw8BpA57fhQUIyLnYUSqLCkZRspBQ6GizmbZ3T/sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793329633;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/uSzGTnG/yOJTh9JMU3hh2HWfIlei95qLPy/XlUKvmg=;
	b=aofTQrPmUT84Ye2W7U98NNNpT88xlFOb4lfB1YKjnDltPr8l5ltxI46jQY7K3/oj2CjV
	 7Q7sQCk/97FKGgGfb1LPvFmK9JyIBgbzffcNfd4U6Y/oSS5cx+HN5pEyN31y7s4pwL04N
	 BPSwo4D/h8WEk6wp6drPCuhabaO6tCgGs8vCGE+I+wguM/VxIWOYwFIUeGiQAttCHQUp5
	 m+zvpec9dGoeaXcysFe7NKEDIKt6xFXxT5OG+9Or4yMRWbh6WopJPhahnyxb6S7gAaqX9
	 r/p27HoxO6nQVlv6iGXe67cO5cKGEwZTCO+mMFp4xldG4Fk8ndiiFn02p+VboOolCiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cBckOE2b;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA4C606A325
	for <linux-tegra@vger.kernel.org>; Fri, 30 Oct 2026 03:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cBckOE2b
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EF7D1F00A1C
	for <linux-tegra@vger.kernel.org>; Fri, 30 Oct 2026 03:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793329632;
	bh=/uSzGTnG/yOJTh9JMU3hh2HWfIlei95qLPy/XlUKvmg=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=cBckOE2bzavNJb3OzybplOn3pG+5iDGHJaiUxI/i9aP9W3tywQtMo3uhdvorxzAfn
	 Z6C99P2+noPuVauSJ7HGbjTPiZ/iOu1qZUEekhZ31VLbV7svgE/E4tj/AZ4sgUVd7S
	 7qhi2kBdHp/Wa1CVvjO4UMwzh1q5zifIUkGi1VBnuyweIRh95Vtm0Gx2zArlDHRFNW
	 MYIVWdndq6IjJlKJaWNaM0kAz2XRMjLq4FCmzCOkCdb0zraPU9EVB6DUwxWVEUdRbd
	 ewf8UqC9zdUbIfEBjw4Qrej1m1gxB3A6Y2cJc3/od0qi+Sa8Gr/su2L735gyltgR2Y
	 80jf8Zs2DshxQ==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3a9e87ba696so2340891fa.0
        for <linux-tegra@vger.kernel.org>; Thu, 29 Oct 2026 20:07:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByhjdP6I2nXYvcZgS4TPk2eQXJ5f/mLSucxgq6lWHtLoxZ6hPvCLrbT2GK+9zwpuBQMIUhjuUUbo7vFmw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJnwp7IgodYlGC9UnjwP4B0YRK8sa5yDRNG7BPjbFaDq6kmiVc2
	ZCrELQnViNl/4I/r/DDrbMfsraPuKXYZIM2yqzmb+UwQyRN3lHxmgOyfXEppkEvUdVV1L/3iTEa
	TrFyJg4cTq+7LLN7FNWyCspu4PIA/XzA=
X-Received: by 2002:a05:651c:2120:b0:3aa:f617:5c85 with SMTP id
 38308e7fff4ca-3acb7aa5561mr1702801fa.12.1793329629127; Thu, 29 Oct 2026
 20:07:09 -0700 (PDT)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026-drm-panel-funcs-v1-0-5e3070a3478f@oss.qualcomm.com> <20261026-drm-panel-funcs-v1-20-5e3070a3478f@oss.qualcomm.com>
In-Reply-To: <20261026-drm-panel-funcs-v1-20-5e3070a3478f@oss.qualcomm.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 30 Oct 2026 11:06:54 +0800
X-Gmail-Original-Message-ID: <CAGb2v66GV0mu+iKHs2+mZPxJmbdgm60j8srtKLuux7BdAC9BZQ@mail.gmail.com>
X-Gm-Features: AclHuK9xiSETdonY9_QkznCRV7eL1jeHCdIOBKyx8OeAMXLApY8qfRj6-NRV9No
Message-ID: <CAGb2v66GV0mu+iKHs2+mZPxJmbdgm60j8srtKLuux7BdAC9BZQ@mail.gmail.com>
Subject: Re: [PATCH 20/35] drm/sun4i: set the panel orientation on the connector
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Douglas Anderson <dianders@chromium.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jyri Sarha <jyri.sarha@iki.fi>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Paul Cercueil <paul@crapouillou.net>, Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Linus Walleij <linusw@kernel.org>, 
	Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Alison Wang <alison.wang@nxp.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Yannick Fertre <yannick.fertre@foss.st.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
	Philippe Cornu <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Samuel Holland <samuel@sholland.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Jagan Teki <jagan@amarulasolutions.com>, 
	Ondrej Jirman <megi@xff.cz>, Javier Martinez Canillas <javierm@redhat.com>, 
	Igor Reznichenko <igor@reznichenko.net>, Michael Walle <mwalle@kernel.org>, 
	Dario Binacchi <dario.binacchi@amarulasolutions.com>, Jagan Teki <jagan@edgeble.ai>, 
	Jianhua Lu <lujianhua000@gmail.com>, =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
	Purism Kernel Team <kernel@puri.sm>, Jerry Han <hanxu5@huaqin.corp-partner.google.com>, 
	Joel Selvaraj <jo@jsfamily.in>, Icenowy Zheng <icenowy@aosc.io>, 
	Michael Trimarchi <michael@amarulasolutions.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Casey Connolly <casey.connolly@linaro.org>, Michael Tretter <m.tretter@pengutronix.de>, 
	Cristian Cozzolino <cristian_ci@protonmail.com>, Junjie Cao <junjie.cao@linux.dev>, 
	Ryan Brue <ryanbrue.dev@gmail.com>, Nickolay Goppen <setotau@mainlining.org>, 
	Stefan Mavrodiev <stefan@olimex.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Robert Chiras <robert.chiras@nxp.com>, Alexander Koskovich <akoskovich@pm.me>, 
	Markuss Broks <markuss.broks@gmail.com>, Artur Weber <aweber.kernel@gmail.com>, 
	David Heidelberg <david@ixit.cz>, Dzmitry Sankouski <dsankouski@gmail.com>, 
	Yedaya Katsman <yedaya.ka@gmail.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 7:11=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> The panel is used directly, without the panel bridge, so nothing sets
> its orientation on the connector apart from the workaround in the
> get_modes() of some panel drivers, which runs too late.
>
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Acked-by: Chen-Yu Tsai <wens@kernel.org>

> ---
>  drivers/gpu/drm/sun4i/sun4i_lvds.c | 2 ++
>  drivers/gpu/drm/sun4i/sun4i_rgb.c  | 2 ++
>  2 files changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/sun4i/sun4i_lvds.c b/drivers/gpu/drm/sun4i/s=
un4i_lvds.c
> index 6b98d20a8890..448e8a70b1aa 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_lvds.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_lvds.c
> @@ -153,6 +153,8 @@ int sun4i_lvds_init(struct drm_device *drm, struct su=
n4i_tcon *tcon)
>                         goto err_cleanup_connector;
>                 }
>
> +               drm_connector_set_orientation_from_panel(&lvds->connector=
,
> +                                                        lvds->panel);
>                 drm_connector_attach_encoder(&lvds->connector,
>                                                   &lvds->encoder);
>         }
> diff --git a/drivers/gpu/drm/sun4i/sun4i_rgb.c b/drivers/gpu/drm/sun4i/su=
n4i_rgb.c
> index 3da9a9283c6e..5414afcb10b5 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_rgb.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_rgb.c
> @@ -245,6 +245,8 @@ int sun4i_rgb_init(struct drm_device *drm, struct sun=
4i_tcon *tcon)
>                         goto err_cleanup_connector;
>                 }
>
> +               drm_connector_set_orientation_from_panel(&rgb->connector,
> +                                                        rgb->panel);
>                 drm_connector_attach_encoder(&rgb->connector,
>                                                   &rgb->encoder);
>         }
>
> --
> 2.47.3
>
