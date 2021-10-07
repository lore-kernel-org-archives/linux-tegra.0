Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 367F9C433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Oct 2021 16:50:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0BDBC6103B
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Oct 2021 16:50:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231594AbhJGQwu (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 7 Oct 2021 12:52:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229810AbhJGQwt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 7 Oct 2021 12:52:49 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FE79C061570;
        Thu,  7 Oct 2021 09:50:55 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id t8so21185796wri.1;
        Thu, 07 Oct 2021 09:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5jhkUPyFzXyVrFDP0KthQbkrB1NpkofJ0PvTGbaiHos=;
        b=PHfp8kvtKekPBEMn6WV56NGi+S8wLg45jAgU6yq8ksGrsghES1yyuKloB+bj6yxXCF
         MwhI39KrmSQhRNyrtMcE2u/hQzoWLpLlJI1S9uf0iQuXnfc6WKdy3dERixu9MlJ6+vhq
         M775TVYhFcHxhOe8AraoSHv1MBTelcG2iW+aMMqQy410ykci282M5n2/+wRYU5ECc1Nb
         ORAslnQDepgxKoVogoj0zDVjo63ytr3cQ6Re+m/W9FpdqZCzuB5l8gm4DcxyO5vR9C7w
         CRYijpEJI/G/yaocQBrkReCPdcV02/iUih5JFPXl/r7XfegP6IgHNgAUKxqdJCN2ggh3
         YZ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5jhkUPyFzXyVrFDP0KthQbkrB1NpkofJ0PvTGbaiHos=;
        b=DJLX+hvJLPhq2cOJQGx2CoBaiz1U5Evsw2Q6UKkMdrSGRVlIz+11J4rE/aazeYjLuw
         jzYztjEpkuK9r6uw+jLvFgLCfS/e8nW6qyxjVbZgrYcp5W4ZFAm6Qjw4qYLU9sP5MhgJ
         E2j6fAErNlkRtdTT2SKzf+ptAKbkEKtLziq+gC+5/9PKToAiquV/mj+8+6fQI1OmEo0l
         aXf/n8RiZioqo+TxurKLqNiqCJKXqBKx6pcgKiTYD3fedsF4nRDw83gFGxPAszRtm+3X
         WSvQNU0g4nlWwCbaCHMqWIUO6BCeCtK9kqn5DnDFxcSeezXgjod+8CaiymazFMEYLEFZ
         dzMw==
X-Gm-Message-State: AOAM5314wfzx3XmU/GBQzLaUMxkz+cDitXY6LYvJlDQ2fr9V/0C60qLz
        LIz/RJUSutUZe+Lq1LfmrMM=
X-Google-Smtp-Source: ABdhPJzetsAoFeFigPW64yidJmga4qIMgj3V6oupZ4iNduaR9ycNlNrDWQ3WpSE7zJQJu9y2DPdX1g==
X-Received: by 2002:adf:b199:: with SMTP id q25mr6758970wra.414.1633625454097;
        Thu, 07 Oct 2021 09:50:54 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id o19sm152877wrg.60.2021.10.07.09.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 09:50:53 -0700 (PDT)
Date:   Thu, 7 Oct 2021 18:50:52 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     joro@8bytes.org, will@kernel.org, vdumpa@nvidia.com,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        digetx@gmail.com
Subject: Re: [PATCH v6 2/6] iommu/tegra-smmu: Rename struct
 tegra_smmu_group_soc *soc to *group_soc
Message-ID: <YV8lbCePQet+vICa@orome.fritz.box>
References: <20210914013858.31192-1-nicoleotsuka@gmail.com>
 <20210914013858.31192-3-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="exooZ6C2N7YMZiZO"
Content-Disposition: inline
In-Reply-To: <20210914013858.31192-3-nicoleotsuka@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--exooZ6C2N7YMZiZO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 13, 2021 at 06:38:54PM -0700, Nicolin Chen wrote:
> There are both tegra_smmu_soc and tegra_smmu_group_soc using "soc"
> for their pointer instances. This patch renames the one of struct
> tegra_smmu_group_soc from "soc" to "group_soc" to distinguish it.
>=20
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
>  drivers/iommu/tegra-smmu.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)

I think the context makes it clear which one this is. The "soc" field in
struct tegra_smmu_group clearly refers to the group SoC data, whereas
the "soc" field in struct tegra_smmu refers to the SMMU SoC data.

>=20
> diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
> index 6ebae635d3aa..a32ed347e25d 100644
> --- a/drivers/iommu/tegra-smmu.c
> +++ b/drivers/iommu/tegra-smmu.c
> @@ -22,7 +22,7 @@
>  struct tegra_smmu_group {
>  	struct list_head list;
>  	struct tegra_smmu *smmu;
> -	const struct tegra_smmu_group_soc *soc;
> +	const struct tegra_smmu_group_soc *group_soc;
>  	struct iommu_group *grp;
>  	unsigned int swgroup;
>  };
> @@ -870,7 +870,7 @@ static struct iommu_device *tegra_smmu_probe_device(s=
truct device *dev)
>  static void tegra_smmu_release_device(struct device *dev) {}
> =20
>  static const struct tegra_smmu_group_soc *
> -tegra_smmu_find_group(struct tegra_smmu *smmu, unsigned int swgroup)
> +tegra_smmu_find_group_soc(struct tegra_smmu *smmu, unsigned int swgroup)

This one might be okay to disambiguate, but even here I think this isn't
really necessary. It's already clear from the return value what's being
returned.

>  {
>  	unsigned int i, j;
> =20
> @@ -896,19 +896,20 @@ static struct iommu_group *tegra_smmu_device_group(=
struct device *dev)
>  {
>  	struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);
>  	struct tegra_smmu *smmu =3D dev_iommu_priv_get(dev);
> -	const struct tegra_smmu_group_soc *soc;
> +	const struct tegra_smmu_group_soc *group_soc;
>  	unsigned int swgroup =3D fwspec->ids[0];
>  	struct tegra_smmu_group *group;
>  	struct iommu_group *grp;
> =20
>  	/* Find group_soc associating with swgroup */
> -	soc =3D tegra_smmu_find_group(smmu, swgroup);
> +	group_soc =3D tegra_smmu_find_group_soc(smmu, swgroup);
> =20
>  	mutex_lock(&smmu->lock);
> =20
>  	/* Find existing iommu_group associating with swgroup or group_soc */
>  	list_for_each_entry(group, &smmu->groups, list)
> -		if ((group->swgroup =3D=3D swgroup) || (soc && group->soc =3D=3D soc))=
 {
> +		if ((group->swgroup =3D=3D swgroup) ||
> +		    (group_soc && group->group_soc =3D=3D group_soc)) {
>  			grp =3D iommu_group_ref_get(group->grp);
>  			mutex_unlock(&smmu->lock);
>  			return grp;
> @@ -921,9 +922,9 @@ static struct iommu_group *tegra_smmu_device_group(st=
ruct device *dev)
>  	}
> =20
>  	INIT_LIST_HEAD(&group->list);
> +	group->group_soc =3D group_soc;
>  	group->swgroup =3D swgroup;
>  	group->smmu =3D smmu;
> -	group->soc =3D soc;

As another example, it's pretty evident that group->soc refers to the
group SoC data rather than the SMMU SoC data. The latter can be obtained
=66rom group->smmu->soc, which again is enough context to make it clear
what this is.

So I don't think this makes things any clearer. It only makes the names
more redundant and awkward to write.

Thierry

--exooZ6C2N7YMZiZO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmFfJWwACgkQ3SOs138+
s6EtzBAAlbmsyoqvR9EXxdf+cslYTE4fSEGehtr+WGZgxOL/HybkiImRvJBELQfK
UrIyyKbHMD1gLC/mpK6A8L3MoPmnzxVTmsB3kG3VF+1F/iEQsHtd337Ilga7pBSU
Q84pUMl1fdbZZcAq2gYfUMPELmdMmIqWKvNOgXa/+Mrlrjf9kaTHtcKxshyzRVCU
xd6bvebuZbN6txvbEGJAeoPBGJqd3CKen5JJg1GF2/2GAuFuiZNUSMslY6zB1rSC
MSuorCqnsxXP1LIL++JY0WACgare8moemq/BRuaqbDyJRE+l8OfmqEfizJKFcbGQ
vjzMhr6IXu0FLkYFuezgcrt+T2WfvI3RwOJVKHbGwJ3WXrTSUYEOwLMbV2JKUsFv
omlEXYMOQZXTIBdfoyln+dj7Rad2LZqCOxQJ+SULxXptfWhmuwXsEtSogOwNc9u2
uwiX7k1ZlBzw94TKyTF/CPyyETPSieDQFek4XFmIDp/F8Q6U25+OC7QIHUZJaN9Y
qoyGOWJon4kjpO9QTq9rQbCmpwLGaYdAU7lcrIDQ6H3zbBtf6P22xjuIdkW9Amlc
Zn51De/iVev5ufGKpmrYYkf6peTk5lWQjmnzpQMPJrY47qmqipfVy60f7wGSNhsl
T9dwkMeSYqQYTAigI6Vnl8or2EdCFhIl+gBLHGC4bEE/VDhBOj0=
=AbZe
-----END PGP SIGNATURE-----

--exooZ6C2N7YMZiZO--
