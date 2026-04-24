Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78C4364055
	for <linux-tegra@vger.kernel.org>; Fri, 24 Apr 2026 07:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777017445; cv=none; b=m4MSrb8M89ESYXV9RsSOmk/9RAuQfSkbCwAAiGGa1L2fHm9MUy/IXopE0pjKoU7/Yufv+Vy2NMOa4++zkmd+FTc9Uk+QBI646Ejwg51v7tVTu8EgI7chG/di0m38j3zspaFfDCF7638+i98BmjMePCkdgPdNnDal1AnYRnUHyq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777017445; c=relaxed/simple;
	bh=BZaZ3g7ZBPkjQoz8nLCka6ZxevyTyp8FYNkCXs7p8Ww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XoVZobdvUgZ79lTsd9NGg588L3kPXrMOdV9iUk/KYr3U3Hc4tuDxjK9XuOQiGTCIE4Okb/D993xpCJYJY718/Q1zX3LyfHcfMFscXaYP3n3vt6mnKoCPwcaGLyM6lDZyBIm7yVMbwF16mE6MLncm+Vpa8SY/DTo6OEpqq1sPcq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-42c0b0ffac1so2664724fac.2
        for <linux-tegra@vger.kernel.org>; Fri, 24 Apr 2026 00:57:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777017441; x=1777622241;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+k21mzy1Q8IyL290m/XCuURamP2UyoHvl1hWQE5Pk/w=;
        b=UoOB+9HT6cp0icDnXhNzqa9iA0YWAV4uXwj1i29p5/6dkkZY3Yxmk9fu+Va3HXYTl3
         aFbY2cstC/Su1duZvoIBk2mhkHz/wHBcpLWR/2Qh9Adg3NXpqS2zVAUAJuQsLNvDmpCb
         1nDuCfd04nYlgujp48GeqmI2Fc43XxVW5g3T269iIf+pgV5Jr7FnKnRIkkuWONrVng6U
         ZDo4/RW3Lx+YpjAvq6zRjLNHv0UuACtJg6Z4oOeEcE0NBsrUBZSuDrBUCl/cbJpCvSG6
         cdqD3tPWDr8cJV8Om6coKvntINYBXVnlIrl2ai5KSuP5yAtGhW0lPKJAe7aXhWci715/
         aNMg==
X-Forwarded-Encrypted: i=1; AFNElJ/6yAcB/C3h/L4TRunKPwNet53cbQzSI90o2M9kMkXQpjy45QKOn+O1Lvfb6tRV8JMIZ/qhTWTxEBzwFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFR1GOIrhPhJT5eaxIYriLml3kj4HgLuRacu62FlfSAkZSSqhC
	EHqBmoM+DzRS+5yp4+j5x+JRtNTBLNeDpG9vS9elbN3gjdFmDmCmNjSyMuuvXDwA0Hs=
X-Gm-Gg: AeBDietobgdNH5lvbTwjgpCM99eL7plJ58Eg7V4XRz2GHBZHTm0bNimDh2HyQtjY/cA
	iSCRVJy1ZTT/ta1+HzFkBXYFr6fUjdIt4/GybfPMbZAZ9oIq9SRn8aKagZ51ZZbM6Y65r8FwZ+7
	D37bJOrnwEkTgtVXHaYrg98KsXkl9V0HDrpzlBMVgZZBCakuvBVYqPfWe4VqPftFZudg9+atSG3
	QF/W4O511wVMEERwO8UvowevROVCLtYS7hZbODyNFpd64LjXFtspkAx6pfC2wIG1Ca8TioHfG5I
	8/Ns8KfgnxxFDW3T7LsRV0g3Z163Fo+y9B7GLYoVArZHUifGSTkvIsInIQ3XWxOek69QwzcKmjh
	NXU01s7vkQ7BOHrWZnhow+IWQXh9SO/3ywZBdPLVYxpA5v0yk4G/37IU+YMZ1BixjM4Exxbso4j
	g/EmJNR2jOF0BGHWM6sPyyQBlk9r/ip6In7BxTLifGnr0WuOdMF3JWmJYCEmnL0O9MfTHsYHk=
X-Received: by 2002:a05:6870:9a8b:b0:417:22e:e2d1 with SMTP id 586e51a60fabf-42abf23c02fmr19908387fac.2.1777017441448;
        Fri, 24 Apr 2026 00:57:21 -0700 (PDT)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com. [209.85.161.41])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-42fbe8a0bcbsm7435585fac.2.2026.04.24.00.57.20
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 00:57:20 -0700 (PDT)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-682fce74c06so6021223eaf.3
        for <linux-tegra@vger.kernel.org>; Fri, 24 Apr 2026 00:57:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9m/5oGKRfmw23mwn4cgPv3c7Phic6F2wkOMw0CCn8UloKrjTQRqFq+GLsYkGjJ3qFYRCEbgmMyMWxxDg==@vger.kernel.org
X-Received: by 2002:a05:6102:38cb:b0:5e8:1d93:921a with SMTP id
 ada2fe7eead31-616f772e968mr14645934137.15.1777017023068; Fri, 24 Apr 2026
 00:50:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260423-drm-bridge-connector-attach_encoder-v2-0-2ae6ca69b390@bootlin.com>
 <20260423115550.444930-7-luca.ceresoli@bootlin.com>
In-Reply-To: <20260423115550.444930-7-luca.ceresoli@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 09:50:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVbEV0b+MwCjqyc9Q0EjasD2hoN0rqWtjfmPPotZ19Lrw@mail.gmail.com>
X-Gm-Features: AQROBzASdrVB_Aky8lNaIViGqa4fIOoRKTkBEjNLF-nFJbKyYgy5oQezNNnYjKM
Message-ID: <CAMuHMdVbEV0b+MwCjqyc9Q0EjasD2hoN0rqWtjfmPPotZ19Lrw@mail.gmail.com>
Subject: Re: [PATCH v2 41/41] drm: renesas: shmobile: remove now-redundant
 call to drm_connector_attach_encoder()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sasha Finkelstein <fnkl.kernel@gmail.com>, Janne Grunau <j@jannau.net>, Liu Ying <victor.liu@nxp.com>, 
	Douglas Anderson <dianders@chromium.org>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Cercueil <paul@crapouillou.net>, Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Icenowy Zheng <zhengxingda@iscas.ac.cn>, Jingoo Han <jingoohan1@gmail.com>, 
	Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Marek Vasut <marex@denx.de>, 
	Stefan Agner <stefan@agner.ch>, Jyri Sarha <jyri.sarha@iki.fi>, Michal Simek <michal.simek@amd.com>, 
	Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Luca,

On Thu, 23 Apr 2026 at 13:59, Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> shmob_drm_connector_create() can init the connector in two ways, based on
> the 'if (sdev->pdata)':
>
>  1. manually in shmob_drm_connector_create(), or
>  2. delegating to drm_bridge_connector_init()
>
> Whichever branch is taken, drm_connector_attach_encoder() is called
> immediately after to attach the connector to the encoder.
>
> Now drm_bridge_connector_init() calls drm_connector_attach_encoder() on the
> connector so it is not needed anymore in case 2 and should be removed, but
> it is still needed in case 1. Move drm_connector_attach_encoder() from the
> common path to inside shmob_drm_connector_create() in order to get back to
> a single drm_connector_attach_encoder() in both cases.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

For case 2:
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

As none of the old SH platform have been converted from
sh_mobile_lcdc_fb to shmob-drm yet, case 1 cannot be tested.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
