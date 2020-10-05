Return-Path: <SRS0=kAmo=DM=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88D1BC4363A
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 10:56:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 49E052078E
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 10:56:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nRLdqwaK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725891AbgJEK4n (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Oct 2020 06:56:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726000AbgJEK4m (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Oct 2020 06:56:42 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 608A2C0613CE;
        Mon,  5 Oct 2020 03:56:42 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id md26so11217212ejb.10;
        Mon, 05 Oct 2020 03:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VW36Bst63UeT/9fe8A8vDqB0S1/3TYgq9jtrOPWsAZs=;
        b=nRLdqwaKzsmfCRbzw5SUMaTGJLmNSBJ+TehPsPq3wCvHmY7Yjc90gZZZNZSwdSZ97j
         aui4NMg6xjoXyigagvtR62Z3dNDegghCRHUhsLSft1vgBkpehMNmKR35UQ7eaTqmW1o/
         nX04uxYhqDb/4r9kLIX1r7DIWNXP1cr6t6gOpLuGgN4iGvXaxvNINaXqB+RDyKRMB+By
         brM273zh8itQmDboJJBqCXnTbZ/R9an2gUiurCHx0iS2Z9PJcjLSYdhixmiEqY4o435Y
         VHRoDMwFMp0DOXVAt+Gt0WJtsPGw31cb8ego7zxrfrCDl/D7piC8udYGAYdnb5u9ckzS
         6tTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VW36Bst63UeT/9fe8A8vDqB0S1/3TYgq9jtrOPWsAZs=;
        b=pM0XHBvym/nI+kC06KF7a5vVhEHnHQ7vyuer5xoFgKpguKcXWPY20HVr1ri5vjdHSh
         DwbzgevlwcOdHgIP+ko3XpmODqCMoee1vkoxEZdqMaSgcDEeCPWwW0T7TLvpq4uzYSQ2
         24pRDsoZsYZ2FH97KSOt2NMU67CZoke0FWR/qK+Cc3tvI/OSdGBQs1TdBRxa3GdOCzzT
         x4g2Zf7ywUFH1n3c2erO2KkrJgZPUEZTExwyNW0fer7v6c5x2Sz4JF+onMCTXwd4D1Hp
         schX7Ux9voyvcanKA2kFnT02i/kmLY2kP4YhXMTJuLTsMvBpQ0UgOg2X8oD6jW9US41k
         wrKw==
X-Gm-Message-State: AOAM533SE0Up+VxJnxr0mes0BPAM8Ov8yuO1JNusi4FyeQlZlVX/mhez
        c9ji0jv164zFOcMUD5YoL/bbzsSecRk=
X-Google-Smtp-Source: ABdhPJwwZBa9wb6JyFeflQsILPmL40Kga6MU0GdxaM20mu+y+14QfuFYq1F06rv+x90g3Ta7K9VW+w==
X-Received: by 2002:a17:906:70d4:: with SMTP id g20mr15543122ejk.413.1601895400994;
        Mon, 05 Oct 2020 03:56:40 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id y11sm3444085edu.85.2020.10.05.03.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 03:56:39 -0700 (PDT)
Date:   Mon, 5 Oct 2020 12:56:38 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Nicolin Chen <nicoleotsuka@gmail.com>, joro@8bytes.org,
        vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] iommu/tegra-smmu: Rework tegra_smmu_probe_device()
Message-ID: <20201005105638.GO425362@ulmo>
References: <20201003065947.18671-1-nicoleotsuka@gmail.com>
 <20201003065947.18671-3-nicoleotsuka@gmail.com>
 <4a5a5b1c-080a-327a-1e2f-dc087948e1a1@gmail.com>
 <20201004215731.GA21420@Asurada-Nvidia>
 <689c3d90-e05c-d36a-bf37-0bec100040f5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="KDy5+/kaQUC2a3Gw"
Content-Disposition: inline
In-Reply-To: <689c3d90-e05c-d36a-bf37-0bec100040f5@gmail.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--KDy5+/kaQUC2a3Gw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 05, 2020 at 11:41:08AM +0300, Dmitry Osipenko wrote:
> 05.10.2020 00:57, Nicolin Chen =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Sat, Oct 03, 2020 at 05:06:42PM +0300, Dmitry Osipenko wrote:
> >> 03.10.2020 09:59, Nicolin Chen =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>>  static int tegra_smmu_of_xlate(struct device *dev,
> >>>  			       struct of_phandle_args *args)
> >>>  {
> >>> +	struct platform_device *iommu_pdev =3D of_find_device_by_node(args-=
>np);
> >>> +	struct tegra_mc *mc =3D platform_get_drvdata(iommu_pdev);
> >>>  	u32 id =3D args->args[0];
> >>> =20
> >>> +	put_device(&iommu_pdev->dev);
> >>> +
> >>> +	if (!mc || !mc->smmu)
> >>> +		return -EPROBE_DEFER;
> >>
> >> I'm not very excited by seeing code in the patches that can't be
> >> explained by the patch authors and will appreciate if you could provide
> >> a detailed explanation about why this NULL checking is needed because I
> >> think it is unneeded, especially given that other IOMMU drivers don't
> >> have such check.
> >=20
> > This function could be called from of_iommu_configure(), which is
> > a part of other driver's probe(). So I think it's safer to have a
> > check. Yet, given mc driver is added to the "arch_initcall" stage,
> > you are probably right that there's no really need at this moment
> > because all clients should be called after mc/smmu are inited. So
> > I'll resend a v6, if that makes you happy.
>=20
> I wanted to get the explanation :) I'm very curious why it's actually
> needed because I'm not 100% sure whether it's not needed at all.
>=20
> I'd assume that the only possible problem could be if some device is
> created in parallel with the MC probing and there is no locking that
> could prevent this in the drivers core. It's not apparent to me whether
> this situation could happen at all in practice.
>=20
> The MC is created early and at that time everything is sequential, so
> it's indeed should be safe to remove the check.

I think I now remember exactly why the "hack" in tegra_smmu_probe()
exists. The reason is that the MC driver does this:

	mc->smmu =3D tegra_smmu_probe(...);

That means that mc->smmu is going to be NULL until tegra_smmu_probe()
has finished. But tegra_smmu_probe() calls bus_set_iommu() and that in
turn calls ->probe_device(). So the purpose of the "hack" in the
tegra_smmu_probe() function was to make sure mc->smmu was available at
that point, because, well, it is already known, but we haven't gotten
around to storing it yet.

->of_xlate() can theoretically be called as early as right after
bus_set_iommu() via of_iommu_configure() if that is called in parallel
with tegra_smmu_probe(). I think that's very unlikely, but I'm not 100%
sure that it can't happen.

In any case, I do agree with Dmitry that we should have a comment here
explaining why this is necessary. Even if we're completely certain that
this is necessary, it's not obvious and therefore should get that
comment. And if we're not certain that it's necessary, it's probably
also good to mention that in the comment so that eventually it can be
determined or the check removed if it proves to be unnecessary.

Thierry

--KDy5+/kaQUC2a3Gw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl96++MACgkQ3SOs138+
s6GRgBAAqmH9PfL0fo3tHWKylZ/CG+Es9277l5AGEZHysCC9KkyssEr0Om2gAKZ0
kQKxk5vjbooZbfu+0PWRCJ00FXfXZ4TbwVuyv3xjltqfmqM1RsrMYq/RcmM8bTbh
j62j9Gi9milT8vw+7dNUF+3Ys5ZoK+xcD0ak8KjsvS9ey76vh5EZAH+LX5sdhzdP
CbvEK3MKAd5QAhfTuRpUjl+MtsVvUoqJklLHpO+jE5mSDyZT0HSCmwIO1UYNn58P
VwupVaxbz0aQdBLMCzkGXD7dzE/gsMoOZS3XiS+C4OPp538N60jIgnC6RY/CpITJ
bqrwfr6IUiw5JejUbIacQfqtwLsts8eM23dw8kCDhVl3kqtp+hh1tNvarG30SsO5
HtgYkPjPloGm9bLTQALE0zhacm9fqouGbC+vY6ylrJZ3YpHGFNUCtuw2nFGG9x7t
yhxEiiNu+0syuI3kQ1DN6gbeTdWPTCGoZEHygt92oL2CziPWmyCkwHlhuG88t08h
iotw38Jp0eoYAq7Q02NwUjtXMkRQrb7pMIg8L8SKZ7i2rmDet/vTk5fQ0T22ncsH
lm6mfrBCUvZTNmT2JcEaf8vgncTi+CGIUF+Ex79IOkkaq0DLe82G5CGMxzE+LF9L
oQ3SgSuVeeII+snXcopbqhevrLsTnECBrTOooIOiJiErxXDLFhk=
=AIlO
-----END PGP SIGNATURE-----

--KDy5+/kaQUC2a3Gw--
