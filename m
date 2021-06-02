Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AC81C47092
	for <linux-tegra@archiver.kernel.org>; Wed,  2 Jun 2021 08:42:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 12402613D0
	for <linux-tegra@archiver.kernel.org>; Wed,  2 Jun 2021 08:42:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbhFBIoG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 2 Jun 2021 04:44:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229654AbhFBIoF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 2 Jun 2021 04:44:05 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D235BC061574
        for <linux-tegra@vger.kernel.org>; Wed,  2 Jun 2021 01:42:21 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id gb17so2639050ejc.8
        for <linux-tegra@vger.kernel.org>; Wed, 02 Jun 2021 01:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=o2VWGZw80fi/ORNN9aNTt9xwZ4Mho8m3zy0vi7dNfXY=;
        b=nLCe4bTY52IZ9f1ELod1EPP6noBoLKD7++U70LgMjxoB2bR/iIhUrSM943ZsH+ofmu
         SZie8h05bezf7J8VMZRMJaQc5PC+OfxiKowF6swWPD8JJ9jW2uiHeQ+QXGdxQGQh0PeM
         XQ9qIs4F39iP/czyDDWw/YJFqiS/cDy0Gj4efy8XXcgkxbHSaGrsPpbi/6XBd5UGNHFj
         Ucga3jLRtrGlUCuhykm/3FirHH00GLriA6uyPK6arZyIwYWjO3jLZu9B0KDseZxCLh3E
         MvZWrFMM8tOgOt8QsLj7hXgQxvbngSdKhArlnhRIlVtPGPVXJxj0IJ9m73ALA7057bwa
         OUUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=o2VWGZw80fi/ORNN9aNTt9xwZ4Mho8m3zy0vi7dNfXY=;
        b=KTPOkabZsVVzBUI36mvCqXZvwLMhqdUya0oI9qjaujqrVBwUrMVHoJEhOZ5fDEPsUJ
         FjkgtcW8zV5lOMPKPFqJwhxbmgLoRh9o9OYRCLSS7Vv6ISsx5UbDSJUyVmSsw72CPs3+
         XKA+660XvyBE/Nso1HNKfLct6QHVu4JIwyyHi0mUqe+aTDwv4gUFue05SYYXIHQLnFt/
         n/xAGW26wSEM4m/KYH6DUgpyXVs20r85CO0a8FGKC5sJcYhDDAT60Hkjvue+NCNJzZkx
         9V1fVJS+egj8LzAu1pDktw0mIxd6sox64LzOXUqrQ+NaKawGpGstXhkMifHFh3IoBbxr
         Uf6A==
X-Gm-Message-State: AOAM533BdI0XGSwNp3rIlZEg5ZA0VhUQRFhaRmXQEvrQZXiH69mdfCYA
        z3sDByMUlHpqqausBI4TeU0=
X-Google-Smtp-Source: ABdhPJwiFX+l5JLUT1A9I3QDlR1r8bGfS+ts965NMyqGTmnIAmG5df3C6FaP/RonAlrDNYxb1H1PQQ==
X-Received: by 2002:a17:906:5210:: with SMTP id g16mr33499211ejm.116.1622623340456;
        Wed, 02 Jun 2021 01:42:20 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id y25sm862336edt.17.2021.06.02.01.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 01:42:18 -0700 (PDT)
Date:   Wed, 2 Jun 2021 10:43:54 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 07/12] memory: tegra: Parameterize interrupt handler
Message-ID: <YLdEyoSOFIeAki7m@orome.fritz.box>
References: <20210601175942.1920588-1-thierry.reding@gmail.com>
 <20210601175942.1920588-8-thierry.reding@gmail.com>
 <9ce2210f-538d-607a-10e4-802ab849deb5@gmail.com>
 <ef9e119a-941a-cb15-0084-137a07cf0cf1@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Z0GfQ1CHflwURXnn"
Content-Disposition: inline
In-Reply-To: <ef9e119a-941a-cb15-0084-137a07cf0cf1@gmail.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--Z0GfQ1CHflwURXnn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 01, 2021 at 10:37:19PM +0300, Dmitry Osipenko wrote:
> 01.06.2021 21:53, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > 01.06.2021 20:59, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >> --- a/drivers/memory/tegra/mc.h
> >> +++ b/drivers/memory/tegra/mc.h
> >> @@ -135,9 +135,13 @@ extern const struct tegra_mc_soc tegra210_mc_soc;
> >>      defined(CONFIG_ARCH_TEGRA_132_SOC) || \
> >>      defined(CONFIG_ARCH_TEGRA_210_SOC)
> >>  int tegra30_mc_probe(struct tegra_mc *mc);
> >> +irqreturn_t tegra30_mc_handle_irq(int irq, void *data);
> >=20
> > tegra30_mc_handle_irq() doesn't need to be made global, it's defined and
> > used only within mc.h.
> >=20
>=20
> You could make this function static and annotate it with maybe_unused.

This doesn't even need to be __maybe_unused because it's declared in the
same #if/#endif block as tegra30_mc_ops. But yeah, I can make this
static to mc.c. Initially I had thought that this was going to be used
by tegra186_mc_ops as well, but we can always export it if necessary
when that work materializes.

Thanks,
Thierry

--Z0GfQ1CHflwURXnn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmC3RMgACgkQ3SOs138+
s6HnvxAAtNoU8iQ9GIyvOLXXag0pvmeRLISKyjMHGXaPo39Ejqx3/OT7QePRjWzD
YYDMU9kadlKQm6L0RKxA7ZOX2FcAmYdS6BYQmnacAetRNUnD1/TRszZ8XMYGIxYp
HW6dQ/PsDTuiLyD508dMF87rbqJZ06hI4vmxkIJQ+ELFk67jLDuY19A/a4p9ici2
z05Q0aYAyvKaYIXk1k1X8XMez9LqMdvdk09WHJi8yxMC6CCUrJDHyBszEGkLdTUO
mvctolE4HjoaxmJlZK/WeC4CSN7Wlp+Gi5HeZCytYnpdefgSayaoPnvXEjOSL4C7
XifDqtaAcJhuvKfQzG5E/G8WSYHG40Q4/X/puqUmyFGvE2Ncz/kTa9uy5NpLe0Mu
rkziNXqXLQoOBtn77suwrubeT3SAJGQe7BbKBQ4YidndCH3aX2UewxsePeAQ9Uph
M19NGCBd/l5HESVTV1Ek8t1bMxoiV61lIZLvJAZGcHAnKyEepXV8ly7Y+bZ2Haaw
wPYPZC1qZZ3AXAxEfdKcUg9b/Lm8N0Eq36rxrlu5IrjXCUoaG1UhTorlh/q9A76a
P/EQNAN/ww5i/MDi2GCfm0KFo3Bgfrh5+jbY9OZKmY/kD0qhdU/kn1W2RK+KuCAd
m8hnhuwL8xLjHIqvmNClGEQgHrn4VbVWhiRpQp0uYto3IZVo5HQ=
=Ag6Y
-----END PGP SIGNATURE-----

--Z0GfQ1CHflwURXnn--
