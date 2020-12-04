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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08E29C4361A
	for <linux-tegra@archiver.kernel.org>; Fri,  4 Dec 2020 11:12:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BD712227BF
	for <linux-tegra@archiver.kernel.org>; Fri,  4 Dec 2020 11:12:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726014AbgLDLMF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 4 Dec 2020 06:12:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725839AbgLDLME (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 4 Dec 2020 06:12:04 -0500
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E45CC0613D1;
        Fri,  4 Dec 2020 03:11:24 -0800 (PST)
Received: by mail-ej1-x643.google.com with SMTP id ga15so8129389ejb.4;
        Fri, 04 Dec 2020 03:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xnaHGe/ZuxSqBmGctMzyZL4ITR7AeciIssYQdgeiTiE=;
        b=Izo9zFmC3Jet2SaZFSA0PfAeG9x8ayklzFrBHtggksXTDmyOVpsG0r8Hh0uMlMeW9m
         FNxBpyspEAIAilZyE6qGRf3b/la4Nt3s1oD3jftVy1gncDwdX6EZLUWOYLZLxbx6/63n
         MyifPp3zf2Ki0jtqjN1UqgXwOheHgaSW9kwlJj0ETmDn+NEXEfs8FMkJVhhIU5nbtQYb
         pGNxMwwWtDK4qaVf7c2+f0PjZvM74aEoNL2l8f7XbMIw7IOyTSyb78A+0LE0Usek9VgT
         SYMCTeAv+UWItuDQZzwUd46KVjt3Xyw9YplUrq6Mpjni0EwaMnghBi70ElVhop/E28JZ
         7Osg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xnaHGe/ZuxSqBmGctMzyZL4ITR7AeciIssYQdgeiTiE=;
        b=bo7FGqsD6SEqRCKfC9VEJkujk5TW1DevuEBxs2mUGL8rjqEOaIErzGucEsE2pk1XvE
         4ck5Y5HyGZsm+LRO7DWz0Nn0+mhlsMwtKJrmRoKfMwHQ57NoAeJygIkFce7bFRFscHsN
         qCWizVYLMJSgFxCJbnVaN38UKPZ28/keD8CdQyXhwht5Z+QGSMOvd8uJTQgL4uVzWyrN
         Entwslm3VNclI0oj99OHEYVWBm5AgpTiOVZmQWW31v21EluUIDlwl71mPlDT8D+dNJLe
         8uyv9jNwFmaKCry2fjhQhBjNx6jpioy2Qm+s9OsRs0Kb2G3JYpfhkQZNWB1ZMvkVGOAQ
         WZHw==
X-Gm-Message-State: AOAM533yYlCxSQu86n90AZ/GuPHBgBV7cmYvxwRzxXYF8ZOONIXsBAQu
        bFskM8m2uJeGsUwiCIsP7SY=
X-Google-Smtp-Source: ABdhPJzK+9oEpwGONVRbN8en4DTehED+iOtvvDaJIgXEjsRZS2FNBl8zBcBnxy471rRc20EQ9DStDw==
X-Received: by 2002:a17:907:2122:: with SMTP id qo2mr4474939ejb.539.1607080283075;
        Fri, 04 Dec 2020 03:11:23 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id gl2sm2798257ejb.29.2020.12.04.03.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 03:11:21 -0800 (PST)
Date:   Fri, 4 Dec 2020 12:11:20 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: tegra: bpmp: fix T234 build failure
Message-ID: <X8oZWMhARPcieFW7@ulmo>
References: <20201203230625.1480626-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="BjMOgQ6UjF/35Sbo"
Content-Disposition: inline
In-Reply-To: <20201203230625.1480626-1-arnd@kernel.org>
User-Agent: Mutt/2.0.2 (d9268908) (2020-11-20)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--BjMOgQ6UjF/35Sbo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 04, 2020 at 12:06:20AM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> When only Tegra 234 is enabled, the bpmp driver fails
> to build:
>=20
> drivers/firmware/tegra/bpmp.c:861:51: error: 'tegra186_soc' undeclared he=
re (not in a function)
>   861 |  { .compatible =3D "nvidia,tegra186-bpmp", .data =3D &tegra186_so=
c },
>       |                                                   ^~~~~~~~~~~~
>=20
> Fix the #ifdef statement to match the location in which this
> symbol is used.
>=20
> Fixes: 0ebdf11699d0 ("firmware: tegra: Enable BPMP support on Tegra234")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/firmware/tegra/Makefile       | 1 +
>  drivers/firmware/tegra/bpmp-private.h | 3 ++-
>  drivers/firmware/tegra/bpmp.c         | 3 ++-
>  3 files changed, 5 insertions(+), 2 deletions(-)

Sigh... I wonder if I should just give up and eliminate all
ARCH_TEGRA_XYZ_SOC options. There's not a lot that we gain by keeping
them around and most people will be building multi-platform
configurations anyway, so there's very little point to it.

Anyway, this looks good, so:

Acked-by: Thierry Reding <treding@nvidia.com>

Let me know if you'd prefer me to pick this up and send as a follow-up
pull request for Tegra.

Thierry

--BjMOgQ6UjF/35Sbo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl/KGVgACgkQ3SOs138+
s6H7Sw//VHbPPlHeGAiLDPwKNTRWcINdQlK2htbX3GrWI6nW7lYc0GftNPHJUaTq
tQ0no2qyhgrTnvJgw8wfcP4/gYwPJpX7FNMcv9aA37+jzX4oQLJ0Nk7zvEaz1AOJ
CAjVMZVhjef6jbNLRzpO60ZsfHZtoPojSpV24ki8QAGdJSJSTUcyxVZ80/8JVnGo
vSr2YEI7Y8VuwVIsaZgWyAGtW15DlFTnuZeBVijdLcThhnUa45YXZMfHBwemTCZQ
yC5d3fnYrCP4vKl46j3vEzMNnQy3xcX0oJKP4xvkW4PDldCFR1pALSgwJnIzx2al
OdgSTngS7aC/0LJWaNxfOy5yDDqt1tW+RUjNChwcRIEKUjA83FHPZxfN3agql/89
twMYJQ9vgVyqfiJY3uzXjX5qOVvq8aITjgszSIKrnouAZVBTMoLvKnO46qhBJShD
9aYzJRmL9L98bwg1eWPbFAXryNGbvRSP3847LWthm1qUAa10FrhcOxE6wnxCFdYp
2stHmGU/fshmZCRDLTQW4TKczkorI7D1ekn8E49Q/Rl7tnNhbN2pa3EoblYvY4EJ
9HFMA4/NXLAelSvsQd1Yzj9bdaxDg+ZtyOzZoMQm7OIPt1BwTU7rhoJ5hFJfyOWO
9+gOENtmRuNbOLwdobktBwjcTDUw0wPZRV8nabDscaUA5pJ8CoM=
=4cb8
-----END PGP SIGNATURE-----

--BjMOgQ6UjF/35Sbo--
