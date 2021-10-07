Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12BFCC433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Oct 2021 16:57:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA5A061248
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Oct 2021 16:57:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242950AbhJGQ7d (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 7 Oct 2021 12:59:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242953AbhJGQ72 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 7 Oct 2021 12:59:28 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78181C061767;
        Thu,  7 Oct 2021 09:57:34 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id o20so21042637wro.3;
        Thu, 07 Oct 2021 09:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=El2GgWjzGT3viL2Ka9TGbi2wzgQQNq0vXUAM3RTl7rM=;
        b=NgX7hfYeaa3E/yEBbPOQByUrqiYE/qI824xs4ToqrJj1fTGpxW9OXRkBDDGIuBzxpp
         01OTm5/FyD37etzeiJWIz9o90MT0ztqEHYa4Bok3tTouLKs3c7WBapKz5439tMFYLA6w
         NAqT+9pmb2tNEdpf12np7W4TIijC2wFgLon/tnsF82lJ4uH146LP5dqU0YuPVeyKS53+
         Ys33ILup66XiUjWAI5hnZlqLh9K8Pajia0xShDz0LqW1Ha6ilBAQvSWMPVlVa4eroDjw
         cVbke7jP/DglmKoFE3YE1KbPtmrqWPzkMDPP3A4Smbi7pVAXWolyCizb+8OXX508OoLm
         WNLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=El2GgWjzGT3viL2Ka9TGbi2wzgQQNq0vXUAM3RTl7rM=;
        b=Cnkn8n9Qdo7BbN2XK2r6oGSWw2oJY62pw6vMLfr1OLVwME5m4E09YqX/8zds0paBBk
         Xnk38docWHXBLV06RDOa9AUMXGv6rUsWB6jDNXN5MsiBf9rAHX4OeohH6wUIyiTb2JH1
         sIrXXicPnEvhz8bu0Ag+nUDbFBHQ7PCiUKRYgGpx950IoXn5A5jhvMvAhl3ceTRoHpAF
         v0QhCIggUQMA78wIVBApmOXv30TO81ZZQNPHZGhvZgLQatgk9ICBdvxkCqsh7ySeRCyg
         joHiWTiiHLqMQBD5Qaos5i1IauzPyJQzycloFXE7NPkii6hu5j852aiySdT4AsLSUXtO
         fljw==
X-Gm-Message-State: AOAM530h9+mo+0EerqFQi7ED4DcR1UuCl8tpJeOe0E6uJQFwPtRxfeQJ
        uHbw24hp5fT2DkubHpCrOIY=
X-Google-Smtp-Source: ABdhPJx4XwYRlso76dDdIc3k2apWPUAjSpgjJfpK+bS23C8zb7IRv85ldfWBS1S3aUXBTU4EGI+i0g==
X-Received: by 2002:a1c:9d97:: with SMTP id g145mr5894307wme.78.1633625853047;
        Thu, 07 Oct 2021 09:57:33 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id n1sm2800731wmi.30.2021.10.07.09.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 09:57:32 -0700 (PDT)
Date:   Thu, 7 Oct 2021 18:57:31 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     joro@8bytes.org, will@kernel.org, vdumpa@nvidia.com,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        digetx@gmail.com
Subject: Re: [PATCH v6 3/6] iommu/tegra-smmu: Rename struct
 tegra_smmu_swgroup *group to *swgrp
Message-ID: <YV8m+0qP2ibQBvNs@orome.fritz.box>
References: <20210914013858.31192-1-nicoleotsuka@gmail.com>
 <20210914013858.31192-4-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="z5TfhxvQFdT1ZzDp"
Content-Disposition: inline
In-Reply-To: <20210914013858.31192-4-nicoleotsuka@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--z5TfhxvQFdT1ZzDp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 13, 2021 at 06:38:55PM -0700, Nicolin Chen wrote:
> There are both tegra_smmu_swgroup and tegra_smmu_group structs
> using "group" for their pointer instances. This gets confusing
> to read the driver sometimes.
>=20
> So this patch renames "group" of struct tegra_smmu_swgroup to
> "swgrp" as a cleanup. Also renames its "find" function.
>=20
> Note that we already have "swgroup" being used for an unsigned
> int type variable that is inside struct tegra_smmu_swgroup, so
> it's not able to use "swgroup" but only something like "swgrp".
>=20
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
>  drivers/iommu/tegra-smmu.c | 34 +++++++++++++++++-----------------
>  1 file changed, 17 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
> index a32ed347e25d..0f3883045ffa 100644
> --- a/drivers/iommu/tegra-smmu.c
> +++ b/drivers/iommu/tegra-smmu.c
> @@ -334,35 +334,35 @@ static void tegra_smmu_domain_free(struct iommu_dom=
ain *domain)
>  }
> =20
>  static const struct tegra_smmu_swgroup *
> -tegra_smmu_find_swgroup(struct tegra_smmu *smmu, unsigned int swgroup)
> +tegra_smmu_find_swgrp(struct tegra_smmu *smmu, unsigned int swgroup)

This makes things inconsistent now. The tegra_smmu_find_swgroup() name
indicates that we're looking for some "swgroup" entity within an "smmu"
object. The entity that we're looking for is a struct tegra_smmu_swgroup
so I think it makes sense to use that full name in the function name.

>  {
> -	const struct tegra_smmu_swgroup *group =3D NULL;
> +	const struct tegra_smmu_swgroup *swgrp =3D NULL;

I don't think the existing naming is confusing. The variable name
"group" is consistently used for tegra_smmu_swgroup structures and there
are no cases where we would confuse them with struct tegra_smmu_group
instances.

However, I don't feel strongly about it, so I'm fine with changing the
variable names to "swgrp" if you think that makes things less confusing.

Thierry

--z5TfhxvQFdT1ZzDp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmFfJvsACgkQ3SOs138+
s6FH1g//bwitjmhtyJUDK/UWfxLfuFwOjEu/eNLJf0O23uMNI90/z2dGywyDoXgu
QYpUdBr3dSr6mO1uQjFSnftlgad6AK7CReY0ZeHKu3SiGmpIbXI84vSJRKVHpoWu
Hc4daNzWEAQS2SnBvzpwa8rnLPoxsbpA4x2EqI5nN+Zh1bmaeIcEMF/BQHoGJWj9
o55XUIwRXKa500tP3JG7qNa0LhwYHnaDI+R8mYVTee88wD2nCwTGuxghWiJk7aKI
NvLTq7Y1/lHHzAEpP1a+fEXsjDUKTOTU6FuZyd8Fx16N/O0FigyQXl4SU3WPmMfg
tvRZtn/Y/gdB7uodJRhLmLCAhTc1NZSxZWU5TXupPAIVohIWHtecEKTD5aKBXNhv
btbQxyPz0WLT34CqPCdl5+8+2U3v3OyhjdP3Z+v37mPYav85ejuySiBfTuyDcvb7
4T6QgAIEOaOIGPQGBmchEoe5MUlPDN3U2ZN9wmiw/kZdH0k13MhVRHPe5wK6kMJ7
bYLAH+Am3+sTgdnPJsKQ/ILyXbaI1jj11CZko/FmKKK0Tr72ue7npLSHf41m74TU
B7tOnybngivbPWz4R8hANp0/fIP0PLuIS6mYd5+8Gs/qb1J7gx82RIbLrZcP/N8t
e5XgdrCf+8sezq8ADDn4o+JrGb8vE0c/rrNQImyTOsAOwXfDHeE=
=z04X
-----END PGP SIGNATURE-----

--z5TfhxvQFdT1ZzDp--
