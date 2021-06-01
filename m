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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59CE0C47092
	for <linux-tegra@archiver.kernel.org>; Tue,  1 Jun 2021 17:00:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E6EF613BC
	for <linux-tegra@archiver.kernel.org>; Tue,  1 Jun 2021 17:00:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234533AbhFARCN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 1 Jun 2021 13:02:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234505AbhFARCM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 1 Jun 2021 13:02:12 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D58AC061574;
        Tue,  1 Jun 2021 10:00:30 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id e18so7089418eje.5;
        Tue, 01 Jun 2021 10:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CQMqoWBzPL5ZLjlastQzR0yj7aAdYnXQO5fTeIFHZ4k=;
        b=ofaY6ZaT894tU9GoJsERFeuD9OD42gzTogC7Kxhjh/caApTFSPZUhXeALqmKwC49TY
         O6KJKbTayLjj1K51CHu3nvHQg0A6jbNRc5lEjV1Gao2I203F1t8HD1bOQMsf6y1LXpdK
         elUbzHcmR6qOHi5lmvk8ewFRC2UpJzz4bFXH0v/W5wq2A247kXrQPGJae0UWQZwpxesT
         cYnNJo0Hcct+8Txg21brH899srxYL5ZNYPqG8Ry4+tLFbUtHiObim9mlppQrf/4tnQob
         yB5NB9Ov+CPeBOHbCaZsYigVmI8mt9zLI9450umfPPXeM+Lw+lxvygGULrrZDOYkY5NU
         tRZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CQMqoWBzPL5ZLjlastQzR0yj7aAdYnXQO5fTeIFHZ4k=;
        b=g5/VjIEjWR2RUmPDcVzUn5iuFybhN2IFctFw3cJbvnfHjYKgCNN/zp1wdClVUEix31
         BftUCajf5yUNcRj4+mWe0fW8pmSDNLfQrDfzVB1rosgbjW+AkTEMEwmlfWmhqpOoFqOF
         ZVJD6Ip+9pNdUiYz8+UgwFHfjD6Dt3Q8EcxLFDDKlma7XTpQkwrxXd5ywvaMuk4kKu1G
         hkrCR8W+eVqfH2qphophGisraS1mXYF3GZds5ZkcMvMycKmlrFPyiBLDTZxgWbqLJIyj
         lznzTaB22Q/C0W/SVBeUW/5VEFuJtiQJmA7V1Az0uR/OYhIA7Av30xeVwx2G+lMO8rV4
         gGOQ==
X-Gm-Message-State: AOAM530vsfq8NU33wpb2g6t9wZpIWAJqTDxLt1w2Q664zUHP6p5UYpQz
        a3BKTvjDIWp6VTOFnOfm0PbO8RzosP8=
X-Google-Smtp-Source: ABdhPJyeYOWjKhIUjgAyXu/6opTIZiY7INYhum2ypvPWZAVMNFSxz6OYqa+86KdwPYLX8cww7HPu7A==
X-Received: by 2002:a17:907:7201:: with SMTP id dr1mr1121890ejc.19.1622566828720;
        Tue, 01 Jun 2021 10:00:28 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id bq1sm3123438ejb.66.2021.06.01.10.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 10:00:27 -0700 (PDT)
Date:   Tue, 1 Jun 2021 19:02:03 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        jonathanh@nvidia.com
Subject: Re: [PATCH -next] soc/tegra: fuse: don't return -ENOMEM when
 allocate lookups failed
Message-ID: <YLZoC32dTDVwfSjh@orome.fritz.box>
References: <20210412140527.4142735-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="P3fufEzxHHIvHqpA"
Content-Disposition: inline
In-Reply-To: <20210412140527.4142735-1-yangyingliang@huawei.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--P3fufEzxHHIvHqpA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 12, 2021 at 10:05:27PM +0800, Yang Yingliang wrote:
> fuse->base can not be unmapped if allocate lookups failed in
> tegra_init_fuse(), because it is an early_initcall, the driver
> will be loaded anyway and fuse->base will be accessed by other
> functions later, so remove the return -ENOMEM after allocating
> lookups failed to make less confusing.
>=20
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/soc/tegra/fuse/fuse-tegra.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)

Applied, though I did drop the error message. Out-of-memory situations
are noisy anyway, so the extra error message doesn't add anything.

Thanks,
Thierry

--P3fufEzxHHIvHqpA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmC2aAcACgkQ3SOs138+
s6Fxtg//R8Jp1X7MQW6jXODjtxZCNLH2r+0MuF2z9+x5gE6deR0/Vfg4YrnIBPj2
UijfczUYNHGsiJ6uisl6/VA4x2JgjZAmtuUActxkD+hAeMuCp+saF0LylsKI8HK2
OcnELPh1sp11+1FPU75dxqsbEqYWbJ6ZqUlaHrugQ71Qe61+UflxirNQOsikKo6y
sDewYLjcn36GWqLqCdaQjxKr8VC1GehSkWClHebPtyWCGdjcLntfcQ0HRIsefCHQ
FkSVCwms74AxjnsmVwd92h0SlGdYkgpn2XU9Ox4KslX3KIkjwc8zQbKYC6p7y5d3
0PxhOnxI5ygt0lANjvKHA4qKe6g3hIwPsWTzGmjKjwB3vTh4nj2tUfkev/8gNr25
0DioLGQygX2pxoTrP0LtC6t7/15qRnTKpZEOp6i44uGiephPsNyqjm0mlYN35Gai
9GrUBdpmsEK3lscQHuu2WnENOiqKXagdIDuuyPtv3bUMT9KXYi4Aor0uzWKae0od
JwllY2Jt0nQMJzX95xxDgYpyNs5rtVWAO+m6tJuhcoF9K2wfkl1JdoZxdsD8l01M
jbfriSy6S1UvkiW0H6IOpGg/9ZWOWj/7/NwxeKy9nAb6B0bjanBaw36VxxgOVgPk
g8I6Y7hK4A6kmZ+JvTcRTkH+sM4Gau24xMGqsfTJQI/h5h19pyw=
=Ak5L
-----END PGP SIGNATURE-----

--P3fufEzxHHIvHqpA--
