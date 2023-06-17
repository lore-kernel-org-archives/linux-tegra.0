Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E84EFEB64D9
	for <linux-tegra@archiver.kernel.org>; Sat, 17 Jun 2023 18:05:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbjFQSFe (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 17 Jun 2023 14:05:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjFQSFd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 17 Jun 2023 14:05:33 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80B1B1732
        for <linux-tegra@vger.kernel.org>; Sat, 17 Jun 2023 11:05:31 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-982acf0a4d2so264761566b.3
        for <linux-tegra@vger.kernel.org>; Sat, 17 Jun 2023 11:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1687025129; x=1689617129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sD3IWEzBGQZ8mcTerhCj4o67e1f5v1lsAPNkuhRyMbk=;
        b=Vnox8eNsc3z1h0i7Qz6zo8ubTeI84nPWZ1G0PcuFLgIDM7TfGGdPvSq1NDXbqK8elo
         a4mBT1PzirGrvJMy0OcM+1hdWSRNggEGS98dc09/UhINUMIvKq9fkM5v0UBKPR1SiHtj
         v5YH9+DiNNCsdA68R9XEvzFRfx/phW5Vnmwd4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687025129; x=1689617129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sD3IWEzBGQZ8mcTerhCj4o67e1f5v1lsAPNkuhRyMbk=;
        b=hk9V19qj2f7wa/3DiFARYQ7GPiJnLCR9EbNHj5pjS6SVkgfhVosjPDxA2J80k31j3z
         WGNE3aNzXoWq01Qqi/cxMB/HPvBkpv4OJ6gKwj9f1QDgiagv8ZJINk6h12d0bordLh1T
         L3QRmzsARGBzZNkj0+tlAngnyG6Et068uXSXr5VHtcPF/0wqw2N9hyiTFZ+PZME3WC4J
         jRbib3ckrOwexEE0S3iBPR7v6UHe5aKlF1P70VlJTgffA4sRn4DKOZWyfMUqGWEb6H+/
         rtWfFbJGU1P6RbguaEXQ59b3ZSJRGtJtldtIT6Ut5Kq+EO32C1KYPrmuNpAFmQSEi5Rv
         FkxA==
X-Gm-Message-State: AC+VfDwFLg7A/omSaOx/jA+x3E8KnfSBvz8Up6REiRbg+766hE/cqT//
        CpSqeY8jtZrJfZvqg8XK9aHKiP8dQAyEknSoRktKwMv2HSE=
X-Google-Smtp-Source: ACHHUZ6lSLWxjjf6zHDd0Y27HMiXrzIz91SdqEnrPfgShgaH5Rk3f1O4/cSs2KqXP1SEMWdxZUxCUA==
X-Received: by 2002:a17:907:2d09:b0:982:66e5:64fc with SMTP id gs9-20020a1709072d0900b0098266e564fcmr5085131ejc.44.1687025129560;
        Sat, 17 Jun 2023 11:05:29 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id u15-20020a170906068f00b009886aaeb722sm25592ejb.137.2023.06.17.11.05.29
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jun 2023 11:05:29 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-516500163b2so3292a12.1
        for <linux-tegra@vger.kernel.org>; Sat, 17 Jun 2023 11:05:29 -0700 (PDT)
X-Received: by 2002:a05:600c:444e:b0:3f4:2736:b5eb with SMTP id
 v14-20020a05600c444e00b003f42736b5ebmr491530wmn.1.1687024655682; Sat, 17 Jun
 2023 10:57:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230601154002.uv2wfatpb7b45duz@pengutronix.de> <CAD=FV=WvP--wJwBQtnSoW_xb57R1Wf9dH0XzWxe+NorczXfeAw@mail.gmail.com>
 <20230617161222.wy55pbomnrrlfy5u@pengutronix.de>
In-Reply-To: <20230617161222.wy55pbomnrrlfy5u@pengutronix.de>
From:   Doug Anderson <dianders@chromium.org>
Date:   Sat, 17 Jun 2023 10:57:23 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U5gbMUNteyyFcTvHVBDWzfthM0aDirJC+yXGovDwMOBA@mail.gmail.com>
Message-ID: <CAD=FV=U5gbMUNteyyFcTvHVBDWzfthM0aDirJC+yXGovDwMOBA@mail.gmail.com>
Subject: Re: patches dropped from drm-misc-next [Was: Re: [PATCH 00/53] drm:
 Convert to platform remove callback returning] void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        dri-devel@lists.freedesktop.org,
        Russell King <linux@armlinux.org.uk>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Steven Price <steven.price@arm.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
        Karol Herbst <kherbst@redhat.com>,
        Samuel Holland <samuel@sholland.org>,
        Kevin Hilman <khilman@baylibre.com>,
        =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Danilo Krummrich <dakr@redhat.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Miaoqian Lin <linmq006@gmail.com>, linux-sunxi@lists.linux.dev,
        Rahul T R <r-ravikumar@ti.com>,
        Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Jani Nikula <jani.nikula@intel.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        etnaviv@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
        Inki Dae <inki.dae@samsung.com>, Sean Paul <sean@poorly.run>,
        Johan Hovold <johan+linaro@kernel.org>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Jingoo Han <jingoohan1@gmail.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
        kernel@pengutronix.de, Alex Deucher <alexander.deucher@amd.com>,
        freedreno@lists.freedesktop.org,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-aspeed@lists.ozlabs.org,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        John Stultz <jstultz@google.com>,
        Mihail Atanassov <mihail.atanassov@arm.com>,
        Liang He <windhl@126.com>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        lima@lists.freedesktop.org, Chunyan Zhang <zhang.lyra@gmail.com>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Minghao Chi <chi.minghao@zte.com.cn>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-rockchip@lists.infradead.org,
        Ben Skeggs <bskeggs@redhat.com>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Liu Ying <victor.liu@nxp.com>, linux-arm-msm@vger.kernel.org,
        Maxime Ripard <mripard@kernel.org>,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Sandy Huang <hjc@rock-chips.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Brian Starkey <brian.starkey@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Yuan Can <yuancan@huawei.com>, Stefan Agner <stefan@agner.ch>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-tegra@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh@kernel.org>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Mali DP Maintainers <malidp@foss.arm.com>,
        Joel Stanley <joel@jms.id.au>, nouveau@lists.freedesktop.org,
        Orson Zhai <orsonzhai@gmail.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Lyude Paul <lyude@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
        Guo Zhengkui <guozhengkui@vivo.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Alison Wang <alison.wang@nxp.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Liu Shixin <liushixin2@huawei.com>,
        Tomi Valkeinen <tomba@kernel.org>,
        Deepak R Varma <drv@mailo.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Tian Tao <tiantao6@hisilicon.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        Emma Anholt <emma@anholt.net>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
        David Airlie <airlied@gmail.com>, Marek Vasut <marex@denx.de>,
        linux-renesas-soc@vger.kernel.org,
        Yongqin Liu <yongqin.liu@linaro.org>,
        Jayshri Pawar <jpawar@cadence.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Rob Clark <robdclark@gmail.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Melissa Wen <mwen@igalia.com>,
        linux-mediatek@lists.infradead.org,
        Fabio Estevam <festevam@gmail.com>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Qiang Yu <yuq825@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Lucas Stach <l.stach@pengutronix.de>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Karol Wachowski <karol.wachowski@linux.intel.com>,
        Laura Nao <laura.nao@collabora.com>,
        Wang Jianzheng <wangjianzheng@vivo.com>,
        Raymond Tan <raymond.tan@intel.com>,
        Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi,

On Sat, Jun 17, 2023 at 9:15=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> [expanding recipents by the other affected persons]
>
> On Thu, Jun 08, 2023 at 09:08:15AM -0700, Doug Anderson wrote:
> > On Thu, Jun 1, 2023 at 8:40=E2=80=AFAM Uwe Kleine-K=C3=B6nig
> > <u.kleine-koenig@pengutronix.de> wrote:
> > >
> > > Hello,
> > >
> > > On Sun, May 07, 2023 at 06:25:23PM +0200, Uwe Kleine-K=C3=B6nig wrote=
:
> > > > this patch series adapts the platform drivers below drivers/gpu/drm
> > > > to use the .remove_new() callback. Compared to the traditional .rem=
ove()
> > > > callback .remove_new() returns no value. This is a good thing becau=
se
> > > > the driver core doesn't (and cannot) cope for errors during remove.=
 The
> > > > only effect of a non-zero return value in .remove() is that the dri=
ver
> > > > core emits a warning. The device is removed anyhow and an early ret=
urn
> > > > from .remove() usually yields a resource leak.
> > > >
> > > > By changing the remove callback to return void driver authors canno=
t
> > > > reasonably (but wrongly) assume any more that there happens some ki=
nd of
> > > > cleanup later.
> > >
> > > I wonder if someone would volunteer to add the whole series to
> > > drm-misc-next?!
> >
> > It looks as if Neil applied quite a few of them already, so I looked
> > at what was left...
> >
> > I'm a little hesitant to just apply the whole kit-and-caboodle to
> > drm-misc-next since there are specific DRM trees for a bunch of them
> > and it would be better if they landed there. ...so I went through all
> > the patches that still applied to drm-misc-next, then used
> > 'scripts/get_maintainer.pl --scm' to check if they were maintained
> > through drm-misc. That still left quite a few patches. I've applied
> > those ones and pushed to drm-misc-next:
> >
> > 71722685cd17 drm/xlnx/zynqmp_dpsub: Convert to platform remove
> > callback returning void
> > 1ed54a19f3b3 drm/vc4: Convert to platform remove callback returning voi=
d
> > b957812839f8 drm/v3d: Convert to platform remove callback returning voi=
d
> > e2fd3192e267 drm/tve200: Convert to platform remove callback returning =
void
> > 84e6da7ad553 drm/tiny: Convert to platform remove callback returning vo=
id
> > 34cdd1f691ad drm/tidss: Convert to platform remove callback returning v=
oid
> > d665e3c9d37a drm/sun4i: Convert to platform remove callback returning v=
oid
> > 0c259ab19146 drm/stm: Convert to platform remove callback returning voi=
d
> > 9a865e45884a drm/sti: Convert to platform remove callback returning voi=
d
> > 3c855610840e drm/rockchip: Convert to platform remove callback returnin=
g void
> > e41977a83b71 drm/panfrost: Convert to platform remove callback returnin=
g void
> > cef3776d0b5a drm/panel: Convert to platform remove callback returning v=
oid
> > bd296a594e87 drm/mxsfb: Convert to platform remove callback returning v=
oid
> > 38ca2d93d323 drm/meson: Convert to platform remove callback returning v=
oid
> > fd1457d84bae drm/mcde: Convert to platform remove callback returning vo=
id
> > 41a56a18615c drm/logicvc: Convert to platform remove callback returning=
 void
> > 980ec6444372 drm/lima: Convert to platform remove callback returning vo=
id
> > 82a2c0cc1a22 drm/hisilicon: Convert to platform remove callback returni=
ng void
> > c3b28b29ac0a drm/fsl-dcu: Convert to platform remove callback returning=
 void
> > a118fc6e71f9 drm/atmel-hlcdc: Convert to platform remove callback retur=
ning void
> > 9a32dd324c46 drm/aspeed: Convert to platform remove callback returning =
void
> > 2c7d291c498c drm/arm/malidp: Convert to platform remove callback return=
ing void
> > a920028df679 drm/arm/hdlcd: Convert to platform remove callback returni=
ng void
> > 1bf3d76a7d15 drm/komeda: Convert to platform remove callback returning =
void
>
> Together with the patches that were applied later the topmost commit
> from this series is c2807ecb5290 ("drm/omap: Convert to platform remove
> callback returning void"). This commit was part for the following next
> tags:
>
>         $ git tag -l --contains c2807ecb5290
>         next-20230609
>         next-20230613
>         next-20230614
>         next-20230615
>
> However in next-20230616 they are missing. In next-20230616
> drm-misc/for-linux-next was cf683e8870bd4be0fd6b98639286700a35088660.
> Compared to c2807ecb5290 this adds 1149 patches but drops 37 (that are
> also not included with a different commit id). The 37 patches dropped
> are 13cdd12a9f934158f4ec817cf048fcb4384aa9dc..c2807ecb5290:
>
>         $ git shortlog -s 13cdd12a9f934158f4ec817cf048fcb4384aa9dc..c2807=
ecb5290
>              1  Christophe JAILLET
>              2  Jessica Zhang
>              5  Karol Wachowski
>              1  Laura Nao
>             27  Uwe Kleine-K=C3=B6nig
>              1  Wang Jianzheng
>
>
> I guess this was done by mistake because nobody told me about dropping
> my/these patches? Can c2807ecb5290 please be merged into drm-misc-next
> again?

Actually, it was probably a mistake that these patches got merged to
linuxnext during the 4 days that you noticed. However, your patches
aren't dropped and are still present in drm-misc-next.

drm-misc has a bit of a unique model and it's documented fairly well here:

https://drm.pages.freedesktop.org/maintainer-tools/drm-misc.html

The key is that committers can commit to drm-misc-next _at any time_
regardless of the merge window. The drm-misc merge strategy makes this
OK. Specifically, when it's late in the linux cycle then drm-misc-next
is supposed to stop merging to linuxnext. Then, shortly after the
merge window closes, patches will start flowing again.

So basically your patches are landed and should even keep the same git
hashes when they eventually make it to Linux. They just won't land for
another release cycle of Linux.

Hope that makes sense!

-Doug
