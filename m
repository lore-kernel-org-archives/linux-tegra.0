Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4587EB64DC
	for <linux-tegra@archiver.kernel.org>; Fri, 14 Jul 2023 15:00:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235407AbjGNPA7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 14 Jul 2023 11:00:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229943AbjGNPA6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 14 Jul 2023 11:00:58 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D14111BD4
        for <linux-tegra@vger.kernel.org>; Fri, 14 Jul 2023 08:00:56 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-98df3dea907so260286466b.3
        for <linux-tegra@vger.kernel.org>; Fri, 14 Jul 2023 08:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689346855; x=1691938855;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9uOrVwHr7OQS9p4ayO3nVYA0C95WLl/kvfNm4fKN/rE=;
        b=sm7Ntlzod2OijN+YIzWc5pOk+BaEaFB4UhQjT9gmdbpOLcL9O4c8xTE0bTyHe0PMX4
         g+g+psGO5Bats2152YWrQs0vu17OCi3/0+5X93idK7oJqd4KmMoGbN1YUF+AsIp7kibs
         Z3M96RNC4K+SAlAn14TPqzwWMP7zd4S9lSvn8Y9mYaiB1HGCejEKnq4DEe8dYAJ0lh6n
         RZmkjPv9jkJ0iBPobaALfv4OiXDTrbsThjH6iChseEHwYF6cdXcV72R1kvzkzneQUuHB
         9zjC3+TpD3cUTkTubQXiNHmTxdK+VZ+oKpDp+x/JLgvpw0v7zjmiLTNrI2iqvSUpeLNx
         bZ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689346855; x=1691938855;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9uOrVwHr7OQS9p4ayO3nVYA0C95WLl/kvfNm4fKN/rE=;
        b=C6lP5TwAQijgdfAA/XZhjsIFxpR+bWI34EITQvqqXsq0Ircg1uk11yhn+/bklIygL+
         6hLjEV7d9cGCUQNfC+ZU0r9pxwWmw9D3hv4euUHvSjbo6gTh6H+jwqY10XIl8bHYri4N
         CWso8gA94OBcPXJ1CgT3smPnGxQS0GXL//ed23phgVcxpH1RLMGN5BnLssQ7sXAgRAlC
         q4666w2y+rLPQYfnbknZc1WUXGnQz1X/ugiloXACWI57iu5275FgaXGF0pnBLJdzSsGa
         jCxFbvxqq+NIz1JyCW2Nlt4sYKZNp6waSwRmer/h+q9fO2842jZS+VFM+Hx0jsSC2lFx
         yO5g==
X-Gm-Message-State: ABy/qLZWSidnEvr/iq3g1vnYC9HvWA4TimHdwU00ausHPWB0CEPpYgZR
        Z6ckFjLOv9WyW/E3Yxnt9IwnFUlXQUr0I2k4ehQ=
X-Google-Smtp-Source: APBJJlG5snDPttJ67VsvKkXJ12sl/Ix4krta+TI3a121onLx590ZhDLFmv0Pl8ROqR+TGLzH81afCq9SSBG+NYxn/s0=
X-Received: by 2002:a17:906:3914:b0:993:f081:2c5b with SMTP id
 f20-20020a170906391400b00993f0812c5bmr3812370eje.11.1689346855022; Fri, 14
 Jul 2023 08:00:55 -0700 (PDT)
MIME-Version: 1.0
References: <ZLFd_L_Uw1PmpSep@orome>
In-Reply-To: <ZLFd_L_Uw1PmpSep@orome>
From:   Svyatoslav Ryhel <clamor95@gmail.com>
Date:   Fri, 14 Jul 2023 18:00:43 +0300
Message-ID: <CAPVz0n3fj77JEzJbYve9-5pjjVt+yJHNcFGqJr0HFSJnaOtbzw@mail.gmail.com>
Subject: Re: LVDS panel compatible strings
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        David Heidelberg <david@ixit.cz>,
        Raffaele Tranquillini <raffaele.tranquillini@gmail.com>,
        Ion Agorria <ion@agorria.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        =?UTF-8?Q?Pedro_=C3=82ngelo?= <pangelo@void.io>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Zack Pearsall <zpearsall@yahoo.com>,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

=D0=BF=D1=82, 14 =D0=BB=D0=B8=D0=BF. 2023=E2=80=AF=D1=80. =D0=BE 17:38 Thie=
rry Reding <thierry.reding@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi everyone,
>
> I've been working on converting all Tegra-related device tree bindings
> to json-schema so that eventually we can fully validate device tree
> files. Getting all the bindings reviewed and merged has been slow, but
> I have a local tree where pretty much all validation errors and warnings
> have been fixed. The remaining warnings that I'm not sure how to resolve
> are these:
>
>     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dtb: displ=
ay-panel: compatible:0: 'panel-lvds' is not one of ['auo,b101ew05', 'tbs,a7=
11-panel']
>         from schema $id: http://devicetree.org/schemas/display/panel/pane=
l-lvds.yaml#
>     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dtb: displ=
ay-panel: compatible: ['panel-lvds'] is too short
>         from schema $id: http://devicetree.org/schemas/display/panel/pane=
l-lvds.yaml#
>     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dtb: displ=
ay-panel: Unevaluated properties are not allowed ('compatible' was unexpect=
ed)
>         from schema $id: http://devicetree.org/schemas/display/panel/pane=
l-lvds.yaml#
>     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: displ=
ay-panel: compatible:0: 'panel-lvds' is not one of ['auo,b101ew05', 'tbs,a7=
11-panel']
>         from schema $id: http://devicetree.org/schemas/display/panel/pane=
l-lvds.yaml#
>     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: displ=
ay-panel: compatible: ['panel-lvds'] is too short
>         from schema $id: http://devicetree.org/schemas/display/panel/pane=
l-lvds.yaml#
>     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: displ=
ay-panel: Unevaluated properties are not allowed ('compatible' was unexpect=
ed)
>         from schema $id: http://devicetree.org/schemas/display/panel/pane=
l-lvds.yaml#
>     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dtb: displ=
ay-panel: compatible:0: 'panel-lvds' is not one of ['auo,b101ew05', 'tbs,a7=
11-panel']
>         from schema $id: http://devicetree.org/schemas/display/panel/pane=
l-lvds.yaml#
>     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dtb: displ=
ay-panel: compatible: ['panel-lvds'] is too short
>         from schema $id: http://devicetree.org/schemas/display/panel/pane=
l-lvds.yaml#
>     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dtb: displ=
ay-panel: Unevaluated properties are not allowed ('compatible' was unexpect=
ed)
>         from schema $id: http://devicetree.org/schemas/display/panel/pane=
l-lvds.yaml#
>     arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dtb: display-panel:=
 compatible:0: 'panel-lvds' is not one of ['auo,b101ew05', 'tbs,a711-panel'=
]
>         from schema $id: http://devicetree.org/schemas/display/panel/pane=
l-lvds.yaml#
>     arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dtb: display-panel:=
 compatible: ['panel-lvds'] is too short
>         from schema $id: http://devicetree.org/schemas/display/panel/pane=
l-lvds.yaml#
>     arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dtb: display-panel:=
 Unevaluated properties are not allowed ('compatible' was unexpected)
>         from schema $id: http://devicetree.org/schemas/display/panel/pane=
l-lvds.yaml#

Hello Thierry! Pegatron Chagall uses a Hannstar similar to one used in
ASUS TF201 but unfortunately it is not compatible with existing simple
panel setup (blurry image if used). My assumption is that chagall as
different revision of this panel like HSD101PWW3-B00 or
HSD101PWW1-A00 which is more likely or panel is highly modified which
is unlikely. I propose to use "hannstar,hsd101pww1" which is more wide
spread.

Best regards,
Svyatoslav R.

>
> The reason for these is that the device tree files use:
>
>         compatible =3D "panel-lvds";
>
> but that's not valid as per the bindings. So what we really want is a
> specific compatible string that specifies the exact panel that each of
> these devices uses in addition to the "panel-lvds" fallback. Do you guys
> have information about these that could help fix up the DT files?
>
> Thanks,
> Thierry
