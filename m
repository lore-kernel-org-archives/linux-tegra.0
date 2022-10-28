Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D891C38A02
	for <linux-tegra@archiver.kernel.org>; Fri, 28 Oct 2022 11:25:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230131AbiJ1LY7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 28 Oct 2022 07:24:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230188AbiJ1LY5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 28 Oct 2022 07:24:57 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B321F58094
        for <linux-tegra@vger.kernel.org>; Fri, 28 Oct 2022 04:24:56 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id bj12so12123109ejb.13
        for <linux-tegra@vger.kernel.org>; Fri, 28 Oct 2022 04:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1UwXAn3s6Q4JpDF5XpTjVt5tzQnkaacj2VfmP77k/Qg=;
        b=P09hRqq2ecgzxIj9RQ/XAtwRmLvABzLx2h3yZmiMlgStlFvmXwmI7ANv5u3mwCvYDw
         0RT3LhhWIz2msvI4NfUtDAGx8H+LS+79Uc3w1CMcyEVzCDT4au3J0pnfC8mQuhBV01gg
         eEy6whBMD3GtLxBWINbP3erkP0GIH8xC1jpOnnbkygItTBWSdmkZHMAlIfJ7x5MX733U
         R/0pPrN5UC6zjU64dl8wryQStMtHmRWTqT/9ImG18sr5YIKzlV+YzLAPNk5FC1w1KaH8
         pCUgZqLJ5sftqHEU7Z7GadSN78d+cDYI4UlRLBj0tbCRQLVFOgLL7XrFqAc/ZUixcIgm
         URug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1UwXAn3s6Q4JpDF5XpTjVt5tzQnkaacj2VfmP77k/Qg=;
        b=xVc49KvYKNPNnRgMAeOrq12Z3CRQbsDgGPw3V9eOOgtxSZes1PRzTRBsrCxXmmAy+B
         mIrh3jBnebPlt6quFXlY/JbleRhh6U+sO+xPMFGAoZ7laFZxa5OtvyhIfv8Na1eKIoyP
         uDrc9AcjcCLC1jY2TO3bkfOs4XT71yJWqykaYHwXurGEooCEDTX1N+HjD5no8n7ImBGA
         Wd/ZWXkmVj+uIdnvHhjdwmZPct6Hvk1JqYd29YSWIbL2GNcu0CFfWdOevzRgv1hoprb3
         K5rM5ZVoj7iO0+27JoysjmhzJSUup4lGRxqkEIvuRXWGL16oQXLFGVAKQy2N25kNVyX+
         VRuw==
X-Gm-Message-State: ACrzQf0lXStviqOB7i3DL7xDXsIhwDkN27n/0uK3+/n2dcb/jcA9G2fB
        0jn7awfAXyV4+sWoN+iUWliZLvyIbjw=
X-Google-Smtp-Source: AMsMyM5gCNy9CHIVCJq7O8JX6WQUyfkR+hbBHFmgoMtYSqGdMhe4KLPOfFXc8iRYLFP9rHXaxCY/Pg==
X-Received: by 2002:a17:907:703:b0:78e:25be:5455 with SMTP id xb3-20020a170907070300b0078e25be5455mr45664737ejb.630.1666956295128;
        Fri, 28 Oct 2022 04:24:55 -0700 (PDT)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id t3-20020aa7d703000000b0045c3f6ad4c7sm2475292edq.62.2022.10.28.04.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 04:24:53 -0700 (PDT)
Date:   Fri, 28 Oct 2022 13:24:52 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-tegra@vger.kernel.org, jonathanh@nvidia.com
Subject: Re: [PATCH -next] soc/tegra: cbb: tegra194: use of_address_count()
 helper
Message-ID: <Y1u8BNTy7G6ml/RR@orome>
References: <20221027065625.1443750-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="62eLEOyMo/lEs7/s"
Content-Disposition: inline
In-Reply-To: <20221027065625.1443750-1-yangyingliang@huawei.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--62eLEOyMo/lEs7/s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 27, 2022 at 02:56:25PM +0800, Yang Yingliang wrote:
> After commit 16988c742968 ("of/address: introduce of_address_count() help=
er"),
> We can use of_address_count() to instead of open-coding it.
>=20
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/soc/tegra/cbb/tegra194-cbb.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

That commit is only in linux-next for now, so I can't apply this yet.

Thierry

--62eLEOyMo/lEs7/s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmNbvAQACgkQ3SOs138+
s6HWsw/+NXWxYJ/t5X17EDyEOh5vxH7I0BiSYOR0QJ0GzIJ5lexiRIJaZFQ9eqUo
pE4wMi2oG6XuOZg9OP+oTkAmvSCeTViUBHiqLeC9XNDM+5BCvqZYRgIBpXDxwiCP
Fql/ZULo/faNKrnOhUhtqQVasaM3iysgcDy8m4kMp6g/tZX8u3JDN+ooYflHErBp
o2VM4kAK+LrvlwMHC4Tylih/XSObqjjc/Hp046x3FH4Fi9fYt6bD6JHu4NJutCyI
AOFCqPFDL0qKonaNwZ3tuN4njDjjtaFPljsjhURIAEbe3X6BzEwUEbutnTFD5mHg
h5eZKaGLcl2zAIMevnzvoxV8fJgpn9OORYwfFxqrnj7JFowav5oR0e02JJelXxNN
Y4W9gx0PBIkLnITV2cgzkMAj7662IYx0FHgwuYQIGLICYUfGZxlvf/c5REd+87Mn
pZ7FzCQW8S7HZsciGgStAP9TtlXznahoaD+BDY29Z+rvcgubdeT46zpCExyGSOvV
P6nLPqM6ep2GnDtXS6VkPUcg23eUHDkeyH+D2cgxObSrkLmixpf7J7bco0l2Imwh
jh8CBkYR1pveyLJi8IAzYldn9T9CLi/4kEXrZOFvaPb+9dsmUv/xTBH2lVoh2I3s
NFnGriAxgxcXWH97c36fbRaUFmmHqCc9gDOibY3HjzBmj+gy5Mk=
=IGrj
-----END PGP SIGNATURE-----

--62eLEOyMo/lEs7/s--
