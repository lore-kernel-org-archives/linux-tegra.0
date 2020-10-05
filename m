Return-Path: <SRS0=kAmo=DM=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 038E7C4363A
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 09:47:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A178220776
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 09:47:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jFFP2Tx+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725891AbgJEJr5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Oct 2020 05:47:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725887AbgJEJr5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Oct 2020 05:47:57 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEB6AC0613CE;
        Mon,  5 Oct 2020 02:47:56 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id n22so8578364edt.4;
        Mon, 05 Oct 2020 02:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8FVfgUbPigKX8q6acs/usUL41ngU1LBGrHZ+WyTTHpU=;
        b=jFFP2Tx+qnv8xeJv5u+m8BMlaEvC9R8HisLPC2n45BC78Gaj+EG538YmJx3bfIl9AG
         FQbQCH56fruWaCLp0aoQBXR8s32E9BaTtJ7rMPUEJ07Y7kt2qDHFz4AlTBuUFk8SD6vK
         gHPVFv041qFnDatTOgx8Q4luMBuDBdolJoIuJupQCt2EUmqc21uEpaWzMnMh3PLI/AnW
         KGgqD442EcPSJzE4gJ9NmTwsxMgh7CKyuuFTkaE1p7oPrTaUwzLDEhhGs9vTWci2ushb
         yQQz73y/GCHV6QzYV7/i1T5jg8a3SZHQ3aNC7L39z/PtC1f09iJn++mvtEeQjeC42WHP
         /2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8FVfgUbPigKX8q6acs/usUL41ngU1LBGrHZ+WyTTHpU=;
        b=qZdqAnxvuHlx3gjxQNuKi3EyC2XfXbOyp9NuS2IZyLaKkLrXS/vHA10KdTfmOUvT6s
         oZuExwp4AQxmCmyt1aiHPnhJ7FU3fP2PxiC7r0zk1CJ2EEzNrKJCu7zZfJzUIxpAPVeM
         j9dVgklSPY/3qKBwXEIPhczYLBkl5XMpJkvshKEdsvhxN3VWcEooKIBx/yQI34not9sH
         NI8LFlL4rY62jQndldn5hk32DxC7IjK7aZ8vDWSPuoN4IJAN9AETzY14S00MyboEVsSo
         636HZh1+Y4oAEttAhaktAkdT2iYK+pwgIzEkL1lzAPCOHrIFTM36zgdk+d2ehkBC8wO4
         wE3w==
X-Gm-Message-State: AOAM532Fqm2qNt40CpqlNE7oTP3KTDfv38sQZrslowOEQXHSWiPAs6fQ
        9ND9FsJ23ocFtPjPjLjWr1M=
X-Google-Smtp-Source: ABdhPJzj1lshRyTwroPH5unbnCt2C6kPU7UiCL8EBBHIsEdetc+VATQp5cQQopto3L7ArF3KqR3LXQ==
X-Received: by 2002:aa7:c54f:: with SMTP id s15mr3575372edr.107.1601891275435;
        Mon, 05 Oct 2020 02:47:55 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id s1sm1950125edi.44.2020.10.05.02.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 02:47:53 -0700 (PDT)
Date:   Mon, 5 Oct 2020 11:47:52 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>, joro@8bytes.org,
        vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] iommu/tegra-smmu: Rework tegra_smmu_probe_device()
Message-ID: <20201005094752.GG425362@ulmo>
References: <20201002060807.32138-1-nicoleotsuka@gmail.com>
 <20201002060807.32138-3-nicoleotsuka@gmail.com>
 <c42f1f51-9fa5-6503-91aa-3809f1f27d0c@gmail.com>
 <0f186339-1e49-4878-834e-11ae8bf140f2@gmail.com>
 <20201002195328.GE29706@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Y+xroYBkGM9OatJL"
Content-Disposition: inline
In-Reply-To: <20201002195328.GE29706@Asurada-Nvidia>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--Y+xroYBkGM9OatJL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 02, 2020 at 12:53:28PM -0700, Nicolin Chen wrote:
> On Fri, Oct 02, 2020 at 05:58:29PM +0300, Dmitry Osipenko wrote:
> > 02.10.2020 17:22, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > > 02.10.2020 09:08, Nicolin Chen =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > >> -static void tegra_smmu_release_device(struct device *dev)
> > >> -{
> > >> -	dev_iommu_priv_set(dev, NULL);
> > >> -}
> > >> +static void tegra_smmu_release_device(struct device *dev) {}
> > >=20
> > > Please keep the braces as-is.
> > >=20
> >=20
> > I noticed that you borrowed this style from the sun50i-iommu driver, but
> > this is a bit unusual coding style for the c files. At least to me it's
> > unusual to see header-style function stub in a middle of c file. But
> > maybe it's just me.
>=20
> I don't see a rule in ./Documentation/process/coding-style.rst
> against this, and there're plenty of drivers doing so. If you
> feel uncomfortable with this style, you may add a rule to that
> doc so everyone will follow :)

I also prefer braces on separate lines. Even better would be to just
drop this entirely and make ->release_device() optional. At least the
following drivers could be cleaned up that way:

    * fsl-pamu
    * msm-iommu
    * sun50i-iommu
    * tegra-gart
    * tegra-smmu

And it looks like mtk-iommu and mtk-iommu-v1 do only iommu_fwspec_free()
in their ->release_device() implementations, but that's already done via
iommu_release_device().

Thierry

--Y+xroYBkGM9OatJL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9668UACgkQ3SOs138+
s6E2dg//V+pp9h+NZZeSpxS6ef49t6f3JNwWjeDDqOJXRqCkou8l/ocyhlvDyypT
rk9YAef+4foynhex5mIEEeQ7KOSgG0wCv1FuH5AlIN5uo/H4NO1pyB4c/P0pSEb+
aj6MfC5oV+ZTNpTTYWGsVv9naSRu6l47V99kv9B8pguq7aU9286Ef/oDTtqgp3bz
xJoEmgiUOtzxkQQZX+//+VFoWzcxbEsNe16zPKxYU+EWH6aqYCK6d5teTROfujjO
JfbsWm8/3/i3gRvhSNDc7bdM2NAx8f66RA15z3PAKiKSSoKAaKedJZOxINYCO2rx
s0u9wQqo36mTujtIIsoq8L3mjcysi+FsInikeX1+FDusQKGOAFQMUHS+odMpi8/4
uUXeGsWNdDBP4e61fLfG53dc2rvqHSvkycwqtXMTpSQc3ToXXoY8y/b6yyCEh+Rm
2mUSe/9KyKaGTm1mvMyL+zAvfYsMbFPD8W6q12e9lpPBzdOSuSufBtvgJZTw9UUi
tqO38VLE6TxhC2Z0x4Eoi/yVPmfgDl4F+XkeA2c4IN872hPrhjSDI4uCL32Rj37d
th/YMvGIIGQ3btUqonM3/ghgFXJGhvR31IudFTLoa4qIhhtqF8bSqD8ZUGJMW9zR
QUfY8opIepx9pdQ3ZDzDNnTNZjRXS1LdKqjM8cKZsctUB83ENyw=
=vOdp
-----END PGP SIGNATURE-----

--Y+xroYBkGM9OatJL--
