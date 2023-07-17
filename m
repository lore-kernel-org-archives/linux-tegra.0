Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B94C3C001DC
	for <linux-tegra@archiver.kernel.org>; Mon, 17 Jul 2023 15:40:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231255AbjGQPkJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 17 Jul 2023 11:40:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230457AbjGQPkI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 17 Jul 2023 11:40:08 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CA99187
        for <linux-tegra@vger.kernel.org>; Mon, 17 Jul 2023 08:40:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8AAF961158
        for <linux-tegra@vger.kernel.org>; Mon, 17 Jul 2023 15:40:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF63EC116A0
        for <linux-tegra@vger.kernel.org>; Mon, 17 Jul 2023 15:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689608406;
        bh=tF/K12dcb1AtR13XQY0pq3bgmoCAiVfZHpGq03H1+sk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=uSghMZln8zDCY4i/Z8kcg92v1GX+yiTfVQMbm6tTmpM5q7Ql6OPFPde89SLkf9V8Z
         3JX2KwJib8Q7Qot41SvoxjHA7ukLzXmaRuLmt6CGapRce9AAd1MVbs517dE4pavc5W
         QtVkDdbTd6p+kswQ3EveL3d3YmC1EZV8eM3Y1HeUOM7H3K8s3hO4dTSxjyHvoQwbbH
         7v2FbeRUfl4saIuhgUSej8mzFWoHFlCe8tygtVuFZ8pwft320PqVCzs+3BcZL96LWH
         2USjet1UIDpr8lHhgDtjFqYtWR7Tq3BX8D232R55/Y+nkST+2KY7rD+XHdixoyDKpC
         hjmUV07xQpa4g==
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1b0419f758eso3617970fac.1
        for <linux-tegra@vger.kernel.org>; Mon, 17 Jul 2023 08:40:05 -0700 (PDT)
X-Gm-Message-State: ABy/qLaryN6AX8Id0GzbjBmbQRIC9LNeMA+2G530XbTo8mLlGzbAwk8h
        qgTdGB0z7qoPrHHJGAjcn8kTYUX7G/iUQK0cLf39Yg==
X-Google-Smtp-Source: APBJJlHs9bNlVGErzzDkG3ITNYPrBi9bcbK5hB2pZ5ku9OA6MncccRQ7QQDddVXbZVn5Z/tCXP76UHYBqks/PFSJBmQ=
X-Received: by 2002:a17:90b:1095:b0:263:3567:f99 with SMTP id
 gj21-20020a17090b109500b0026335670f99mr13011407pjb.15.1689608384033; Mon, 17
 Jul 2023 08:39:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230714174545.4056287-1-robh@kernel.org> <114500369.nniJfEyVGO@phil>
 <CAL_JsqJMo4LHRmsfRQAr-j6oNESbS=q+eFU+B7e720emjf+8nA@mail.gmail.com>
In-Reply-To: <CAL_JsqJMo4LHRmsfRQAr-j6oNESbS=q+eFU+B7e720emjf+8nA@mail.gmail.com>
From:   Robert Foss <rfoss@kernel.org>
Date:   Mon, 17 Jul 2023 17:39:32 +0200
X-Gmail-Original-Message-ID: <CAN6tsi5wOhptw4PgP2etkC5KYh_5cfOXZuVhsN6YCMiqn15hog@mail.gmail.com>
Message-ID: <CAN6tsi5wOhptw4PgP2etkC5KYh_5cfOXZuVhsN6YCMiqn15hog@mail.gmail.com>
Subject: Re: [PATCH] drm: Explicitly include correct DT includes
To:     Rob Herring <robh@kernel.org>
Cc:     Heiko Stuebner <heiko@sntech.de>,
        Liviu Dudau <liviu.dudau@arm.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Lucas Stach <l.stach@pengutronix.de>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Tian Tao <tiantao6@hisilicon.com>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Yongqin Liu <yongqin.liu@linaro.org>,
        John Stultz <jstultz@google.com>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Qiang Yu <yuq825@gmail.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
        Sam Ravnborg <sam@ravnborg.org>,
        Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
        Icenowy Zheng <icenowy@aosc.io>, Ondrej Jirman <megi@xff.cz>,
        Javier Martinez Canillas <javierm@redhat.com>,
        =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
        Purism Kernel Team <kernel@puri.sm>,
        Jianhua Lu <lujianhua000@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Artur Weber <aweber.kernel@gmail.com>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Steven Price <steven.price@arm.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Emma Anholt <emma@anholt.net>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Sandy Huang <hjc@rock-chips.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Tomi Valkeinen <tomba@kernel.org>,
        Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
        devicetree@vger.kernel.org, Ondrej Jirman <megous@megous.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        etnaviv@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-mips@vger.kernel.org, lima@lists.freedesktop.org,
        linux-mediatek@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Jul 17, 2023 at 4:27=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Sun, Jul 16, 2023 at 3:26=E2=80=AFAM Heiko Stuebner <heiko@sntech.de> =
wrote:
> >
> > Am Freitag, 14. Juli 2023, 19:45:34 CEST schrieb Rob Herring:
> > > The DT of_device.h and of_platform.h date back to the separate
> > > of_platform_bus_type before it as merged into the regular platform bu=
s.
> > > As part of that merge prepping Arm DT support 13 years ago, they
> > > "temporarily" include each other. They also include platform_device.h
> > > and of.h. As a result, there's a pretty much random mix of those incl=
ude
> > > files used throughout the tree. In order to detangle these headers an=
d
> > > replace the implicit includes with struct declarations, users need to
> > > explicitly include the correct includes.
> > >
> > > Signed-off-by: Rob Herring <robh@kernel.org>
> > > ---
> >
> > [...]
> >
> > > diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/driver=
s/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> > > index 917e79951aac..2744d8f4a6fa 100644
> > > --- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> > > +++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> > > @@ -12,7 +12,9 @@
> > >  #include <linux/mfd/syscon.h>
> > >  #include <linux/module.h>
> > >  #include <linux/of_device.h>
> > > +#include <linux/of_platform.h>
> > >  #include <linux/phy/phy.h>
> > > +#include <linux/platform_device.h>
> > >  #include <linux/pm_runtime.h>
> > >  #include <linux/regmap.h>
> >
> > I'm not sure if I'm just misreading something, but in all other places
> > of_device.h gets removed while here is stays as an include. Is this
> > correct this way?
>
> Yes, because of_match_device() is used.
>
> Rob
>

For drivers/gpu/drm/bridge/

Acked-by: Robert Foss <rfoss@kernel.org>
