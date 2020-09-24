Return-Path: <SRS0=yNrD=DB=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3B0BC4363D
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Sep 2020 10:23:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A5FE623741
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Sep 2020 10:23:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RFnsISeh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727330AbgIXKXR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 24 Sep 2020 06:23:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727089AbgIXKXR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Sep 2020 06:23:17 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4EC8C0613CE;
        Thu, 24 Sep 2020 03:23:16 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id d4so2944297wmd.5;
        Thu, 24 Sep 2020 03:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=EVfZA8Ct79CbPZklHfFRotVXFuhWd9+as8robUKzh4k=;
        b=RFnsISeh2H1GKnONLlgbr2NxtGdER3flCTS61Yyr/wr+dppwJjXOgsShgvRmJMJP4S
         ZNqSg5vliGpP6p+YIrVsVvjtTMKa7suw0pt0H9EQbsNS628luftbpxDnsyr8d+c/Kt49
         b5FghArvusHD1IIv9jqCrgqVkWwynaWKpjZ4uVAudh901f5qy7svs5qlukrYGEFvtrzJ
         +NaiP+JEFJZkiIEKC8bZYv72Q9xtHAqtef6fUGJyFCMW58YFWsqKe+HxiPNbL2nE0qzP
         oH/JDKFs+Gpm7CsYybhiaN82SS3L7+tM+GtDNv8PGbuXXh49uUSA2luFxWfnwq5ce4mW
         mEZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=EVfZA8Ct79CbPZklHfFRotVXFuhWd9+as8robUKzh4k=;
        b=Ny8pBRPulAtArl8O9T/mgJ7N4I7T/QYr/zROvyCydlefRS6qsHI1CRhjD2u3SIX+JA
         U4wXfXOgHYNg/frtE0wt0cZmeknd5tjglzQ9HJGIfrCDQubBr/lUoxliTbomlycr9vDh
         Is1X+V4b1/Dnk93H9lfF+BrAIh6zWk9i4Inr2b/y8ni3pNjDZVFQrU2CK8Hyg3xILZ4e
         DpxTq+t85IxEiuOh//GV5G2gkTDmR6yKvaifbdqazpJZ0HnY0O2PmFsk6A2Tj7iEVZtN
         Fo7r1YGzX02wu0DEuJ7I8H+Cru0W5/B2KnYl3AU1Q4pMzWAbI2V6Zp9R7vOThQl/jc6s
         +eHg==
X-Gm-Message-State: AOAM532XVq1t7YyvGp26HR9uJAB7M2lFahI6p1vJ5eSybHf3JdlVUkMI
        KyN3rs1RxEZfA8Z+xcWHPOA=
X-Google-Smtp-Source: ABdhPJzw+VjS6qW3ICFO0IQrZ5i6ll2keFfG0Jk2Pm3kmAheCl4xQOGiaStfjuT1zAoKEsb0Sub9SA==
X-Received: by 2002:a1c:488:: with SMTP id 130mr3831012wme.164.1600942995364;
        Thu, 24 Sep 2020 03:23:15 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id u63sm2952064wmb.13.2020.09.24.03.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2020 03:23:14 -0700 (PDT)
Date:   Thu, 24 Sep 2020 12:23:12 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     joro@8bytes.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
        jonathanh@nvidia.com, vdumpa@nvidia.com
Subject: Re: [PATCH 1/3] iommu/tegra-smmu: Do not use PAGE_SHIFT and PAGE_MASK
Message-ID: <20200924102312.GG2483160@ulmo>
References: <20200911071643.17212-1-nicoleotsuka@gmail.com>
 <20200911071643.17212-2-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="/i8j2F0k9BYX4qLc"
Content-Disposition: inline
In-Reply-To: <20200911071643.17212-2-nicoleotsuka@gmail.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--/i8j2F0k9BYX4qLc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2020 at 12:16:41AM -0700, Nicolin Chen wrote:
> PAGE_SHIFT and PAGE_MASK are defined corresponding to the page size
> for CPU virtual addresses, which means PAGE_SHIFT could be a number
> other than 12, but tegra-smmu maintains fixed 4KB IOVA pages and has
> fixed [21:12] bit range for PTE entries.
>=20
> So this patch replaces all PAGE_SHIFT/PAGE_MASK references with the
> macros defined with SMMU_PTE_SHIFT.
>=20
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
>  drivers/iommu/tegra-smmu.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
> index 046add7acb61..789d21c01b77 100644
> --- a/drivers/iommu/tegra-smmu.c
> +++ b/drivers/iommu/tegra-smmu.c
> @@ -130,6 +130,11 @@ static inline u32 smmu_readl(struct tegra_smmu *smmu=
, unsigned long offset)
>  #define SMMU_PDE_SHIFT 22
>  #define SMMU_PTE_SHIFT 12
> =20
> +#define SMMU_PAGE_MASK		(~(SMMU_SIZE_PT-1))
> +#define SMMU_OFFSET_IN_PAGE(x)	((unsigned long)(x) & ~SMMU_PAGE_MASK)
> +#define SMMU_PFN_PHYS(x)	((phys_addr_t)(x) << SMMU_PTE_SHIFT)
> +#define SMMU_PHYS_PFN(x)	((unsigned long)((x) >> SMMU_PTE_SHIFT))
> +
>  #define SMMU_PD_READABLE	(1 << 31)
>  #define SMMU_PD_WRITABLE	(1 << 30)
>  #define SMMU_PD_NONSECURE	(1 << 29)
> @@ -644,7 +649,7 @@ static void tegra_smmu_set_pte(struct tegra_smmu_as *=
as, unsigned long iova,
>  			       u32 *pte, dma_addr_t pte_dma, u32 val)
>  {
>  	struct tegra_smmu *smmu =3D as->smmu;
> -	unsigned long offset =3D offset_in_page(pte);
> +	unsigned long offset =3D SMMU_OFFSET_IN_PAGE(pte);
> =20
>  	*pte =3D val;
> =20
> @@ -726,7 +731,7 @@ __tegra_smmu_map(struct iommu_domain *domain, unsigne=
d long iova,
>  		pte_attrs |=3D SMMU_PTE_WRITABLE;
> =20
>  	tegra_smmu_set_pte(as, iova, pte, pte_dma,
> -			   __phys_to_pfn(paddr) | pte_attrs);
> +			   SMMU_PHYS_PFN(paddr) | pte_attrs);
> =20
>  	return 0;
>  }
> @@ -790,7 +795,7 @@ static phys_addr_t tegra_smmu_iova_to_phys(struct iom=
mu_domain *domain,
> =20
>  	pfn =3D *pte & as->smmu->pfn_mask;
> =20
> -	return PFN_PHYS(pfn);
> +	return SMMU_PFN_PHYS(pfn);
>  }
> =20
>  static struct tegra_smmu *tegra_smmu_find(struct device_node *np)
> @@ -1108,7 +1113,8 @@ struct tegra_smmu *tegra_smmu_probe(struct device *=
dev,
>  	smmu->dev =3D dev;
>  	smmu->mc =3D mc;
> =20
> -	smmu->pfn_mask =3D BIT_MASK(mc->soc->num_address_bits - PAGE_SHIFT) - 1;
> +	smmu->pfn_mask =3D
> +		BIT_MASK(mc->soc->num_address_bits - SMMU_PTE_SHIFT) - 1;

checkpatch no longer warns about lines longer than 80 characters. The
new limit is 100, so you can fit this all on one line.

But either way:

Acked-by: Thierry Reding <treding@nvidia.com>

--/i8j2F0k9BYX4qLc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9sc5AACgkQ3SOs138+
s6F80g/+JuxY/x6E7mY8d3iXr0sk56VhC9IAKa2ZyE5iUaD2Con2ohzLEZQ9zOCS
GSQqZuiQiP+9l6k296/0wKd2NV9Y9g86JBmyEghk0YBCpqqoR8eklPmpL4D/vXwx
CjwqxnQ8Qm0nAUTkOLYC1bygUJ6eELDD/P8z2pU/Gex6hLTFP93PbRkpnjke8poS
beDTJGgBpQFSJ3vv3+R/nTAbWtI1ErWIugpSxiRUrBr8E7H8M9dyYVknKk49Ejjo
3+PUYW7GmuUnvtbs5fI9oPZ5ydgeL92QK38OLgVzAOnnULvcrwLCXrxATIrPJ9sD
qURSWQa2mOE+NFQ7z7+Z0qDt48FjQoGj6IGFjQur+wWulZiSLRiZP5s3u+k6aOU8
oPl1uMwDf2UEQLT8CGNR02z/0VBCV/WwFx1fXAaTqu5wBsdVAzIKe5dCQDk+c74O
KwXzkzvNvsfGSJ2DlMi/iJC0CETD2UlBfGZnCDOv5fzWYkXotHn9smqKNv0ihbMO
s9dCY0lYd8PhjLL//qY18WPXmM5s3HjxPUJmU/wmKUIYofJR6+xmmksqtWBydjiv
l5R0TopIsLDRQ739sGdW3yUvgbYHdXq51oExrkZSh+BKJoobwazDgBP4CR7UVpXO
Uxl+wVcC7qo4g2AFCb9iMmrw7o6hvpW+G3JpT5vcMCqCX5/DjZc=
=JXY2
-----END PGP SIGNATURE-----

--/i8j2F0k9BYX4qLc--
