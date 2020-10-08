Return-Path: <SRS0=64AB=DP=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD43AC43467
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Oct 2020 09:55:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E7012168B
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Oct 2020 09:55:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jtlh2t+5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729132AbgJHJzy (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 8 Oct 2020 05:55:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725849AbgJHJzy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 8 Oct 2020 05:55:54 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57984C061755;
        Thu,  8 Oct 2020 02:55:54 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id ly6so7203752ejb.8;
        Thu, 08 Oct 2020 02:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YeuhPRr+8z262NbOKlojpiKbS8DIdyX4GR8PkpnezB0=;
        b=jtlh2t+5xcZBhggDN5WpgGQmepHy8x+EweLX9DghVtSzvdufoquh2mui6ZfFe8jY3R
         500ZVRB52Ufx27weClRmA1cmWfp88YjvQCmA01N4x98d2jVWTmmF1xpd19HVglO5lleG
         txj63Rmzm2d0sjosdnfsW2quBTj5qEw0wH9CD7Gwdx7MrKKhur3ndcy1zaDoZpD9XqFP
         pZaRLlfzsXd6ThyJZFqDxxIZKWRx3ZUkifdcP7EgCNQWB/ImdRQFn1ELT5/H8zgBfShA
         Vys/1xi5j+9pgEhk8TrgbdBEjBBa7Ufj/x7ZIO9d8PEYaVK9MXT9Ilk3mhODFWzGpsHH
         uJrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YeuhPRr+8z262NbOKlojpiKbS8DIdyX4GR8PkpnezB0=;
        b=Df7t1tKAgMhzVy43tMl6Zhb+CgL3YIcXX0IR0HFNWLg3PRpSlD3/bLqQPVQMfMGfk6
         PYtxeMtmFxciMhU10gfGp2lmD15pyX6WzgBENy0TKEBZYoO1vJTs/2EREDcL5psFL3cj
         MtJV1wefYlN5EylEcN/+5wpcPRqV0247Nbagyo19IBnGo3vFo5znHogL4I0v0Ax57sZF
         JdkktdGkB8dCj4Z0q9RGWztTAJFODGN1P9/Qk+4InuDbd44MlNbS1DcbWlpa7+BHU5DO
         WaYuWHgqVRdc21v57a6Vq5ralBl5Yh4iZhr1g4IKOu4zN9WYLGMjnQrQoxalyNPIcteL
         cJWw==
X-Gm-Message-State: AOAM533RgQJE5poBlGOZ3vKQPcG3j3192B4C9+9U80XidI6NYlQwHikK
        ZNhsTVoGoB/RBhShrjss2No=
X-Google-Smtp-Source: ABdhPJy7Lbb8AaP557Gk3yqm0KpsSiddDmF/zhqYKtfCpy70LnUSpGLTwrzHGMsSA2rTJR2/MKb51w==
X-Received: by 2002:a17:906:17c6:: with SMTP id u6mr7920515eje.95.1602150952873;
        Thu, 08 Oct 2020 02:55:52 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id oa19sm3711344ejb.95.2020.10.08.02.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 02:55:51 -0700 (PDT)
Date:   Thu, 8 Oct 2020 11:55:50 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     joro@8bytes.org, vdumpa@nvidia.com, jonathanh@nvidia.com,
        digetx@gmail.com, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        hch@infradead.org
Subject: Re: [PATCH v4 1/2] iommu/tegra-smmu: Unwrap tegra_smmu_group_get
Message-ID: <20201008095550.GB2349275@ulmo>
References: <20200929061325.10197-1-nicoleotsuka@gmail.com>
 <20200929061325.10197-2-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="9zSXsLTf0vkW971A"
Content-Disposition: inline
In-Reply-To: <20200929061325.10197-2-nicoleotsuka@gmail.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--9zSXsLTf0vkW971A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2020 at 11:13:24PM -0700, Nicolin Chen wrote:
> The tegra_smmu_group_get was added to group devices in different
> SWGROUPs and it'd return a NULL group pointer upon a mismatch at
> tegra_smmu_find_group(), so for most of clients/devices, it very
> likely would mismatch and need a fallback generic_device_group().
>=20
> But now tegra_smmu_group_get handles devices in same SWGROUP too,
> which means that it would allocate a group for every new SWGROUP
> or would directly return an existing one upon matching a SWGROUP,
> i.e. any device will go through this function.
>=20
> So possibility of having a NULL group pointer in device_group()
> is upon failure of either devm_kzalloc() or iommu_group_alloc().
> In either case, calling generic_device_group() no longer makes a
> sense. Especially for devm_kzalloc() failing case, it'd cause a
> problem if it fails at devm_kzalloc() yet succeeds at a fallback
> generic_device_group(), because it does not create a group->list
> for other devices to match.
>=20
> This patch simply unwraps the function to clean it up.
>=20
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
>=20
> Changelog
> v2->v4:
>  * N/A
> v1->v2:
>  * Changed type of swgroup to "unsigned int", following Thierry's
>    commnets.
>=20
>  drivers/iommu/tegra-smmu.c | 19 ++++---------------
>  1 file changed, 4 insertions(+), 15 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--9zSXsLTf0vkW971A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9+4iYACgkQ3SOs138+
s6GPJhAAqI2OuqFHW34225nABjRPlBJmkRxEfhdWt4JMwwSTBHVoEYgPVEKK8RCf
choO2k2iA0fU0UWd5iw27tWYGf6esq4PR+n/LjH+0HjURQJJcnxNmt2iVzSnnZSl
lpCGTHsBXbXDSDQgmsxRFuqOubzqXzvOue1phB8siQIQoP6vPIDnd0ufw9GTxiFn
/dl+M7dFPUhrW1UO8ALNbYXqm4qW3TU0r1oJd0JiYuV+Pv56qScwHxjTT5fLGbWz
z5NVwpMpdahu4UuVUtVBLpJwJmyLZD2NhFlkmKViSc8jaL2+lMQrjO6H8RZ1IaXV
XWJISwJqgk6TPufmYxj69I0z1TUKpf3T42quyW6gs4laOh+xlwLiO32i/70itk3u
NulgzRRi3SA/qH+dFAICOnDfzN23YzI3Px6nMr/sbFCq7zdVKMUyGPRhbxEHmApz
gdzNtmFTYqq0QpIsrYnQACnwP0b9IJX0h831Rzx0IWxh0r5n5ENfxVTLTIPgQ+A0
Nrk3/6MSHPUi5VBuKfVgriAC6YBnuz/zKabII+kR+Eh91SkZej6zDu901djPE/KS
SwgGVyWDazm8dLqm92uC6K7xbIMlOCN9R9rLZ2ePMQVYsN1ZshAQaU/C+3308ent
aSDwfr1KjKkAF03Tflykp7Rwi8Kq3Aioq4+e6qi8lGXffkRllaU=
=nE27
-----END PGP SIGNATURE-----

--9zSXsLTf0vkW971A--
