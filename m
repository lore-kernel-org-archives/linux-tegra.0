Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E46F6EB64DC
	for <linux-tegra@archiver.kernel.org>; Fri, 14 Jul 2023 15:57:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235470AbjGNP5Q (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 14 Jul 2023 11:57:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229943AbjGNP5P (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 14 Jul 2023 11:57:15 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34CE330F8
        for <linux-tegra@vger.kernel.org>; Fri, 14 Jul 2023 08:57:14 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-992b27e1c55so267581666b.2
        for <linux-tegra@vger.kernel.org>; Fri, 14 Jul 2023 08:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689350232; x=1691942232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PjfU7A8+zMWROepAmHvqUQaf89QkGELk+WYBvrX4LEc=;
        b=LLhbPaEvjO8tDvUoDB0FtxH0JimQsoSlDzSfrvVpwjkI5Nq1mPrPfFOpXRM00Ufh+P
         H1aoSdUIrT8nummA6t135/MVT5GnS8mSWP2h7TEZIe1o7hcQUquEnCUH2Is8Kvtv2oA0
         J6ZQprpB0ABRf+UpdYa8PzYD+2gDehb68TnALVpCJLAS3mqXDurGUTJhL/xG895OnLZP
         UXSucFfumGz+ooxX1gYsmN22H64Qe0cxAEtCTabrxM4JkgS9yhfpzGOxio2ODvXIN4vb
         9uRYpxSsFyKSNCGin6pc3x1WHFtwgGDip7jblRRjguMCoeXw3Kfo6Zc+s6fVP3aO0+AJ
         rvOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689350232; x=1691942232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PjfU7A8+zMWROepAmHvqUQaf89QkGELk+WYBvrX4LEc=;
        b=XPLgbtUHkYhHaK51suxhNLDCWEMGyiItqHELuHQbMJMWc488KikePXAWOm5PRdYi24
         X86OfHXlbovgLS82VnJo0BI6BeZWbuy79klSqHh7/gpv3wKvBseN1oX+J5qizdx+GwEz
         +mCt0GghCGkJ2A1S1Z8uyr4jOrI+gw3IZrF1+aNisNp/75DDCp31+VGdcLQ0Wj0rg4rC
         359+VSPQjZd9he8wMVfDV23y/0EEn5fWSL7nHRPheOuvYkOQMNkEHTAYEP93ULblkjh/
         LR4PJLkzzx3rWwLNZhlj5c7r91E8Oy08Y+G1XJG9nwF6pceDODCu1QHuZW7HGdN4/W6J
         Mv+g==
X-Gm-Message-State: ABy/qLYxTUM2WMHm0te0P4oODAFII19+/dI4itqogCSnQ7Cta+PSD4kS
        tzMUNx2D4nxLN6YCCIqjCbZkclDN8pDzEpTk3Qw=
X-Google-Smtp-Source: APBJJlED3nBNoH+UF/wWAUstRcU7dz38nU+0C80W4VoHzZeLEgJUI91ucAwWcz8rM14YI5cGWqAg0TS6LG3xPSfZrHM=
X-Received: by 2002:a17:906:73cb:b0:982:2586:f85 with SMTP id
 n11-20020a17090673cb00b0098225860f85mr4369622ejl.65.1689350232418; Fri, 14
 Jul 2023 08:57:12 -0700 (PDT)
MIME-Version: 1.0
References: <ZLFd_L_Uw1PmpSep@orome> <CAPVz0n3fj77JEzJbYve9-5pjjVt+yJHNcFGqJr0HFSJnaOtbzw@mail.gmail.com>
 <ZLFmxuVuO2FWy1as@orome>
In-Reply-To: <ZLFmxuVuO2FWy1as@orome>
From:   Svyatoslav Ryhel <clamor95@gmail.com>
Date:   Fri, 14 Jul 2023 18:57:01 +0300
Message-ID: <CAPVz0n0sYJvKJRmwBRpp_aUx7HbgbcLnkAJAV82XryHVeeYcHA@mail.gmail.com>
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

=D0=BF=D1=82, 14 =D0=BB=D0=B8=D0=BF. 2023=E2=80=AF=D1=80. =D0=BE 18:16 Thie=
rry Reding <thierry.reding@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Fri, Jul 14, 2023 at 06:00:43PM +0300, Svyatoslav Ryhel wrote:
> > =D0=BF=D1=82, 14 =D0=BB=D0=B8=D0=BF. 2023=E2=80=AF=D1=80. =D0=BE 17:38 =
Thierry Reding <thierry.reding@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > Hi everyone,
> > >
> > > I've been working on converting all Tegra-related device tree binding=
s
> > > to json-schema so that eventually we can fully validate device tree
> > > files. Getting all the bindings reviewed and merged has been slow, bu=
t
> > > I have a local tree where pretty much all validation errors and warni=
ngs
> > > have been fixed. The remaining warnings that I'm not sure how to reso=
lve
> > > are these:
> > >
> > >     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dtb: d=
isplay-panel: compatible:0: 'panel-lvds' is not one of ['auo,b101ew05', 'tb=
s,a711-panel']
> > >         from schema $id: http://devicetree.org/schemas/display/panel/=
panel-lvds.yaml#
> > >     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dtb: d=
isplay-panel: compatible: ['panel-lvds'] is too short
> > >         from schema $id: http://devicetree.org/schemas/display/panel/=
panel-lvds.yaml#
> > >     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dtb: d=
isplay-panel: Unevaluated properties are not allowed ('compatible' was unex=
pected)
> > >         from schema $id: http://devicetree.org/schemas/display/panel/=
panel-lvds.yaml#
> > >     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: d=
isplay-panel: compatible:0: 'panel-lvds' is not one of ['auo,b101ew05', 'tb=
s,a711-panel']
> > >         from schema $id: http://devicetree.org/schemas/display/panel/=
panel-lvds.yaml#
> > >     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: d=
isplay-panel: compatible: ['panel-lvds'] is too short
> > >         from schema $id: http://devicetree.org/schemas/display/panel/=
panel-lvds.yaml#
> > >     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: d=
isplay-panel: Unevaluated properties are not allowed ('compatible' was unex=
pected)
> > >         from schema $id: http://devicetree.org/schemas/display/panel/=
panel-lvds.yaml#
> > >     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dtb: d=
isplay-panel: compatible:0: 'panel-lvds' is not one of ['auo,b101ew05', 'tb=
s,a711-panel']
> > >         from schema $id: http://devicetree.org/schemas/display/panel/=
panel-lvds.yaml#
> > >     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dtb: d=
isplay-panel: compatible: ['panel-lvds'] is too short
> > >         from schema $id: http://devicetree.org/schemas/display/panel/=
panel-lvds.yaml#
> > >     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dtb: d=
isplay-panel: Unevaluated properties are not allowed ('compatible' was unex=
pected)
> > >         from schema $id: http://devicetree.org/schemas/display/panel/=
panel-lvds.yaml#
> > >     arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dtb: display-pa=
nel: compatible:0: 'panel-lvds' is not one of ['auo,b101ew05', 'tbs,a711-pa=
nel']
> > >         from schema $id: http://devicetree.org/schemas/display/panel/=
panel-lvds.yaml#
> > >     arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dtb: display-pa=
nel: compatible: ['panel-lvds'] is too short
> > >         from schema $id: http://devicetree.org/schemas/display/panel/=
panel-lvds.yaml#
> > >     arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dtb: display-pa=
nel: Unevaluated properties are not allowed ('compatible' was unexpected)
> > >         from schema $id: http://devicetree.org/schemas/display/panel/=
panel-lvds.yaml#
> >
> > Hello Thierry! Pegatron Chagall uses a Hannstar similar to one used in
> > ASUS TF201 but unfortunately it is not compatible with existing simple
> > panel setup (blurry image if used). My assumption is that chagall as
> > different revision of this panel like HSD101PWW3-B00 or
> > HSD101PWW1-A00 which is more likely or panel is highly modified which
> > is unlikely. I propose to use "hannstar,hsd101pww1" which is more wide
> > spread.
>
> Interesting. So is the problem the HSD101PWW2 timings that are off, or
> is it because the panel-lvds code does something special to make this
> blurry image go away?
>
timings are different

> Thierry
