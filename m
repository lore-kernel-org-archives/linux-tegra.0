Return-Path: <SRS0=kAmo=DM=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80D8DC4363A
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 09:53:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 477D620776
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 09:53:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WCC2gEff"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725930AbgJEJxz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Oct 2020 05:53:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725919AbgJEJxz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Oct 2020 05:53:55 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40761C0613CE;
        Mon,  5 Oct 2020 02:53:55 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id u21so11016048eja.2;
        Mon, 05 Oct 2020 02:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tSNvIJ6n/8PydPpekJ3sBZyLSmyQXmedjUmwZXMurMo=;
        b=WCC2gEffyxEhzVrQNJMtnmNTSoUUlpfjFkvf9eRqLzEJ9LA0ehw10XSgqvJx76A3ip
         kUazxGYkWWM0N7bRnnWYWQlXKslfVFRf4wvmPEK2JSFJIEfYoHnv9wlqtT/5h8h1KDEj
         qkxF1atxUk2xVIUzKvp0v+ORc4LYFEihJ+chWpuQtb3nFFQYZ8Lv1REbPLvp8jPlSM/o
         JjTJyceLbPgYy3s3ae88L6ngca5cL88GCs6eBAVJ8+DatuXO6dQYoZkO8ksmKthOuA8k
         d+wBWlESELfkIhwLFeIJYwRskd3V37LRuVyNmc5+OwBWpFN3r+vcYjH2eiMyniU4/PuM
         hLcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tSNvIJ6n/8PydPpekJ3sBZyLSmyQXmedjUmwZXMurMo=;
        b=ZJJacbcgznomMW0MRFdGKqv/HaDjTK4z7pFLMg0Os5YYZUS7/STY4X2Ap/ePUzV8ba
         NVDF8iNUeMWM2ld5865HYRHCzJMh9xLZgfPIiN+IkDVjAP1Vq+JwGL+n7cQwvzKq8pNk
         3hWZPleCWIFjhky6ych7PQCIm2GV2ab4mY7a+FFFyruz1//Ungwjc9r0eikUUCPbRu3W
         YS8NSTJH4YSEpWE6a/d25YW6dHMKWGxPauSSDUBw+lkjwLINYGYkABA0gdyVRKB5c00/
         +8y1r2Z7cHrR8OnEigNT5F6pbu89l0Pjre0lCOlbCqIxw0nC45Ju7GE9lSGxXQoFsY6L
         btBA==
X-Gm-Message-State: AOAM533sZnM2Y94oFScv5GLalLbNZyrkflMeBOU9b5PgY/u2nmd760Cm
        2+arAxBR9/PpBxEoMd+mg/mUcxIBYnE=
X-Google-Smtp-Source: ABdhPJxgzAOZ4Qeah+nCeFuiSWn88H4ILEdKN/5a6C7QNL1MKO0q6rEqKvyjihuNnGDqmUMjqS+F8g==
X-Received: by 2002:a17:907:7215:: with SMTP id dr21mr14431042ejc.239.1601891633938;
        Mon, 05 Oct 2020 02:53:53 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id x2sm8286307edr.65.2020.10.05.02.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 02:53:52 -0700 (PDT)
Date:   Mon, 5 Oct 2020 11:53:51 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Nicolin Chen <nicoleotsuka@gmail.com>, joro@8bytes.org,
        vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] iommu/tegra-smmu: Rework tegra_smmu_probe_device()
Message-ID: <20201005095351.GI425362@ulmo>
References: <20201002060807.32138-1-nicoleotsuka@gmail.com>
 <20201002060807.32138-3-nicoleotsuka@gmail.com>
 <b1a195cf-0127-0531-f6d1-835367511f57@gmail.com>
 <0c66bab9-0132-d3fb-ea4e-de1278cf2b04@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="FUFe+yI/t+r3nyH4"
Content-Disposition: inline
In-Reply-To: <0c66bab9-0132-d3fb-ea4e-de1278cf2b04@gmail.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--FUFe+yI/t+r3nyH4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 02, 2020 at 05:50:08PM +0300, Dmitry Osipenko wrote:
> 02.10.2020 17:22, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>  static int tegra_smmu_of_xlate(struct device *dev,
> >>  			       struct of_phandle_args *args)
> >>  {
> >> +	struct platform_device *iommu_pdev =3D of_find_device_by_node(args->=
np);
> >> +	struct tegra_mc *mc =3D platform_get_drvdata(iommu_pdev);
> >>  	u32 id =3D args->args[0];
> >> =20
> >> +	of_node_put(args->np);
> >> +
> >> +	if (!mc || !mc->smmu)
> >> +		return -EPROBE_DEFER;
> > platform_get_drvdata(NULL) will crash.
> >=20
>=20
> Actually, platform_get_drvdata(NULL) can't happen. I overlooked this.

How so? It's technically possible for the iommus property to reference a
device tree node for which no platform device will ever be created, in
which case of_find_device_by_node() will return NULL. That's very
unlikely and perhaps worth just crashing on to make sure it gets fixed
immediately.

Thierry

--FUFe+yI/t+r3nyH4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl967S8ACgkQ3SOs138+
s6G50A/8CC2aziQWFWKu9/zGjy1UbL+zP8uXbPn3wZVQnWQ8kjRE5ip/HSI1QS+i
sgafB0As25F0ajenDbidZFp0nJiZvFRlD3VQT6bj+5XwoxI7vA0Uzu5UiXLmxCXU
CYA2NJZ/g6uCJ3ptk52YbG2gt1J49/GhgFuCPCaBxV2c8gIwo0eVs4daocjvK1mQ
XqL7Nci3UcsY1oDgNnzzQAyUQ4ZEpEHdFzLUd9CSNZBxGDXA26d3J+RgJGXlnXbv
eus6PtalK5okgodgvY60KLzyci/3Ph3k1aHJFNou0lmNxyJYW0PXTOVk5fn/wxY4
E8rcGiUyNSmYxcZ9KVYr/EXhYW+ECM9drCGL1pM6InKeDtxa67vhOeW4RdbiGdzt
/RjoUqPTUB4JYihBxpvkhUtYVZe4vtM+E3clPdKAqVig6pfZk5nacAPXj7KeJmNz
2QNydAPLaBNiOclO7x1hneV9xHf0UBmp/Gp1P1OmaRe/eJ9bk8uymQVyG4QiX4MS
dGPNMhW0lYgwy+a0K9omgh5RIInTaJpjIC5A9Z5N1um3sByGsk5HavPQHlZSqNjN
CytLUR5MaSs0Zsfn/1OxszZtr1J/Kor3CC8Qxlv0pxQN1xSidAT7sWwL5ObEgHKt
FoXOhaIeBvMp1DxmN6BHUDxA/p+Luf1GxGgZjsWIp4WUzw6XNNc=
=0Ryz
-----END PGP SIGNATURE-----

--FUFe+yI/t+r3nyH4--
