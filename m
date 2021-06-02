Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42296C47092
	for <linux-tegra@archiver.kernel.org>; Wed,  2 Jun 2021 09:05:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 28D67611BF
	for <linux-tegra@archiver.kernel.org>; Wed,  2 Jun 2021 09:05:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230264AbhFBJGy (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 2 Jun 2021 05:06:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230145AbhFBJGx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 2 Jun 2021 05:06:53 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF0BBC06174A;
        Wed,  2 Jun 2021 02:05:09 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id g18so5813edq.8;
        Wed, 02 Jun 2021 02:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=UPjJ+Xb/IPe8pQPzEHkVZDRwhuI4BNPAjDSbmUBiWK0=;
        b=C48RQJmJAtd4uOk6nkxwpndWiwOB3NmwUxkeVK5Bd0WOJWVcR6FpsM7agf1QworTJm
         kkhTyUzQYf7AeZb9SOLYfnb7EfC+rs9+pu65ZYtigfxM5gf57wPJBia5JF58ADC/0MfP
         dzkU0vnbXb2A4NILKkGFg0QoCpggjQ39LzpMDQKTGWQb47IPTAzrSGxod1kOiU+XlRfi
         e9PFEOYnn/iFY0uMvRGor+kvyZwVKbjRSmZf/PzHCSB9VsNx+fWIDV895dZivDqcyxv9
         4xXDORvnAUE/EGWxXvc/o8jZui5sLse6oNNw0LnfXEn5qf0VT/TLl65Q0Zh0+GrCgyDL
         +YPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UPjJ+Xb/IPe8pQPzEHkVZDRwhuI4BNPAjDSbmUBiWK0=;
        b=lgK0X5pxwQ6rES5+MfMPz9HlIaIvkPFT60dEHDjY+fkQUmiKHrm4llRFwRWVHF67SC
         d1zWNoP0+FsGTZZOPGOP8GPuPRQdeEBTGLKvOfjgUCZ9kirPTOgCT5rz/DvZlq/dPckB
         NrKdhD6mdtGMB4R8mWztWniFaTwKOOWaAvHHzhpnjxdsM7g1A96VvEtZTmcBNzhIk88C
         kp6GMLxJgvUlexscoXdiNtVrxTekwIBunjwM2qFiL4SyzZuYwprrN8W65RUhozVG0kSl
         ok/CMPTpvKgZjJgO6bU/hdb4YuhpiqUEWoEXCqHhPFHN/pbl6BJYZJE+a3Nak6gahrO5
         X4yg==
X-Gm-Message-State: AOAM531JMI5hLDVI798v7m45WTFKAT0j6fdOaArGtZhAiq8vFrb3TYp4
        WFq6FYYDsfV9l1pwbMDBwzY=
X-Google-Smtp-Source: ABdhPJxJE/zSSZ+HLNiWD6Xj7xK3sL+zpdcPs/dmbEViW4cvOWW82ieaLYXQN4ylGZnxlj7x98bl5w==
X-Received: by 2002:a05:6402:1111:: with SMTP id u17mr37633778edv.87.1622624708541;
        Wed, 02 Jun 2021 02:05:08 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id y9sm887281edc.46.2021.06.02.02.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 02:05:06 -0700 (PDT)
Date:   Wed, 2 Jun 2021 11:06:42 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Yang Yingliang <yangyingliang@huawei.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, jonathanh@nvidia.com
Subject: Re: [PATCH -next] clk: tegra: tegra124-emc: fix missing
 clk_disable_unprepare() on error in emc_set_timing()
Message-ID: <YLdKIqyqaOwlXw9v@orome.fritz.box>
References: <20210518044247.605370-1-yangyingliang@huawei.com>
 <162262068754.4130789.12258910664512101759@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xNOpmisMFYQeyVNT"
Content-Disposition: inline
In-Reply-To: <162262068754.4130789.12258910664512101759@swboyd.mtv.corp.google.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--xNOpmisMFYQeyVNT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 02, 2021 at 12:58:07AM -0700, Stephen Boyd wrote:
> Why does the subject have -next in it?
>=20
> Quoting Yang Yingliang (2021-05-17 21:42:47)
> > After calling clk_prepare_enable(), clk_disable_unprepare() need
> > be called when prepare_timing_change() failed.
> >=20
> > Fixes: 2db04f16b589 ("clk: tegra: Add EMC clock driver")
>=20
> And then the Fixes tag is for a patch that was merged in v4.10?

To be honest, I'm not sure it's worth backporting this. The probability
of this happening is very small and the worst that will happen is that
the parent clock may stay enabled even if it doesn't have to. However,
the parent clock for these is one of pll_p, pll_c or pll_m, all of which
are usually sourced from other peripherals.

Yes, it's nice to fix this, but I don't think it warrants a backport, so
I think I'll just drop the Fixes tag.

> > Reported-by: Hulk Robot <hulkci@huawei.com>
> > Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> > ---
> >  drivers/clk/tegra/clk-tegra124-emc.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/clk/tegra/clk-tegra124-emc.c b/drivers/clk/tegra/c=
lk-tegra124-emc.c
> > index bdf6f4a51617..74c1d894cca8 100644
> > --- a/drivers/clk/tegra/clk-tegra124-emc.c
> > +++ b/drivers/clk/tegra/clk-tegra124-emc.c
> > @@ -249,8 +249,10 @@ static int emc_set_timing(struct tegra_clk_emc *te=
gra,
> >         div =3D timing->parent_rate / (timing->rate / 2) - 2;
> > =20
> >         err =3D tegra->prepare_timing_change(emc, timing->rate);
> > -       if (err)
> > +       if (err) {
> > +               clk_disable_unprepare(timing->parent);
> >                 return err;
> > +       }
> > =20
> >         spin_lock_irqsave(tegra->lock, flags);
> > =20
>=20
> Looks correct to me. I assume Thierry will pick it up for the next merge
> window.

Yes, I can do that. I've got a couple of minor fixes queued already, so
this will fit right in.

Thierry

--xNOpmisMFYQeyVNT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmC3SiAACgkQ3SOs138+
s6GKpxAAuesuCLZB+eIUpak/TE7XduGdf2+ojeeewKxlhqLuAhklZUqfOu2UU/r6
uSB98Rbq21cjwHrkdPxgGfV1FoGZqm4VpY3cBEABWOTmgZQJhsOOPsQPX72RF8b8
ogjXli1BznABlN9LYDbf80NJnirFq7Z67e837/ormYq69Wz0Vm9RjGI6gATxB2CP
FJRrg831A/RBxaadhVJAm8dXbHp7Q3hk+Mg79GBcGcQEfm/ebr1RknVBeXqOPXHL
/stQRUlQiHxphM9J5VionfJYZegaHBdHN+zWfoCFbdxYPVH9F6t7f9PG3nKTaDvR
nQKyT6o4f+SB8jfAhvQ9q/coVY6VLzj/FxtZqMcUgwpabnY3NV4tkqxRfdg+IJYD
wttTBeOgoYCRgCBaiOT6RE/s6eBeGAkEDS7/CZrikDvfD9Ky/pVptdyZ4cWiqkB+
ysKn5Y24W5NEKoh6e1ZtJkItOLrtuwLaQxdw6/6ku7t4uuYeF4co0t90xehQuxVq
QImfmpVY5Al19fmlSpdRd9l7G06MaMgRKWjs97n5ZXnTqiasH5iKew0EyYMpUx2U
AK8vzkNegtwC6xt9apskwxW/PiVGpfdbarVIGvMDXuyA62kD+txDKaeiyze2XJZp
42WYOEWZDG08UPBndnOmPXs9pg6+iE1Ewv1H1C+l9Uw5ufLPo78=
=tsva
-----END PGP SIGNATURE-----

--xNOpmisMFYQeyVNT--
