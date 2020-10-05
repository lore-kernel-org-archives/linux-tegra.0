Return-Path: <SRS0=kAmo=DM=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CC11C4363A
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 11:15:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 40F3C20774
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 11:15:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O1OflwmK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725930AbgJELPw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Oct 2020 07:15:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725917AbgJELPv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Oct 2020 07:15:51 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ACDEC0613CE;
        Mon,  5 Oct 2020 04:15:51 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id p15so11313677ejm.7;
        Mon, 05 Oct 2020 04:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=G52tFSPPaeht3TFoNGYf73lcJsIZuvlxHBvQMW/kYTU=;
        b=O1OflwmKg/lBEsgt/JHLEvrfnvNzpwEXpE8fFMtuWYxf+A+RoxndDbsn5LoJWd76rZ
         0+vn8POURTdeC328btpQRpm4nXLSo4u/idERBuAzHc7XKlnnmRXNmNTGhULHWOoCsmho
         7i4XbzZ6uDnEcI5uWCZ6S/iacGeL25pv66yo/HYTCsclb9ngKq83jIVhDpB6n60M71l9
         /BdQKt1toZpEgDvfMOItPNPlOYKDmmnt3bNQIzcg0Yvrog26m+a93iIkOx6KQHUjz8DJ
         A87qg5V4LoOr4ik/fa/lswadxMLyswrdG4FUHt+aP9ZIuExI5Leek0XL+/AXNwjMYyWO
         WRAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=G52tFSPPaeht3TFoNGYf73lcJsIZuvlxHBvQMW/kYTU=;
        b=WVEuIM70b7oSsgz9ity2oQPKXiP1AwGD0q5r+jpT82KW0mzBnrIkhjsBVrPF9Skdun
         HnKX4p/Bazvh7TGBGqDSyLz5WcdBasDXZrzGIeN6hSCViKC+tvty/yyWHt9LtWi6iyk4
         4T8rflmUsqo4Br488fbyD/9exKnmAF7foZPoySEC8/Pms5QL4WCgvt7IeKQdv9BSp3pd
         bWV5gGjLGc+o8EIFTMRKUqGxPOveLtIsyBjtx4rpYfffFJYb7hEuZfaaO4iRytIP9uhg
         RQAeQ33uoqfJSKVm5l48wPa3d732wvM2taZNTLVPbfffeE5bhe+320KCoYBx2RyvAhRw
         ZNXg==
X-Gm-Message-State: AOAM533/VenlZiYvuXWxYA/Qh4rO+9tpRCvuD2rmBsUxwQ2OMkfAAjJn
        2sovzTm71eCKMAWe5E/nzb8=
X-Google-Smtp-Source: ABdhPJwnrPmzKEGgsIBpUDZrJBddWhelV8OEvD0c3B5sPykEx4pFJr9tbKxbiHK8nWO5lRmxpDgHDw==
X-Received: by 2002:a17:906:940c:: with SMTP id q12mr15491682ejx.195.1601896550021;
        Mon, 05 Oct 2020 04:15:50 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id y3sm1426201ejk.92.2020.10.05.04.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 04:15:48 -0700 (PDT)
Date:   Mon, 5 Oct 2020 13:15:47 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Nicolin Chen <nicoleotsuka@gmail.com>, joro@8bytes.org,
        vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] iommu/tegra-smmu: Rework tegra_smmu_probe_device()
Message-ID: <20201005111547.GQ425362@ulmo>
References: <20201002060807.32138-1-nicoleotsuka@gmail.com>
 <20201002060807.32138-3-nicoleotsuka@gmail.com>
 <b1a195cf-0127-0531-f6d1-835367511f57@gmail.com>
 <0c66bab9-0132-d3fb-ea4e-de1278cf2b04@gmail.com>
 <20201005095351.GI425362@ulmo>
 <ae48aaaf-fe10-6de4-06bb-2afbde799168@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kZU6r8y0YpRwyDfh"
Content-Disposition: inline
In-Reply-To: <ae48aaaf-fe10-6de4-06bb-2afbde799168@gmail.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--kZU6r8y0YpRwyDfh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 05, 2020 at 01:36:55PM +0300, Dmitry Osipenko wrote:
> 05.10.2020 12:53, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Fri, Oct 02, 2020 at 05:50:08PM +0300, Dmitry Osipenko wrote:
> >> 02.10.2020 17:22, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>>>  static int tegra_smmu_of_xlate(struct device *dev,
> >>>>  			       struct of_phandle_args *args)
> >>>>  {
> >>>> +	struct platform_device *iommu_pdev =3D of_find_device_by_node(args=
->np);
> >>>> +	struct tegra_mc *mc =3D platform_get_drvdata(iommu_pdev);
> >>>>  	u32 id =3D args->args[0];
> >>>> =20
> >>>> +	of_node_put(args->np);
> >>>> +
> >>>> +	if (!mc || !mc->smmu)
> >>>> +		return -EPROBE_DEFER;
> >>> platform_get_drvdata(NULL) will crash.
> >>>
> >>
> >> Actually, platform_get_drvdata(NULL) can't happen. I overlooked this.
> >=20
> > How so? It's technically possible for the iommus property to reference a
> > device tree node for which no platform device will ever be created, in
> > which case of_find_device_by_node() will return NULL. That's very
> > unlikely and perhaps worth just crashing on to make sure it gets fixed
> > immediately.
>=20
> The tegra_smmu_ops are registered from the SMMU driver itself and MC
> driver sets platform data before SMMU is initialized, hence device is
> guaranteed to exist and mc can't be NULL.

Yes, but that assumes that args->np points to the memory controller's
device tree node. It's obviously a mistake to do this, but I don't think
anyone will prevent you from doing this:

	iommus =3D <&{/chosen} 0>;

In that case, since no platform device is created for the /chosen node,
iommu_pdev will end up being NULL and platform_get_drvdata() will crash.

That said, I'm fine with not adding a check for that. If anyone really
does end up messing this up they deserve the crash.

I'm still a bit undecided about the mc->smmu check because I haven't
convinced myself yet that it can't happen.

Thierry

--kZU6r8y0YpRwyDfh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl97AGMACgkQ3SOs138+
s6EFMhAArB0+w3SsuWOHgLNkY+cFC6nn9FHzozivUKxgv7oSV8svQmcqrUMlfk1C
ZFlyT3HtM1POgbubhOVdybFepULnAvsKut9TD5J8EFvzHZJwYqjyVwwD0VqVry2c
a/zGLATS4nqtMIfgCHQ9hzlNMQa+/S59RO68oLpZdHwRSst+D1fwi6gY+dFn3HoJ
G2x94K10487l1O+wQjN5kQWu9gxzv4tuauLz1OHE+WvP75la9tDjcXMFwH/Jutsa
F7W1H97dD6+YGeNbEKtQ6WkI04D1WIh/9WaryJLDUzvuuw2JyEHEGLdyd9wtfABE
WWvctvwP9lDkLaRz1yOBQBHVWFE+dr6/mHmf3goKN0r4UilDRbpWFsOEEj4BF5Dd
MsiWEayh7MMRzmH66nmfR/ZeJYE05pE7hth/JSmfYVVMTiuOb2ZS2CFk9llO8png
9x6Hy+XrCDqfAoldTfGHiytYIcWEB1nMMRa1SqDqRtVgPxsDmtWXda5eAYqJVjRq
jwgdOPF07B1Y1q+Q9Xn/MQdSlbVK5S4nc3kz3ltmUB9ktVsUetBJs4Xqsr5jwhO5
7+BGIyn/e/y6k5SHQj6rMc87ByIBNrtGooZiPxVgYbKlI/ASye/ZQgY1kO93d+zK
XJ31HMNds7kT5gIaqmtZqUsAdkWHSeQKJqdLsGal3zY8Y62cahE=
=l8C/
-----END PGP SIGNATURE-----

--kZU6r8y0YpRwyDfh--
