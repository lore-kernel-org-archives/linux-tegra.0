Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75B89C433E0
	for <linux-tegra@archiver.kernel.org>; Wed, 20 Jan 2021 17:33:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 456C6221F8
	for <linux-tegra@archiver.kernel.org>; Wed, 20 Jan 2021 17:33:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726920AbhATRdM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 20 Jan 2021 12:33:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727513AbhATRZC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 20 Jan 2021 12:25:02 -0500
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B50AC0613CF;
        Wed, 20 Jan 2021 09:24:22 -0800 (PST)
Received: by mail-qt1-x833.google.com with SMTP id o18so7138691qtp.10;
        Wed, 20 Jan 2021 09:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QHGxCrtWj1JMWVn1PV7IKwxKRhoQXxqNmdVqNw1canw=;
        b=kjr59o3afGGwKSLLD1PXHcn1hlF0tuSLZI5cRO/0CPg/reKzx+ZnIxdKMIoq2J+FHM
         9H+fl80XPaa2NncZMusZBaWdm7bqn0C0OqmBloVCw6Fw3TwTC104Y3GzEXs/YowhZb/t
         XXIC+nPehiSyGikka/bpWVKbNJCsL9P3+Jr6ajcsCsD/0AEspMmSuAVe6aUA1avVglub
         qMupdhxnPZuBLTKZi89dP51m4sj4gYeA/OzY35S3ISWWRJQWrW6FiUrMfZgboy1/lq49
         AB7tKAiO5pSZyg2haypmAtrvkuiQeN5qtjgcIOkSxUttPKWtYL4EO9FDdidD1G3Mf+OG
         Qzlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QHGxCrtWj1JMWVn1PV7IKwxKRhoQXxqNmdVqNw1canw=;
        b=naaUDVgD2UtmOkpwK5FQp4GxArzvviugsJFo4VhAkKitfopGxT4G78uEPKzw13h0R1
         gXNSkex5zzFWu2H9HLe9G11j9fvXA4ijI2FuKwdKQqSEcxIJyvOogq6H4M9+VAj+6nZw
         JWCG2T9bAkjKFA65nYxk5GB5yo5QYF6zPv9M06RkAVDpdU4OYs45eNhjZEfW5xKgkAmM
         pA0AdlxJFhR1Wu704USZkwleceNJV1PnE7zvjhNJjTlTME6Qb3a2sP8YY/JTZT8G7CnS
         +oMhQjLTljW3shkSD0TeTvL8i91PpYGsK1rbHTtq6ZwKLkBEE5tx64L6ye31hd55g7eU
         i6Ew==
X-Gm-Message-State: AOAM532gtA+43PVizGVjlHXOjMa0kNkqdYP0lqPCfOPBGSDyWAbaPOyu
        JZBu2FjB3VXz0f9hNkXN+CU=
X-Google-Smtp-Source: ABdhPJzWRcWqEGULd33QwmIEXWdCtG/rHx79bLVCT6LWLGrMzLGo3dVLazphPv2N5hr5DPJ4Bm07DA==
X-Received: by 2002:a05:622a:90:: with SMTP id o16mr5255432qtw.49.1611163461791;
        Wed, 20 Jan 2021 09:24:21 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id h26sm1553183qtq.18.2021.01.20.09.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 09:24:19 -0800 (PST)
Date:   Wed, 20 Jan 2021 18:24:17 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Saravana Kannan <saravanak@google.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Marc Zyngier <maz@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>, kernel-team@android.com
Subject: Re: [PATCH v1 1/2] of: property: Add fw_devlink support for "gpio"
 and "gpios" binding
Message-ID: <YAhnQbORCTJM+FLI@ulmo>
References: <20210120080522.471120-1-saravanak@google.com>
 <20210120080522.471120-2-saravanak@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="pCZppSPUrQdyYjcn"
Content-Disposition: inline
In-Reply-To: <20210120080522.471120-2-saravanak@google.com>
User-Agent: Mutt/2.0.4 (26f41dd1) (2020-12-30)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--pCZppSPUrQdyYjcn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 20, 2021 at 12:05:20AM -0800, Saravana Kannan wrote:
> To provide backward compatibility for boards that use deprecated DT
> bindings, we need to add fw_devlink support for "gpio" and "gpios".
>=20
> Cc: linux-tegra <linux-tegra@vger.kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Fixes: e590474768f1 ("driver core: Set fw_devlink=3Don by default")
> Tested-by: Jon Hunter <jonathanh@nvidia.com>
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> ---
>  drivers/of/property.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--pCZppSPUrQdyYjcn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmAIZz8ACgkQ3SOs138+
s6H8Fw//exdiPxcZEHUstRkaLWDGfkyaqoNUjcXBm4sI/X6+A+X8vRU6oxxj2jzK
x3XgbzhjLkp442DZtMlOgS5yYlkxAWoKyyleroeCE1CS7Jcfl7EeL3dp4ggflRjg
mb3/zLG4VYvsIX/859RpnOW8APr9d1/AcRQPvuPX9+7TdO6u2n+HVp4A3bgvhQvo
hpdazA/S5Jp2UsoQuc8DQGu89QV47TCjrztorp6js5Creh+OX7cc6/BPAv7s2SIB
9Dr+cVIXhVwkruq6cBNS77J6ZunRyeNNzyhlAYPtBqSNMAMH2PBwal5iOCMoY9YH
9f+4jTIGnakEKA+eWkeSfRmt/9BqpPEbk7W+ACskXupq9dB+/Dtp2sU1JvZDIwFX
NCvQaRSmXSRObs3YlJplauQ5uNmG5zvWg8y6es9s9lMRUVJkZHJl7sBSO751B3Qb
RXb5P5Ip8n0pMppl8SHAt2E9ayBcz7ZvJwC1+dNtRUM3K/ShDCicfnbO1Y/Tvy/l
sL1IaCqGrQfT7A02LpVSBVxBFvXEGxreSI3XmET3UOx0jtwcSYIFrnpMKpNKB1Y+
gUCGfUdvZRdqazUhYiEbgK6GRdOpfVFuxxSbvU7ia7gU2wjP6AwideiLRkUkGNge
S3P13nua5DiZtx+D1g9zg3zqmAQTJPaiYAi6BADk+eQH8oz6XeE=
=NGtr
-----END PGP SIGNATURE-----

--pCZppSPUrQdyYjcn--
