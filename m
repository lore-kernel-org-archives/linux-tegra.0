Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0C4DEB64DC
	for <linux-tegra@archiver.kernel.org>; Mon, 17 Jul 2023 08:09:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229820AbjGQIJV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 17 Jul 2023 04:09:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbjGQIJU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 17 Jul 2023 04:09:20 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6220198E
        for <linux-tegra@vger.kernel.org>; Mon, 17 Jul 2023 01:08:55 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-991da766865so601486066b.0
        for <linux-tegra@vger.kernel.org>; Mon, 17 Jul 2023 01:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689581334; x=1692173334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ntbgb2QP55qfdtUW2D1ui/1EoqWV4zRwM+5Bw69Rmmo=;
        b=anlJ4Fj1IEAZ7prtwJ/T+iA80jeLBKihKz26GGqr6WPKZP2PfyBJdC37wu2QvYohxc
         joBzDOa/DyrxZ1Lu3UF0++V17QyYMzzLXNahXtjhoq5tF2Ls9uApARkTLBEwGuKGB9gU
         QOWJh55zOg8mHE/RnCrR0Sr8M0RHAO8NSbQ/GiJ8V6fHYDxoYWD9n3io2mHtdqH3NI+4
         B8j2BTqk6ctfy1EXA2+uaua5vCCRenrp9awWmJGzFbCJctujeTEiLOqPGbbl7F6X9LrU
         gmEBTXU3NCl8b96VypuOoXTtLHfFRFkJJEH0wMAWK15wkUinqSdSqoxNVfLzcydACNRz
         4QAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689581334; x=1692173334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ntbgb2QP55qfdtUW2D1ui/1EoqWV4zRwM+5Bw69Rmmo=;
        b=V2NZEpwZbm8PGJtBlCmDKSnl6bb7qfv8M1HeIWzqMWQXDnlaMaoWEuH0WDLLNuRtAv
         xI5yHj4HwsT3bqHlIMvZJkBPGPlpY8pirj0xcNpktGfOhqV4mLl/L23nKAy6hUeek5Hx
         zIS6oIOpH5jroT2SEIjyDQ9vCsApH0QLVeQltJCPgeEc+WtLcs91r6paSwAlmQDrnal4
         75/Z+Ng4X97bvgyCXeCPiwTFCwGfcjJ7ks1dwQRHVRsMD3AcaLPVm0g2JwO/qFIrt0h5
         VE3/EEG2pECuvlQqkXEWlSs6mtKgEh88qKKZAuvIbJoVU6ljvZFGLOcA/H8DYBDl3fgt
         /dlA==
X-Gm-Message-State: ABy/qLanaL4xIz9Owvp7XhoIeGI4dvIWcB8vQ1+kT0iU57rHWf5mHYss
        jHLSpjhl4oBNlluTNKzwBOREoG/BNqhjqHFxwN8=
X-Google-Smtp-Source: APBJJlHZ4AU6yJwbcDyI2TqMM92uCLTKwcdH4E1kXciAoy11zm3YD+X3OBwlkj/GeExbK4++8plzezyX0LiJmaCXPvU=
X-Received: by 2002:a17:906:19b:b0:994:1844:549c with SMTP id
 27-20020a170906019b00b009941844549cmr10991015ejb.0.1689581333976; Mon, 17 Jul
 2023 01:08:53 -0700 (PDT)
MIME-Version: 1.0
References: <ZLFd_L_Uw1PmpSep@orome> <CAPVz0n3fj77JEzJbYve9-5pjjVt+yJHNcFGqJr0HFSJnaOtbzw@mail.gmail.com>
 <ZLFmxuVuO2FWy1as@orome> <CAPVz0n0sYJvKJRmwBRpp_aUx7HbgbcLnkAJAV82XryHVeeYcHA@mail.gmail.com>
 <ZLTq3KXeV-tT_HFG@orome>
In-Reply-To: <ZLTq3KXeV-tT_HFG@orome>
From:   Svyatoslav Ryhel <clamor95@gmail.com>
Date:   Mon, 17 Jul 2023 11:08:42 +0300
Message-ID: <CAPVz0n2_NVN0pNEp76cNqVvHTmVV4wOrn8ORJcApci-cK9BaDw@mail.gmail.com>
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

=D0=BF=D0=BD, 17 =D0=BB=D0=B8=D0=BF. 2023=E2=80=AF=D1=80. =D0=BE 10:16 Thie=
rry Reding <thierry.reding@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Fri, Jul 14, 2023 at 06:57:01PM +0300, Svyatoslav Ryhel wrote:
> > =D0=BF=D1=82, 14 =D0=BB=D0=B8=D0=BF. 2023=E2=80=AF=D1=80. =D0=BE 18:16 =
Thierry Reding <thierry.reding@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Fri, Jul 14, 2023 at 06:00:43PM +0300, Svyatoslav Ryhel wrote:
> > > > =D0=BF=D1=82, 14 =D0=BB=D0=B8=D0=BF. 2023=E2=80=AF=D1=80. =D0=BE 17=
:38 Thierry Reding <thierry.reding@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > > >
> > > > > Hi everyone,
> > > > >
> > > > > I've been working on converting all Tegra-related device tree bin=
dings
> > > > > to json-schema so that eventually we can fully validate device tr=
ee
> > > > > files. Getting all the bindings reviewed and merged has been slow=
, but
> > > > > I have a local tree where pretty much all validation errors and w=
arnings
> > > > > have been fixed. The remaining warnings that I'm not sure how to =
resolve
> > > > > are these:
> > > > >
> > > > >     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dt=
b: display-panel: compatible:0: 'panel-lvds' is not one of ['auo,b101ew05',=
 'tbs,a711-panel']
> > > > >         from schema $id: http://devicetree.org/schemas/display/pa=
nel/panel-lvds.yaml#
> > > > >     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dt=
b: display-panel: compatible: ['panel-lvds'] is too short
> > > > >         from schema $id: http://devicetree.org/schemas/display/pa=
nel/panel-lvds.yaml#
> > > > >     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dt=
b: display-panel: Unevaluated properties are not allowed ('compatible' was =
unexpected)
> > > > >         from schema $id: http://devicetree.org/schemas/display/pa=
nel/panel-lvds.yaml#
> > > > >     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dt=
b: display-panel: compatible:0: 'panel-lvds' is not one of ['auo,b101ew05',=
 'tbs,a711-panel']
> > > > >         from schema $id: http://devicetree.org/schemas/display/pa=
nel/panel-lvds.yaml#
> > > > >     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dt=
b: display-panel: compatible: ['panel-lvds'] is too short
> > > > >         from schema $id: http://devicetree.org/schemas/display/pa=
nel/panel-lvds.yaml#
> > > > >     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dt=
b: display-panel: Unevaluated properties are not allowed ('compatible' was =
unexpected)
> > > > >         from schema $id: http://devicetree.org/schemas/display/pa=
nel/panel-lvds.yaml#
> > > > >     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dt=
b: display-panel: compatible:0: 'panel-lvds' is not one of ['auo,b101ew05',=
 'tbs,a711-panel']
> > > > >         from schema $id: http://devicetree.org/schemas/display/pa=
nel/panel-lvds.yaml#
> > > > >     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dt=
b: display-panel: compatible: ['panel-lvds'] is too short
> > > > >         from schema $id: http://devicetree.org/schemas/display/pa=
nel/panel-lvds.yaml#
> > > > >     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dt=
b: display-panel: Unevaluated properties are not allowed ('compatible' was =
unexpected)
> > > > >         from schema $id: http://devicetree.org/schemas/display/pa=
nel/panel-lvds.yaml#
> > > > >     arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dtb: displa=
y-panel: compatible:0: 'panel-lvds' is not one of ['auo,b101ew05', 'tbs,a71=
1-panel']
> > > > >         from schema $id: http://devicetree.org/schemas/display/pa=
nel/panel-lvds.yaml#
> > > > >     arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dtb: displa=
y-panel: compatible: ['panel-lvds'] is too short
> > > > >         from schema $id: http://devicetree.org/schemas/display/pa=
nel/panel-lvds.yaml#
> > > > >     arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dtb: displa=
y-panel: Unevaluated properties are not allowed ('compatible' was unexpecte=
d)
> > > > >         from schema $id: http://devicetree.org/schemas/display/pa=
nel/panel-lvds.yaml#
> > > >
> > > > Hello Thierry! Pegatron Chagall uses a Hannstar similar to one used=
 in
> > > > ASUS TF201 but unfortunately it is not compatible with existing sim=
ple
> > > > panel setup (blurry image if used). My assumption is that chagall a=
s
> > > > different revision of this panel like HSD101PWW3-B00 or
> > > > HSD101PWW1-A00 which is more likely or panel is highly modified whi=
ch
> > > > is unlikely. I propose to use "hannstar,hsd101pww1" which is more w=
ide
> > > > spread.
> > >
> > > Interesting. So is the problem the HSD101PWW2 timings that are off, o=
r
> > > is it because the panel-lvds code does something special to make this
> > > blurry image go away?
> > >
> > timings are different
>
> For cases where the timings are the only things that differ, the DT
> bindings allow overriding the timings specifically. So you might get
> away with using one of the existing panels if it is close enough and
> patch up the timings in DT.
>
> Comparing what you've got for Chagall, the porches exceed what the
> HSD101PWW2 allows, but the timing values in the simple-panel driver look
> a little arbitrary, to be honest, so I think those could be extended.
> Looking at a datasheet that I found online, it's very unspecific about
> the porch lengths since it only mentions minimum, typical and maximum
> values for the total frame blanking times:
>
>         vertical: 3, 23, 223
>         horizontal: 54, 160, 681
>
> So I think we can be more generous in how these are split up. So we
> could for example do this:
>
> --- >8 ---
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel=
/panel-simple.c
> index 18dc251749fb..b2fb7943f2ed 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -2108,13 +2108,13 @@ static const struct panel_desc hannstar_hsd100pxn=
1 =3D {
>  static const struct display_timing hannstar_hsd101pww2_timing =3D {
>         .pixelclock =3D { 64300000, 71100000, 82000000 },
>         .hactive =3D { 1280, 1280, 1280 },
> -       .hfront_porch =3D { 1, 1, 10 },
> -       .hback_porch =3D { 1, 1, 10 },
> -       .hsync_len =3D { 58, 158, 661 },
> +       .hfront_porch =3D { 1, 1, 64 },
> +       .hback_porch =3D { 1, 1, 64 },
> +       .hsync_len =3D { 58, 158, 553 },
>         .vactive =3D { 800, 800, 800 },
> -       .vfront_porch =3D { 1, 1, 10 },
> -       .vback_porch =3D { 1, 1, 10 },
> -       .vsync_len =3D { 1, 21, 203 },
> +       .vfront_porch =3D { 1, 1, 32 },
> +       .vback_porch =3D { 1, 1, 32 },
> +       .vsync_len =3D { 1, 21, 159 },
>         .flags =3D DISPLAY_FLAGS_DE_HIGH,
>  };
>
> --- >8 ---
>
> And then we could move the compatible string from simple to LVDS:
>
> --- >8 ---
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.y=
aml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> index 929fe046d1e7..344e5df40c2f 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> @@ -40,6 +40,8 @@ properties:
>      items:
>        - enum:
>            - auo,b101ew05
> +          # HannStar Display Corp. HSD101PWW2 10.1" WXGA (1280x800) LVDS=
 panel
> +          - hannstar,hsd101pww2
>            - tbs,a711-panel
>
>        - const: panel-lvds
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple=
.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index df1cec8fd21b..f4d9da4afefd 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -168,8 +168,6 @@ properties:
>        - hannstar,hsd070pww1
>          # HannStar Display Corp. HSD100PXN1 10.1" XGA LVDS panel
>        - hannstar,hsd100pxn1
> -        # HannStar Display Corp. HSD101PWW2 10.1" WXGA (1280x800) LVDS p=
anel
> -      - hannstar,hsd101pww2
>          # Hitachi Ltd. Corporation 9" WVGA (800x480) TFT LCD panel
>        - hit,tx23d38vm0caa
>          # InfoVision Optoelectronics M133NWF4 R0 13.3" FHD (1920x1080) T=
FT LCD panel
> diff --git a/arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dts b/arch=
/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dts
> index c81d5875c31c..4012f9c799a8 100644
> --- a/arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dts
> +++ b/arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dts
> @@ -2628,7 +2628,7 @@ cpu3: cpu@3 {
>         };
>
>         display-panel {
> -               compatible =3D "panel-lvds";
> +               compatible =3D "hannstar,hsd101pww2", "panel-lvds";
>
>                 width-mm =3D <217>;
>                 height-mm =3D <136>;
> --- >8 ---
>
> That gets rid of the DT validation warning for me. Would you be able to
> test this on actual hardware? I think the compatible matching would
> result in this matching the simple-panel driver and that does have some
> support for LVDS, but I'm not sure if it's exactly equal to what you get
> with only the panel-lvds matching, which makes this get handled by the
> panel-lvds driver.
>
> I'm attaching the full patch to make it a bit easier to apply this.

I have just tested new timings with my TF201 and can confirm that I see no
regressions for TF201. Testing on Chagall will be nearly impossible because
the owner of Chagall does not have it in reach and will not be able to
test it in
the next few months.

As for now I see no downsides of this patch for both Chagall and TF201.
Chagall will substitute its own timings and TF201 is confirmed to work fine=
.

Best Regards,
Svyatoslav R.

> Thierry
