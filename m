Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE5A5EB64DC
	for <linux-tegra@archiver.kernel.org>; Mon, 17 Jul 2023 07:16:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230243AbjGQHQv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 17 Jul 2023 03:16:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbjGQHQu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 17 Jul 2023 03:16:50 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37A7E10D8
        for <linux-tegra@vger.kernel.org>; Mon, 17 Jul 2023 00:16:48 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-51e526e0fe4so6349984a12.3
        for <linux-tegra@vger.kernel.org>; Mon, 17 Jul 2023 00:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689578206; x=1692170206;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N2D8YPw3fga+fkCfJZrEv3DmWfCyH0U4b6YoKxzwCxA=;
        b=OShVVsR6Rb2varzAQR0k2KK9QH5OCuXuAS5f+Ycb2yWdj8Sy9TTv6Bb9f7Ai0sN0mJ
         5Y8z/oCYZ3qPSDih+64dY7/82ShjtlFWtHsSXzv8TyMnjzgDudLztho2qGBQqyYf+83K
         mesWukOOIMhoDYj7o1PgWH5x7xmGPyOxKQXiYQEVP60CXBk6LcURDFUcMH8rzojGqPPI
         olJ06Zd1kXGa8sFuc0dUxqUzLg+HzX8dmcrCTKo6iqx2FL2NklvCQ23stmQQCKZe1rM4
         89zx37oY3uqb48Wh51eV/XsePLn+ztiwWZ3VYRzDKrFElIsdKULtqjnDrAvuubNC3Uqs
         cafQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689578206; x=1692170206;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N2D8YPw3fga+fkCfJZrEv3DmWfCyH0U4b6YoKxzwCxA=;
        b=SSplUBdytlhTuK3FuUTSpJyl0b+riBUrKXfo+KIlW7C1mn0oJBI/6GhElP1GSEs5Wx
         JTgdYiHPafBq+7Fu8WkUqwF9bZqDXCHCC8j0Lg7idDNr2ZQ21rYPmvEGZXXA7T0udFb8
         Il1gCQmPb9k/hkHcGc//vlx2OWmWOdEzdniQsgaUeJXOXKkiI418tx0bmKeQP0hEh8aD
         l29jyFqZI6LvESBwVMRNKLcxTHr0bnKjHOmG/64gFVXO+gJPFVd2yticVyVOF3B9w9Ys
         Vqj36w3K37fb4rrkRoksbCuTELhV/UlTin1dGpRzMBlm94V4kw9Ovuf4Hp+T5UH9rAY4
         ndQg==
X-Gm-Message-State: ABy/qLbf4l1zC4vc0oh3zhp79jD5K/JCxhPdz+rtbRxgtVkz09nIzWWS
        tylrcGf7F59djUdZSXW+5TU=
X-Google-Smtp-Source: APBJJlEIV3fpe5fB1/B8beWShmGl+Rx2DINYYeJoX03tonzWiArXjyAxAK2pwgVVdF1ggocHopniPQ==
X-Received: by 2002:a17:906:51c8:b0:992:7295:61d4 with SMTP id v8-20020a17090651c800b00992729561d4mr11823289ejk.3.1689578206268;
        Mon, 17 Jul 2023 00:16:46 -0700 (PDT)
Received: from orome (p200300e41f4b7100f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4b:7100:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id y24-20020a17090629d800b0098822e05539sm8801848eje.191.2023.07.17.00.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 00:16:45 -0700 (PDT)
Date:   Mon, 17 Jul 2023 09:16:44 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Svyatoslav Ryhel <clamor95@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        David Heidelberg <david@ixit.cz>,
        Raffaele Tranquillini <raffaele.tranquillini@gmail.com>,
        Ion Agorria <ion@agorria.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        Pedro =?utf-8?Q?=C3=82ngelo?= <pangelo@void.io>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Zack Pearsall <zpearsall@yahoo.com>,
        linux-tegra@vger.kernel.org
Subject: Re: LVDS panel compatible strings
Message-ID: <ZLTq3KXeV-tT_HFG@orome>
References: <ZLFd_L_Uw1PmpSep@orome>
 <CAPVz0n3fj77JEzJbYve9-5pjjVt+yJHNcFGqJr0HFSJnaOtbzw@mail.gmail.com>
 <ZLFmxuVuO2FWy1as@orome>
 <CAPVz0n0sYJvKJRmwBRpp_aUx7HbgbcLnkAJAV82XryHVeeYcHA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="d1wotkiI0vZrTaFJ"
Content-Disposition: inline
In-Reply-To: <CAPVz0n0sYJvKJRmwBRpp_aUx7HbgbcLnkAJAV82XryHVeeYcHA@mail.gmail.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--d1wotkiI0vZrTaFJ
Content-Type: multipart/mixed; boundary="k/CojhKxWPI8Y+Qc"
Content-Disposition: inline


--k/CojhKxWPI8Y+Qc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 14, 2023 at 06:57:01PM +0300, Svyatoslav Ryhel wrote:
> =D0=BF=D1=82, 14 =D0=BB=D0=B8=D0=BF. 2023=E2=80=AF=D1=80. =D0=BE 18:16 Th=
ierry Reding <thierry.reding@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Fri, Jul 14, 2023 at 06:00:43PM +0300, Svyatoslav Ryhel wrote:
> > > =D0=BF=D1=82, 14 =D0=BB=D0=B8=D0=BF. 2023=E2=80=AF=D1=80. =D0=BE 17:3=
8 Thierry Reding <thierry.reding@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > >
> > > > Hi everyone,
> > > >
> > > > I've been working on converting all Tegra-related device tree bindi=
ngs
> > > > to json-schema so that eventually we can fully validate device tree
> > > > files. Getting all the bindings reviewed and merged has been slow, =
but
> > > > I have a local tree where pretty much all validation errors and war=
nings
> > > > have been fixed. The remaining warnings that I'm not sure how to re=
solve
> > > > are these:
> > > >
> > > >     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dtb:=
 display-panel: compatible:0: 'panel-lvds' is not one of ['auo,b101ew05', '=
tbs,a711-panel']
> > > >         from schema $id: http://devicetree.org/schemas/display/pane=
l/panel-lvds.yaml#
> > > >     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dtb:=
 display-panel: compatible: ['panel-lvds'] is too short
> > > >         from schema $id: http://devicetree.org/schemas/display/pane=
l/panel-lvds.yaml#
> > > >     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dtb:=
 display-panel: Unevaluated properties are not allowed ('compatible' was un=
expected)
> > > >         from schema $id: http://devicetree.org/schemas/display/pane=
l/panel-lvds.yaml#
> > > >     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb:=
 display-panel: compatible:0: 'panel-lvds' is not one of ['auo,b101ew05', '=
tbs,a711-panel']
> > > >         from schema $id: http://devicetree.org/schemas/display/pane=
l/panel-lvds.yaml#
> > > >     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb:=
 display-panel: compatible: ['panel-lvds'] is too short
> > > >         from schema $id: http://devicetree.org/schemas/display/pane=
l/panel-lvds.yaml#
> > > >     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb:=
 display-panel: Unevaluated properties are not allowed ('compatible' was un=
expected)
> > > >         from schema $id: http://devicetree.org/schemas/display/pane=
l/panel-lvds.yaml#
> > > >     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dtb:=
 display-panel: compatible:0: 'panel-lvds' is not one of ['auo,b101ew05', '=
tbs,a711-panel']
> > > >         from schema $id: http://devicetree.org/schemas/display/pane=
l/panel-lvds.yaml#
> > > >     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dtb:=
 display-panel: compatible: ['panel-lvds'] is too short
> > > >         from schema $id: http://devicetree.org/schemas/display/pane=
l/panel-lvds.yaml#
> > > >     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dtb:=
 display-panel: Unevaluated properties are not allowed ('compatible' was un=
expected)
> > > >         from schema $id: http://devicetree.org/schemas/display/pane=
l/panel-lvds.yaml#
> > > >     arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dtb: display-=
panel: compatible:0: 'panel-lvds' is not one of ['auo,b101ew05', 'tbs,a711-=
panel']
> > > >         from schema $id: http://devicetree.org/schemas/display/pane=
l/panel-lvds.yaml#
> > > >     arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dtb: display-=
panel: compatible: ['panel-lvds'] is too short
> > > >         from schema $id: http://devicetree.org/schemas/display/pane=
l/panel-lvds.yaml#
> > > >     arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dtb: display-=
panel: Unevaluated properties are not allowed ('compatible' was unexpected)
> > > >         from schema $id: http://devicetree.org/schemas/display/pane=
l/panel-lvds.yaml#
> > >
> > > Hello Thierry! Pegatron Chagall uses a Hannstar similar to one used in
> > > ASUS TF201 but unfortunately it is not compatible with existing simple
> > > panel setup (blurry image if used). My assumption is that chagall as
> > > different revision of this panel like HSD101PWW3-B00 or
> > > HSD101PWW1-A00 which is more likely or panel is highly modified which
> > > is unlikely. I propose to use "hannstar,hsd101pww1" which is more wide
> > > spread.
> >
> > Interesting. So is the problem the HSD101PWW2 timings that are off, or
> > is it because the panel-lvds code does something special to make this
> > blurry image go away?
> >
> timings are different

For cases where the timings are the only things that differ, the DT
bindings allow overriding the timings specifically. So you might get
away with using one of the existing panels if it is close enough and
patch up the timings in DT.

Comparing what you've got for Chagall, the porches exceed what the
HSD101PWW2 allows, but the timing values in the simple-panel driver look
a little arbitrary, to be honest, so I think those could be extended.
Looking at a datasheet that I found online, it's very unspecific about
the porch lengths since it only mentions minimum, typical and maximum
values for the total frame blanking times:

	vertical: 3, 23, 223
	horizontal: 54, 160, 681

So I think we can be more generous in how these are split up. So we
could for example do this:

--- >8 ---
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/p=
anel-simple.c
index 18dc251749fb..b2fb7943f2ed 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2108,13 +2108,13 @@ static const struct panel_desc hannstar_hsd100pxn1 =
=3D {
 static const struct display_timing hannstar_hsd101pww2_timing =3D {
 	.pixelclock =3D { 64300000, 71100000, 82000000 },
 	.hactive =3D { 1280, 1280, 1280 },
-	.hfront_porch =3D { 1, 1, 10 },
-	.hback_porch =3D { 1, 1, 10 },
-	.hsync_len =3D { 58, 158, 661 },
+	.hfront_porch =3D { 1, 1, 64 },
+	.hback_porch =3D { 1, 1, 64 },
+	.hsync_len =3D { 58, 158, 553 },
 	.vactive =3D { 800, 800, 800 },
-	.vfront_porch =3D { 1, 1, 10 },
-	.vback_porch =3D { 1, 1, 10 },
-	.vsync_len =3D { 1, 21, 203 },
+	.vfront_porch =3D { 1, 1, 32 },
+	.vback_porch =3D { 1, 1, 32 },
+	.vsync_len =3D { 1, 21, 159 },
 	.flags =3D DISPLAY_FLAGS_DE_HIGH,
 };
=20
--- >8 ---

And then we could move the compatible string from simple to LVDS:

--- >8 ---
diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yam=
l b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
index 929fe046d1e7..344e5df40c2f 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
@@ -40,6 +40,8 @@ properties:
     items:
       - enum:
           - auo,b101ew05
+          # HannStar Display Corp. HSD101PWW2 10.1" WXGA (1280x800) LVDS p=
anel
+          - hannstar,hsd101pww2
           - tbs,a711-panel
=20
       - const: panel-lvds
diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.y=
aml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index df1cec8fd21b..f4d9da4afefd 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -168,8 +168,6 @@ properties:
       - hannstar,hsd070pww1
         # HannStar Display Corp. HSD100PXN1 10.1" XGA LVDS panel
       - hannstar,hsd100pxn1
-        # HannStar Display Corp. HSD101PWW2 10.1" WXGA (1280x800) LVDS pan=
el
-      - hannstar,hsd101pww2
         # Hitachi Ltd. Corporation 9" WVGA (800x480) TFT LCD panel
       - hit,tx23d38vm0caa
         # InfoVision Optoelectronics M133NWF4 R0 13.3" FHD (1920x1080) TFT=
 LCD panel
diff --git a/arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dts b/arch/a=
rm/boot/dts/nvidia/tegra30-pegatron-chagall.dts
index c81d5875c31c..4012f9c799a8 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dts
@@ -2628,7 +2628,7 @@ cpu3: cpu@3 {
 	};
=20
 	display-panel {
-		compatible =3D "panel-lvds";
+		compatible =3D "hannstar,hsd101pww2", "panel-lvds";
=20
 		width-mm =3D <217>;
 		height-mm =3D <136>;
--- >8 ---

That gets rid of the DT validation warning for me. Would you be able to
test this on actual hardware? I think the compatible matching would
result in this matching the simple-panel driver and that does have some
support for LVDS, but I'm not sure if it's exactly equal to what you get
with only the panel-lvds matching, which makes this get handled by the
panel-lvds driver.

I'm attaching the full patch to make it a bit easier to apply this.

Thierry

--k/CojhKxWPI8Y+Qc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline;
	filename="0001-WIP-Use-Hannstar-HSD101PWW2-on-Pegatron-Chagall.patch"
Content-Transfer-Encoding: quoted-printable

=46rom d45f49a40b0e9db07cb4fcdcaafd29e1453e8001 Mon Sep 17 00:00:00 2001
=46rom: Thierry Reding <treding@nvidia.com>
Date: Mon, 17 Jul 2023 09:15:33 +0200
Subject: [PATCH] WIP: Use Hannstar HSD101PWW2 on Pegatron Chagall

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../bindings/display/panel/panel-lvds.yaml           |  2 ++
 .../bindings/display/panel/panel-simple.yaml         |  2 --
 .../arm/boot/dts/nvidia/tegra30-pegatron-chagall.dts |  2 +-
 drivers/gpu/drm/panel/panel-simple.c                 | 12 ++++++------
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yam=
l b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
index 929fe046d1e7..344e5df40c2f 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
@@ -40,6 +40,8 @@ properties:
     items:
       - enum:
           - auo,b101ew05
+          # HannStar Display Corp. HSD101PWW2 10.1" WXGA (1280x800) LVDS p=
anel
+          - hannstar,hsd101pww2
           - tbs,a711-panel
=20
       - const: panel-lvds
diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.y=
aml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index df1cec8fd21b..f4d9da4afefd 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -168,8 +168,6 @@ properties:
       - hannstar,hsd070pww1
         # HannStar Display Corp. HSD100PXN1 10.1" XGA LVDS panel
       - hannstar,hsd100pxn1
-        # HannStar Display Corp. HSD101PWW2 10.1" WXGA (1280x800) LVDS pan=
el
-      - hannstar,hsd101pww2
         # Hitachi Ltd. Corporation 9" WVGA (800x480) TFT LCD panel
       - hit,tx23d38vm0caa
         # InfoVision Optoelectronics M133NWF4 R0 13.3" FHD (1920x1080) TFT=
 LCD panel
diff --git a/arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dts b/arch/a=
rm/boot/dts/nvidia/tegra30-pegatron-chagall.dts
index c81d5875c31c..4012f9c799a8 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dts
@@ -2628,7 +2628,7 @@ cpu3: cpu@3 {
 	};
=20
 	display-panel {
-		compatible =3D "panel-lvds";
+		compatible =3D "hannstar,hsd101pww2", "panel-lvds";
=20
 		width-mm =3D <217>;
 		height-mm =3D <136>;
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/p=
anel-simple.c
index 18dc251749fb..b2fb7943f2ed 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2108,13 +2108,13 @@ static const struct panel_desc hannstar_hsd100pxn1 =
=3D {
 static const struct display_timing hannstar_hsd101pww2_timing =3D {
 	.pixelclock =3D { 64300000, 71100000, 82000000 },
 	.hactive =3D { 1280, 1280, 1280 },
-	.hfront_porch =3D { 1, 1, 10 },
-	.hback_porch =3D { 1, 1, 10 },
-	.hsync_len =3D { 58, 158, 661 },
+	.hfront_porch =3D { 1, 1, 64 },
+	.hback_porch =3D { 1, 1, 64 },
+	.hsync_len =3D { 58, 158, 553 },
 	.vactive =3D { 800, 800, 800 },
-	.vfront_porch =3D { 1, 1, 10 },
-	.vback_porch =3D { 1, 1, 10 },
-	.vsync_len =3D { 1, 21, 203 },
+	.vfront_porch =3D { 1, 1, 32 },
+	.vback_porch =3D { 1, 1, 32 },
+	.vsync_len =3D { 1, 21, 159 },
 	.flags =3D DISPLAY_FLAGS_DE_HIGH,
 };
=20
--=20
2.41.0


--k/CojhKxWPI8Y+Qc--

--d1wotkiI0vZrTaFJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmS06tkACgkQ3SOs138+
s6EqBhAAhXBUoN7Ma8R6yJF18SNPmoxHy8UJLA+Nec+j+8v/lgeIOKv+Loi93SyA
s3wv9d2SVN1Y5UXs4bmMj4ywdxi9WKGQqV24YYNJ4SztodxeYfG+Q9M3WH72zEN/
1sIA7rVnx29x4fCmhMgzFi8T6YwFlQrH6DD2qF2awERIDIjmekaqfD1kTFLuUvby
7iQtFFUeYJkjWIod1H/4lWL8rKH2T/MbuVFJ8Jrvuco7jXTCQyr1+N7gZU37fzUn
M6a3y1BsYWTZcHAam2vZ2ahZLw0HHv0vrxssbQudSCCg7y5nSEzEO3yaP2e8JLwC
7axojOlK0EjRh38zcYyHqCmByA/AVTi6zZKGFcO0idIf2O9dXw0cjysu8umotkLe
dKZOvRG3oeeU6z8dLfUHadHnkD7cZfnpVgwaoDUKza2KqAirVLxvsDdidWYOKWip
VssnsE19Na1Rgu+/v/paZ1u3T79xis0REXPHydXAkjnlQjll2WZiTxBwR7YoVI7K
+HtTfwcWbTBdiXR2NN7e7FL2Wh6sbDu4pddJ6EJq1lslBRtsQQXedsXYotntO/gC
pWU4PEUVIww5Nad08Osv1/47BNZYJBazaQjobx0dDya/H/bRRrAC+vakTUdXZgYD
eEE//VqglHFUJftpMl7dUAThrJzlS80ioEUCg2316lIqyP5BG4U=
=0yiq
-----END PGP SIGNATURE-----

--d1wotkiI0vZrTaFJ--
