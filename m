Return-Path: <SRS0=0tg+=DF=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BA45C2D0A8
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Sep 2020 07:52:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E0EB722574
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Sep 2020 07:52:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MyUqCRXA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726640AbgI1HwQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 28 Sep 2020 03:52:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726465AbgI1HwQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Sep 2020 03:52:16 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CBA0C0613CE;
        Mon, 28 Sep 2020 00:52:16 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id b79so44273wmb.4;
        Mon, 28 Sep 2020 00:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=c1rtM6R7V6DyRjzBY3Avayc0U8K5E/GPGILf8ze7ouA=;
        b=MyUqCRXAWw2mNHhTKZ76ICVt2XmFHGf9/4+yBStb9XppRaVExbFjfaR/y6iMhm9L6o
         X3os43VY8WTDpKb+ArIS/Kzr7qfQETb3Z9sECsBKHIkPzs/Yu10PPR3GhNc/C8RSC+7J
         1/Xgjv6ev8vtuLjEC2h9C433wAzplis5B//L9KGGau98Fu+b0CD58BXayMhdeP84cZJ0
         eRwNfTHPg1CI9YVsEYKP/g15nZNHGIPa1wDayQmKNoGGAGt7lbfq1DdMEYsCHnzJXNv5
         GmY4SXZku20bIhnVV5aRnfVACNC8fU36dtO3FQf1zEi+IAf7liB2nQ4oNPZNNmXw4/I5
         H9RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=c1rtM6R7V6DyRjzBY3Avayc0U8K5E/GPGILf8ze7ouA=;
        b=UW51fX1dUCyKSjysC+R/ENnrvr2jIarlKxQEzmTvarRj7cOkXtjKLIHu3BbBhO7fkD
         e75eWhKiY1dlbQ1zqxsQfkmLth0khjwfVBZsbVEe9Mr/FLhJ9n776U+YIZF21ntOv51I
         AjwUx0SAKVhy2XshgqOty3y8Ue+fvAbjVYtacqKMj2/BkS2rsyuSAGWzLnlUwh67fiiZ
         HsByvqHwcVQrHiyLQfnn+Jc1LpIsQpvtpohFETNntxA0+7YuqWa++/TmEvC1cQ5xLTN6
         bLV4j1wS/RZvVOEF8/ZRCk3n42r5PNcWsQzTxeNGDlJh/5fs64ZtFodWUJI/8ZUgVU4F
         oF8g==
X-Gm-Message-State: AOAM532/DK/CctoUSelkNOwBU7ETK8/FOlxaMj0IodRNKX+jeOCqpcXX
        Y6DTLlxsaeo+IYiBlFhcFUfEcl4ppMg=
X-Google-Smtp-Source: ABdhPJwMz+E5GdG92HFB/kP369O0a6ydRfwpqTVaf2u2TaNPxmrBp/RUm6wZcNzWHbRL81OWlDHgGw==
X-Received: by 2002:a1c:2ed0:: with SMTP id u199mr220864wmu.125.1601279534690;
        Mon, 28 Sep 2020 00:52:14 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id y68sm120477wmd.39.2020.09.28.00.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 00:52:13 -0700 (PDT)
Date:   Mon, 28 Sep 2020 09:52:12 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     joro@8bytes.org, krzk@kernel.org, vdumpa@nvidia.com,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] iommu/tegra-smmu: Use iommu_fwspec in
 .probe_/.attach_device()
Message-ID: <20200928075212.GF2837573@ulmo>
References: <20200926080719.6822-1-nicoleotsuka@gmail.com>
 <20200926080719.6822-4-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="QNDPHrPUIc00TOLW"
Content-Disposition: inline
In-Reply-To: <20200926080719.6822-4-nicoleotsuka@gmail.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--QNDPHrPUIc00TOLW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 26, 2020 at 01:07:17AM -0700, Nicolin Chen wrote:
> The tegra_smmu_probe_device() function searches in DT for the iommu
> phandler to get "smmu" pointer. This works for most of SMMU clients
> that exist in the DTB. But a PCI device will not be added to iommu,
> since it doesn't have a DT node.
>=20
> Fortunately, for a client with a DT node, tegra_smmu_probe_device()
> calls tegra_smmu_of_xlate() via tegra_smmu_configure(), while for a
> PCI device, of_pci_iommu_init() in the IOMMU core calls .of_xlate()
> as well, even before running tegra_smmu_probe_device(). And in both
> cases, tegra_smmu_of_xlate() prepares a valid iommu_fwspec pointer
> that allows us to get the mc->smmu pointer via dev_get_drvdata() by
> calling driver_find_device_by_fwnode().
>=20
> So this patch uses iommu_fwspec in .probe_device() and related code
> for a client that does not exist in the DTB, especially a PCI one.
>=20
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
>  drivers/iommu/tegra-smmu.c | 89 +++++++++++++++++++++++---------------
>  drivers/memory/tegra/mc.c  |  2 +-
>  include/soc/tegra/mc.h     |  2 +
>  3 files changed, 56 insertions(+), 37 deletions(-)
>=20
> diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
> index b10e02073610..97a7185b4578 100644
> --- a/drivers/iommu/tegra-smmu.c
> +++ b/drivers/iommu/tegra-smmu.c
> @@ -13,6 +13,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
> +#include <linux/dma-iommu.h>

Why is this needed? I don't see any of the symbols declared in that file
used here.

>  #include <linux/dma-mapping.h>
> =20
>  #include <soc/tegra/ahb.h>
> @@ -61,6 +62,8 @@ struct tegra_smmu_as {
>  	u32 attr;
>  };
> =20
> +static const struct iommu_ops tegra_smmu_ops;
> +
>  static struct tegra_smmu_as *to_smmu_as(struct iommu_domain *dom)
>  {
>  	return container_of(dom, struct tegra_smmu_as, domain);
> @@ -484,60 +487,49 @@ static void tegra_smmu_as_unprepare(struct tegra_sm=
mu *smmu,
>  static int tegra_smmu_attach_dev(struct iommu_domain *domain,
>  				 struct device *dev)
>  {
> +	struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);
>  	struct tegra_smmu *smmu =3D dev_iommu_priv_get(dev);
>  	struct tegra_smmu_as *as =3D to_smmu_as(domain);
> -	struct device_node *np =3D dev->of_node;
> -	struct of_phandle_args args;
> -	unsigned int index =3D 0;
> -	int err =3D 0;
> -
> -	while (!of_parse_phandle_with_args(np, "iommus", "#iommu-cells", index,
> -					   &args)) {
> -		unsigned int swgroup =3D args.args[0];
> -
> -		if (args.np !=3D smmu->dev->of_node) {
> -			of_node_put(args.np);
> -			continue;
> -		}
> +	int index, err =3D 0;
> =20
> -		of_node_put(args.np);
> +	if (!fwspec || fwspec->ops !=3D &tegra_smmu_ops)
> +		return -ENOENT;
> =20
> +	for (index =3D 0; index < fwspec->num_ids; index++) {
>  		err =3D tegra_smmu_as_prepare(smmu, as);
> -		if (err < 0)
> -			return err;
> +		if (err)
> +			goto err_disable;

I'd personally drop the err_ prefix here because it's pretty obvious
that we're going to do this as a result of an error happening.

> =20
> -		tegra_smmu_enable(smmu, swgroup, as->id);
> -		index++;
> +		tegra_smmu_enable(smmu, fwspec->ids[index], as->id);
>  	}
> =20
>  	if (index =3D=3D 0)
>  		return -ENODEV;
> =20
>  	return 0;
> +
> +err_disable:
> +	for (index--; index >=3D 0; index--) {
> +		tegra_smmu_disable(smmu, fwspec->ids[index], as->id);
> +		tegra_smmu_as_unprepare(smmu, as);
> +	}

I think a more idiomatic version of doing this would be:

	while (index--) {
		...
	}

> +
> +	return err;
>  }
> =20
>  static void tegra_smmu_detach_dev(struct iommu_domain *domain, struct de=
vice *dev)
>  {
> +	struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);
>  	struct tegra_smmu_as *as =3D to_smmu_as(domain);
> -	struct device_node *np =3D dev->of_node;
>  	struct tegra_smmu *smmu =3D as->smmu;
> -	struct of_phandle_args args;
>  	unsigned int index =3D 0;
> =20
> -	while (!of_parse_phandle_with_args(np, "iommus", "#iommu-cells", index,
> -					   &args)) {
> -		unsigned int swgroup =3D args.args[0];
> -
> -		if (args.np !=3D smmu->dev->of_node) {
> -			of_node_put(args.np);
> -			continue;
> -		}
> -
> -		of_node_put(args.np);
> +	if (!fwspec || fwspec->ops !=3D &tegra_smmu_ops)
> +		return;
> =20
> -		tegra_smmu_disable(smmu, swgroup, as->id);
> +	for (index =3D 0; index < fwspec->num_ids; index++) {
> +		tegra_smmu_disable(smmu, fwspec->ids[index], as->id);
>  		tegra_smmu_as_unprepare(smmu, as);
> -		index++;
>  	}
>  }
> =20
> @@ -845,10 +837,25 @@ static int tegra_smmu_configure(struct tegra_smmu *=
smmu, struct device *dev,
>  	return 0;
>  }
> =20
> +static struct tegra_smmu *tegra_smmu_get_by_fwnode(struct fwnode_handle =
*fwnode)
> +{
> +	struct device *dev =3D driver_find_device_by_fwnode(&tegra_mc_driver.dr=
iver, fwnode);
> +	struct tegra_mc *mc;
> +
> +	if (!dev)
> +		return NULL;
> +
> +	put_device(dev);
> +	mc =3D dev_get_drvdata(dev);
> +
> +	return mc->smmu;
> +}
> +

As I mentioned in another reply, I think tegra_smmu_find() should be all
you need in this case.

>  static struct iommu_device *tegra_smmu_probe_device(struct device *dev)
>  {
>  	struct device_node *np =3D dev->of_node;
>  	struct tegra_smmu *smmu =3D NULL;
> +	struct iommu_fwspec *fwspec;
>  	struct of_phandle_args args;
>  	unsigned int index =3D 0;
>  	int err;
> @@ -868,8 +875,6 @@ static struct iommu_device *tegra_smmu_probe_device(s=
truct device *dev)
>  			 * supported by the Linux kernel, so abort after the
>  			 * first match.
>  			 */
> -			dev_iommu_priv_set(dev, smmu);
> -
>  			break;
>  		}
> =20
> @@ -877,8 +882,20 @@ static struct iommu_device *tegra_smmu_probe_device(=
struct device *dev)
>  		index++;
>  	}
> =20
> -	if (!smmu)
> -		return ERR_PTR(-ENODEV);
> +	/* Any device should be able to get smmu pointer using fwspec */
> +	if (!smmu) {
> +		fwspec =3D dev_iommu_fwspec_get(dev);
> +		if (!fwspec || fwspec->ops !=3D &tegra_smmu_ops)
> +			return ERR_PTR(-ENODEV);
> +
> +		smmu =3D tegra_smmu_get_by_fwnode(fwspec->iommu_fwnode);
> +	}
> +
> +	/* NULL smmu pointer means that SMMU driver is not probed yet */
> +	if (unlikely(!smmu))
> +		return ERR_PTR(-EPROBE_DEFER);
> +
> +	dev_iommu_priv_set(dev, smmu);

Can this not be unified with the OF code above? Basically in all cases
where we use Tegra SMMU, a fwnode_node should correspond 1:1 to a struct
device_node, which makes the code you added here effectively the same as
what's already there.

Thierry

--QNDPHrPUIc00TOLW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9xlikACgkQ3SOs138+
s6Hc2Q//bU11CubWA9+S+FyXfY+Khd3t83w10jA+TYacMj2SaS9mAqVzvm7rOEXz
ehBomwbiqs8M5MwobnC/v+jHvRBBPwB9H/ZVVZOqWXpTrkCAUmsSbhKyOvlaVEo0
pOnupOewuPnA7CgvLfTenoF8twx5+wSpIV7/Ih0dfj+jeF0vkh0yvZ8JQZVVfESM
wLKv2+Cf2IVKDJSLEDLK7b9nhBaSxt3UzfbL89+N8j28b2VWdk4dHw6SQQJRWQK8
qyric5oKELsUIdSA3iL0g29BNIcBlv2+drqoObPwtlSsxVwHOJsJNujf/ru5kTc9
HDkdPzniVyfcEsjUYecRITWz1jCBXTs36OfAjAwwR8d3ZMhlqmLmlbnZv4hI2NZe
5ejRbLoLEz0dQ2OnD4HfWZBdFya7GxvtdCtuCWjp/uYaSDGs8jjTaAaE8mfEN+Gj
Cp1U5RBEOkwbinVW7NoLoftLFSlAimSPnu5iu4/apPqD8PF9U3xEPRA7fD+xx5A0
FJLWnVyi4dCBhwFUTt5kTbNGuvuQblVwiklCopw1q85VoO97v4H08th21Jgn6SD+
8Y6QPk4AAgu/r9yXjVEgqOJxdBdu9sNCULkxRx0qnTUuMSb5Xaq+U2YesOpHdyDl
knimyn7Hlutnq8y1rsM2v+HaZjEK1nM2CZzCU9eCiTZEYz/JWK8=
=agja
-----END PGP SIGNATURE-----

--QNDPHrPUIc00TOLW--
