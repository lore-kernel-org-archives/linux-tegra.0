Return-Path: <SRS0=kAmo=DM=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01120C4363A
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 09:58:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AEBC820795
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 09:57:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gBUQ0LSt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725947AbgJEJ57 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Oct 2020 05:57:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725930AbgJEJ57 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Oct 2020 05:57:59 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6525C0613CE;
        Mon,  5 Oct 2020 02:57:58 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id ce10so11013158ejc.5;
        Mon, 05 Oct 2020 02:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=g7GU/AkNe3daV6icPj0oXO9lJvefNEYI/yjHaeqAgzE=;
        b=gBUQ0LSt7aRNbGRSly36vsk68h5MeQHGUEn5PNiLM2tUNHqmKSTnY8ucIH9CGASvH9
         rOJPQrzqJqSjm3vjFOrbslhgFs5YeoVz1zreVI5Gn6XBXNMw/d84OAP+qdX8kL/5r86P
         7glbh+AwxUOSfftniDaU0W2qVJt5k9afxilwP9Vy1tLVYK/RQkv84fzXbQVBr5MHJcP1
         dwD6ae8+OT4dchO1S0XKYhHRZLYJ9/gH4QQuuWa7PnLn9Xgc3BL298FJgx0vpPuMAIp6
         vUWdisshy3dX91w/R534wVAH9qQmaRONx5nTE7PWr1p6CyyDHyGoPmcpaa+xkQj2n296
         xiNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=g7GU/AkNe3daV6icPj0oXO9lJvefNEYI/yjHaeqAgzE=;
        b=TXWIXNTve5F70zbxnEIElP/TO/fC889S3/UFVxn8IWsW5PsKseEZZ4DNk1wSKo59eB
         buEDlhrIZyRdKGhq75nAPkcvNvIUKALk7LxjIuHJTqFBoVQaRmXbvJcIb3n4fazzRT68
         ke1MvynGt/u4msegOEihmAfMHdibyqp8t9oHpJ0dd1ALHVHMeV2teLeM4L8EfL0pDWAI
         hkv6NIRB3/qH6TJERaso2ETwCFoCTWltKPOcHdVxr+wZ8NDMskotQnQYp0+/szsAXJCY
         KxjNEWgTDbNRSndvxX8OlfjTePxh2Qu7qf/VX9pVERA5ujzDbzCMMWwt/vrKTfjqtB4+
         dV9g==
X-Gm-Message-State: AOAM530dgE69OLngqH8lYI5RIw72lamdeG7jDl92ezeVOmMEJp2XQ4Zq
        cGs4PHN8J+sEg0TDn3TNluTLTEaaAUU=
X-Google-Smtp-Source: ABdhPJwE+3FLZlVeIjhlYl7qJ/LCobtIjgHrzHX4wuV+T11HeCElPqVpYQH4SuMwe2PbUJy/LNTACw==
X-Received: by 2002:a17:906:8399:: with SMTP id p25mr14654502ejx.243.1601891877401;
        Mon, 05 Oct 2020 02:57:57 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id q10sm5385858ejb.117.2020.10.05.02.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 02:57:56 -0700 (PDT)
Date:   Mon, 5 Oct 2020 11:57:54 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>, joro@8bytes.org,
        vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] iommu/tegra-smmu: Rework tegra_smmu_probe_device()
Message-ID: <20201005095754.GJ425362@ulmo>
References: <20201002060807.32138-1-nicoleotsuka@gmail.com>
 <20201002060807.32138-3-nicoleotsuka@gmail.com>
 <5542b314-f414-1e83-8cf6-2bf22a41ae9c@gmail.com>
 <20201002185828.GC29706@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fKov5AqTsvseSZ0Z"
Content-Disposition: inline
In-Reply-To: <20201002185828.GC29706@Asurada-Nvidia>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--fKov5AqTsvseSZ0Z
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 02, 2020 at 11:58:29AM -0700, Nicolin Chen wrote:
> On Fri, Oct 02, 2020 at 06:02:18PM +0300, Dmitry Osipenko wrote:
> > 02.10.2020 09:08, Nicolin Chen =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > >  static int tegra_smmu_of_xlate(struct device *dev,
> > >  			       struct of_phandle_args *args)
> > >  {
> > > +	struct platform_device *iommu_pdev =3D of_find_device_by_node(args-=
>np);
> > > +	struct tegra_mc *mc =3D platform_get_drvdata(iommu_pdev);
> > >  	u32 id =3D args->args[0];
> > > =20
> > > +	of_node_put(args->np);
> >=20
> > of_find_device_by_node() takes device reference and not the np
> > reference. This is a bug, please remove of_node_put().
>=20
> Looks like so. Replacing it with put_device(&iommu_pdev->dev);

Putting the put_device() here is wrong, though. You need to make sure
you keep a reference to it as long as you keep accessing the data that
is owned by it.

Like I said earlier, this is a bit weird in this case because we're
self-referencing, so iommu_pdev->dev is going to stay around as long as
the SMMU is. However, it might be worth to properly track the lifetime
anyway just so that the code can serve as a good example of how to do
things.

If you decide to go for the shortcut and not track this reference
properly, then at least you need to add a comment as to why it is safe
to do in this case. This ensures that readers are away of the
circumstances and don't copy this bad code into a context where the
circumstances are different.

Thierry

--fKov5AqTsvseSZ0Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl967iIACgkQ3SOs138+
s6FMlQ/+PI2U3e9+14M09UT7Av+BBmD/Af5CKPGXxy5A3EG9pX97uPO6q6kt30/1
5VnVWJnXCZESSl2ZFNwXcTOrSZ6Pre5QUH8LTM7TG+QcJH3bSn1wk7jZj6snYOto
z9scPx+zNCqw1lyMbiEd+GkI5DVrrGM6qFH2wESur0ZNn4VUO//DWhOUH62uM1tc
SuByO6o1fcf66jjb6AHwd79BaIXn6E7rKEdQpRFdTmFhZVxCae2fVeETtQ7IPhBL
t4K5SBNjdv/2bD1GEKvOgt2ZufQGqkmB52cCW4FFvv+sSzi3nlv3c1W8hMWGgptA
l/wCei1ZGNU0bwM/Vk+f+/LYjveIarkYsVmZOoamvcliCtnpmpkhznqJy2MJf5GV
jqYQqzG8WyU0JW3vO6jqTz421YmNqajs82APyv7wHn5/Vq4oicDEh67RQvSqxzV5
t1gnQaS19CsoB8TLDJE8VYUGnnZ5mxcNwE+P4dy65O21KmyzjJSkwmzSSfaGklG9
6xLedqfYr2c1YkEiPjYrwpDuLa5ID7A9ohk8x4dkd2OCz/80f4QBnJNt7uv5la1N
U91E6tJ2cLMkQdxP3RQatyYRlkZk/IQTwtQ9LwuQkAmB/PGb9HcfhGc7cPz2UPZA
QQ8+ZwFqEJrHlmVudKnjX1HU+FRSvzu3ComceNZjbqXaEd+F9NU=
=jGLH
-----END PGP SIGNATURE-----

--fKov5AqTsvseSZ0Z--
