Return-Path: <SRS0=yNrD=DB=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB164C4363D
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Sep 2020 10:25:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8944020B1F
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Sep 2020 10:25:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U77b18qo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727420AbgIXKZk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 24 Sep 2020 06:25:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727358AbgIXKZj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Sep 2020 06:25:39 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 756D1C0613CE;
        Thu, 24 Sep 2020 03:25:38 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id w2so2973799wmi.1;
        Thu, 24 Sep 2020 03:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4/7mHE7BxkmccTTH2BLUO+DA7CrohaCzbOjCPDUfgN0=;
        b=U77b18qoLIwiwEgjDl1y0OmVs0s+KcFyNqBtmJC+gEZsC59CmvhDuUmV9kPsu+nRja
         AlTM2xqOR+n1UsA8OiD6ll5MsvaXcTYcPn9x59MUz33PbYOZqOFV1zuym/tvbHeEJOrX
         rS2ebaaHtDwd4Nu+9dZDesyYDFxoMibS30iyrUX5i9cGIcTXddHWgT2+NbveDPYnc3JK
         9W+hQGyTRosm4EwV/P7bhTE0GADzXO9+FNdUMAl3kCWa/mI7zkMZCvGpPBJnb0kFtl6J
         5A06+gUmTGe6UKhZA/5Vu00FhyoVokvTJdE72buu6lbnhMjX2jj2CCo8yejjoZUPIpLK
         eUIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4/7mHE7BxkmccTTH2BLUO+DA7CrohaCzbOjCPDUfgN0=;
        b=uFf+/GsJtvTa5+hBliwGKj9HmzubY2f0T2UmPGdGeNBsHdiwPa1I0h9ltguY1SrJJD
         IhOrnCx8Hc2rubpFifP4iIrewmR2ryaC3cSg3OzEQIF+B3dmd9DudEKYHn5ydfUCpNM4
         l+w1dYf4LnUk2x/wTHaDcSElA4UMnidi8V4GUu/8BIsD5MS7QLNEO2CpJpSqMR/unsxv
         j3O0Jz35U6svjPbuJ/v90/Rhp8skERGXFqBEtGhM6BVLWajViJqIQXzgIpAqWfZNBMxd
         RyB7/LGVw4wP37hlCsfmnbNYuno/al4FZz48fQzrwcdrHMMHUpfRhUNZe3CwkcdbQZ0O
         GCZA==
X-Gm-Message-State: AOAM533XU1SDBbKXz7hCIsZnj/YPCCOfGoZI4IlIV94vo+7UG+pkP3/y
        s3UHCxuahPcFcLBSon8aJq8=
X-Google-Smtp-Source: ABdhPJyhb+PV6AabI5OtSsT0y1M2LOJjr35vXCf598N9AvMGTg3pKW/7E6qXjKSx6r7UnQabmUmiew==
X-Received: by 2002:a1c:e904:: with SMTP id q4mr4199133wmc.151.1600943137217;
        Thu, 24 Sep 2020 03:25:37 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id j14sm3209005wrr.66.2020.09.24.03.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2020 03:25:36 -0700 (PDT)
Date:   Thu, 24 Sep 2020 12:25:34 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     joro@8bytes.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
        jonathanh@nvidia.com, vdumpa@nvidia.com
Subject: Re: [PATCH 3/3] iommu/tegra-smmu: Allow to group clients in same
 swgroup
Message-ID: <20200924102534.GI2483160@ulmo>
References: <20200911071643.17212-1-nicoleotsuka@gmail.com>
 <20200911071643.17212-4-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="r4QXMf6/kyF/FvJJ"
Content-Disposition: inline
In-Reply-To: <20200911071643.17212-4-nicoleotsuka@gmail.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--r4QXMf6/kyF/FvJJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2020 at 12:16:43AM -0700, Nicolin Chen wrote:
> There can be clients using the same swgroup in DT, for example i2c0
> and i2c1. The current driver will add them to separate IOMMU groups,
> though it has implemented device_group() callback which is to group
> devices using different swgroups like DC and DCB.
>=20
> All clients having the same swgroup should be also added to the same
> IOMMU group so as to share an asid. Otherwise, the asid register may
> get overwritten every time a new device is attached.
>=20
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
>  drivers/iommu/tegra-smmu.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)

Makes sense:

Acked-by: Thierry Reding <treding@nvidia.com>

--r4QXMf6/kyF/FvJJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9sdB4ACgkQ3SOs138+
s6FXSA/9HImjNheVtwru469lJEW3LBct1GkjgSPN4oFezSxMJgy/vj/YRrTy9Ezd
X55ZrMV9GkKyXW5Bj9LUrnI8svadFcgn8Lyq19ywPJuDRz9KRwjpNYhsTbHycbDM
qTaWGh6xzL2RCvRq0LvofEtJBdn972bpZWoBgNNN/obKs76RGEFasx6YhX8MI9L3
I59OWzZMYraOjbVfiupZ+25wpVEHf2L4ADleLTJjM7SprxZX2wzqpH4k+simc01d
V1yw1JaQk6YSKKy5+qHUWq9zU2g+j92YhZ38CVsdRcmqOnwljDkvHXSQREIOvBoL
aGQcGE6F/KPI5G5bl2u6vI0Z+pDd886/zLKAUNThqhsi3CApLfr/r9ZnaUWjE/5O
G6zEzghEY6lA88dWqQzg4Q0EVpSbJAt2a/QkoN0tdmtaoi0Kv6w2chKnzxU8Ql2s
uVQd46EKITbnIFxYW713HAyfQ6mCbT0BGUwYhItM1H4du5Sc2x0e2Llv4WhM/7pP
9vfs1bJjp5ZRhU4zb7ktuypFepunlYIW41lHA1PJkIm+O7kPf+leVUL86JeOjgyo
142PMzUDPgKFbJa3VpmCerNtVE9+jp25tu0E+nsUvOvZhINvCYxE08sz1fMjn+84
MKRzue+EB7DjFQefNE7Fww9+GoJ9qjffNunue6EX9QfZIw5Sr8Y=
=nmeb
-----END PGP SIGNATURE-----

--r4QXMf6/kyF/FvJJ--
