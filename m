Return-Path: <SRS0=Tnts=C2=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53C62C2BBD1
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 10:41:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0703C2087D
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 10:41:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r8Zs4fj6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726236AbgIQKlp (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Sep 2020 06:41:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726217AbgIQKlo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Sep 2020 06:41:44 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C2F1C06174A;
        Thu, 17 Sep 2020 03:41:43 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id l15so4157174wmh.1;
        Thu, 17 Sep 2020 03:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=X83+YxLNLakSEy2MO2kNdUk1vFYzpBNVVoYA7qc9Hv8=;
        b=r8Zs4fj610xUajyLYCKzJ7kAYSxcX52cD0GDHf40+fI98gr6h+EEWEzyMRb075ARrd
         I4sQVmOtKcmMh9a+5BNplnzJgXH3H25Zj9voFQqDQ+xop77fAYdWEjS1wT6K98E1DRCr
         BVBWvX6+Y0BzkRUk6UgA7Hgj3WPBr8HhdmogWFQYUibY6Mpol9wiICtNNiHZoEbj4+SZ
         8TrBabmozaC37Inx39cnR26MiNEG68s44MsDxPnMLY5nwuoubCF0djgum70p26BQBADS
         mcZ1QsQWAAvz4kTrJ++tk5PgAIVrK8UrUbAl4aLFZ1dr9p1vR+yQ+21BhkLKWpUdEnsT
         VrQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=X83+YxLNLakSEy2MO2kNdUk1vFYzpBNVVoYA7qc9Hv8=;
        b=My2Vnx/vz5mQBgZMa0/joBJ9x0MnXZcYWOjJzgRsPNd348NkLOKmyI4gPNDKZ9GwuI
         5tOKaz/t5D33bOtUnqm1UYdq6Q1xL3cey6cHiYY7mIxK0VGb2rW/vvGjNk68KeZZQzKd
         OeJ1e0m/ESXyWCVs4i4S977yBkDB+43x3QWpKcBVHQeGJuPE36v3XfP5KaJdIlPQpQSD
         01DAfCxucyfC5tL6wE3tlcT704XqIcnaWa+HDsxx7QnwM+wgKykzIHi3CkBgtlrT2dio
         HaoWGr/eEtYiR+bSaGtUq734/UQrN95BxxHf3AiTQ0lZzT1uWDD8o3Fsk3AFPQnJTRz6
         H9uQ==
X-Gm-Message-State: AOAM5326sM4lkYOHFccn7uxutIKmnFzcNciHTIY6/u+0lSVgK6+7AxDS
        m98M0iyTmGwEvflHWa7V3Zc=
X-Google-Smtp-Source: ABdhPJzLaq0pt0bNv92XyZEyoER6JQVztwJxVRUOSMo+cF5R4NCHmce2JIVKbOJMi0TkQ/eTSVcYZA==
X-Received: by 2002:a1c:6a11:: with SMTP id f17mr8726659wmc.143.1600339302168;
        Thu, 17 Sep 2020 03:41:42 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id y6sm38883203wrn.41.2020.09.17.03.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 03:41:40 -0700 (PDT)
Date:   Thu, 17 Sep 2020 12:41:39 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     joro@8bytes.org, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-tegra@vger.kernel.org, jonathanh@nvidia.com,
        vdumpa@nvidia.com
Subject: Re: [PATCH] iommu/tegra-smmu: Fix tlb_mask
Message-ID: <20200917104139.GH3515672@ulmo>
References: <20200916002359.10823-1-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Yia77v5a8fyVHJSl"
Content-Disposition: inline
In-Reply-To: <20200916002359.10823-1-nicoleotsuka@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--Yia77v5a8fyVHJSl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2020 at 05:23:59PM -0700, Nicolin Chen wrote:
> The "num_tlb_lines" might not be a power-of-2 value, being 48 on
> Tegra210 for example. So the current way of calculating tlb_mask
> using the num_tlb_lines is not correct: tlb_mask=3D0x5f in case of
> num_tlb_lines=3D48, which will trim a setting of 0x30 (48) to 0x10.
>=20
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
>  drivers/iommu/tegra-smmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

This is technically a prerequisite for this patch you sent out earlier:

    https://patchwork.ozlabs.org/project/linux-tegra/patch/20200915232803.2=
6163-1-nicoleotsuka@gmail.com/

You should send both of those out as one series and add maintainers for
both subsystems to both patches so that they can work out who will be
applying them.

For this pair it's probably best for Joerg to pick up both patches
because this primarily concerns the Tegra SMMU, whereas the above patch
only provides the per-SoC data update for the SMMU. Obviously if Joerg
prefers for Krzysztof to pick up both patches that's fine with me too.

In either case, please send this out as a series so that both Joerg and
Krzysztof (Cc'ed for visibility) are aware of both patches. From the
Tegra side:

Acked-by: Thierry Reding <treding@nvidia.com>

> diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
> index 84fdee473873..0becdbfea306 100644
> --- a/drivers/iommu/tegra-smmu.c
> +++ b/drivers/iommu/tegra-smmu.c
> @@ -1120,7 +1120,7 @@ struct tegra_smmu *tegra_smmu_probe(struct device *=
dev,
>  		BIT_MASK(mc->soc->num_address_bits - SMMU_PTE_SHIFT) - 1;
>  	dev_dbg(dev, "address bits: %u, PFN mask: %#lx\n",
>  		mc->soc->num_address_bits, smmu->pfn_mask);
> -	smmu->tlb_mask =3D (smmu->soc->num_tlb_lines << 1) - 1;
> +	smmu->tlb_mask =3D (1 << fls(smmu->soc->num_tlb_lines)) - 1;
>  	dev_dbg(dev, "TLB lines: %u, mask: %#lx\n", smmu->soc->num_tlb_lines,
>  		smmu->tlb_mask);
> =20
> --=20
> 2.17.1
>=20

--Yia77v5a8fyVHJSl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9jPWMACgkQ3SOs138+
s6F/bg//XdumYVA2ODztwS8iTzCljbnXyjUzNX8Ru37N5Br82W9rXoStYRiZ7boA
8IQVASAvvHf8pKd8J6Sm1sXasSi6yGFeJqPrCfZxYq1PCs+RIM93OrXtBd1JRajl
8d/u3ivynx6Qd3E98BQTc9uNc2+6cXY11XR6dKwhHuI4wb43BS/4FOR8a3lq+VWf
gznzq/QZPd11ZbCNLF4eI/LaWByGR4c/J1yrnw4O/QcCv/MTMr2m6YViJHhybm+V
XOTLotbAK0sjn2ihlieHKVUHvluPKkAn+qJVdB9/9SpgaPBq1/wueXu4GpLOcA9F
1ffbBx27wHv/dW3QzAqyOrjeTsKd0vFwTVziux0eZ1zOt74n9ARp9C+KDEn4b28G
2XtbuBE4CVTsZ2IS+ePrWAAG3ZnPfcz+cu+v6NNxZ9cd65qDK2aqOD6nskkUbbaf
m8eV41RK2PqT8p5FaeA3KFmXASVIMAwSFqWhNGnPYO5fzPSdr43m/iPas77sM8pE
OXPy/+SL5YDyYwez4mEs3gCzdPy19pFcnXgKGACS9yR5xnYAEBBvU+UpV8xAHFfE
vJYX5UyOBqJbmUAccVEhqllklQ0iWpTR1gmGBWlwjizBGxyR4bXW82oL/+ePcv0c
xdzFtey9zMVqmbsX3wqCi83VoEEwfo8VzxWF399WCoUiQMUJo+s=
=dbE2
-----END PGP SIGNATURE-----

--Yia77v5a8fyVHJSl--
