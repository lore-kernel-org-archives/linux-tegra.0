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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50A68C2D0A8
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Sep 2020 07:14:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CF29C23119
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Sep 2020 07:14:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QVueCi8X"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgI1HOB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 28 Sep 2020 03:14:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726328AbgI1HOB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Sep 2020 03:14:01 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02293C0613CE;
        Mon, 28 Sep 2020 00:14:00 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id o5so10946447wrn.13;
        Mon, 28 Sep 2020 00:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dKVXsIoVUAuhSPTXKz6orVntDM81DbNac5gyHMzAPn0=;
        b=QVueCi8XQiMhkjOzIKmaTIysaN6WlOZE2WfLd9SNZ5wlmdtIVcuNGiYUTgd5NPAOo9
         hi0/5KDd4YUjJbJT8RWlpYw//5248xsoPdhCkIxJ/yCMVJnV4EZpXw045OWTrPehnP7D
         WYgFexBGVJN5OKD/8rFXsmQYtJIpanOjg0myKVLKFLmGWxe/L9Aa9pEE6C+ocaeut3sh
         V4+qB1XJuh/JcJy49H9yyECjtXLR+Ik0M6DGifAVousD2WiH7oQNK84LM8DYvwZMI9vG
         pfvYmgeCxdkt3UV6URosdCh3QNZ8m9hiwSIWfiGZ+7fTX4hD1q7mSZQdN+HcRD4b58Qi
         isyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dKVXsIoVUAuhSPTXKz6orVntDM81DbNac5gyHMzAPn0=;
        b=TMBK4Zf3wP0omxvDLu8rQkBGju7+JwoUEzN2vB2FKtaw0Jr9EW1onh/vZc1OGi3yLc
         gXNf6dVYlQmBTsUTESKP5gFr9vb6tX1F6sLn+6YQ02nPIcB2FjeBwezmdoM1a6lpFSci
         xDnnYlKsq/Lposvmlklnf0hyzE5YKM7IjET8oUugOr/DIv3SGBFS2cMYUCZjmOPMQAJQ
         9qCYldnzbkAXoXEt3Tn8v0j6/eAahEGL2J6YR/E3eLQ4AZR72qdImM9PuQ/RKIH7Tr1D
         hGGpt7yXGH+zrhO/KiCzwOxxP/Z64Ow3AkG/KGAyvhLN80VGEMiSA6XJxqDg0FewDSrS
         e99A==
X-Gm-Message-State: AOAM530osRDUvx5mGnIMiSBJE8+q3BpMJXliTCiKiqsPltJ3pLLj49rS
        i5c1cjSXQKKtLwuJol6JzVnD2D5fzWA=
X-Google-Smtp-Source: ABdhPJy63S7ozLyrXRI/kPxuSL7jEKLDY06CuO93Ngie1sFy4hxUh9/wyXJfm5BoikfaZt0zwSFrag==
X-Received: by 2002:adf:d0cb:: with SMTP id z11mr31038wrh.192.1601277239454;
        Mon, 28 Sep 2020 00:13:59 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id n10sm27928wmk.7.2020.09.28.00.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 00:13:57 -0700 (PDT)
Date:   Mon, 28 Sep 2020 09:13:56 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     joro@8bytes.org, krzk@kernel.org, vdumpa@nvidia.com,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] iommu/tegra-smmu: Unwrap tegra_smmu_group_get
Message-ID: <20200928071356.GD2837573@ulmo>
References: <20200926080719.6822-1-nicoleotsuka@gmail.com>
 <20200926080719.6822-2-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="eqp4TxRxnD4KrmFZ"
Content-Disposition: inline
In-Reply-To: <20200926080719.6822-2-nicoleotsuka@gmail.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--eqp4TxRxnD4KrmFZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 26, 2020 at 01:07:15AM -0700, Nicolin Chen wrote:
> The tegra_smmu_group_get was added to group devices in different
> SWGROUPs and it'd return a NULL group pointer upon a mismatch at
> tegra_smmu_find_group(), so for most of clients/devices, it very
> likely would mismatch and need a fallback generic_device_group().
>=20
> But now tegra_smmu_group_get handles devices in same SWGROUP too,
> which means that it would allocate a group for every new SWGROUP
> or would directly return an existing one upon matching a SWGROUP,
> i.e. any device will go through this function.
>=20
> So possibility of having a NULL group pointer in device_group()
> is upon failure of either devm_kzalloc() or iommu_group_alloc().
> In either case, calling generic_device_group() no longer makes a
> sense. Especially for devm_kzalloc() failing case, it'd cause a
> problem if it fails at devm_kzalloc() yet succeeds at a fallback
> generic_device_group(), because it does not create a group->list
> for other devices to match.
>=20
> This patch simply unwraps the function to clean it up.
>=20
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
>  drivers/iommu/tegra-smmu.c | 19 ++++---------------
>  1 file changed, 4 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
> index 0becdbfea306..6335285dc373 100644
> --- a/drivers/iommu/tegra-smmu.c
> +++ b/drivers/iommu/tegra-smmu.c
> @@ -903,11 +903,13 @@ static void tegra_smmu_group_release(void *iommu_da=
ta)
>  	mutex_unlock(&smmu->lock);
>  }
> =20
> -static struct iommu_group *tegra_smmu_group_get(struct tegra_smmu *smmu,
> -						unsigned int swgroup)
> +static struct iommu_group *tegra_smmu_device_group(struct device *dev)
>  {
> +	struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);
> +	struct tegra_smmu *smmu =3D dev_iommu_priv_get(dev);
>  	const struct tegra_smmu_group_soc *soc;
>  	struct tegra_smmu_group *group;
> +	int swgroup =3D fwspec->ids[0];

This should be unsigned int to match the type of swgroup elsewhere.
Also, it might not be worth having an extra local variable for this
since it's only used once.

Thierry

--eqp4TxRxnD4KrmFZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9xjTEACgkQ3SOs138+
s6Hb3BAAmlSBf17eRIqR2c2OKS3u6J4Gm8+F2mKHd+5sC0MgnQVSzME9EJCuuiMb
oPvGwcxTnuabt/CvTD+s7O9dRsDP9vfmYADkWhpvfF5fY+QEbaRdmy7H8dECi7Wp
0UqfdEY99sE5Tj2z+mtywlTFrcHPzHuKPrOEYyjorIY2Fi569yRERhB8Bbs9Rkgc
QRrB2R3rel+1aL7gYauQvkEJOoBFAT2i6Ebg6qaVFl4yPtHmRwALHgyEmV6SRT7D
3CUIaW8g8pEulOoM1YzKyAThO1NKH2GTp/+3/+cjFl7qK654a0J5inAQrYp0fF7+
L/GcJbflazVj766H4nQYdE6PbwEBfNt8BDUDDeIAAasBgiJ+I9/97DnJodt0Q5Kq
Jkdg0OO+q050bjutL5+QYLpHQPaykZzIIGQhIqXw/VKum26Zj4ETzT6u4sqO0PVG
gHPiUmN3ioC3UEfvzHd/xJz1a+nBN6LgHXH4rQEsuu7ZfbWmVIiWY/aEB13jUj3l
i4IrXLTt05GnspNSeoVkeXpMaJfovn/ocESIXmxL3Yz4yf09rNzBxZlypFhCbq7q
GUk7WKpXG2i0gtvCMXIzPTGcC0ewhAfI/bzz2FsfYX20e7a2ao7Qg9DqvO4QmXR1
loq35HGpMRSodtzvSeuEQJMV1uwebJgHq1EnitQvP3X9JVKwLJs=
=UiGV
-----END PGP SIGNATURE-----

--eqp4TxRxnD4KrmFZ--
