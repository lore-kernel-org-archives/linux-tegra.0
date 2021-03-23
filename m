Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1000FC433DB
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 16:50:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D94A2619C0
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 16:50:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233186AbhCWQtv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 23 Mar 2021 12:49:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233238AbhCWQtY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Mar 2021 12:49:24 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9B0BC061763
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 09:49:23 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id w18so24287331edc.0
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 09:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=iIst2vNUuR9o1HS8SwPrAaScoswSlCZZ25v5hTCN338=;
        b=KvK4BWg/abYVDAS6lhUQLj0Mh49P6oKeGYyJKr+u4XEMSGrdCFC3EFn390dqyiVWTY
         u17CuDCkEtxYsUULX7IvtJgLiPYleWNL37H+MOenDj6BwQBEvr2duevSaJJQd+fRy8AU
         HixlSDg+DHtRJvv3sK5MkdFjns9H5YwMJk5JrCY4N3NMuvEIlbj2NoTLJF6hPsOLiRq/
         0KUAi7Op7xy8ptVt/HCX36rE/YrhA656Zv4Lb5V3F+W3cwVQtb+Sb+t1b71HA8TqN3Fg
         Dcc6iqgojZxiLuaEQA0aS7Q5QELzoPP2RcPUFJNZdOokRffIq2bVxD+ZK5qOxHJW3L7g
         sqoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=iIst2vNUuR9o1HS8SwPrAaScoswSlCZZ25v5hTCN338=;
        b=XlIQYhM4jjN52gpJSGOallxq0uoYVLWgjuLC7ze5ldwoFFKPGrJlI6KttC95nCxDMC
         99iTUY7R3gyVBelqRiqwPHOSC/SWyYVK4+85xAqjpdJhoLh5+RFaFFre3eRf24SMi9Jk
         +bCtn38GT6t607uN7p+1Fb8Kvbip6899J4y9HSq2f2AEkyq/5wQivABJ8SHzrDmdbyQP
         JjgwBEcz8LNqbgkaJhT8u+Zf0r3MsPrC2zN6YWj+9GRt0T7DM/8wKgsQf/99hlbpqjG/
         c86s4OtEyqy1r3Z3fM20OQWHuDWfUZM4VGrYudHxTlC93gq0fsJP6gJx/S2kzwqzeoDG
         toLg==
X-Gm-Message-State: AOAM533Hlj0tYLrRG669cUKZ/klnavHJiSj1d4AcB0xhb1Yhn8XsUml9
        hRO5SsJYOyJK5ayMaXFDavw=
X-Google-Smtp-Source: ABdhPJyAroDMsy9lYDJuW292LQrc5eHTY4Tj7ifSEn1o8ZA2ls+EEiXsQJkuM8GhNfbd9J1GLnOo8w==
X-Received: by 2002:a05:6402:1c98:: with SMTP id cy24mr5494989edb.296.1616518162361;
        Tue, 23 Mar 2021 09:49:22 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id u59sm13706511edc.73.2021.03.23.09.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 09:49:21 -0700 (PDT)
Date:   Tue, 23 Mar 2021 17:49:42 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Simon Ser <contact@emersion.fr>
Cc:     David Airlie <airlied@linux.ie>, James Jones <jajones@nvidia.com>,
        dri-devel@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/9] drm/fourcc: Add macro to check for the modifier
 vendor
Message-ID: <YFocJrHaB3N1Gudt@orome.fritz.box>
References: <20210323155437.513497-1-thierry.reding@gmail.com>
 <20210323155437.513497-2-thierry.reding@gmail.com>
 <cEyRtluqBdulJxqLBLGpza4_rFKfTtmboo04l2mUFzjOcxGcILAbxPsLVmqQrMrAC0--VT7V_9rgVtvgbW3jLejGf-V8gpnMO10QHK9GtSQ=@emersion.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="EnrfyH8bJj4R/c8p"
Content-Disposition: inline
In-Reply-To: <cEyRtluqBdulJxqLBLGpza4_rFKfTtmboo04l2mUFzjOcxGcILAbxPsLVmqQrMrAC0--VT7V_9rgVtvgbW3jLejGf-V8gpnMO10QHK9GtSQ=@emersion.fr>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--EnrfyH8bJj4R/c8p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 23, 2021 at 04:04:35PM +0000, Simon Ser wrote:
> Can we instead have a macro/function to get the vendor? This would be
> useful elsewhere as well, see drmGetFormatModifierVendor in a recent-ish
> libdrm patch [1].
>=20
> [1]: https://gitlab.freedesktop.org/mesa/drm/-/merge_requests/108/diffs#9=
1ecb12b27c7154b26013bb95e17a5cc24ea443e_947_947

Either way would work. I chose this because it ends up being much
shorter than extracting the vendor and comparing to the constant.

Maybe we should just add both?

Thierry

--EnrfyH8bJj4R/c8p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBaHCUACgkQ3SOs138+
s6G/LhAAj35SCy/UYCTDvzLBrqVrHxBeQuXbVxVmSD5jF7SB8/uaUBryWKp1N8bO
je+9gjkk+UHaeEcbCn6ChZWOGKEP0+5Hwr9nj6tDB+d1M5xkXFYmuyzZgGaoJYTU
+GWX4BnmePGH6IFWQpGNi6WbJXdRp4hZa46cgvCK3JhDrju+1ypUy9bXpu+oZOxW
TzmeHUUUoNpCAHK8txuLCwcTYqxCpHcosGMQHVOfPKp8Els9hK/cQAQCW7fSrfBU
097/oB3XudGZnpzjlQtIJ2DP9hEzMS+Fyg/fxoc60RqnluxntwF9mZd3uZJB+xzJ
UnNjwxOyXWCF1LsJwmLKWJLcPEC/h3Bz+MlGxj5C7M+8k55+luOQdy80JthPDU1b
hj2OYsiNDFzBAc7lvk9HKMY7IMbIfWJzrd1/gipXDthT09En+g4P3kD66tzt1CBi
aKOHEmp+lUt9Yt/cL1mE3QZggECjlQ3JshNHMIofiPGeD63F+xdF0dh/yKQNGvaz
tsWCKlVA8ROIoCbm4t2ZUR6W81KmFv9eUDAPjeVLNnuwnJedgdCncApLvRNzGo/g
DvwsGigR76XawoQNTkDLi/lr7LejGWtb13k0ATm0an4cbXgp1YCTEbfEKUhmjNqW
2miDOv6s5gYDRtm41IMBmJrFVhRf5/e8itlCNVIEQihXaAvsz48=
=9b/f
-----END PGP SIGNATURE-----

--EnrfyH8bJj4R/c8p--
