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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FC3EC433E0
	for <linux-tegra@archiver.kernel.org>; Mon, 15 Feb 2021 10:28:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4FC7F64DFF
	for <linux-tegra@archiver.kernel.org>; Mon, 15 Feb 2021 10:28:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230208AbhBOK2J (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 15 Feb 2021 05:28:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230219AbhBOK1l (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 15 Feb 2021 05:27:41 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEFF6C0613D6;
        Mon, 15 Feb 2021 02:26:59 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id v1so8224987wrd.6;
        Mon, 15 Feb 2021 02:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=UjqtMJ/BPQOo38rVa7F/L+SU7hZ/Rce9Dqnw1PVPXeM=;
        b=fJbTkrV7F3MwrD5/oI9C62wtXakxZN5dtv3K9UqDoPDVqy36ayjVqyTn+Al7EUhC+n
         Uk0BARCJ539ABJsH11EGVhfnpdpp/JR9AGtWfBvHEu5kAOolBJMEEs4+OOk6Ns7QMdsV
         ZkJhzI5h/JUo+/S8rRGCI3U+9o9IRVOI+1k6hmcr5+pOLr3977TSI1Hl5/X7/GRhnCXg
         8Rf8K4XmhR/mYKUwRsa62Fe/HKdFUC2Vm9xcQbgyIDRCaiJOc+pAYzbcmE2uh3No8Syw
         qg5pZ3HND0GBPXFtsIrwHcWXzYmGi7nudwOvLX5KiOuSvaS63a2mzLY9HFYVtZGv1+w5
         hgDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UjqtMJ/BPQOo38rVa7F/L+SU7hZ/Rce9Dqnw1PVPXeM=;
        b=LTjm/t2vTiRuOLzFV0L5PYzig9xwpwHmLnW+GoKxt+rrKVIKxdJbMVKsp/UMSKtQUt
         JnB3HotEN06Z1vreAYe+7zOzQboH+U+x7YINvS2C4hH+BVHH6gG/oz6hwNI/oMMCcMOg
         nnJxN0tl07rDFk5A5y/FS0JRjQbUq9t0NOU/sPdbYHufJtLEC/OxXYHygMaWUcvsP13S
         XLlUAtCHOGB6Nnjs16HPuzrAvQ6Q2+Mwr0e5CM8eM4zgiiTTLNWdG16F5k0OjgOoS9Ds
         jyoAfJ29MgTW6VyuQ7SnmmIQiAdrdHVhD+3QIaxcykx2SYHA9L4r2CmIctprd/v7PwD9
         QWyg==
X-Gm-Message-State: AOAM532wiTuBim/6ptv25sQt/LDmHgeYx9xEtlkTumF/QxFvt1t8pPhO
        Dpe2FwLQ/9Jiz0QCFU0lsDk=
X-Google-Smtp-Source: ABdhPJwGEiRJr044XgRWa8oweqQYTPi09ZE3zXgUZwpN0S+a4cg3LWdHftzoBy5KV3LWLUBeR0wMig==
X-Received: by 2002:adf:f609:: with SMTP id t9mr15637344wrp.57.1613384818692;
        Mon, 15 Feb 2021 02:26:58 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id f7sm22795333wre.78.2021.02.15.02.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 02:26:57 -0800 (PST)
Date:   Mon, 15 Feb 2021 11:26:56 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Mikko Perttunen <mperttunen@nvidia.com>
Cc:     jassisinghbrar@gmail.com, jonathanh@nvidia.com,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] mailbox: tegra-hsp: Set lockdep class dynamically
Message-ID: <YCpMcNRgq43FIPJH@ulmo.localdomain>
References: <20210210134945.2699170-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="M97IL2++JHsy/uxf"
Content-Disposition: inline
In-Reply-To: <20210210134945.2699170-1-mperttunen@nvidia.com>
User-Agent: Mutt/2.0.5 (da5e3282) (2021-01-21)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--M97IL2++JHsy/uxf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 10, 2021 at 03:49:45PM +0200, Mikko Perttunen wrote:
> On Tegra194, due to both BPMP and TCU using mailboxes, we get a
> lockdep spew at boot. Both are using different instances of HSP,
> so this is harmless. As such give each HSP instance a different
> lockdep class.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/mailbox/tegra-hsp.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--M97IL2++JHsy/uxf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmAqTG8ACgkQ3SOs138+
s6H36w//VpEeJOLqr5R2/G7lWsaqrrQz2CdoFNoFRbyvxw4c14XBtl14jT6SOhgb
JKAE+ODffe5XWrdvq93ttUr1w8m1vX/Up1oSpWVtmXBrbM/yBLqn+jX6d8y+/8Mw
740nO80xUSJFkl9/JnWo9opMZ5VwsvNa7uAJv+gZs77cgLm5N2mDkDvkbClTRhaB
mzbuPGbRoIqj9uPgykfxfTYKgi7Ad1VcnEhKtjPJ6BWhPSY/wHNlmmLYxDLSsphl
+1bLvr7jrK6R4JUkY+2JYrWP9VI9lF8SiXiuBY8gNHvFrbsxt4tTufz8lJwlrBKO
qMC49Yu7Bnp15Rb2piB3MuIitJLvm2pGliLJuKv2lOFFfjs8XJkCW53qcvXLfz3i
p3ztrMtKSJrxZcr5F3USU/Eq3fGjFailBCo6i/Iph6VE/Fzn63m+xVg23usArn9b
uOsqSWogj2Nq7Oiaw3FUdaRdWFhNYtd8i7p3Bn35U3A0ywKOwjvBfQFAFBTSwu5Z
qi/ezQHr/2tRB1rP8xGAtIWkx1SZsM3sCzN6DqCfuQYdRUmP/I3Ob2aGFQQOaOf8
Fpj+QEtlWiaPKEDP7c8jLYCoU4d2pa6XCTH0If3ogu4UjBwHmyW702fqN6oqzGkE
hIbxwwj7ccxkL2SGHjrhgwWhMx7YH8KDiGI/SDg14QXQYpW/kRw=
=zP8b
-----END PGP SIGNATURE-----

--M97IL2++JHsy/uxf--
