Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F299EC433C1
	for <linux-tegra@archiver.kernel.org>; Mon, 29 Mar 2021 06:51:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B4D5A6195B
	for <linux-tegra@archiver.kernel.org>; Mon, 29 Mar 2021 06:51:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230358AbhC2Guw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 29 Mar 2021 02:50:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230346AbhC2Gur (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Mar 2021 02:50:47 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F6F3C061574;
        Sun, 28 Mar 2021 23:50:46 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id hq27so17676750ejc.9;
        Sun, 28 Mar 2021 23:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=MRKoM7dLBS9DMoYGv5mFilj8qS/0VViXMQGlcQLXpXA=;
        b=nLSWHKf5KAmj1oGujUv1uA9+7+PNBOeKPQb5KRjdmPRLgc2Vy3m8JTlf+wSsNuwwLD
         1CLQ3o2yXPwTBBqemFJn7JxtFsE0fQSr7TOIdnKHXwzYhE4K6Vz7//alWLAJ339ziNoM
         +Dl/upjMwMrtkv6Nwb3fSQJhb4cqc3vhJ9V0r6eD92btN57tboCb2UUXPyrFjOAPsMkh
         FlKGNnvmmUGs6+3s+52a7yyww57Is1RvCbzWg7k/cK4g4fZZoTFp/BCKBpY1mrrXT2gS
         07B8GAqHJKhd7Mo0idhmeQ4P3WV/MugJ5YHungvXhLB2D1UATEIgRLTdXH690rQaSPZ2
         3WDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MRKoM7dLBS9DMoYGv5mFilj8qS/0VViXMQGlcQLXpXA=;
        b=OyQJubZQ4tcAGzAB/xb3pdxv75t6mL46LqGaCG5rASs9jFMnk//egLIhFcaJkMO7AM
         p9u5Krnkh/EO6leHgws2u/uj4ocUN3hZSAgvxI0GcENiNHt9ehjfbcsG9xNwQyzicay5
         IGIMLl5qdi9B5bccOUa4zuwUYxb1t3iejehucnFpoKWSU7c9Ustue9u0FUKEmPd2aOIa
         fswI4yvVo/Ltib7Vtro2qIzR2sN+KIaBGLvE2Q18zrsfh+G0bfBIdokoEJipQpwSnSR/
         hGP+OkR5uqAmZPQjt6X8NMWNYvsz+c/vyniOIuYmVmm2klen8zkb2qe7O2ZXoHEEbOsk
         v/TQ==
X-Gm-Message-State: AOAM531bpg5fCEqT2JL7nmyfo2SUM0WeLmbevoOnxYE2IBmXlrJEYgZL
        kpBUKx6gqwRUR9NqMA59m94=
X-Google-Smtp-Source: ABdhPJzkQD/gxtEB7aJEpelFjec40cUy+ftj4/iW4yoqa2XdZRoReftjFH3rK8clufBajPxwC4spGA==
X-Received: by 2002:a17:906:ecf3:: with SMTP id qt19mr26693818ejb.467.1617000645203;
        Sun, 28 Mar 2021 23:50:45 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id c19sm8403325edu.20.2021.03.28.23.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Mar 2021 23:50:44 -0700 (PDT)
Date:   Mon, 29 Mar 2021 08:51:09 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Lyude Paul <lyude@redhat.com>
Cc:     nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "open list:DRM DRIVERS FOR NVIDIA TEGRA" 
        <linux-tegra@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 02/20] drm/tegra: Don't register DP AUX channels
 before connectors
Message-ID: <YGF43W1kppXmOTwh@orome.fritz.box>
References: <20210326203807.105754-1-lyude@redhat.com>
 <20210326203807.105754-3-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3/3ODl/4QwGFlK0b"
Content-Disposition: inline
In-Reply-To: <20210326203807.105754-3-lyude@redhat.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--3/3ODl/4QwGFlK0b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 26, 2021 at 04:37:49PM -0400, Lyude Paul wrote:
> As pointed out by the documentation for drm_dp_aux_register(),
> drm_dp_aux_init() should be used in situations where the AUX channel for a
> display driver can potentially be registered before it's respective DRM
> driver. This is the case with Tegra, since the DP aux channel exists as a
> platform device instead of being a grandchild of the DRM device.
>=20
> Since we're about to add a backpointer to a DP AUX channel's respective D=
RM
> device, let's fix this so that we don't potentially allow userspace to use
> the AUX channel before we've associated it with it's DRM connector.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/tegra/dpaux.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--3/3ODl/4QwGFlK0b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBheN0ACgkQ3SOs138+
s6E2+g/+IIUa7Z93weSOTP7EoyYiNnDgVw5B2vMst7Px4Nck336qqsZbv0J9ZQ0L
h5P0mlUejyzOxAshnHtiYejeAXTN1GbyFUw6GlN+EEaZFoPcOSkSszhaO+UWNERE
sIVhvhYtePlzA9dASwQtxjXYOHjWmBO1EcQaLCUjeI0bRAPKhlFjnpMM3xLRlegU
k4yJCJIwUzRTaz7AHESzqZney+D89lF2yl8PO7xn176KWR/bJwW7cozPvzLoJCdh
Qx8j3tXwGe11Ssc6EqUmuYOqNqIZQDLn+n+8PnEpRKebSr1UKj1907EtiUwsVPEJ
BdeDhJKMqNKX9Rna/4Qj+ggLrhAPmlZOeMqHe6oretW9JBQGBd54GcijZVU65SbR
LEaye5H1okuCEDPRCAswRBpkpOss8ri0BZtWecDzQvorSKq6pIcOL9pgBccasjHQ
k4/d0bDTj4qR8S5iqYs7IChTSTKIpd5UUVYCyVuiVoVkr4j4QxW3/zvffr/RtxmN
GEm3qwnJ6S6Ug3GH6Fsp7rNSWOxlhvEhet54IqJpAWUsKtGL3nCOEQ21xM87qUsh
Bl+xjmYrHzwOokbIT6Ee1aB+4M7GsvVU1tO3sW/djawCF/LjdBJDa7ZBQTy6lhRV
tRaDjz8d3XII/RohT4aLokZOpGop8lMWohyjqv8tWgiCpq5jWtU=
=BnXA
-----END PGP SIGNATURE-----

--3/3ODl/4QwGFlK0b--
