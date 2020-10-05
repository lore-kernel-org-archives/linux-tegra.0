Return-Path: <SRS0=kAmo=DM=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B15C9C4363A
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 10:04:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6307720776
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 10:04:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YMGSZ4jX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725917AbgJEKEY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Oct 2020 06:04:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725887AbgJEKEX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Oct 2020 06:04:23 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F906C0613CE;
        Mon,  5 Oct 2020 03:04:23 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id k14so8639946edo.1;
        Mon, 05 Oct 2020 03:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=p3BM0kPaZyOPUQYWBvmUtL1qF+A5L+ek6VHw+7yxmPQ=;
        b=YMGSZ4jX8zZy/zJA+ymFeHemM9uTXw8KWpy+9+08a+s1kDuU+FLEHyOUFoHkq8CaJb
         VinWd4eIsN1NT7RSoqjueiIPYt6K50guGxOOeLU+hNIO3jW2Avr4mwvaXTNeVNYjOxmC
         hcx9QpFLQDk8ACHS9yPxfLlnN+JQT0Co0jVeL032FxGChFzsojq6wzwOzRB8wxws6PIg
         ThfJi+SYghZlg73IKb1qisxGHnkxezbWHSO3o0zD+9NyellUwFrg3sFVnyR2SEa+TMgo
         81W9tYs8VlPs0UiVzP25lc+0FaDu1VnKXr/Iz3BpSzBdHgv0gMArSb7ui3aSVv+LzzSU
         ssFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=p3BM0kPaZyOPUQYWBvmUtL1qF+A5L+ek6VHw+7yxmPQ=;
        b=ES5sCH4DQyDm2mhTPX9nwdVmxl0h7QFDT1cWAdrBEBwcqDeWhMPtjNVl7NWB2OREvz
         rWCaSqnZIPtInxIzGEGm9Hpb+NT1B7kE6H1v5PJMQUQm+55zwzfzYANijbrJRsyIe1VR
         RG0peuPtImhCNVPXywG4o3vu917HSKSuyWL9//pK/qgaN9Y8rQdzcF40TlX6OERaTVO3
         fGsx1waGq1B0dMspKdgxDfKCOTTRpzCslZ1tQauUQsvgCgfUyrJ7SMEfIbjhh9lJ6fnN
         sJszbYWmqDcFhrdLPEmyF6VBum0wVXU05RDiwOAe1UNF1eQ83dF8nvN5p4YotCBZuxhf
         9ZEw==
X-Gm-Message-State: AOAM5330VPEAIn+Zw5znA25qurHGaKd9sngng58mMS5DaACIjf0k0EAl
        zjImSvt9PoHNQHJSews0dug=
X-Google-Smtp-Source: ABdhPJynxv4HgFVq+YzG8NngdyxhCbkuUZlkdwXEwFycADMLdau1/kA3SvY2XMssurYI9UWUoDYGZg==
X-Received: by 2002:a50:fe82:: with SMTP id d2mr15842040edt.86.1601892262334;
        Mon, 05 Oct 2020 03:04:22 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id u9sm7675435eje.119.2020.10.05.03.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 03:04:20 -0700 (PDT)
Date:   Mon, 5 Oct 2020 12:04:19 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     joro@8bytes.org, digetx@gmail.com, vdumpa@nvidia.com,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] iommu/tegra-smmu: Add PCI support
Message-ID: <20201005100419.GK425362@ulmo>
References: <20201002060807.32138-1-nicoleotsuka@gmail.com>
 <20201002060807.32138-4-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="PEfPc/DjvCj+JzNg"
Content-Disposition: inline
In-Reply-To: <20201002060807.32138-4-nicoleotsuka@gmail.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--PEfPc/DjvCj+JzNg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 01, 2020 at 11:08:07PM -0700, Nicolin Chen wrote:
> This patch simply adds support for PCI devices.
>=20
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
>=20
> Changelog
> v3->v4
>  * Dropped !iommu_present() check
>  * Added CONFIG_PCI check in the exit path
> v2->v3
>  * Replaced ternary conditional operator with if-else in .device_group()
>  * Dropped change in tegra_smmu_remove()
> v1->v2
>  * Added error-out labels in tegra_smmu_probe()
>  * Dropped pci_request_acs() since IOMMU core would call it.
>=20
>  drivers/iommu/tegra-smmu.c | 37 +++++++++++++++++++++++++++----------
>  1 file changed, 27 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
> index 02d02b0c55c4..b701a7b55e84 100644
> --- a/drivers/iommu/tegra-smmu.c
> +++ b/drivers/iommu/tegra-smmu.c
> @@ -10,6 +10,7 @@
>  #include <linux/kernel.h>
>  #include <linux/of.h>
>  #include <linux/of_device.h>
> +#include <linux/pci.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
> @@ -865,7 +866,11 @@ static struct iommu_group *tegra_smmu_device_group(s=
truct device *dev)
>  	group->smmu =3D smmu;
>  	group->soc =3D soc;
> =20
> -	group->group =3D iommu_group_alloc();
> +	if (dev_is_pci(dev))
> +		group->group =3D pci_device_group(dev);
> +	else
> +		group->group =3D generic_device_group(dev);
> +
>  	if (IS_ERR(group->group)) {
>  		devm_kfree(smmu->dev, group);
>  		mutex_unlock(&smmu->lock);
> @@ -1069,22 +1074,32 @@ struct tegra_smmu *tegra_smmu_probe(struct device=
 *dev,
>  	iommu_device_set_fwnode(&smmu->iommu, dev->fwnode);
> =20
>  	err =3D iommu_device_register(&smmu->iommu);
> -	if (err) {
> -		iommu_device_sysfs_remove(&smmu->iommu);
> -		return ERR_PTR(err);
> -	}
> +	if (err)
> +		goto err_sysfs;
> =20
>  	err =3D bus_set_iommu(&platform_bus_type, &tegra_smmu_ops);
> -	if (err < 0) {
> -		iommu_device_unregister(&smmu->iommu);
> -		iommu_device_sysfs_remove(&smmu->iommu);
> -		return ERR_PTR(err);
> -	}
> +	if (err < 0)
> +		goto err_unregister;
> +
> +#ifdef CONFIG_PCI
> +	err =3D bus_set_iommu(&pci_bus_type, &tegra_smmu_ops);
> +	if (err < 0)
> +		goto err_bus_set;
> +#endif
> =20
>  	if (IS_ENABLED(CONFIG_DEBUG_FS))
>  		tegra_smmu_debugfs_init(smmu);
> =20
>  	return smmu;
> +
> +err_bus_set: __maybe_unused;
> +	bus_set_iommu(&platform_bus_type, NULL);
> +err_unregister:
> +	iommu_device_unregister(&smmu->iommu);
> +err_sysfs:
> +	iommu_device_sysfs_remove(&smmu->iommu);

Can you please switch to label names that are more consistent with the
others in this driver? Notably the ones in tegra_smmu_domain_alloc().
The idea is to describe in the name of the label what's happening at the
label. Something like this, for example:

unset_platform_bus:
	bus_set_iommu(&platform_bus_type, NULL);
unregister:
	iommu_device_unregister(&smmu->iommu);
remove_sysfs:
	iommu_device_sysfs_remove(&smmu->iommu);

Thierry

--PEfPc/DjvCj+JzNg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9676MACgkQ3SOs138+
s6E57BAAt0AeCX/qjGZv2yu0JoZxyVMxx2y3P3p1t8cvhgWhppRMaXErd01bAZoA
vh4HYhmi1vVbnfyDxtafYXY7jUKwwe1Kwo4zjAnNqzm1xYRTeeEtZ0f03xhMviDk
G0y7pIXOZeMUozoR0cSruq8ZF7+tVmdmTL2A9ybZBwFXIuL7f1vhizd2Fk9aprvd
lSwhz43OVmYWWPRAjM+1HBJ1R+klw3SUy/ZBg6kaQX/sBeFnQ3InmapFZ7B+iKt4
ARXioQv0Kb935t1ABIYJZu26tunTZrMcdhekIOWyn345a7VuHtCOgaUYPSoDJsX4
1Y+kDStZD9/FZ/EpvCt8saacx1gnJ+yChbiAM/gheIeK5D/42rp4GNElfxOC9Edy
6qZGXMGCAcrvfCZjozsfNTAg7yG91BshhODi0vtR/ljoKtCdc6A6gGgPb7d6454j
9KQSrgy0XdV1hI+UOhCVcCWAuY7niE57OHaLSLE58b84Y3q52kGEq8gq7eSVS2ug
86V8ywHa/NQvE9bVMpwpqIKw5EX5cp3YEHHSmDQufaUlVHHw1kqcVGsDk7YjY7wM
zJ15fJegbRpPTRKfNehb64hKemeSWjOSi+Ipgkxk8k5WirUp0PiGEUsNEozTBizL
QMxkTR/VGoott/nWoAAEV+t50W8p/zgdc/ZXbwIq755B9qskBds=
=E6uA
-----END PGP SIGNATURE-----

--PEfPc/DjvCj+JzNg--
