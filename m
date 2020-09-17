Return-Path: <SRS0=Tnts=C2=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 107C3C43461
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 10:19:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B85502083B
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 10:19:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I15DIaeJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726589AbgIQKTC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Sep 2020 06:19:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726592AbgIQKSN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Sep 2020 06:18:13 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCA95C061788
        for <linux-tegra@vger.kernel.org>; Thu, 17 Sep 2020 03:18:02 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id z4so1443622wrr.4
        for <linux-tegra@vger.kernel.org>; Thu, 17 Sep 2020 03:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=GtA5Y0I5kXwcw0rM0+0qrE5W0ZiepSJACaykj4+MWdc=;
        b=I15DIaeJIod9YbceEJf0SUF4Vd7g+3vHkAVQtDUfqni8Ny8JQ8ougkEG8ZZHSVoigK
         axKhSWCa3B0e4cBYkFBSB+xQC7B9LQycx2sOLkleCcAa1hAp/IuzDQv98Y7FeaODtrQ+
         002t3sKUwaWBnRvVAsp9U9nExGFg7dLL7R7MZhrNzyTtjPyiQ5oPjUD0/cF2JC4COf5B
         nXlQxzJwGebMSvU8IT5CWtg3d4RX+Yy0DC471C2oLpRC1uJy8q1K1L7Cue02LffRPOvC
         nMgrDVmGetIlUuPOUC4EHAIU4/fMW2+sLGdIXAj4dtmOxYO8kyfIfnaCnxv5vUu8rhsa
         p8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GtA5Y0I5kXwcw0rM0+0qrE5W0ZiepSJACaykj4+MWdc=;
        b=g6tq7z8cBTQUt+lYQF9tNpJPrbkq5IhzL6B1RiYueaJ2B/tUxL39FIfZVYXxMjED2K
         utlUhgRnouugpUmYvG+fcX5nhEkGOHgXWGt/Wsrx5HO/jXgzMCtcd8pCO068RQzXvLMY
         5XG4z/ooQR2z/c59f7vpR826gEXNwXuGom3NY52+hqwORPUT4AnSJDj1BlKFIX3BupCB
         W9HZAh/va1CXqPnlnXKv92jldUzWmXPI4QajcBGJ3AcQJciecJEVE0NxhqHzJPkHrZbk
         XPeacCu/nol3oMSULZ3P5GTk6p46V5MSYQj6jNHb/AfR6MKn3gJCqwSKZ4jAY0P+Iyf5
         yR/A==
X-Gm-Message-State: AOAM53263kQmcuHE9ZhhSF7mlxseP7X1JNtIbwwFdxY9Jdp505xNzLP4
        Z2HSKrrzRDtSHXzbcMxg3DQ=
X-Google-Smtp-Source: ABdhPJwLZkIsaJWdZ1QcCXe3msnFPYEMxeDpjCKzjePiNpmwu2m4pdXkNXOpzE8WhvKPQb1DVSHrKQ==
X-Received: by 2002:adf:f88b:: with SMTP id u11mr30341957wrp.376.1600337880936;
        Thu, 17 Sep 2020 03:18:00 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id i83sm10902830wma.22.2020.09.17.03.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 03:17:59 -0700 (PDT)
Date:   Thu, 17 Sep 2020 12:17:58 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1 3/3] ARM: tegra: acer-a500: Remove atmel,cfg_name
 property
Message-ID: <20200917101758.GC3515672@ulmo>
References: <20200906190008.25247-1-digetx@gmail.com>
 <20200906190008.25247-3-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="E13BgyNx05feLLmH"
Content-Disposition: inline
In-Reply-To: <20200906190008.25247-3-digetx@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--E13BgyNx05feLLmH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 06, 2020 at 10:00:08PM +0300, Dmitry Osipenko wrote:
> This property was supposed to be upstreamed, but it was NAKed recently
> in a favor to a better approach of firmware loading. It also turned
> out that the firmware loading isn't really necessary because it's stored
> in a non-volatile memory inside of the touchscreen controller and
> previously the FW loading was needed in order to get touchscreen working,
> but it actually was a TS driver problem which is resolved now. Hence
> remove the unsupported property.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  arch/arm/boot/dts/tegra20-acer-a500-picasso.dts | 2 --
>  1 file changed, 2 deletions(-)

Applied, thanks.

Thierry

--E13BgyNx05feLLmH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9jN9YACgkQ3SOs138+
s6Et4xAAsuwaOIISY6QY9foFAY3KxcQCXdp8hi9hBsa7S6VT+hkmrVN3fKMWcay5
d2CPqjmKK0rakDQuTmkVGjln7H2Pg3sXBEillWgm4jfYl57yu7noluiHL9uCnspD
8fTWV+TeIPteTaMO/ceqy0D2U86CogEwhxhk6caKsovwc3b4rxgaeoEDOQHDofTS
T0Zdmj2YCC6kQCXwyjU+lSAld8F1r5Xd9WLBHVblrQk8V+9fAScIdtWd6Rdpx2Rf
k+g3HqD3WSGcc56Me+m1jXIND+FCxWB1RSxcfBd8qQ6QUUYKCHeh0FPyhlO4t7MH
ZS59RjEpObIW7txS68Q7Wq9y/Hnj49W55HtHxRsEsZM/JVXvISsmK8HJheEbnL99
BbmF5emQ6fnkcib0dHzSTeHf1k1TNyoMPus327L3Dl0Foncjzen5nO45i1tnpJ5f
ybjEBe6jCubiW/rC+5vYCm6ZMEDi4NQs9JBiAmCIStc1JKAYiagg6HqESXmIE4y0
Kvnc8F67xSCb1xhgahQx7HpW4vNTfTZvv64DEzEFFyWBx8XHuY4DRt/I76Iqyjio
gvQtK2BZ1VwYK9GnaNEvZ3FIkQ9UPyMq2kgOE0hKWyoMNdAULM2E1nnUBUpdmdwB
MkvK3l+tUGKmJZnkA41DsKhkU0z0v8OgWgljBN+LwXqQcpNWPHI=
=2B8W
-----END PGP SIGNATURE-----

--E13BgyNx05feLLmH--
