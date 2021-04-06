Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B9FAC433B4
	for <linux-tegra@archiver.kernel.org>; Tue,  6 Apr 2021 13:57:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E5C1761380
	for <linux-tegra@archiver.kernel.org>; Tue,  6 Apr 2021 13:57:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235262AbhDFN5m (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 6 Apr 2021 09:57:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344809AbhDFN5m (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 6 Apr 2021 09:57:42 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C034C061756
        for <linux-tegra@vger.kernel.org>; Tue,  6 Apr 2021 06:57:33 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id o19so16710650edc.3
        for <linux-tegra@vger.kernel.org>; Tue, 06 Apr 2021 06:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=MQkxEhlKIb8/YGqTspPm8HvwN6gwZMNUE/fpcjzsSqk=;
        b=cdhmrtpRTyTTcTeuKmDCCO5D0ns6Ft+eAH7qdPY+V8q5LH2Hf88P3jvn1f+gv6QVQw
         Naqgoq74boPUcGHsSnyISMif967Qk9V/r50B4+GhKbOuu2NLmYvqlYESG18+kxGMNcyH
         /M6yXOo7VJ5H11t3nxMAr3NpFYtoJU4FyYogaVuHd8U5gS7jd5cPPLEivaN3x/Tj+N3H
         wxSsGMZic/UBMkjggXsIEhHiooeUI2DAUMkgZUs0gWYA8DQJjajvSHVCtnUIG6fCN/YR
         GtOp9zw5tV669GgJvtjORd89YGzzBdQNGc3ASgpPeycVZvkB4ost23Lp5hGzAFytlWD8
         YYfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MQkxEhlKIb8/YGqTspPm8HvwN6gwZMNUE/fpcjzsSqk=;
        b=DkX5vPLf61EGOXbtV8d+ybkQuOki1pzRq915O9SsLxWapbSJ7CkE8L+c2edKg4PQ8d
         WYZgSLf3qWfG1v+V2j8KppN5uBHrzQx9OC5wbuCg+myXnmbBzuD5uBYCSzJKVSv1Lui1
         NhmAsMCET00vYLMIArtuhx9eEpsX15p9w9osD5joDLzZfN/CY5/0yTGLJzL/KXas/4kX
         HIWjXAse/jr7pt2R0t+3oGKGKDqHM1sWvDhSt6YOKJ377EQoVogtV1rDqPFmvxUPbcM7
         9GdNpmEYGXjNgCs2IcuvExd6aQzGJkSr6gBjquMEyG+D4+QMi38LuHjqFzseJYM3MKuO
         1suA==
X-Gm-Message-State: AOAM530I030yOUsHFAQLra57W9mblQU8YCfyUQe04EUXM9gwg/iEDHei
        /DoQ1OSFg1FA4nTtYFBlFwk=
X-Google-Smtp-Source: ABdhPJxZilVJD4OPMBpDkTrLSvhknPIKK/t0mgpB5UWHofYhSA2ucCeK4PkyXlqI7mTM+Hd8DdI/RQ==
X-Received: by 2002:aa7:cb97:: with SMTP id r23mr37345127edt.106.1617717452111;
        Tue, 06 Apr 2021 06:57:32 -0700 (PDT)
Received: from localhost (p2e5be490.dip0.t-ipconnect.de. [46.91.228.144])
        by smtp.gmail.com with ESMTPSA id w2sm643680eju.71.2021.04.06.06.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 06:57:29 -0700 (PDT)
Date:   Tue, 6 Apr 2021 15:58:03 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Jon Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>,
        linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v9 09/13] phy: tegra: xusb: Add wake/sleepwalk for
 Tegra210
Message-ID: <YGxo6558N4llZo2U@orome.fritz.box>
References: <20210325164057.793954-10-thierry.reding@gmail.com>
 <20210401110512.2743589-1-thierry.reding@gmail.com>
 <YGvrMJ6FwwV3KOpt@vkoul-mobl.Dlink>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="VB49K5E67482yWAP"
Content-Disposition: inline
In-Reply-To: <YGvrMJ6FwwV3KOpt@vkoul-mobl.Dlink>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--VB49K5E67482yWAP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 06, 2021 at 10:31:36AM +0530, Vinod Koul wrote:
> On 01-04-21, 13:05, Thierry Reding wrote:
> > From: JC Kuo <jckuo@nvidia.com>
> >=20
> > This commit implements Tegra210 XUSB PADCTL wake and sleepwalk
> > routines. Sleepwalk logic is in PMC (always-on) hardware block.
> > PMC driver provides managed access to the sleepwalk registers
> > via regmap framework.
>=20
> Acked-By: Vinod Koul <vkoul@kernel.org>

Hi Vinod,

thanks for looking at these so quickly. Unfortunately this missed the
v5.12-rc6 cut-off for ARM SoC. However, all the prerequisites are now
in ARM SoC and Greg had acked the XHCI patches, another option would
be for me to send you a pull request for this series with all the
prerequisites (that are already in ARM SoC) included for v5.13. What
do you think?

Thierry

--VB49K5E67482yWAP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBsaOsACgkQ3SOs138+
s6Hk3hAAq7qJy89VYmGD+e4iSPHVPUITNARNyLqCGsv1pBM0mRrmyHVId3aFfS4G
QapGb9pydBghL20FFyR6TExCDVOJ6jl0wMnKMPw6XYaBVEO42Obhe+GCBt4X43dX
0wbsC0+NI9YPBFfw+ftGMHmngl6UDH8bQnuYbcDyxLFJZIeiAu3PzJ9Txs/gtqw2
Yze1DBKxHy/JmFJdYd8ykniJdo/Mbz+dpFud5cN/qDMI9uxPH8vhtqLLDxnfUDLT
AJ911g328SrMqEyPMsR+nsv44cOCLusXg8Ii3Wasbt6KYHJFFov+KnsV17WMIFqW
p8m/FPP3IQrFdGfPWqj3kXvgTvnVqU+8bydgscSlBIngrU4vEMHqe+o3d0tpbZOf
fU2BDt9mavKXKkNQr5Ck0rTdnbCWV5bsr09pndaJ4KuUMPjVwEU0Uu9S0qEz2gJS
YEhBHOHlX1i12ZoQChgEziFVYQtKpntz5DwEuipacUEdca7T+TkXu5rsFzTmFTeX
pdp30E/DSrzH+j3GM8BDzSfzLwXIr8zQyLr3uBy1CKfLvttoxILHTX3D1ocGFeB6
djWcgqr5PtvqCXKIP5sRmGIb4kvP6SVMbn85pepH+qZb+RtptiblgxHTiSDp9N09
msPOf/dtkhMC++GFB5BYaqMZ/QzAGNM1LmAAHLUsFa7G09DOkOI=
=Tn1+
-----END PGP SIGNATURE-----

--VB49K5E67482yWAP--
