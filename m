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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79B95C433DB
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 14:42:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5327E61A23
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 14:42:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231146AbhCYOl7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 25 Mar 2021 10:41:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230406AbhCYOl4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Mar 2021 10:41:56 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DB87C06174A;
        Thu, 25 Mar 2021 07:41:56 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id m20-20020a7bcb940000b029010cab7e5a9fso3239641wmi.3;
        Thu, 25 Mar 2021 07:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=GdzCq3T7om+pz7j3QFSfZ1tOXdUKrpb/92e4E3T8X/I=;
        b=sEX8x2yXmoK2+jNeXGqdrLWtGN8XkGHih83bo6i4pWoDgm315ZiLPmZLEkutLlcgRS
         BYHXUTbEzgCOKDmPW8znEBAzCNw3+b9o/mLm3CNDFYzXZsDVm7tTwFigT5XBr6FyJLMh
         C6JuSVw90tTcsf0XakBET4XeiNMcwiJ/+GmAzLWPAJqXqUbAKPDe/ZWqGHv9w46VJuEw
         +wf6B6XaOT2POfeVL9xmPkMhSca41fMyoSp4jx8Vj9q8DMDeaYZbYG7Wgnj/XSG+qMvo
         d5CU1OQ7P0IFo0c19ogxitd+irSkYK5+4nqfqJcCQ2/9zxEQeOWaNrlsTSMLkjlRjqC9
         B6Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GdzCq3T7om+pz7j3QFSfZ1tOXdUKrpb/92e4E3T8X/I=;
        b=oHtUIU8a0ItogdSoP8NGhbeDFvE3FgbEd7gah7fQ4opxXYHQPY68k3SjGGX9Iql9RA
         bAVfhbQ7GwWLnHXsUSmBHrPwW+FElctkkOmUmCJlO9077Vt2sbcK+H8kK6OkXpdobobQ
         u0/5Npy5gMzshGkq0iud1H7oIbAPfbZo1DoHGIW2GBtHoVNfFf92/7MIxwELif5X9KRO
         pfyqy5TYP33ReraGXyMx0FTvBI+0WkdLzcOw30Mg+Wpprnia13VaNlPODfh/6J/jnCf2
         l/bvxnMYvzvUp8EHuqqnrSap35q6vMyDHxcIiieP7GWgRVOosnhkcUNjRjmTEIDXoWxT
         bZ+w==
X-Gm-Message-State: AOAM531NoMsVy9+ocB+fzm2LA5KNFW7gk3M1Glaqnmsz5idgCrQn66TI
        ahM8vZHQ+F4lcIGQx+LdKeY=
X-Google-Smtp-Source: ABdhPJySZkKzjV/v8FlhtQAHJjlx8GmO+AH2O1lmpuklKLuQbbCNqUFB/SVDO1YCUPGnF910Ooyt3w==
X-Received: by 2002:a1c:e041:: with SMTP id x62mr8195659wmg.95.1616683314744;
        Thu, 25 Mar 2021 07:41:54 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id b15sm7506572wmd.41.2021.03.25.07.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 07:41:53 -0700 (PDT)
Date:   Thu, 25 Mar 2021 15:42:15 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/5] soc/tegra: pmc: Rate-limit error message about
 failed to acquire of reset
Message-ID: <YFyhR1XgFGzJkkLt@orome.fritz.box>
References: <20210302122502.20874-1-digetx@gmail.com>
 <20210302122502.20874-6-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="RJVjZmigLjAB8zEk"
Content-Disposition: inline
In-Reply-To: <20210302122502.20874-6-digetx@gmail.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--RJVjZmigLjAB8zEk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 02, 2021 at 03:25:02PM +0300, Dmitry Osipenko wrote:
> PMC domain could be easily bombarded with the enable requests if there is
> a problem in regards to acquiring reset control of a domain and kernel
> log will be flooded with the error message in this case. Hence rate-limit
> the message in order to prevent missing other important messages.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/soc/tegra/pmc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index bf29ea22480a..84ab27d85d92 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -868,8 +868,8 @@ static int tegra_genpd_power_off(struct generic_pm_do=
main *domain)
> =20
>  	err =3D reset_control_acquire(pg->reset);
>  	if (err < 0) {
> -		dev_err(dev, "failed to acquire resets for PM domain %s: %d\n",
> -			pg->genpd.name, err);
> +		dev_err_ratelimited(dev, "failed to acquire resets for PM domain %s: %=
d\n",
> +				    pg->genpd.name, err);

That doesn't look right. This is a serious error condition that
shouldn't happen at all. Ever. If this shows up even once we've got a
serious bug somewhere and we need to fix it rather than "downplay" it
by ratelimiting these errors.

What's the exact use-case where you see this?

Thierry

--RJVjZmigLjAB8zEk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBcoUcACgkQ3SOs138+
s6FFhhAAtIJuqjxGYDFRf1CJZP0iY2TPW4F7PvvDMsjmFbmqZuYMORvoE1+qV4MO
5CkG/3KCAYMhdxrIB6eTz5C6latwUGHvrbW3VjYaDr9843aF+qvGSq0I1BXN5Lqs
CkZVtg04DpMYopyoNJqDh4PcYF/+AdI1vSNm+m6z/x9FAbQJdH5yU/4pPFAR/SMh
IEu1Ku0r2z904Z6H2yY+BaodLTV3r5QUQXdZ05ep+/JxeluHipZ91mnuq/XSyC1V
gkuqesTGfephbUTZFWg8qUifEUfj8Z7V0Tzcvha5zyawNWVJ03caGvtwDPbeLkv+
g409K2hT/ubkT4PQTSkO+f3u9Ez3qRy/lD38kJGhuHuuXn5EZ2vRfapsbUQ+D8YJ
QXUIbkaxBfhqO6mYcpT+Pm43C4tzaxZqo6047aKQqTVdsYDbvvdRDuLUoZeYYUSU
5MtUVYjrAP1unFdqOfDvU9uymjpHYF4PImTEBrPd70XkqPDYR68QMHJG/Ag8GaBP
JkyPyWfaIrjKjsgInut3zmNGCcqL4k9LT9HUJyuwv1iUgEIsICn49lxclp+Tat1C
Jog61+Z4oDPpOOJ3NpZnA6fb28eTKVOFN06vOVaHcuJcV7pMRzHI0EhfHT0t4n0H
MKREKdH6aV8SfKqC+6WwoV/T49WZEmXMT2oX4qJvI/+TkR3mhcA=
=WO4j
-----END PGP SIGNATURE-----

--RJVjZmigLjAB8zEk--
