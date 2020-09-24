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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33052C2D0E2
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Sep 2020 10:23:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DAAEC23741
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Sep 2020 10:23:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PKDFs6f1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727351AbgIXKXj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 24 Sep 2020 06:23:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727089AbgIXKXi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Sep 2020 06:23:38 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28930C0613CE;
        Thu, 24 Sep 2020 03:23:38 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id y15so3035229wmi.0;
        Thu, 24 Sep 2020 03:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gZTr6jKVJWBT4b9FYe4os7KKq9EIettyh4MTHWoR4TY=;
        b=PKDFs6f19rp55uBqg1s6mc/02OdH3LiLE4xwl102tLJqolty41BUdcS3PJo2zzp+ev
         wXIISPXFCiCYvP576m8UOEGFjEHsmkIMsiDzTC2eVFF/rw8R15A7ofeVpNxEcMaEttuA
         aruUCFs2ZDBJQBNOsEwaKfr9lLIsVHmUh4UaqghCS9OFdZwfqZ7nD6IVLS5p+PWQXSy4
         dKCygqDumJijzPP5I/7wiO17FMS+4tBz9dpKX1nBXMibDCEFSFchXqE5K3eYN+FvoNKX
         IXa3zvXNzgovrGwJ0M5aCu1CfGY8zwe5967rFlhzHAImPIHLPDhgpEr/A1oti/jGxfjq
         K7Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gZTr6jKVJWBT4b9FYe4os7KKq9EIettyh4MTHWoR4TY=;
        b=G2+vbKDO0iKV7gPgkMxxJA6GprQXpJdz/aHRbmDHoX1d/5qzyMICWRO+TTfLDfrvgl
         +js7nEchOui+ORZLRCZzlDEOUEXG4xrKcuFTqjf+pRqU6dPEnDaHSNiv5b9y8SPgsmMU
         ojTq70gZS7CJu/MV7KzcNGRzgC+Ibq7zl5j00jPWgsBnA+br75xnutEn1baA6XOzVcZ6
         x7ZswFzgvQHORuh+Fjgb1iVuXEl2Tw6Tbu0YmIufJTR5EaWudjT0Y9dj9X4L0mXIbSj3
         PM2thSKD1zcXfH1MP77+sFJOeAWwLwACUc8gdLOLePcihsPhBdwuSP60QTJoDYzdL4ld
         FB3A==
X-Gm-Message-State: AOAM5332GVwnymOtobjL4KEi0eQX+rolVAS9zVCV38X/EoPD6GIHWP/d
        5tKzfCEiDr36amTO5+YLA00=
X-Google-Smtp-Source: ABdhPJwhuRMERw9p/nHHMg6pVZuFa6hzITzvP8M0CBrfe0EcJtOoL2dRd+frNm3C7Xww3RN6AFaeew==
X-Received: by 2002:a1c:9c4b:: with SMTP id f72mr3950986wme.188.1600943016827;
        Thu, 24 Sep 2020 03:23:36 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id u186sm2895522wmu.34.2020.09.24.03.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2020 03:23:35 -0700 (PDT)
Date:   Thu, 24 Sep 2020 12:23:33 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     joro@8bytes.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
        jonathanh@nvidia.com, vdumpa@nvidia.com
Subject: Re: [PATCH 2/3] iommu/tegra-smmu: Fix iova->phys translation
Message-ID: <20200924102333.GH2483160@ulmo>
References: <20200911071643.17212-1-nicoleotsuka@gmail.com>
 <20200911071643.17212-3-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hAW+M2+FUO+onfmf"
Content-Disposition: inline
In-Reply-To: <20200911071643.17212-3-nicoleotsuka@gmail.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--hAW+M2+FUO+onfmf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2020 at 12:16:42AM -0700, Nicolin Chen wrote:
> IOVA might not be always 4KB aligned. So tegra_smmu_iova_to_phys
> function needs to add on the lower 12-bit offset from input iova.
>=20
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
>  drivers/iommu/tegra-smmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
> index 789d21c01b77..50b962b0647e 100644
> --- a/drivers/iommu/tegra-smmu.c
> +++ b/drivers/iommu/tegra-smmu.c
> @@ -795,7 +795,7 @@ static phys_addr_t tegra_smmu_iova_to_phys(struct iom=
mu_domain *domain,
> =20
>  	pfn =3D *pte & as->smmu->pfn_mask;
> =20
> -	return SMMU_PFN_PHYS(pfn);
> +	return SMMU_PFN_PHYS(pfn) + SMMU_OFFSET_IN_PAGE(iova);
>  }
> =20
>  static struct tegra_smmu *tegra_smmu_find(struct device_node *np)

Acked-by: Thierry Reding <treding@nvidia.com>

--hAW+M2+FUO+onfmf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9sc6UACgkQ3SOs138+
s6H3aQ//YiyhKfdv1T0l5I+sWJLgPMt5Tv9V3Hul5HxECkRzIWLUFijryp3tLNlU
unup51XBCpV0Y/q1B8S7X0AhIqaoUM7aRXIiAbp6LwZuZDHyAKN7iS2e1IXdZ3lh
gl1c6r6boPVKiMRPcnOYKeukZSMsWO6RsnWlOZO5VgYjcYT2L+a94bCZ0Ogg3vpW
g47FFf22V+RnDF3UOFI/3sROkOLptSqEU7PgNUC67cS3rffTNoiW9FoxHYASJ70J
BapvXPZHDWKovcD4FdEIcoEc0phEO9knjPvh0ssOM07lzWUDqME7I2X1CcGtncd3
z/jmVjw8NwXyZEh50CkN3shUJdOeZ+1jO3jBb0EOAXWjjmK4zbDQgV3qdyC2CQLU
afRp4bq0wprYj+FCWDCA2i3ndNIWTgu3ArObLz5YiSf3Mny5dbO0S+d2pOGwGERZ
oeQEy3C/pK0vhy/ziLsTt6k8byU6JCRA4RMdCuTZSNH2v4Sk7eCwVupdf+QvZk0g
5Sj7nr00b5d1qSJFm8LoVxLAKxVW0AQdmN8x8TYbAiY/R1KzaSBnU+bJMNXZIrqo
iJ2XLQlyYwNyXSzAOPwiYA2FP2k1G/QF8rBUFZgBgP5RVtIiGDcnyw6MSYJpQ88X
qgI6SuOmQqwxYH64pYrThfrVyzZC49sVuf4pqzgDSA3NyDh2QW4=
=W1ct
-----END PGP SIGNATURE-----

--hAW+M2+FUO+onfmf--
