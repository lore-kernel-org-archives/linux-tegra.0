Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7247C00140
	for <linux-tegra@archiver.kernel.org>; Thu, 18 Aug 2022 15:15:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245734AbiHRPPB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 18 Aug 2022 11:15:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244793AbiHRPO5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 18 Aug 2022 11:14:57 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A85C21E26;
        Thu, 18 Aug 2022 08:14:55 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id kb8so3833665ejc.4;
        Thu, 18 Aug 2022 08:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc;
        bh=3pOHW2UUGPUYRmj5n0C5eVZOuZ5kPsT1vN7tqKPTQYk=;
        b=D2G2KZXLAUdE1Fm0wzIy2EYYRXCxenhhIBPQQHoqptOZ/IBsVeAwcbCNRUgcPU0crP
         wRe2mayNESZsOXgZhMDcpoeNlrAn9T4dYLiEheHko2NkBkZIInT5pKlIOzxIOqm8axnh
         JPy2Xho8kocriIaCzF+epwilx03xTvkk077F8+oaXcZ22nw59VXOyGJBnhp5PHfWlbCI
         t5p+mI6CMkRAiJqD+CTPnXp82pFU9rb/xbAdgOYsorNkTVVQdmptcOt7U62TfIB3NFE3
         lgMhC4L5cTMRnW/nCLjOK6hWOVXEgXZLdOWBgNe8a60CpuCIeccFYsdSkZ/ZVtgguMr2
         zOpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=3pOHW2UUGPUYRmj5n0C5eVZOuZ5kPsT1vN7tqKPTQYk=;
        b=c4wqRDh9tVkTHa41mw5UUONZorqz8g32qpqT/GsRYv3uoXKS5/AMFTIKQbAt5hAu2c
         xJVuI5IT7z9rcvsJROuSOa8ag/rwrdHEzdXNyU2+TRQN9Uq0d9pO44Ea6Lsq0EFF9Mic
         u/NRZ3bUznTmyjIdRJ+9kC3NtesWsFlJSb3E7aBIlhcjutNMjgjL2piN7Ce13w8pCdhM
         2wg2VuuVBsu5cqK9iVns0pk3nEbf6IH+Mp29BCY7fm1zcXg18SH+0YukRnqra2uCTNSc
         Vb7aNeyoy3PMAQpZVl8tHxwDmGRg8N9kbjCjWeKKBVR9BvYQ4X3x42tAsi3hizBG6NG6
         pQYg==
X-Gm-Message-State: ACgBeo3vpiRhlNSfoPMNXDG1FtOVW+4PGar1LaiohTfK/hY0Lkoku2Dh
        Kfh2ub8uYHGkTrWazz5kewM=
X-Google-Smtp-Source: AA6agR6v/d+71iY3JL6JH/HiKRWZnEUhpdlbWxQanh4o5o/aKE/AR9u0Ijpzg7mKKE/5QPGC4paLVw==
X-Received: by 2002:a17:907:1361:b0:730:e5c4:6eba with SMTP id yo1-20020a170907136100b00730e5c46ebamr2168073ejb.597.1660835693547;
        Thu, 18 Aug 2022 08:14:53 -0700 (PDT)
Received: from orome (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id r11-20020a170906704b00b007315c723ac8sm932020ejj.224.2022.08.18.08.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 08:14:51 -0700 (PDT)
Date:   Thu, 18 Aug 2022 17:14:50 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Petlozu Pravareshwar <petlozup@nvidia.com>
Cc:     jonathanh@nvidia.com, p.zabel@pengutronix.de,
        dmitry.osipenko@collabora.com, ulf.hansson@linaro.org,
        kkartik@nvidia.com, cai.huoqing@linux.dev, spatra@nvidia.com,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc/tegra: pmc: Print reset info during probe
Message-ID: <Yv5XarzacTOkTL1k@orome>
References: <20220817184456.1184459-1-petlozup@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="C/vs0DuZb0Diixxt"
Content-Disposition: inline
In-Reply-To: <20220817184456.1184459-1-petlozup@nvidia.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--C/vs0DuZb0Diixxt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 17, 2022 at 06:44:56PM +0000, Petlozu Pravareshwar wrote:
> During PMC probe, print previous reset related info
> such as reset reason and reset level.
>=20
> Signed-off-by: Petlozu Pravareshwar <petlozup@nvidia.com>
> ---
>  drivers/soc/tegra/pmc.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)

We already expose this information in sysfs, why do we need to print it
during boot?

Thierry

--C/vs0DuZb0Diixxt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmL+V2oACgkQ3SOs138+
s6FjChAAvNUHWb9fpfLIFcVCgRQIpwNJH5MC+XiVINBic0EW3xPSatpUp8cFsXwq
QWkiiIONVWAcmPvWYiXUlWMNeKJSZbPFIWRL2MkCLdSb4ENw3UUPg7mzww8bUm6R
i/nsKOEYkLW3PBBU8RtHK0XjvxzKRAMJUcEfdRXWziH85044ONv2Jz6nNfcoEjjj
mnqM6hjro2O+OY7SnjO3TGSIahtJ+fqM7RNPI3njyGZq11PEEEPoeefZNg+NuBfT
qDOLi7uYblINcxJAWzwjm9T5ZGEpco8fVzpiVh2kU09BUsFrfvLMjxmhLHOswsvL
3fdWJXB0r4R8ud/QafoElChP9aKSEV91F5lDHIzd59ygMVQBzpkjsBeZNw2mhxxU
E87Iehn0KLAl096ea+2yUpsZ4SUSyYJYU6Mz5nDCPoKPzi/m9qxJxhBh/MMp50fu
uW4ihTxdGE0XI/k2ZZLaDuRqGYFGzEB8S4KpGJvX2wobJoEs+FkFKUiyGRKZUAQF
s80qdInRiy6+D740jQ1mWqNXrxCIbb4MStc+aRsKk86OXb/oi2mGKBeEY4UBRkPN
q3baneodA49o4Dfl8qj10dzkIoqmXevSB6s5hkeHbv+qOkJNkTG3hG/84lkAxLjs
3plJbq6Rz9shIlfJoOAT7bZb9H51xt5uBO+yADFiHfEIW8NUos8=
=06pU
-----END PGP SIGNATURE-----

--C/vs0DuZb0Diixxt--
