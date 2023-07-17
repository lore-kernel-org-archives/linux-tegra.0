Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3A3EEB64DC
	for <linux-tegra@archiver.kernel.org>; Mon, 17 Jul 2023 07:25:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229450AbjGQHZN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 17 Jul 2023 03:25:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230308AbjGQHZL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 17 Jul 2023 03:25:11 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53DF810D7
        for <linux-tegra@vger.kernel.org>; Mon, 17 Jul 2023 00:25:09 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-314417861b9so3772132f8f.0
        for <linux-tegra@vger.kernel.org>; Mon, 17 Jul 2023 00:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689578708; x=1692170708;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=m4lovg3jDREgZYo6CfmIp7e8uOxi2v15aXxLTCXqUjc=;
        b=W7b0Sztlu5a8QxsF41ZMBl7373icg5vRaRk7ZTn1AGCzcAOfMtu6lx9eVcAOcfRXQZ
         flTD8bU84f3zozTf7hd+P6wOvCpAl+J5Xq7iX3zSMpSIepOZnuG4llhQ1WfVb8G8xghJ
         Zft+mYL4+cPuu4jT0vnC26fpRMiLCErQLHAFr6tiUJle7yyVds/fU4Xr9NxTmMMPStaD
         Cfi6rlGkZzpF7tfQORZhi6YRoJ8MB14rZa5sLH2Zqkmt7Jyf8p1wvEh+Xt0zbqEHYTu/
         njHC5Q4ujy+kQnkN787BiBtVUVQu+IsAxQWy/orLLNpdihWgeyk48SKhDTKZfOlCSyQg
         NmKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689578708; x=1692170708;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m4lovg3jDREgZYo6CfmIp7e8uOxi2v15aXxLTCXqUjc=;
        b=MKesYi0cDkZesxymCWY6UHsOOMP7pp2SdwVeOWYwvw2vLGukdNEYAWe1jXXPqH6vwF
         0jakKU7U6ZnRTpnhdPNr7c9+mFsZLlrX1NQu4JPvsNvb5r2zu0zyIUTIM12wb96rVqmj
         DlAiLQoK4fJG7hH4/wIPzJS18XviV5sJL8Qbgt3YUJabZUdfrrDvcvxKaNmY4+WuuVsU
         8g+tt3Uuoj/d1g3NUPh6850Ap9uuvALZ44HRMUGKFDmAx/yoTh8bTpENyyzE6C2hEb89
         e4RFhsI47EUeXP5QjXVRnloR0tZCs/oM9hrZcNDDQEvaRUJ6gGqfn1oSKsvkb/ncruRX
         lQdg==
X-Gm-Message-State: ABy/qLZsJMLd81FpWR+R//YxnUddovFBwa65G6IMyr58pjeBkfAfY3P6
        zapcLLQQh7kKrYwAQDkzQuMLfrpm8cs=
X-Google-Smtp-Source: APBJJlHwsfeBwNJd4LcHL+hQrAWYaYObY396Y9IAOkbdve8WAczZsmGoAL2PiQ4dDesu7wL9KWIxvQ==
X-Received: by 2002:adf:e785:0:b0:314:2ea7:af4a with SMTP id n5-20020adfe785000000b003142ea7af4amr9317180wrm.13.1689578707526;
        Mon, 17 Jul 2023 00:25:07 -0700 (PDT)
Received: from [127.0.0.1] ([46.211.20.33])
        by smtp.gmail.com with ESMTPSA id t4-20020a5d4604000000b00313e59cb371sm18276976wrq.12.2023.07.17.00.25.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 00:25:07 -0700 (PDT)
Date:   Mon, 17 Jul 2023 10:25:04 +0300
From:   Svyatoslav Ryhel <clamor95@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     Dmitry Osipenko <digetx@gmail.com>,
        David Heidelberg <david@ixit.cz>,
        Raffaele Tranquillini <raffaele.tranquillini@gmail.com>,
        Ion Agorria <ion@agorria.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        =?ISO-8859-1?Q?Pedro_=C2ngelo?= <pangelo@void.io>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Zack Pearsall <zpearsall@yahoo.com>,
        linux-tegra@vger.kernel.org
Subject: Re: LVDS panel compatible strings
User-Agent: K-9 Mail for Android
In-Reply-To: <ZLTq3KXeV-tT_HFG@orome>
References: <ZLFd_L_Uw1PmpSep@orome> <CAPVz0n3fj77JEzJbYve9-5pjjVt+yJHNcFGqJr0HFSJnaOtbzw@mail.gmail.com> <ZLFmxuVuO2FWy1as@orome> <CAPVz0n0sYJvKJRmwBRpp_aUx7HbgbcLnkAJAV82XryHVeeYcHA@mail.gmail.com> <ZLTq3KXeV-tT_HFG@orome>
Message-ID: <9C991D16-71A6-4934-AC2C-CD1D722384AD@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



17 =D0=BB=D0=B8=D0=BF=D0=BD=D1=8F 2023 =D1=80=2E 10:16:44 GMT+03:00, Thier=
ry Reding <thierry=2Ereding@gmail=2Ecom> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=
=B0=D0=B2(-=D0=BB=D0=B0):
>On Fri, Jul 14, 2023 at 06:57:01PM +0300, Svyatoslav Ryhel wrote:
>> =D0=BF=D1=82, 14 =D0=BB=D0=B8=D0=BF=2E 2023=E2=80=AF=D1=80=2E =D0=BE 18=
:16 Thierry Reding <thierry=2Ereding@gmail=2Ecom> =D0=BF=D0=B8=D1=88=D0=B5:
>> >
>> > On Fri, Jul 14, 2023 at 06:00:43PM +0300, Svyatoslav Ryhel wrote:
>> > > =D0=BF=D1=82, 14 =D0=BB=D0=B8=D0=BF=2E 2023=E2=80=AF=D1=80=2E =D0=
=BE 17:38 Thierry Reding <thierry=2Ereding@gmail=2Ecom> =D0=BF=D0=B8=D1=88=
=D0=B5:
>> > > >
>> > > > Hi everyone,
>> > > >
>> > > > I've been working on converting all Tegra-related device tree bin=
dings
>> > > > to json-schema so that eventually we can fully validate device tr=
ee
>> > > > files=2E Getting all the bindings reviewed and merged has been sl=
ow, but
>> > > > I have a local tree where pretty much all validation errors and w=
arnings
>> > > > have been fixed=2E The remaining warnings that I'm not sure how t=
o resolve
>> > > > are these:
>> > > >
>> > > >     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565=2E=
dtb: display-panel: compatible:0: 'panel-lvds' is not one of ['auo,b101ew05=
', 'tbs,a711-panel']
>> > > >         from schema $id: http://devicetree=2Eorg/schemas/display/=
panel/panel-lvds=2Eyaml#
>> > > >     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565=2E=
dtb: display-panel: compatible: ['panel-lvds'] is too short
>> > > >         from schema $id: http://devicetree=2Eorg/schemas/display/=
panel/panel-lvds=2Eyaml#
>> > > >     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565=2E=
dtb: display-panel: Unevaluated properties are not allowed ('compatible' wa=
s unexpected)
>> > > >         from schema $id: http://devicetree=2Eorg/schemas/display/=
panel/panel-lvds=2Eyaml#
>> > > >     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565=2E=
dtb: display-panel: compatible:0: 'panel-lvds' is not one of ['auo,b101ew05=
', 'tbs,a711-panel']
>> > > >         from schema $id: http://devicetree=2Eorg/schemas/display/=
panel/panel-lvds=2Eyaml#
>> > > >     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565=2E=
dtb: display-panel: compatible: ['panel-lvds'] is too short
>> > > >         from schema $id: http://devicetree=2Eorg/schemas/display/=
panel/panel-lvds=2Eyaml#
>> > > >     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565=2E=
dtb: display-panel: Unevaluated properties are not allowed ('compatible' wa=
s unexpected)
>> > > >         from schema $id: http://devicetree=2Eorg/schemas/display/=
panel/panel-lvds=2Eyaml#
>> > > >     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269=2E=
dtb: display-panel: compatible:0: 'panel-lvds' is not one of ['auo,b101ew05=
', 'tbs,a711-panel']
>> > > >         from schema $id: http://devicetree=2Eorg/schemas/display/=
panel/panel-lvds=2Eyaml#
>> > > >     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269=2E=
dtb: display-panel: compatible: ['panel-lvds'] is too short
>> > > >         from schema $id: http://devicetree=2Eorg/schemas/display/=
panel/panel-lvds=2Eyaml#
>> > > >     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269=2E=
dtb: display-panel: Unevaluated properties are not allowed ('compatible' wa=
s unexpected)
>> > > >         from schema $id: http://devicetree=2Eorg/schemas/display/=
panel/panel-lvds=2Eyaml#
>> > > >     arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall=2Edtb: disp=
lay-panel: compatible:0: 'panel-lvds' is not one of ['auo,b101ew05', 'tbs,a=
711-panel']
>> > > >         from schema $id: http://devicetree=2Eorg/schemas/display/=
panel/panel-lvds=2Eyaml#
>> > > >     arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall=2Edtb: disp=
lay-panel: compatible: ['panel-lvds'] is too short
>> > > >         from schema $id: http://devicetree=2Eorg/schemas/display/=
panel/panel-lvds=2Eyaml#
>> > > >     arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall=2Edtb: disp=
lay-panel: Unevaluated properties are not allowed ('compatible' was unexpec=
ted)
>> > > >         from schema $id: http://devicetree=2Eorg/schemas/display/=
panel/panel-lvds=2Eyaml#
>> > >
>> > > Hello Thierry! Pegatron Chagall uses a Hannstar similar to one used=
 in
>> > > ASUS TF201 but unfortunately it is not compatible with existing sim=
ple
>> > > panel setup (blurry image if used)=2E My assumption is that chagall=
 as
>> > > different revision of this panel like HSD101PWW3-B00 or
>> > > HSD101PWW1-A00 which is more likely or panel is highly modified whi=
ch
>> > > is unlikely=2E I propose to use "hannstar,hsd101pww1" which is more=
 wide
>> > > spread=2E
>> >
>> > Interesting=2E So is the problem the HSD101PWW2 timings that are off,=
 or
>> > is it because the panel-lvds code does something special to make this
>> > blurry image go away?
>> >
>> timings are different
>
>For cases where the timings are the only things that differ, the DT
>bindings allow overriding the timings specifically=2E So you might get
>away with using one of the existing panels if it is close enough and
>patch up the timings in DT=2E
>
>Comparing what you've got for Chagall, the porches exceed what the
>HSD101PWW2 allows, but the timing values in the simple-panel driver look
>a little arbitrary, to be honest, so I think those could be extended=2E
>Looking at a datasheet that I found online, it's very unspecific about
>the porch lengths since it only mentions minimum, typical and maximum
>values for the total frame blanking times:
>
>	vertical: 3, 23, 223
>	horizontal: 54, 160, 681
>
>So I think we can be more generous in how these are split up=2E So we
>could for example do this:
>
>--- >8 ---
>diff --git a/drivers/gpu/drm/panel/panel-simple=2Ec b/drivers/gpu/drm/pan=
el/panel-simple=2Ec
>index 18dc251749fb=2E=2Eb2fb7943f2ed 100644
>--- a/drivers/gpu/drm/panel/panel-simple=2Ec
>+++ b/drivers/gpu/drm/panel/panel-simple=2Ec
>@@ -2108,13 +2108,13 @@ static const struct panel_desc hannstar_hsd100pxn=
1 =3D {
> static const struct display_timing hannstar_hsd101pww2_timing =3D {
> 	=2Epixelclock =3D { 64300000, 71100000, 82000000 },
> 	=2Ehactive =3D { 1280, 1280, 1280 },
>-	=2Ehfront_porch =3D { 1, 1, 10 },
>-	=2Ehback_porch =3D { 1, 1, 10 },
>-	=2Ehsync_len =3D { 58, 158, 661 },
>+	=2Ehfront_porch =3D { 1, 1, 64 },
>+	=2Ehback_porch =3D { 1, 1, 64 },
>+	=2Ehsync_len =3D { 58, 158, 553 },
> 	=2Evactive =3D { 800, 800, 800 },
>-	=2Evfront_porch =3D { 1, 1, 10 },
>-	=2Evback_porch =3D { 1, 1, 10 },
>-	=2Evsync_len =3D { 1, 21, 203 },
>+	=2Evfront_porch =3D { 1, 1, 32 },
>+	=2Evback_porch =3D { 1, 1, 32 },
>+	=2Evsync_len =3D { 1, 21, 159 },
> 	=2Eflags =3D DISPLAY_FLAGS_DE_HIGH,
> };
>=20
>--- >8 ---
>
>And then we could move the compatible string from simple to LVDS:
>
>--- >8 ---
>diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds=
=2Eyaml b/Documentation/devicetree/bindings/display/panel/panel-lvds=2Eyaml
>index 929fe046d1e7=2E=2E344e5df40c2f 100644
>--- a/Documentation/devicetree/bindings/display/panel/panel-lvds=2Eyaml
>+++ b/Documentation/devicetree/bindings/display/panel/panel-lvds=2Eyaml
>@@ -40,6 +40,8 @@ properties:
>     items:
>       - enum:
>           - auo,b101ew05
>+          # HannStar Display Corp=2E HSD101PWW2 10=2E1" WXGA (1280x800) =
LVDS panel
>+          - hannstar,hsd101pww2
>           - tbs,a711-panel
>=20
>       - const: panel-lvds
>diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple=
=2Eyaml b/Documentation/devicetree/bindings/display/panel/panel-simple=2Eya=
ml
>index df1cec8fd21b=2E=2Ef4d9da4afefd 100644
>--- a/Documentation/devicetree/bindings/display/panel/panel-simple=2Eyaml
>+++ b/Documentation/devicetree/bindings/display/panel/panel-simple=2Eyaml
>@@ -168,8 +168,6 @@ properties:
>       - hannstar,hsd070pww1
>         # HannStar Display Corp=2E HSD100PXN1 10=2E1" XGA LVDS panel
>       - hannstar,hsd100pxn1
>-        # HannStar Display Corp=2E HSD101PWW2 10=2E1" WXGA (1280x800) LV=
DS panel
>-      - hannstar,hsd101pww2
>         # Hitachi Ltd=2E Corporation 9" WVGA (800x480) TFT LCD panel
>       - hit,tx23d38vm0caa
>         # InfoVision Optoelectronics M133NWF4 R0 13=2E3" FHD (1920x1080)=
 TFT LCD panel
>diff --git a/arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall=2Edts b/ar=
ch/arm/boot/dts/nvidia/tegra30-pegatron-chagall=2Edts
>index c81d5875c31c=2E=2E4012f9c799a8 100644
>--- a/arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall=2Edts
>+++ b/arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall=2Edts
>@@ -2628,7 +2628,7 @@ cpu3: cpu@3 {
> 	};
>=20
> 	display-panel {
>-		compatible =3D "panel-lvds";
>+		compatible =3D "hannstar,hsd101pww2", "panel-lvds";
>=20
> 		width-mm =3D <217>;
> 		height-mm =3D <136>;
>--- >8 ---
>
>That gets rid of the DT validation warning for me=2E Would you be able to
>test this on actual hardware? I think the compatible matching would
>result in this matching the simple-panel driver and that does have some
>support for LVDS, but I'm not sure if it's exactly equal to what you get
>with only the panel-lvds matching, which makes this get handled by the
>panel-lvds driver=2E
>
>I'm attaching the full patch to make it a bit easier to apply this=2E

I will check if this doesn't break TF201=2E

P=2E S=2E U-boot patches are still hanging in the void!

>Thierry
