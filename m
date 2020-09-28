Return-Path: <SRS0=0tg+=DF=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8325BC2D0A8
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Sep 2020 07:30:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3EF4B2080C
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Sep 2020 07:30:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EhGN027Y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726601AbgI1H37 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 28 Sep 2020 03:29:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726380AbgI1H37 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Sep 2020 03:29:59 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65D5EC0613CE;
        Mon, 28 Sep 2020 00:29:59 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id y15so722wmi.0;
        Mon, 28 Sep 2020 00:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bF/OnDFWmdsOAeKw0pjT2s2NRWyUP9adi1FvocC8S30=;
        b=EhGN027YIfnUroT09Zul029bsKtuEI9Vn34Y0t1ktyGhGBsIcFcwOjKdCiG+2hE4ps
         Y9TvvAnJnHybKi2rSQEAr6J4V+O/7leGexHfnwMAbR025HISdBrFMltowVeJZ1PkHUAo
         JyZLWVmdSrTkG5FbxFRjNCfKOapM6LixMqXeUD8qaP5PT5OCVOspbOX0phdhbtB6LQpL
         QYJqwi1QiZpNxsiaGxlkUfOd2yep3zvczh50Ta/wEr3vhpfbkrp1zE1CdSAE6fYiLF+3
         LwBIWz3pW5/KcB4XjNWXQuKRhUsrKEylzaax1e9VZCG3ZFbf+Dklalbec1ftvoUiXOkT
         Zl1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bF/OnDFWmdsOAeKw0pjT2s2NRWyUP9adi1FvocC8S30=;
        b=fnI9bfbSc0W9p7CQD6UQ50utgUKPJQSz4q7tRj3tqPEES2V9NyiIhxNYPNjAzLXuYf
         b+hOtixlrmzpBOwIIhhclM5h5AxHAaww6pGavf/vTUs8noArcfNManpCqjXiWRBTWxcT
         qGBoPSbqqqxBOx5FLyiM53s0nNQQCYRtpEoNxsJT9iB+T2kylac5UgvHJqdwjDabfx1S
         NGtuXnKsUDMEis+5S4auUDoKNh8j9NZ9ukLhrFcjVzsnAbIGwDr4Rfv1J+/5kNFQjCTE
         YdTU+fQ+umxkBytT44BeHpdxzv92zY1u0HvIGIwMX8B9SDrTHtjeNhfBnlWZKRqiWpje
         7VWQ==
X-Gm-Message-State: AOAM532PCJm9JyKMUfGlpYo311t34VFEU+HiTzjcB4xZFPFCDXEm3oAH
        YSQB3leDeLMHKLZbLCLIfew=
X-Google-Smtp-Source: ABdhPJxNDrukC9APqj+RTbzGExbp0pT2hq1z/Dc47qwzrMtRliDqaoqI/UCgUN1hj3wuy9Dm5WKDBg==
X-Received: by 2002:a1c:8109:: with SMTP id c9mr170496wmd.130.1601278198056;
        Mon, 28 Sep 2020 00:29:58 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id f16sm192994wrp.47.2020.09.28.00.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 00:29:56 -0700 (PDT)
Date:   Mon, 28 Sep 2020 09:29:55 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Nicolin Chen <nicoleotsuka@gmail.com>, joro@8bytes.org,
        krzk@kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        jonathanh@nvidia.com
Subject: Re: [PATCH 3/5] iommu/tegra-smmu: Use iommu_fwspec in
 .probe_/.attach_device()
Message-ID: <20200928072955.GE2837573@ulmo>
References: <20200926080719.6822-1-nicoleotsuka@gmail.com>
 <20200926080719.6822-4-nicoleotsuka@gmail.com>
 <ccb95c4e-64ba-bab9-1f75-0c6d287540b0@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="N1GIdlSm9i+YlY4t"
Content-Disposition: inline
In-Reply-To: <ccb95c4e-64ba-bab9-1f75-0c6d287540b0@gmail.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--N1GIdlSm9i+YlY4t
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 26, 2020 at 05:48:17PM +0300, Dmitry Osipenko wrote:
> 26.09.2020 11:07, Nicolin Chen =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
> > +	/* NULL smmu pointer means that SMMU driver is not probed yet */
> > +	if (unlikely(!smmu))
> > +		return ERR_PTR(-EPROBE_DEFER);
>=20
> Hello, Nicolin!
>=20
> Please don't pollute code with likely/unlikely. This is not a
> performance-critical code.
>=20
> ...
> > -static struct platform_driver tegra_mc_driver =3D {
> > +struct platform_driver tegra_mc_driver =3D {
> >  	.driver =3D {
> >  		.name =3D "tegra-mc",
> >  		.of_match_table =3D tegra_mc_of_match,
> > diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
> > index 1238e35653d1..49a4cf64c4b9 100644
> > --- a/include/soc/tegra/mc.h
> > +++ b/include/soc/tegra/mc.h
> > @@ -184,4 +184,6 @@ struct tegra_mc {
> >  int tegra_mc_write_emem_configuration(struct tegra_mc *mc, unsigned lo=
ng rate);
> >  unsigned int tegra_mc_get_emem_device_count(struct tegra_mc *mc);
> > =20
> > +extern struct platform_driver tegra_mc_driver;
>=20
> No global variables, please. See for the example:
>=20
> https://elixir.bootlin.com/linux/v5.9-rc6/source/drivers/devfreq/tegra20-=
devfreq.c#L100
>=20
> The tegra_get_memory_controller() is now needed by multiple Tegra
> drivers, I think it should be good to have it added into the MC driver
> and then make it globally available for all drivers by making use of
> of_find_matching_node_and_match().
>=20
> diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
> index e1db209fd2ea..ed1bd6d00aaf 100644
> --- a/drivers/memory/tegra/mc.c
> +++ b/drivers/memory/tegra/mc.c
> @@ -43,6 +43,29 @@ static const struct of_device_id tegra_mc_of_match[] =
=3D {
>  };
>  MODULE_DEVICE_TABLE(of, tegra_mc_of_match);
>=20
> +struct tegra_mc *tegra_get_memory_controller(void)
> +{
> +	struct platform_device *pdev;
> +	struct device_node *np;
> +	struct tegra_mc *mc;
> +
> +	np =3D of_find_matching_node_and_match(NULL, tegra_mc_of_match, NULL);
> +	if (!np)
> +		return ERR_PTR(-ENOENT);
> +
> +	pdev =3D of_find_device_by_node(np);
> +	of_node_put(np);
> +	if (!pdev)
> +		return ERR_PTR(-ENODEV);
> +
> +	mc =3D platform_get_drvdata(pdev);
> +	if (!mc)
> +		return ERR_PTR(-EPROBE_DEFER);
> +
> +	return mc;
> +}
> +EXPORT_SYMBOL_GPL(tegra_get_memory_controller);

We already have tegra_smmu_find(), which should be enough for this
particular use-case.

Thierry

--N1GIdlSm9i+YlY4t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9xkPAACgkQ3SOs138+
s6H/Ww//axiMGWtEaBa6mSFaKucJWg7WRx/NjtSytJae6gNjLDhCYs0e/MsdC+2m
mqh38guFQBGvXQwAZ5xo8sR2PtGOOcjnndRKlSbc/bSVvn6M2CQz45NU4HUvvdCs
lHwZ9kaWUx7IhjiDdifkvrtViY7WWadvAX3YakU4kCRps5nqb2WJje2HTP2JYFFM
+ORPzBnh/OlVmq/Gc9+ie58p5A8ke4HIEX5NcZYFyVUi32BD+gqpO0miVc05g0/w
9dgrRaZuRjuriprLLua36QVHs5aXyhXU3Gt+JXph7d/2izf8yMbUZUfLmVAUVPTW
Sv8vns4dIqQuk7iLzAFojHs+t2uXi7XgV4Ro3gi3DPKTh5qPUC8LUnDxtTH+PYev
U0bxHIX+ISOtCxOoMPE3LJRysmc3HeP6/lqi7CE6ex9luJYNKnwmx1EaSPPRzhGR
A0RCrSgzkksLY+MA2IaGkVevvPQSbGfwJHyJaJ2LHarz1UrNy2zEwI2wRzSZ0sz7
4R9uE+AdhMfDvUhKdb/iLQFZpumEtwPd+zd9STM+YIoNEIbeIpjYW/dYj9KgOU2Y
7a5R0xrra4PqYRirC2UI8hIDV+H5ab2b9t6VvQg/L9ZsKFl9kIKjeaHInBWfLmcr
Sumt/gEOrzHgkjsoNBz01rZ+5flTzN5hJfndpH44kQwfX/HjGoE=
=+zqu
-----END PGP SIGNATURE-----

--N1GIdlSm9i+YlY4t--
