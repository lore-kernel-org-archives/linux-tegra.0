Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8424C433F5
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Oct 2021 17:13:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9FC1661139
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Oct 2021 17:13:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243202AbhJGRPZ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 7 Oct 2021 13:15:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243193AbhJGRPX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 7 Oct 2021 13:15:23 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2661EC061570;
        Thu,  7 Oct 2021 10:13:29 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id o20so21185137wro.3;
        Thu, 07 Oct 2021 10:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vLFoMp+dlaZHfsMQ3K2u0QNFyHL+HsxnT/5AaQm7BNg=;
        b=RX/pQlBUL5wUWRsIZYj7FNselOa0r9QLUJ72MouaPravOCTozOjwEuHD3CC8b4JL2q
         YJ1CJkz2gjw1DWnplJVhFsQ+rIZlS/hl1mXDf0rBb6PnZ/4lwW3wa/uuGSoWgeSksk5g
         l7/mLXdZqBKH7IhdA5odSJn3OxrkDDflMCyvab7jpgm4RtBECKLyKCR3aVBJXnYcxBjO
         sNfcyTIL2wzbHX2/XYlLwL4YLJl1KIHJkLWUq1n7SCKrVS55v24FT/H1f5PyzVGBJIa/
         fSzhN0/saTGfVU/5A5suk6STEvOELjSIntCHKPAFTc82vjMJHc5n59t7322fL1VNzk28
         5QnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vLFoMp+dlaZHfsMQ3K2u0QNFyHL+HsxnT/5AaQm7BNg=;
        b=PhCvLSo+Lnxa6zOj1E6Gatdlms+qUliDceZVorSspTaCwLL8f0Arvt9D752Jbxdvs2
         NNN/vt0sHJTUoYy3z2J4g+6w0bjtQks7tQzviMjAlQVFolNG0K35F+pIGZUI1/mrinPE
         YXq4Y+0UOQTYNzhW2bqCN3fTusS5ZOw0BFyfTqhjPDCTCIxOVe/iy7ZIl/pgkVUE+IA4
         tHJmWVpXYbrPzVL3jmSK8Z7M97ENo9FASRSdD9vRGpUAhVrFUY9qGfmAUpzKPc2+/osd
         dYL811Tig6k9EwrPMCmLyFHd5WCHJeQG9v3Rbh+LlZiZpguU/U1JKzCOQegoNjsBKZle
         C6SQ==
X-Gm-Message-State: AOAM5324O4Qy099olAO+Ky5rS2Vo1jJOD+drzPcZZrgIaYzQIOSLJoi0
        RvnhzKkRcxmY6UvJvZVaL04=
X-Google-Smtp-Source: ABdhPJzTHTG6kt6OPq07bFUSFJruW8YZ4QMMQf5MkN/9aUgfa60VV/R1Jbf4CIUi4YJBMcgwIkwoTA==
X-Received: by 2002:adf:ab43:: with SMTP id r3mr7062988wrc.225.1633626807587;
        Thu, 07 Oct 2021 10:13:27 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id p8sm1318wmg.15.2021.10.07.10.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 10:13:26 -0700 (PDT)
Date:   Thu, 7 Oct 2021 19:13:25 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     joro@8bytes.org, will@kernel.org, vdumpa@nvidia.com,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        digetx@gmail.com
Subject: Re: [PATCH v6 6/6] iommu/tegra-smmu: Add pagetable mappings to
 debugfs
Message-ID: <YV8qtdicr4+PcIAf@orome.fritz.box>
References: <20210914013858.31192-1-nicoleotsuka@gmail.com>
 <20210914013858.31192-7-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="D2ajDYzQb2RUipRA"
Content-Disposition: inline
In-Reply-To: <20210914013858.31192-7-nicoleotsuka@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--D2ajDYzQb2RUipRA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 13, 2021 at 06:38:58PM -0700, Nicolin Chen wrote:
> This patch dumps all active mapping entries from pagetable
> to a debugfs directory named "mappings".
>=20
> Attaching an example:
>=20
> SWGROUP: hc
> as->id: 0
> as->attr: R|W|N
> as->pd_dma: 0x0000000080c03000
> {
>         [index: 1023] 0xf0080c3e (count: 2)
>         {
>                 PTE RANGE      | ATTR | PHYS               | IOVA        =
       | SIZE
>                 [#1022, #1023] | 0x5  | 0x000000010bbf1000 | 0x00000000ff=
ffe000 | 0x2000
>         }
> }
> Total PDE count: 1
> Total PTE count: 2
>=20
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
>  drivers/iommu/tegra-smmu.c | 145 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 145 insertions(+)
>=20
> diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
> index 68c34a4a0ecc..aac977e181f6 100644
> --- a/drivers/iommu/tegra-smmu.c
> +++ b/drivers/iommu/tegra-smmu.c
> @@ -46,6 +46,7 @@ struct tegra_smmu {
>  	struct list_head list;
> =20
>  	struct dentry *debugfs;
> +	struct dentry *debugfs_mappings;
> =20
>  	struct iommu_device iommu;	/* IOMMU Core code handle */
>  };
> @@ -153,6 +154,9 @@ static inline u32 smmu_readl(struct tegra_smmu *smmu,=
 unsigned long offset)
> =20
>  #define SMMU_PDE_ATTR		(SMMU_PDE_READABLE | SMMU_PDE_WRITABLE | \
>  				 SMMU_PDE_NONSECURE)
> +#define SMMU_PTE_ATTR		(SMMU_PTE_READABLE | SMMU_PTE_WRITABLE | \
> +				 SMMU_PTE_NONSECURE)
> +#define SMMU_PTE_ATTR_SHIFT	29
> =20
>  static unsigned int iova_pd_index(unsigned long iova)
>  {
> @@ -164,6 +168,12 @@ static unsigned int iova_pt_index(unsigned long iova)
>  	return (iova >> SMMU_PTE_SHIFT) & (SMMU_NUM_PTE - 1);
>  }
> =20
> +static unsigned long pd_pt_index_iova(unsigned int pd_index, unsigned in=
t pt_index)
> +{
> +	return ((dma_addr_t)pd_index & (SMMU_NUM_PDE - 1)) << SMMU_PDE_SHIFT |
> +	       ((dma_addr_t)pt_index & (SMMU_NUM_PTE - 1)) << SMMU_PTE_SHIFT;
> +}
> +
>  static bool smmu_dma_addr_valid(struct tegra_smmu *smmu, dma_addr_t addr)
>  {
>  	addr >>=3D 12;
> @@ -496,6 +506,8 @@ static void tegra_smmu_as_unprepare(struct tegra_smmu=
 *smmu,
>  	mutex_unlock(&smmu->lock);
>  }
> =20
> +static const struct file_operations tegra_smmu_debugfs_mappings_fops;

Could the implementation be moved up here to avoid the forward
declaration?

> +
>  static void tegra_smmu_attach_as(struct tegra_smmu *smmu,
>  				 struct tegra_smmu_as *as,
>  				 unsigned int swgroup)
> @@ -517,6 +529,12 @@ static void tegra_smmu_attach_as(struct tegra_smmu *=
smmu,
>  			dev_warn(smmu->dev,
>  				 "overwriting group->as for swgroup: %s\n", swgrp->name);
>  		group->as =3D as;
> +
> +		if (smmu->debugfs_mappings)
> +			debugfs_create_file(group->swgrp->name, 0444,
> +					    smmu->debugfs_mappings, group,
> +					    &tegra_smmu_debugfs_mappings_fops);
> +
>  		break;
>  	}
> =20
> @@ -541,6 +559,12 @@ static void tegra_smmu_detach_as(struct tegra_smmu *=
smmu,
>  		if (group->swgrp !=3D swgrp)
>  			continue;
>  		group->as =3D NULL;
> +
> +		if (smmu->debugfs_mappings) {
> +			d =3D debugfs_lookup(group->swgrp->name, smmu->debugfs_mappings);
> +			debugfs_remove(d);
> +		}
> +
>  		break;
>  	}
> =20
> @@ -1124,6 +1148,125 @@ static int tegra_smmu_clients_show(struct seq_fil=
e *s, void *data)
> =20
>  DEFINE_SHOW_ATTRIBUTE(tegra_smmu_clients);
> =20
> +static int tegra_smmu_debugfs_mappings_show(struct seq_file *s, void *da=
ta)
> +{
> +	struct tegra_smmu_group *group =3D s->private;
> +	const struct tegra_smmu_swgroup *swgrp;
> +	struct tegra_smmu_as *as;
> +	struct tegra_smmu *smmu;
> +	unsigned int pd_index;
> +	unsigned int pt_index;
> +	unsigned long flags;
> +	u64 pte_count =3D 0;
> +	u32 pde_count =3D 0;
> +	u32 *pd, val;
> +
> +	if (!group || !group->as || !group->swgrp)
> +		return 0;
> +
> +	swgrp =3D group->swgrp;
> +	smmu =3D group->smmu;
> +	as =3D group->as;
> +
> +	mutex_lock(&smmu->lock);
> +
> +	val =3D smmu_readl(smmu, swgrp->reg) & SMMU_ASID_ENABLE;
> +	if (!val)
> +		goto unlock;
> +
> +	pd =3D page_address(as->pd);
> +	if (!pd)
> +		goto unlock;
> +
> +	seq_printf(s, "\nSWGROUP: %s\n", swgrp->name);
> +	seq_printf(s, "as->id: %d\nas->attr: %c|%c|%s\nas->pd_dma: %pad\n", as-=
>id,
> +		   as->attr & SMMU_PD_READABLE ? 'R' : '-',
> +		   as->attr & SMMU_PD_WRITABLE ? 'W' : '-',
> +		   as->attr & SMMU_PD_NONSECURE ? "NS" : "S",
> +		   &as->pd_dma);
> +	seq_puts(s, "{\n");

Maybe this can be more compact by putting the name, ID, attributes and
base address onto a single line? Maybe also use "'-' : 'S'" for the
non-secure attribute to keep in line with what you've done for readable
and writable attributes.

Then again, this is going to be very verbose output anyway, so maybe it
isn't worth it.

Thierry

--D2ajDYzQb2RUipRA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmFfKrMACgkQ3SOs138+
s6GirA/8Cfx05/2MiogduRWFZTD9SO62n3CnaxfIXdaSXcZYSiqlhygq0iAZXs42
4VEauSkFFGjhS/oREagxAarQzz2P0UWCKK8N5FT3rByEVF5hrL/EPvw3UVnqLLWC
PoiCZITRyQaAuI84r/j0ppiLoVd8p4DaGIPQc2zGgGx9R8Swvwi3+gckJvAixpDW
86EVz4P61liUKkbqxBO4FIueZJydOJcqY3498bZiQ6bKdGItyh8fLxMScqfI5Ejw
MZB9lR9mMdMJxEZwG6ghCH1BVuCMachdscYSWkoqJI3d3jdgecOMcLRaV0tJYSLP
8vQIEPx/zDuYlxKgL9pIcfnhAEwydeaLJt0jS38Lff19jt8yyuJXcGuk0EwWU86f
4YIOmIRiFMPkqbTenptIreZDY//D0EjGRs0T4/5TZ4ln/zmhXwO01RdOBG2aNj4k
oprwCq1zKnmGmjFJTx+NqfiLwhjKX7EpH8OkFCNKXPhb7vOw9ihvKPwiriLhvXGy
OZQbJENISYlJ1yCrRgvxoXQDX1JF6Qfz15m6yTJJT+8Tm4ujKGlNeiOmux0p/Epv
Mpd5+a5k5YYb12+jtZjMTy3Hn75Ma/9cHwavM6xD6LmyppP4MXC6XRPWSVKCjUrs
5H36g9nwEfIhOlYhosC/jp4jH4AQhebHInqjQLrZn0iBxLcBP8k=
=Xb3q
-----END PGP SIGNATURE-----

--D2ajDYzQb2RUipRA--
