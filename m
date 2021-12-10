Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DDD5C433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 10 Dec 2021 12:53:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241076AbhLJM4s (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 10 Dec 2021 07:56:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241067AbhLJM4s (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 10 Dec 2021 07:56:48 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66A2BC061746
        for <linux-tegra@vger.kernel.org>; Fri, 10 Dec 2021 04:53:13 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id d24so14890533wra.0
        for <linux-tegra@vger.kernel.org>; Fri, 10 Dec 2021 04:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9a4F1Ye6nUx9FkaSWnFdyuvOq97VXm2QesGU7ra1rXQ=;
        b=lxRCAnmLjS9Nd6QUKt3yP9oVOsBvHBYclgx25tfvsk0xkO8yj6TrEpwbLiMqufVU5U
         HLBfG5IMLntBZzUJN8OIFTva2J+5Ok3HHOGq7aUEi6wZGQALlb7XXh5fOJt2rArBv6CB
         51Ibzqi360PLCf+GRdJ8gUxwZ5IXz1q6c2VoxncBiUjiv2JPIcz7BdA3KY6lmfE2ZBgw
         GqlcuKMoY6v0xW4eiEtBLjNsIwlun9YAy0Nzv9hVeO/dG6bV3e2uTQUsn7gagoWyiv+P
         4Y0fzY1JRSLfvFGaD3QzIj0byLbPGRjHnwJh8KYD2evSkSq0+i0fvmX9ah4X0q32mBiF
         fSdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9a4F1Ye6nUx9FkaSWnFdyuvOq97VXm2QesGU7ra1rXQ=;
        b=pqbRBDCU0T2LGnwG5HjLr3QbPKrEZQ+FdNOewFWi3kbTVFmHf/669uWoiWpYk9tVT7
         kgRlGFIIEWdRqN20HTE4hzyYUlqJEE3AMbIzf3PKJeaRjMOEQT/QzBUwILNypimM8LfG
         0HKHnTABiKbnAGIsKTXMkSzfRRr5JOJOcZdyqhWykKGrSjN+ZjO+abjfX5X3cSNexHLE
         s9i1eMlrcbmj/tRh/6j+FWCYvXZ8vTkYMQaiBJPmF5x5uPeE670zUOvhukeZCKPv9xyf
         kqgnERw0RHPoNZHzI3U8RK3KqrrruVUzbpE5q/2YLDtyjeFQH8iT8xgpTJK5avAoMfzU
         OILQ==
X-Gm-Message-State: AOAM533Ya9f2LrSHBfrjk2YEI5/fldXCbFoR7+nNwHNwDK2AnPh8RzR2
        hDzb8Mk9IlxUpL9L+4bnkyUCTp8tTp7LFw==
X-Google-Smtp-Source: ABdhPJzzq2VuXCLuw6i9jS9JizsS2lQ1TKUMWNDTnYX46cuQOoBx0HkD/SaRb7Oi6EExA1IoipoIXw==
X-Received: by 2002:adf:d20e:: with SMTP id j14mr14140211wrh.220.1639140791895;
        Fri, 10 Dec 2021 04:53:11 -0800 (PST)
Received: from orome ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id az15sm2722368wmb.0.2021.12.10.04.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 04:53:10 -0800 (PST)
Date:   Fri, 10 Dec 2021 13:53:07 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 04/25] ARM: tegra: Rename top-level clocks
Message-ID: <YbNNs+H05YZxA2ex@orome>
References: <20211209173356.618460-1-thierry.reding@gmail.com>
 <20211209173356.618460-5-thierry.reding@gmail.com>
 <d545f269-7d99-f126-0ace-b1a5cffe3ab2@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="03BuDu4Oa2ZbFWik"
Content-Disposition: inline
In-Reply-To: <d545f269-7d99-f126-0ace-b1a5cffe3ab2@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--03BuDu4Oa2ZbFWik
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 09, 2021 at 09:27:01PM +0300, Dmitry Osipenko wrote:
> 09.12.2021 20:33, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Clocks defined at the top level in device tree are no longer part of a
> > simple bus and therefore don't have a reg property. Nodes without a reg
> > property shouldn't have a unit-address either, so drop the unit address
> > from the node names. To ensure nodes aren't duplicated (in which case
> > they would end up merged in the final DTB), append the name of the clock
> > to the node name.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  arch/arm/boot/dts/tegra114-dalmore.dts                    | 2 +-
> >  arch/arm/boot/dts/tegra114-roth.dts                       | 2 +-
> >  arch/arm/boot/dts/tegra114-tn7.dts                        | 2 +-
> >  arch/arm/boot/dts/tegra124-jetson-tk1.dts                 | 2 +-
> >  arch/arm/boot/dts/tegra124-nyan.dtsi                      | 2 +-
> >  arch/arm/boot/dts/tegra124-venice2.dts                    | 2 +-
> >  arch/arm/boot/dts/tegra20-acer-a500-picasso.dts           | 4 ++--
> >  arch/arm/boot/dts/tegra20-harmony.dts                     | 2 +-
> >  arch/arm/boot/dts/tegra20-paz00.dts                       | 2 +-
> >  arch/arm/boot/dts/tegra20-seaboard.dts                    | 2 +-
> >  arch/arm/boot/dts/tegra20-tamonten.dtsi                   | 2 +-
> >  arch/arm/boot/dts/tegra20-trimslice.dts                   | 2 +-
> >  arch/arm/boot/dts/tegra20-ventana.dts                     | 2 +-
> >  arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi | 2 +-
> >  arch/arm/boot/dts/tegra30-beaver.dts                      | 2 +-
> >  arch/arm/boot/dts/tegra30-cardhu.dtsi                     | 2 +-
> >  16 files changed, 17 insertions(+), 17 deletions(-)
>=20
> This and the next patch duplicate the preexisting patch [1] that you saw
> and skipped previously. It looks odd that you redoing it on your own
> now. This is not okay to me unless you talked to David and he is aware
> about it.

I had completely forgotten about it. I'll substitute David's authorship
for mine, but I'd prefer to keep the two changes in separate patches.

Thierry

--03BuDu4Oa2ZbFWik
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmGzTbEACgkQ3SOs138+
s6E7sA//c74zKF3Neji+jjlKAql96ZTNsTp76y8Q3S2kzXIvLsDKK5blcQBHpRy6
ku6H3HhKWH0ZQ3rVolYC+pregGSU/3IF7DElW2PgO4YyZWt02HndB4AkgLJD8oIN
T0K+xcCeHE9a6Jhd92mWQ4+dSpO6Jgr6XOSdkIWDPSSULgOKiYzEST/M+jHBWQYu
Kt1a+K/k8FwO3K0svFVa6huWZVUP0ip6a09PY7VTr+wx31Pp2eRCP+ExrE0ZrcBr
xCGIfnGp28/9FzzR9qJpcPcU8lSditOrZ1i96+UEk8pPyRN0afc7OV/YW56H0I4B
ZsXfauV4cQxtXxFqQttQKfkAI7on5qyHOlQLr2D8RfKinJObO0puZf2ADy3o1gDL
fJuixsEmYccWmkJP7fDQMmNiJDI9nyogRMSO1HGVkz3JN9zQgYrHsjFWTL0ynY01
GYin2Hi7fXzvFZ5YzcuoGdmvBODd0z6sLBPz3552T3EfwgrvG8iY8zHUXPAgl1CV
PKWzlmmfDmdEDj8GeBT5tYRvOmTWZipsSkPuGrA2rmcROHvIJXfEV1tkeI1eRK/7
276/16q4HfYoZ3EFaNCahSvYz+JseMSb158aZnChaFbhvXP1xPZES5NlVPNDh+GQ
xu5Vxt89Q0vKd4cD2EmEFOkeTF8ShhRhmFhR3ZL7BpXY7Ndp5RQ=
=5oDy
-----END PGP SIGNATURE-----

--03BuDu4Oa2ZbFWik--
