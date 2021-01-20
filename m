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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D866C433E9
	for <linux-tegra@archiver.kernel.org>; Wed, 20 Jan 2021 17:33:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7544720705
	for <linux-tegra@archiver.kernel.org>; Wed, 20 Jan 2021 17:33:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727513AbhATRdX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 20 Jan 2021 12:33:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727202AbhATRZZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 20 Jan 2021 12:25:25 -0500
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87FBBC0613C1;
        Wed, 20 Jan 2021 09:24:45 -0800 (PST)
Received: by mail-qv1-xf34.google.com with SMTP id dj6so2086995qvb.1;
        Wed, 20 Jan 2021 09:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wpLYwY4KQWgYsZPMBMoJsrRYPiRKuEKmNu5PFFINAZc=;
        b=eGZNWqh3XLMsml2UiAAMdE9m0Z0YP46KcWrv1+T/BPYqqV2Ed4DLg1uZlA0A6NMp8q
         v5QlThq8b3bwXFxARJtbJpvtEmpxOM6fAKqoVJj/uXl29U75tFCddaO48PP5ha8IwrlP
         8PmIImbpwIh2jMDmJBEtB9Mf+ectvyKUDTrSUcDSp4iYXOTBWh7RaPiqX0Q159DSyrWx
         eJZUY2pifxYVEG4yehvqHAUXl3iB5GSDK7W9CCJD7tX7jtSyJZeXaBNRIz+zsGTRcF90
         fjrAL2H32Mn4hwUky4tSDvJSAmIvFuY3CPFpkG9zG+5RBxKc1S8aOxwu7ZXKkpvJqqzM
         Whfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wpLYwY4KQWgYsZPMBMoJsrRYPiRKuEKmNu5PFFINAZc=;
        b=ZOGQBmILOhaaBWKAlwKKxv1Jx2ka5OFjjDCsgYSEIqsYAMJQ7NIqWKbqRo9jg47A6+
         iTNHkBMjpi2YSmC2U1P/cn3K8umq4HmfE/D0uYOddDAN/6lAvffHBaF+Y/5KXfJ9BII4
         dbRf64Jk1UN2epYgNu+RkAZJgiV2T7FXt2y4fBqPKm483x+NkXyQh2NxKsAKtMC2Vdyt
         m58/NY0zZuIqsuNSyLEmwT0j/2sJ7dFq7PquLJeVVcpx7mV4GE4xLkiZyi5P7tdxdo+8
         le87lJLpWzpEXXx1Bi9JgNgAnJzj8DVTz6Peb4TvfEqt4X354VBtOldq0aCVMVWYT/dk
         BB9A==
X-Gm-Message-State: AOAM531bdOi2w6Q1fmUTg+lyAk6IQvcK68FmJkRv62H8aMz7USZF0Tu9
        d9INaxRG9YqL2I0xhgddXNQ=
X-Google-Smtp-Source: ABdhPJxdQdYmPGEIwfk8l8QY6Jjf8dOQu2LZDbxZKkKjHZf52EL26PAI4BcInMnc8eoTOn96/GHS2Q==
X-Received: by 2002:a05:6214:10e7:: with SMTP id q7mr10355551qvt.28.1611163484751;
        Wed, 20 Jan 2021 09:24:44 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id u1sm1608569qth.19.2021.01.20.09.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 09:24:43 -0800 (PST)
Date:   Wed, 20 Jan 2021 18:24:41 +0100
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
Subject: Re: [PATCH v1 2/2] of: property: Add fw_devlink support for
 interrupts
Message-ID: <YAhnWf9+fNajsNNi@ulmo>
References: <20210120080522.471120-1-saravanak@google.com>
 <20210120080522.471120-3-saravanak@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="9yw3Pz6qSi7tGVA4"
Content-Disposition: inline
In-Reply-To: <20210120080522.471120-3-saravanak@google.com>
User-Agent: Mutt/2.0.4 (26f41dd1) (2020-12-30)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--9yw3Pz6qSi7tGVA4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 20, 2021 at 12:05:21AM -0800, Saravana Kannan wrote:
> This allows fw_devlink to create device links between consumers of an
> interrupt and the supplier of the interrupt.
>=20
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> ---
>  drivers/of/property.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--9yw3Pz6qSi7tGVA4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmAIZ1gACgkQ3SOs138+
s6Eiqw//cKwkRmWofifYWykox7SXZWWTFItxcXFgPKHVHRM+5W2iatAjZI1/4NpT
BcWG8gs69y42u+cA4s5xZbSB8f4GepvGR48ls0QeOZI8cm93xQ1hyZGM5/DRy2EY
mNSZjOZYsx0KhjFpHrchXgKQIR88IxEQAVNvlK+pb8leSMw6oQ5OPE6BZOYNN1EX
q4j7S9dJYFChVXuolS6H1cSR2u6eaBOM+m3sTDyG6ePo4fPBlqcBB9RjVik+z58F
fUo9A+6w60dtAVQFvvbqMLA1IJaIF6rP7RAxZM1cBYPF3FB+LmRA+65eBzdQlr8a
WzaU685avtg3oqgGXsJqV8xvenxvnS2aOAUNrpRqZ3DlAsYYqunRBc3pkia8A/eI
MIl3IP4mGBDnIdR+RPuKk72a972mBHbBhNjteMmtE21hUkBTrYqda9t2AmzClYac
SLwL3CBT3a7y/iLiDTiVm3A5JOqSnISZK78x6Vhm4WyuDsYqXKJi1vyhJ/18FehC
lvwqicATFW+0ra0ASyScPlWLX3kKsXuCyi/g2VGuU+VAo/L3h3YtZc4tksntSURy
2iavrEs39p4+kq9ZGEZisD6tWhgkSSSYh4ngMTcv4t5PPr+xd5TFRRt2LuU8IFO3
dbjPQkzC8fEx4aBe6qRQOjhVAmyt7nYN+b2ANyGWru3laY1YAKw=
=ATda
-----END PGP SIGNATURE-----

--9yw3Pz6qSi7tGVA4--
