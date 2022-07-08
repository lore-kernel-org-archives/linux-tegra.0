Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFFD0C43334
	for <linux-tegra@archiver.kernel.org>; Fri,  8 Jul 2022 14:32:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237753AbiGHOcU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 8 Jul 2022 10:32:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235630AbiGHOcT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 8 Jul 2022 10:32:19 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63F4433A35
        for <linux-tegra@vger.kernel.org>; Fri,  8 Jul 2022 07:32:18 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id v14so30823667wra.5
        for <linux-tegra@vger.kernel.org>; Fri, 08 Jul 2022 07:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QFviFYUhe5vJfEEk33Lo3p/SFZLGtcyfY7lkrIA4frE=;
        b=nY/g1z6brJ3G8Bos/uXtiRiUHMSh1WkxwW/iwfrKlGdBJcKHSoookCb4MzPczBGC9T
         VTehaSApVgqCtSuxKmCfqJ3A/L0vXUIReUrRZpDWD5/PAr4VDwRt6v/jCBXnQiOo0b7n
         EpIT/D7kjduVZSPOL4JC4v/8G9HINcf+gYGdXfFLQRGQDNJL6RzsrPJ1zZ9ex6PQhpGv
         kbOodrU53hSAjwRwDp+5GRVdtmhP6clpdVjGNUcZ5/pwxFZEOW6DA7OoaCODxBOyFv6g
         WyF7Ljt5FqyE3DRxk5/YQo8XHfzMs8coQZgqYhRLMgadJswLTgvcMhKb1bIs49HVqvhk
         bt+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QFviFYUhe5vJfEEk33Lo3p/SFZLGtcyfY7lkrIA4frE=;
        b=acNgfJQFW1Ep5Ud1TNRZdG1OVR9ufYxRnPqfafZ8ZqTHk+VwOx5vtRSUKNFFvGD1Xw
         7Yux4WDvRGYRrrZoBpJqCWNcdUYEWE2D+yrQZUinwBETLv4I1uwOZYN8Z8OmwCzzIacw
         Kdtr0k1g0JDR8MAV1gNlOehzp7Zj+iEAb05FjqLGCR9PM6GuZhnp6VUmqwAuWkwoLEjf
         FI4DJaLgUYA42/4IxzIOBPrgKK9pzgM9nvrQvIkSVNC6GdFfekadeDTuWfhlk81AsZuj
         CJ1ChRc2xAfKU13XusIPyZFb3F2jXYXxgXeU6CDStZKjqfLYTk9iFvifUTg+Yp7y9Tfb
         DPWw==
X-Gm-Message-State: AJIora+eQNGZPkF7CN+PVYktgpRquXsDmsNIn96MnFYpcDbIGH/Xfxx3
        HMdn7IZD57VAT8ixUj7bPik=
X-Google-Smtp-Source: AGRyM1tDvkQkd3A9ZPQcpvz5nIG0CH0v1SVETmwkcxnbbRsyrcbd3vVquyufihHLwwABVIvqDMoFcA==
X-Received: by 2002:a5d:5919:0:b0:21d:60cf:cbf4 with SMTP id v25-20020a5d5919000000b0021d60cfcbf4mr3482741wrd.188.1657290736834;
        Fri, 08 Jul 2022 07:32:16 -0700 (PDT)
Received: from orome (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id z10-20020a1cf40a000000b003a2c7bf0497sm2348141wma.16.2022.07.08.07.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 07:32:15 -0700 (PDT)
Date:   Fri, 8 Jul 2022 16:32:14 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     mperttunen@nvidia.com, iommu@lists.linux.dev,
        linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] gpu: host1x: Register context bus unconditionally
Message-ID: <Ysg/7u5gRiDbEm5F@orome>
References: <503bffe670b24aac0dfb03c8fc16437b8f0cca58.1657215044.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="c+67CJDB9HiizjPT"
Content-Disposition: inline
In-Reply-To: <503bffe670b24aac0dfb03c8fc16437b8f0cca58.1657215044.git.robin.murphy@arm.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--c+67CJDB9HiizjPT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 07, 2022 at 06:30:44PM +0100, Robin Murphy wrote:
> Conditional registration is a problem for other subsystems which may
> unwittingly try to interact with host1x_context_device_bus_type in an
> uninitialised state on non-Tegra platforms. A look under /sys/bus on a
> typical system already reveals plenty of entries from enabled but
> otherwise irrelevant configs, so lets keep things simple and register
> our context bus unconditionally too.
>=20
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/gpu/host1x/context_bus.c | 5 -----
>  1 file changed, 5 deletions(-)

Applied, thanks.

Do we need this in v5.19 or is it enough if this gets into v5.20?

Thierry

--c+67CJDB9HiizjPT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmLIP+4ACgkQ3SOs138+
s6GhBRAAwanw1vAqG944lpU++RQCxMXnWxXKI1hwybu+US2ZfoYlbomHu3Bs+MXa
i+clodQY6naysqAsaC1UmJEfWN/edFqzlB27hyHgw5WtouLz2Oo83UlrOj36e2je
oZFAcnVHuzkYZkHJLlEMN9UQrD5/w/e+smKDH4exp6tsE46ya/AaUlfYZfZxed1K
Roi+2BZtPZ3UEq6KoZemRfepZwfueg2JFJWMurLYX3MKNDIFe9Igno439FqubKoR
mK62xFnWnLQgZcuvyoDbYPrgoU0h3QInwhHYK6Xg8Ai2Mjz9Gu88VQNknWslS1FO
iiNWTJ3RjAyxxvaTyTezKAxRXF2FdILbllHdRspilbRqfmdhpNZe0FsvYkBUC4nq
oZdzcrDAJa1G31NFrX0bOBGyAJYiAoGTX26NLBxGelyabX+QxfoPPDGHPhsXoG9g
9OlR4qu0By6+Nn99ZpD9A3FB1Z9L9qVI85feFpHXCCMwka5soPnxWej2EkRvzsrG
ASmOd3/K+OpQ0GAZwgsSjZ0IGf/VnWxbDUE8Kz7eXQkEz7A1MyYxgLWyx83NAlGU
lDh4n3VicTANSspDGGxdC/j9HaLiuDfSuBvglPJAKMFnKVl2ZRROZAU//ZZ3YjYg
F5ZlQ8FtvyV97McS2BCC3QUPLFpaPjDgUqkucr0o31lSOlyKtLI=
=8Mh3
-----END PGP SIGNATURE-----

--c+67CJDB9HiizjPT--
