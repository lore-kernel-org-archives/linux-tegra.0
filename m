Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBAD3EC8743
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Sep 2023 16:46:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235343AbjIGQrB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 7 Sep 2023 12:47:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242104AbjIGQqa (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 7 Sep 2023 12:46:30 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25603172E
        for <linux-tegra@vger.kernel.org>; Thu,  7 Sep 2023 09:46:01 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-99bf1f632b8so149540666b.1
        for <linux-tegra@vger.kernel.org>; Thu, 07 Sep 2023 09:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694105093; x=1694709893; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rVal77bSl5KfJ1NqAZdo3TviCRf1XkCZOl7Ruz9I9ec=;
        b=bGzl3j/BqGWwXD1Tpfs2XngNT4O9+M9gohYc09bYZTsyg+z6QxeTJmyhweBFxHfprH
         iOY+QJrtdgt1lpYfcWzqqXi5eqbFFGtXItTwMpKWu0Wg/sJWalbXYIvufT0lWvu56+ou
         ERWobdhuj8wjAqbdxE+QtwIukHsfzV1Gta0gPA12eyEwBPbylGhbOhPikoJ0L8S0SYN+
         DbThBJtOzpphBk62usTy07nH/sWfkJB2qZr3zpM9rRDlfLiUDPgFq+hvHY+BLwkWRU47
         NC8xiS+sworbdjwUwP432ZLtbCvzQ6scw8HFDLsz5gFEU29QaKUz0+PM3yCe2ZoCOZDf
         68DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694105093; x=1694709893;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rVal77bSl5KfJ1NqAZdo3TviCRf1XkCZOl7Ruz9I9ec=;
        b=XSjk9QW4LxkxOX/BeIKyY2lJP+L5ID7vgphAEA8Yy6t+65DT1fTzNwn7aj+bRIIReH
         KCsKBy/pC+aNdXuYCd0YvdjmSAsT2yKmzeRoDm1BFm1RzDtDYhWASqugwBczJqvh+EPS
         54u6u28a4Q8MIzhxaY9MpnBlLQbK0/0j/iP22NVUQIUYQr7vzcTR3chamLcUGJEQYWbK
         BnmWT5JfUhDpOf44kJHmmQUcxCgn4nYKgeOiQT9+SWTvqd85YFZ+hLJITK6h4vG7mmwB
         1iqyM2GsEPNSD1Dsi2PMEwQeO7vt0nSOXj8kwsyXy3kmJ/x0h0aE8VMxdzP5y+pK5A+w
         ERcQ==
X-Gm-Message-State: AOJu0YxUePJVYxfIi30R8kpqnJGkEJr3n3vyvFgMtFIjvu5zyfbKoTQp
        FZX/guupEzD/7pIzveg5cGXlJsq4r78=
X-Google-Smtp-Source: AGHT+IEb44oJKVU32g8Gpv1w2GLfsjAU2c/Jg14YL7Z37DVTPrlmAqulebsJshUTyJmwcD4D4xsXqA==
X-Received: by 2002:a17:907:1003:b0:9a6:800a:8b58 with SMTP id ox3-20020a170907100300b009a6800a8b58mr4081654ejb.59.1694072683833;
        Thu, 07 Sep 2023 00:44:43 -0700 (PDT)
Received: from orome (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id z17-20020a170906241100b0099cf91fe297sm10257349eja.13.2023.09.07.00.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 00:44:43 -0700 (PDT)
Date:   Thu, 7 Sep 2023 09:44:41 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jinjie Ruan <ruanjinjie@huawei.com>
Cc:     linux-tegra@vger.kernel.org, iommu@lists.linux.dev,
        baolu.lu@linux.intel.com, Krishna Reddy <vdumpa@nvidia.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v2] iommu/tegra-smmu: Drop unnecessary error check for
 for debugfs_create_dir()
Message-ID: <ZPl_adfR8j-ih7Tt@orome>
References: <20230901073056.1364755-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="HvtXWZfmTjWuBMT6"
Content-Disposition: inline
In-Reply-To: <20230901073056.1364755-1-ruanjinjie@huawei.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--HvtXWZfmTjWuBMT6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 01, 2023 at 03:30:56PM +0800, Jinjie Ruan wrote:
> The debugfs_create_dir() function returns error pointers.
> It never returns NULL.
>=20
> As Baolu suggested, this patch removes the error checking for
> debugfs_create_dir in tegra-smmu.c. This is because the DebugFS kernel API
> is developed in a way that the caller can safely ignore the errors that
> occur during the creation of DebugFS nodes. The debugfs APIs have
> a IS_ERR() judge in start_creating() which can handle it gracefully. So
> these checks are unnecessary.
>=20
> Fixes: d1313e7896e9 ("iommu/tegra-smmu: Add debugfs support")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Suggested-by: Baolu Lu <baolu.lu@linux.intel.com>
> ---
> v2:
> - Remove the err check instead of using IS_ERR to replace NULL check.
> - Update the commit message and title.
> ---
>  drivers/iommu/tegra-smmu.c | 2 --
>  1 file changed, 2 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--HvtXWZfmTjWuBMT6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmT5f2cACgkQ3SOs138+
s6GGQw/+Ncn2h8nFPL3OqrcC1az2G+luBQnIRXGLvBs+7LJRMW6CgmhxPvgxWIai
eAt4lXhLCEU9OluStu/79xJXExRJpVOftYb2918gMfsp5VMWq+4tc3uIRo6bbr9P
LTax1jEg4c6cWQjbDGBU3qXZhMxBdc2dr8b7szlbxLrCOiL4ZYakStnxlnO2EEZT
buWVhRhLNsHoYjgUUrp1mSNg0EcfZqeKuE6VwXQ6Q1cI6c/ZekthJmlh35HOU/Uz
THB00C67niQLkkPor8/xtpESrL6bUtfblHbDVAjU4etiamfe3mGClX6cJjltuLnl
lpYghVrbk4ZMjzudoQsX53PL6465ykf8LOseMO6lJ6wWyXxEMetNy46McP5mwnLn
/ANRNqMi0TUbBgcXUj81eVhQ4UIZJGHZoGwGlnvntWb5/QNZOhLKSweWQ8VSC6ZM
pC65yGUeS0ZawAovOtsqVCEdxserfREsr2r8lsUPV1ITO/nPa+OndPMRJ2XI6Acu
lYJmfiHvRweXodiW8V+zu3WsWm3H7dWmOlyDlnUSKyhWzIA8cRhLKCWqh/9fQG0t
xdoK+4a0UK6LzfDvLKqfkwx70vzrL4vS3Kpv+h672KmQdaxRlwPUKUX4THj+hFxe
983l9GGsGQlP6mRMvoumjufwdZBWauTfWfb5q4XymGwDSb9sk9Y=
=HMdc
-----END PGP SIGNATURE-----

--HvtXWZfmTjWuBMT6--
