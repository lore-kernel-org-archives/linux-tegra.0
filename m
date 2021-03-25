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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5236CC433E0
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 14:04:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B0F961A28
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 14:04:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231340AbhCYOEL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 25 Mar 2021 10:04:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231331AbhCYOEA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Mar 2021 10:04:00 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45606C06174A;
        Thu, 25 Mar 2021 07:04:00 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id e18so2406084wrt.6;
        Thu, 25 Mar 2021 07:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=uTnBq9sGyIo2cbY0+SLvTj5ZFkFFmCzKEs2LWGjMdZI=;
        b=GqGnSY+XW2nUrP4ls8HUFNdZmPdMxmY1kab/DVNp5kHlPYTNdml4czVX2ZQqymOk+/
         PP4Y46gEIxJM83OFPMocpUaOTN5Skgr6jo77ixuovJC0GSwZTkH5yLKN3O3XwvINC5dr
         9ItxT8cfXkT27Bpdkvkh1dbKldfFTj8iKSiNwipZSLezZNd+TRvbtp27AQ41yNtoJ0M2
         gMSPJ7JGZXyhfgHyGxMSt7PeiODy8DAfr+WoipUBqvBgFVZrXqHar60sv1Uffp8iRm7E
         QxqTU7AMaybqMyyzuWpYkfM3+YZstMF0vurO2b/yg09JZSbOsAOx889ejAPVDt8D7jPc
         BFRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uTnBq9sGyIo2cbY0+SLvTj5ZFkFFmCzKEs2LWGjMdZI=;
        b=Rd1sExL1bxX20aM6tRYmZ1/Yel8h/HH+Sm4zIpD4EXU3fSz5EmjOzMkBkdI1P1BdcL
         9GmKXyVY7b2hkTJztIS54tLNCKFcberU/4tJ8i+gTpNAKJ87ykdgo7xqSxEvBa9PQFUU
         fDAiK0GPJiFuMa3v8oSBLbGB8xRHGLEI1lsiKbxo5rN01txWjbIxbQQeuEmdmyRrzBR7
         Hqg8E/MKrm3lQ05cjpUbLgbk0uXQbsw+Eof5yarZVD02qKqbYgG4S1PTAtNkMqTmrqCs
         yW+/AQoVx5aPTpryctTFnn3TuUIZMit95e6ldz35CicTXiqsR41Qeg2vHq4wWIz1cjbK
         yUsQ==
X-Gm-Message-State: AOAM530J+Fs/zEbogdAHTOWiNG70rmrufoIIlq/v4vWFvOFgtXjZyfqb
        5tpHe3A9A6M3XGstMXakfcU=
X-Google-Smtp-Source: ABdhPJxFOKj4vwmPSkUbBDUnTQQj7wdsD9o0l603YN1f1uK+7k6axyL57tW+Nzv7UzecLKyaaPP71w==
X-Received: by 2002:adf:83c2:: with SMTP id 60mr9103771wre.386.1616681038902;
        Thu, 25 Mar 2021 07:03:58 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id f16sm7565456wrt.21.2021.03.25.07.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 07:03:57 -0700 (PDT)
Date:   Thu, 25 Mar 2021 15:04:19 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] soc/tegra: regulators: Fix locking up when
 voltage-spread is out of range
Message-ID: <YFyYY00uNyfrq6UW@orome.fritz.box>
References: <20210302131800.14408-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ENw44E3fLRfQXp2K"
Content-Disposition: inline
In-Reply-To: <20210302131800.14408-1-digetx@gmail.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--ENw44E3fLRfQXp2K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 02, 2021 at 04:18:00PM +0300, Dmitry Osipenko wrote:
> Fix voltage coupler lockup which happens when voltage-spread is out
> of range due to a bug in the code. The max-spread requirement shall be
> accounted when CPU regulator doesn't have consumers. This problem is
> observed on Tegra30 Ouya game console once system-wide DVFS is enabled
> in a device-tree.
>=20
> Fixes: 783807436f36 ("soc/tegra: regulators: Add regulators coupler for T=
egra30")
> Cc: stable@vger.kernel.org
> Reported-by: Peter Geis <pgwipeout@gmail.com>
> Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
> Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/soc/tegra/regulators-tegra30.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thierry

--ENw44E3fLRfQXp2K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBcmGMACgkQ3SOs138+
s6Ew5BAAmWMV5VYSMPEFJoaOlKbt0LZ7CRPKoOsTYBF6+UF8Bc8zUhADfP4QyAdo
6U64FF1UQz8Lhi/vBtao5SVPf+W8eYna0z0PkpzrgonhzZv5EZaLOYNt3i7aopKv
B6v+oQonZf7o1DtPXxTK28fkvmzSXze+vFHrPBrx/TzrY3XL0vOYVUoWgSjnhO6J
yQIauE87eZ+tM5if81Z3oYfnLchAAOLPY/PSrb/tbxo2hYjNR0k+sPHJomJdAtTG
pTC4LiD7vzpqm7GrOnBHexCInzfE8b6wSnA/lHr37H4JPveCPRo4IRmWY26a5Ydi
E08+dPGzQD8Z3EPuMF8cyy7peEIleweS0sFYAfOQrLHO0BKYksEKSKTJGb4FRWJb
LiSchlWrmN8bDwgznrDIcpYRw6t2mVoXc7WRat2RRV0qZDBpRpUyQDGFBxc/yEOq
1Dx86m2Qbpx7qOEXpnrDp7eVzrvam096/397ZO2QIfYivuzDLvgPa/YY7ltp4TOn
TBNJr6h99IpTp7evBQyD/fc7Qru4qoU5PGOEBPAYUfodwuFRI9ujezECQ/W22lwC
vmTA8sIE5225E/jU0BM05FFfATy3Ti5kExOquZt8Jn64xJxQoADDvn4puDbjtR0N
C9Ta0R5MgrhDl6NgmsbU42xtGpV95lcp2ndGnwKP38GYhdjvSRo=
=02Xu
-----END PGP SIGNATURE-----

--ENw44E3fLRfQXp2K--
