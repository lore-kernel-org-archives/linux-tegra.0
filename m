Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BB8BEB64DC
	for <linux-tegra@archiver.kernel.org>; Mon, 17 Jul 2023 13:26:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230100AbjGQN0O (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 17 Jul 2023 09:26:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231461AbjGQN0F (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 17 Jul 2023 09:26:05 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08CBB1725
        for <linux-tegra@vger.kernel.org>; Mon, 17 Jul 2023 06:25:41 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-997c4107d62so126867366b.0
        for <linux-tegra@vger.kernel.org>; Mon, 17 Jul 2023 06:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689600310; x=1692192310;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EvM3T8Cg5TXi9seGSlBKC+bWoDRu4d8zPJc+pcxi5hk=;
        b=In0nX9WRH0oPM890xyv/iUaf8vlZrXao5deHpOled6ColQnnRguZL91hX+m63wCxJS
         EAAfpFbKsPq6yhIqLeA1O47ytDswHBA+3Pf8Q5OgBLbMxrBmYf+NWB4AvCoT8Rxsd/ZF
         OZ0JfaSmxN60pfp2BLLD4YOmzzPAChcwbj53/8lB+qEv5vgQ0FOOSJjgxWcIEk6Ihm7N
         ldVj781nQwQd01HpF3HtI7hXpKrsSjFiyrB75tJKae+lJFTE+1XzZFrpWKWyPF5h1OM6
         1lMr6kY0k3YJBWyaLsck1koEmvPMjhYJnAUIrbdd1rsDpZFcx7xrLaLwAdcg1alWPGF3
         JlFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689600310; x=1692192310;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EvM3T8Cg5TXi9seGSlBKC+bWoDRu4d8zPJc+pcxi5hk=;
        b=DZdDbfhjdXV+8Wt9IrjT1ET6tWpJnfr7HgNl6YUx7kKE+9cisP/Vu+g+w1qZrp2vD9
         8sH8jbSdx5K84WWGq3rHmfKnqtd0VyptrdFoAABIzfeP78ns3W0+e5g8HRDTlUBKvhJ6
         p1PUu+kMcJk6cAG1jPQh4Mwz4L9JkqxZrnizcLcdvFja3sLS4R6o1s1TWl2o+ksPpjgG
         hFPG8bz1biEXyeCEu2MEU0WOGobRvuyQvvjjA7HmBJBUeDS494VRHBbl7YHypNFx1jjS
         UTGcoV+t3Rf/ZZJ5CSN6/vetetWs9BLdX4xsfEabNKkMaXuyRh1C7ePTfebBJV0z9cyP
         YDfA==
X-Gm-Message-State: ABy/qLY7Z0Fn2gXzVD4wZ8sk4k7+b0aipuPIntZeh5p0Ofty7TB4J7jI
        NKa1krvbPrROho6IIbR4dNA=
X-Google-Smtp-Source: APBJJlHXt8TEBIXWnjhgKx7MmgFkP2VORRCMaTLik+iepJe1ST/nhdPQyd8LW17/3sg5wDDxxF74rA==
X-Received: by 2002:a17:907:1dd2:b0:992:13c7:563 with SMTP id og18-20020a1709071dd200b0099213c70563mr11680161ejc.75.1689600309596;
        Mon, 17 Jul 2023 06:25:09 -0700 (PDT)
Received: from orome (p200300e41f4b7100f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4b:7100:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id mj6-20020a170906af8600b00988781076e2sm9224352ejb.78.2023.07.17.06.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 06:25:09 -0700 (PDT)
Date:   Mon, 17 Jul 2023 15:25:07 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Svyatoslav Ryhel <clamor95@gmail.com>,
        David Heidelberg <david@ixit.cz>,
        Raffaele Tranquillini <raffaele.tranquillini@gmail.com>,
        Ion Agorria <ion@agorria.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        Pedro =?utf-8?Q?=C3=82ngelo?= <pangelo@void.io>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Zack Pearsall <zpearsall@yahoo.com>,
        linux-tegra@vger.kernel.org
Subject: Re: LVDS panel compatible strings
Message-ID: <ZLVBM23xjgzN_-ZV@orome>
References: <ZLFd_L_Uw1PmpSep@orome>
 <CAPVz0n3fj77JEzJbYve9-5pjjVt+yJHNcFGqJr0HFSJnaOtbzw@mail.gmail.com>
 <ZLFmxuVuO2FWy1as@orome>
 <CAPVz0n0sYJvKJRmwBRpp_aUx7HbgbcLnkAJAV82XryHVeeYcHA@mail.gmail.com>
 <ZLTq3KXeV-tT_HFG@orome>
 <78ba744f-d7f6-2388-0330-1a5105c9dca5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="X7db3DuSi1x05WRv"
Content-Disposition: inline
In-Reply-To: <78ba744f-d7f6-2388-0330-1a5105c9dca5@gmail.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--X7db3DuSi1x05WRv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 17, 2023 at 11:50:03AM +0300, Dmitry Osipenko wrote:
> 17.07.2023 10:16, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > For cases where the timings are the only things that differ, the DT
> > bindings allow overriding the timings specifically. So you might get
> > away with using one of the existing panels if it is close enough and
> > patch up the timings in DT.
>=20
> If panel-simple supported timings override from DT, then panel-lvds
> indeed could be removed. But panel-simple doesn't support it:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?=
id=3Da21f18a993c56566db94ba836684bc32c070a82c

I clearly didn't look at that patch closely enough. panel-simple has
supported override modes since:

commit b8a2948fa2b3a5a6da67fd57aa01c7318d795125
Author: Sean Paul <seanpaul@chromium.org>
Date:   Thu Jul 11 13:34:53 2019 -0700

    drm/panel: simple: Add ability to override typical timing
   =20
    This patch adds the ability to override the typical display timing for a
    given panel. This is useful for devices which have timing constraints
    that do not apply across the entire display driver (eg: to avoid
    crosstalk between panel and digitizer on certain laptops). The rules are
    as follows:
   =20
    - panel must not specify fixed mode (since the override mode will
      either be the same as the fixed mode, or we'll be unable to
      check the bounds of the overried)
    - panel must specify at least one display_timing range which will be
      used to ensure the override mode fits within its bounds
   =20
    Changes in v2:
     - Parse the full display-timings node (using the native-mode) (Rob)
    Changes in v3:
     - No longer parse display-timings subnode, use panel-timing (Rob)
    Changes in v4:
     - Don't add mode from timing if override was specified (Thierry)
     - Add warning if timing and fixed mode was specified (Thierry)
     - Don't add fixed mode if timing was specified (Thierry)
     - Refactor/rename a bit to avoid extra indentation from "if" tests
     - i should be unsigned (Thierry)
     - Add annoying WARN_ONs for some cases (Thierry)
     - Simplify 'No display_timing found' handling (Thierry)
     - Rename to panel_simple_parse_override_mode() (Thierry)
    Changes in v5:
     - Added Heiko's Tested-by
    Changes in v6:
     - Rebased to drm-misc next
     - Added tags
   =20
    Cc: Doug Anderson <dianders@chromium.org>
    Cc: Eric Anholt <eric@anholt.net>
    Cc: Heiko Stuebner <heiko@sntech.de>
    Cc: Jeffy Chen <jeffy.chen@rock-chips.com>
    Cc: Rob Herring <robh+dt@kernel.org>
    Cc: St=C3=A9phane Marchesin <marcheu@chromium.org>
    Cc: Thierry Reding <thierry.reding@gmail.com>
    Cc: devicetree@vger.kernel.org
    Cc: dri-devel@lists.freedesktop.org
    Signed-off-by: Sean Paul <seanpaul@chromium.org>
    Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
    Signed-off-by: Douglas Anderson <dianders@chromium.org>
    Tested-by: Heiko Stuebner <heiko@sntech.de>
    Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
    Acked-by: Thierry Reding <thierry.reding@gmail.com>
    Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
    Link: https://patchwork.freedesktop.org/patch/msgid/20190711203455.1256=
67-2-dianders@chromium.org

Looking at the error message cited in the linked commit, the problem is
that the Chunghwa panel has a fixed mode listed in the driver. However I
don't see a reason why we can't get rid of that. The only place where I
can find the compatible string for that used is for the Nexus 7, so we
should be able to replace the fixed mode with the timings for that panel
and remove the fixed mode.

The initial Chunghwa panel driver support doesn't seem to have been
based on the Nexus 7, so I suppose if we make the above change we could
technically be breaking some setup out there, but since we have no way
of knowing which device this was on, or if anybody still has access, the
best we can do is hope that nothing breaks and fix things up if somebody
complains.

Thierry

--X7db3DuSi1x05WRv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmS1QTAACgkQ3SOs138+
s6HkgxAAgWtTOcf+zRMFN2Ink1aBdURgA97iK8LMR7oxLbHh4kz+pI6QkzE/TxNu
2kq44Xqcdl9iqHFspUcNVjGVyv18ywqTRt/KoE8QeRefAlqFv7hq6wzehwroat7X
os8yZy77ikfu0GFin/yQ9fRj5glTx90wOj39nZ40l8Az3se1KVuIdOycaaWcl22k
6dPUvMmFNOHbwyBTexX/qpAOJxl0QAqwmhk32KGzQ2QJbXVP0FlUedU+CkWXNWFJ
QS/L1fbgdi405Ha8nnu7JlYNSSbPRf4MIPgduRutma5aVTeFKGUef5WFmPrldc5k
LdETB/sWnLrCfe0pyvHtLtTvXXfZW62ezBZ6mnFNBgVcV+Ctpd59SjTziwGX0fco
XqkvU3nAEIhlbv6fg4VrQL8j9OkEjPHnfqa8L1egrs5B8UVhnSY5yB/3b04Q9PsL
+mqjfjxusk0uDXYe6WG850YW4jl+++28DCR/Y+eKxq7ekP54xS7eDMA3xc1hYpJf
2ecEBHrWeCyvr6uNIuP4k2Efwuaklw5Bx3GTKyPS5NzfcgKyVTMeZgRjBXga8SnX
qyoClUfFJAsORpxfOAcaAmtpaQHC9dC8VeXFciQpKRJgoBlTCFiOPDuU2GwHyWR4
IdsDyu0mGX/Gz8g2N9SYWaCdFBTSvHIOvopT4lhIqpFTZo1taP0=
=ENI6
-----END PGP SIGNATURE-----

--X7db3DuSi1x05WRv--
