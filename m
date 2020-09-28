Return-Path: <SRS0=0tg+=DF=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83796C2D0A8
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Sep 2020 07:55:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 38F6122574
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Sep 2020 07:55:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qRujn+aH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbgI1Hzt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 28 Sep 2020 03:55:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726558AbgI1Hzt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Sep 2020 03:55:49 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C29AC0613CE;
        Mon, 28 Sep 2020 00:55:49 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id k15so78660wrn.10;
        Mon, 28 Sep 2020 00:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BVbwN/81blpncprCv+IQkG3sKzMlIpUh26oS8WcgK8I=;
        b=qRujn+aHOdYZcvhWNaNFfmvq+59z5zN/g2Fh/iOS9naiOmJIprb6+8FsHaN3yqhR9T
         SoAU+PMlakBl+lBe97YnRYnM/OB/19efDFQ8ktrGQX3N07B6EJCB/Kir+biySDR863SJ
         dTbZ2BQ0H34vyZ/DXDCQyApKxVbzMUBGGXLqB5TUCmYh0AAAPCM+R7NtbjM6R4touMcO
         e4L2xhzhAQE73/+uJl4zakcF8QIsLu5NGpUNNm/pYMJikHjYye1HfW4b9JV3tIXtVWDH
         i66gptHNIvs+jPlVPC43JE6/ymJ5yogiuKMnm3oMgbwuEsyibTm7IapjvfpZxZ/l5JcL
         2ntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BVbwN/81blpncprCv+IQkG3sKzMlIpUh26oS8WcgK8I=;
        b=LZ6ydtIYHz8hO4tQUrwnpZULzQYfWA1VYcmMMuq9oAB/vT5vY9dXz+TjYgLI/j0eYy
         rrVXm4CFHo8PbCLr4XLHbKXhoMCutX+AGh03hEYBpTq+F6g0NkLe4+Rtb66zmlsdlOzG
         W+yHV/rRpeUl1ZuyL6spQ9hA5g3XuV3Ei24tX4LgItPjjpQiWqEoI1p5e7rIsIlDpwhR
         HOj8BFSDuv5er4yA9tspRWQ+zJVz2HPOlfkOA9LVpe73ZWVRRqwUJ/O7zTytT1QC6vM+
         pUsd/sk5x3Z1yby+7FHTB+eBLFYN4N7UJpi4y6mRUiKTpRZg36eheQ5WOIbzAPYETkEi
         jSpw==
X-Gm-Message-State: AOAM5327DqpENe2CGB/bSybBlRvRX3Xj5G6r+2Zy6kEGNzFFVwH/PShU
        z/nVofWR+MSXGo0EMRHvugg=
X-Google-Smtp-Source: ABdhPJy6kBIrePaHTqKmGmBsQEtVR0qF/zVySEmGZbhinj1US60HRDWY2xrvuJPy9tDSyZv8oXAWqA==
X-Received: by 2002:a5d:444b:: with SMTP id x11mr197900wrr.402.1601279747992;
        Mon, 28 Sep 2020 00:55:47 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id m10sm182221wmi.9.2020.09.28.00.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 00:55:46 -0700 (PDT)
Date:   Mon, 28 Sep 2020 09:55:45 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     joro@8bytes.org, krzk@kernel.org, vdumpa@nvidia.com,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] iommu/tegra-smmu: Add PCI support
Message-ID: <20200928075545.GG2837573@ulmo>
References: <20200926080719.6822-1-nicoleotsuka@gmail.com>
 <20200926080719.6822-5-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="QWpDgw58+k1mSFBj"
Content-Disposition: inline
In-Reply-To: <20200926080719.6822-5-nicoleotsuka@gmail.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--QWpDgw58+k1mSFBj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 26, 2020 at 01:07:18AM -0700, Nicolin Chen wrote:
> This patch simply adds support for PCI devices.
>=20
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
>  drivers/iommu/tegra-smmu.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
> index 97a7185b4578..9dbc5d7183cc 100644
> --- a/drivers/iommu/tegra-smmu.c
> +++ b/drivers/iommu/tegra-smmu.c
> @@ -15,6 +15,7 @@
>  #include <linux/spinlock.h>
>  #include <linux/dma-iommu.h>
>  #include <linux/dma-mapping.h>
> +#include <linux/pci.h>
> =20
>  #include <soc/tegra/ahb.h>
>  #include <soc/tegra/mc.h>
> @@ -935,6 +936,7 @@ static struct iommu_group *tegra_smmu_device_group(st=
ruct device *dev)
>  	const struct tegra_smmu_group_soc *soc;
>  	struct tegra_smmu_group *group;
>  	int swgroup =3D fwspec->ids[0];
> +	bool pci =3D dev_is_pci(dev);
>  	struct iommu_group *grp;
> =20
>  	/* Find group_soc associating with swgroup */
> @@ -961,7 +963,7 @@ static struct iommu_group *tegra_smmu_device_group(st=
ruct device *dev)
>  	group->smmu =3D smmu;
>  	group->soc =3D soc;
> =20
> -	group->group =3D iommu_group_alloc();
> +	group->group =3D pci ? pci_device_group(dev) : iommu_group_alloc();
>  	if (IS_ERR(group->group)) {
>  		devm_kfree(smmu->dev, group);
>  		mutex_unlock(&smmu->lock);
> @@ -1180,6 +1182,19 @@ struct tegra_smmu *tegra_smmu_probe(struct device =
*dev,
>  		return ERR_PTR(err);
>  	}
> =20
> +#ifdef CONFIG_PCI
> +	if (!iommu_present(&pci_bus_type)) {
> +		pci_request_acs();
> +		err =3D bus_set_iommu(&pci_bus_type, &tegra_smmu_ops);
> +		if (err < 0) {
> +			bus_set_iommu(&platform_bus_type, NULL);
> +			iommu_device_unregister(&smmu->iommu);
> +			iommu_device_sysfs_remove(&smmu->iommu);
> +			return ERR_PTR(err);

It might be worth factoring out the cleanup code now that there are
multiple failures from which we may need to clean up.

Also, it'd be great if somehow we could do this without the #ifdef,
but I guess since we're using the pci_bus_type global variable directly,
there isn't much we can do here?

Thierry

--QWpDgw58+k1mSFBj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9xlwEACgkQ3SOs138+
s6HuvQ/+KWpcgdZCbKXXhl1yRvr0vAWBpqSaSn2kW0gf5hn9sHoalZ9dqV3sKXYy
ECgw+sJS/AxESl7W6nUW6yvmcB4XPZSArF5kohfzNo1EKjTO22zqdB/QCWv6k+Yv
ilWSOnpbLf93QAzkeYXgPYdC0iMMRZaREWktp4Qys/cx8CvuwHWuVGaXJwuo/7yx
5hfxPUI4GCtYpNllg+QhNJuaLr9GsG49g8HQjpzex5hIC5Q0Io6R6ExQaE0Cdr+o
op5oiJwx/Mb4DTvo58T79Y+yCdMDC6z0AscXMtRjtevSXEsD9m+04LMG2qYGwhwv
f4raAIOp/0iJ8izvdN3U7TuuJY6tIypySz30tgwQ5ekxEY/3uWJyTf+foCN3xoMt
s5lrAdS2/1EELM5YXqNjHZEBHSFCgjD4TvVtrWv1XZdtObaxmquBjoRlDfUhqHGN
2oHhVcPvGGolbgDqwIJZqnxr13GXfIcthhwUxh+FWWqKtBVsWwGgf2nPQ4tMeWla
9mMKMSKRDKF1TRoMlYW7iucqEmWETRTJY2bUBOrzK2llKYUdJMXrfIrTw29jyDJP
v/XNMXjUJzzlLAMnz7Oup7PQyzZWPzWmEUK3y5Sx5JIj00PIbVsLwPpFs25D2V67
kDwMOwzFrXmIKb606G0PUobcjid45leY99xzDN6QFH/RsUYrb60=
=8eZB
-----END PGP SIGNATURE-----

--QWpDgw58+k1mSFBj--
