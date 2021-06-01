Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E4BBC47080
	for <linux-tegra@archiver.kernel.org>; Tue,  1 Jun 2021 11:23:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 37B5F613B4
	for <linux-tegra@archiver.kernel.org>; Tue,  1 Jun 2021 11:23:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230308AbhFALZ0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 1 Jun 2021 07:25:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230288AbhFALZZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 1 Jun 2021 07:25:25 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3CCFC061574;
        Tue,  1 Jun 2021 04:23:43 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id qq22so12855461ejb.9;
        Tue, 01 Jun 2021 04:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=S3KhbuoyhKPDwdQU5jkXOffzZjPiGwIAcW9wMtdkuwo=;
        b=RMNOr9+w1uJDBMusudGIoj/pGbC0ctESuF1SLXo1HCemb3T5qH8Bobz49uDH4n4VDS
         1n8iZrYatFf9/mbzdkN67HbXhXhqr0Q20M8ieZrN6992DG9bwKUQj6On+xZSH6EFiPt+
         fpIQUWkSAXeQVu7ej2Ut5DEqCIhnUoKlxcGChMJap5Kx5fKA7+xqNemIQqqhtS+T0oP2
         pzjBj8cPMDJYvMsEWVeUBHbMQeD+E5p9SFJXG43bvq/8xCt/2hWScunsHE0xIwV4Whe6
         qkns1AUMWUDCKfwtLvV8ETsmN1wY77sEIjkXfoIJysX4+l18Fouxu3Pm9+wIBRoEatjf
         YATw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=S3KhbuoyhKPDwdQU5jkXOffzZjPiGwIAcW9wMtdkuwo=;
        b=Tjx9NrztFjjNe9uYzO88fu9xf6PCNFNIgMwXPaeOhlNIDlt7vnvUC2YxnxCJhNA+Gp
         +5cEn4a3ZrvjA5IV7bqWUv9Ld1yLqgSKU2dsN9WzWmT6Izp3yFtbWsQmAoXXQ4IridCH
         MzitAEq41yb+H1br/C5ZcxUltrbFfaCItrtuUkaSFhnVmnsKYrPntcYShhlbI1U19q5v
         SmMmzzdvZ7sSwhcjfNxLdxdproxmCXXrB2gM610AKnMSeE5BzsQBWGOe+FUvAb1SCvlm
         B5RPYb0/7YpjPsIkK3tcnXeZiWWiUq0BUDiLqhOQLR0iWlxLUuH8jZ+F2stE3Z65rgMc
         AiWQ==
X-Gm-Message-State: AOAM533kzIHfoXzQ+gur1lMWGcVDg0r6sxow7X5GzQg2OfBfOqmB+ls0
        NIvfn2z19HEkSxuPJaTmt00=
X-Google-Smtp-Source: ABdhPJyTnzbXmSweeSWknvr/IYvb5lUM8VhkyX9Gsu87+A5LDIaUkg4/5HcLyT00s9jkLAYeuIDWoQ==
X-Received: by 2002:a17:906:2854:: with SMTP id s20mr28592048ejc.335.1622546622211;
        Tue, 01 Jun 2021 04:23:42 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id di16sm1106760edb.62.2021.06.01.04.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 04:23:40 -0700 (PDT)
Date:   Tue, 1 Jun 2021 13:25:16 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Agneli <poczt@protonmail.ch>, Paul Fertser <fercerpav@gmail.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 04/10] ARM: tegra: Add reg property to Tegra20 EMC
 table device-tree nodes
Message-ID: <YLYZHPpjZB9amRBW@orome.fritz.box>
References: <20210510202600.12156-1-digetx@gmail.com>
 <20210510202600.12156-5-digetx@gmail.com>
 <YLSpCXNtut3z8U9a@orome.fritz.box>
 <1ab11cc8-b45a-0c2d-c0c4-fa5779756c05@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="EqnHcgd+ZcjTNu1H"
Content-Disposition: inline
In-Reply-To: <1ab11cc8-b45a-0c2d-c0c4-fa5779756c05@gmail.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--EqnHcgd+ZcjTNu1H
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 31, 2021 at 11:45:19PM +0300, Dmitry Osipenko wrote:
> 31.05.2021 12:14, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Mon, May 10, 2021 at 11:25:54PM +0300, Dmitry Osipenko wrote:
> >> The reg property is now specified for the emc-tables nodes in the Tegr=
a20
> >> device-tree binding. Add reg property to the EMC table device-tree nod=
es
> >> of Tegra20 board device-trees in order to silence dt_binding_check war=
ning
> >> about the missing property.
> >>
> >> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >> ---
> >>  arch/arm/boot/dts/tegra20-acer-a500-picasso.dts | 4 ++++
> >>  arch/arm/boot/dts/tegra20-paz00.dts             | 1 +
> >>  2 files changed, 5 insertions(+)
> >=20
> > In retrospect we should've just used "reg" in the first place rather
> > than adding the custom "nvidia,ram-code". It's a bit redundant to have
> > both of them with the same value. I wonder if we should deprecate the
> > use of "nvidia,ram-code" and at least make the code look at the "reg"
> > property first and only fall back to "nvidia,ram-code" if "reg" does
> > not exist. We probably won't ever be able to get rid of the fallback
> > for backwards-compatibility reasons, but at least that would make the
> > intent a bit clearer.
>=20
> This may be not doable. We have Asus TF101 which doesn't use RAM code
> for the memory identification, instead it uses LPDDR chip info [1]. I
> will send the LPDDR patches later on.
>=20
> [1]
> https://github.com/grate-driver/linux/blob/master/arch/arm/boot/dts/tegra=
20-asus-tf101.dts#L1115

That DTS defines both "jedec,lpddr-manufacturer-id" and "reg" with the
same value, so we could simply use "reg" there. If you plan to support
the JEDEC properties, we'll have to add code for that anyway, so there
is no downside to first trying "reg". And we may not even need to add
support for any of those JEDEC properties if we can just use the "reg"
standard property in the first place.

> The TF101 support mostly in a completed state now, we still need to try
> to figure out why upstream kernel doesn't work using a stock Android
> bootloader, so far bootloader replacement to u-boot is required.

I think it's fine to merge support upstream if there is some sort of
bootloader that it can run with. If that bootloader is open-source like
U-Boot, the better, but I don't think we need to set the bar as high as
being able to boot with any available bootloader. There are all sorts
of reasons why the Android stock bootloader may cause things not to work
and there's probably no way to get it fixed anyway. It's similarly
possible that the kernel may need some outlandish quirk to accomodate
for that breakage and we may not want, or be able, to upstream such
quirks anyway.

So if you want to pursue making upstream Linux work with the stock
Android bootloader, that's a fine goal and I won't object, but it's not
a requirement that I will insist on before merging DTS files.

Thierry

--EqnHcgd+ZcjTNu1H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmC2GRkACgkQ3SOs138+
s6G7XQ/+PYR7uRtcQUTZVILyxP1ZYlkd/mic87hEjc1Rnxw5HTbGq56zUAeRtSah
dUoXyv9hcCc8Ls4s8Mg0jw6xmeiOUIItemD7+mJ8GFtWpN/5QJ5Gi7wCl2Nwqqyk
O79AmwgJQou37KFhUnKTUDazLQfBQ9ouAklKPk6wH11y+5vjVp6/CdGLLOR+efBN
xF2IofEZNVNAJVOaLdw3L2wsIfUW0YgW6MrRbofYOX3Vnz0K1jUst9Wt6FqiQIIS
C9Cbbi/APTmQUxPrTgbLE8nnpRzsxT9pOvPiErv5AYL5/iXL9fpENZ5Dq9Wk8a+c
yqNaYua0CRF0VuOJCITHOHpfqZ9Z2ADv+fF2bqvavWxYnD0wDMc17hmsJvN9P8UV
5/Np8R8wVrc+hWUjXNvUvNRjdGeEXGjlATKakIc2IdsBszYVB+qFU8pOawNZKzPB
SnheKmDsqhYc5sivYItvOkP8a6JIpXpy1hfVKJv2phZ/23+4HIw+CyGvthiCJGX0
Nmb/+qfFvPYQ0zcFGQ+qN7qLWsYpMhGfiAo+/EtUfMxbmyBOZVvKd7TP9voJuunh
ux3alcGXWKEjMLgnMgU63CPvEXH7sWUA7T5pHX+RbIea2yXv6QXTyarh53KU2kOT
OvcXsJm3IQgDk7gvA6YMUlxmZvOhZgggelRuVJcUlgMCHjGqxD4=
=1La0
-----END PGP SIGNATURE-----

--EqnHcgd+ZcjTNu1H--
