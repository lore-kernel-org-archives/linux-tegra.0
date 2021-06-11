Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 563E0C48BD1
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Jun 2021 12:05:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3683D613CD
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Jun 2021 12:05:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230280AbhFKMHh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 11 Jun 2021 08:07:37 -0400
Received: from mail-wr1-f53.google.com ([209.85.221.53]:40730 "EHLO
        mail-wr1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229785AbhFKMHg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 11 Jun 2021 08:07:36 -0400
Received: by mail-wr1-f53.google.com with SMTP id y7so5791937wrh.7
        for <linux-tegra@vger.kernel.org>; Fri, 11 Jun 2021 05:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hRpdmhMpuxXRQobR0p25JN65+9rAtH99oGxwRFzt4Og=;
        b=A6qec+2aZ5Q8YBecDbnt0i3i1uWt8libaJeTykG0XqkriQI8PvvIAb0aUqmisjwMlj
         da1qSFZUutBUihSBhPXF6I/vQE6uZEL6V9tyeVumZpJVS0TAQahcDHaCvXdMIA59qdqP
         8HERLhPDeLjDbblSdUsVNB3MnOM88mWOnMlp9n1UrzvDYHEUxjxLZpkYkToylMnkRlnF
         EIHTBh+G1au/gNaKsZMqp0M42ZR1zaA0Nw13cH72Er+K5CN/hPyIdocQf4T2fB6Oek26
         dKAtIsx3HAuhyivOkH+AVOvVEVQqtwHLAFmwPhNtpXenR5WlJDZFz/1e/v3kRuj1h2qB
         gTbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hRpdmhMpuxXRQobR0p25JN65+9rAtH99oGxwRFzt4Og=;
        b=BCV1dKt1nQ0zXvIceGrOgDIY//WumLp4pSUrzpc8QOcIypQsVIAejOa4KtHH1brF4o
         JgY1fxiRgXaAxcKl+x4r/qWyxrpL14aROCxVjZrby3mC7NLMG+KDPGSLbb64BNoFis15
         lcRq4g7uX7rMAqj63BifXAx/pY36epUx/tnX+LVkhmFK7G45mxS/lHEINPiWkHaSgJRQ
         0Uf8k1CSOmD5xr5TObLetMb6NDh4V0B/0jSBx2OyDX9/WgfX8/19VoRWXQveyr56/JoD
         DL3h7YDvFlfECilUHCXM+6fVSH7lfxdkfDEE+7i8nFSYtf27kclVkCd804nIKcOHk2xS
         92Gg==
X-Gm-Message-State: AOAM533nVh7Nq/KVORjWuW+UNCwIlUMcqzlwylU802RT332CPQ3AtnQI
        UbNaLYnNI/IR15SqcVZqj8s=
X-Google-Smtp-Source: ABdhPJxqBjw3HrtMgc2OXg5KORiGwzysOQKEB1Ej0iptMdt1LmifSFgOy1HB3fw6Cytwcs7I8jeLZQ==
X-Received: by 2002:adf:ec43:: with SMTP id w3mr3600353wrn.270.1623413064793;
        Fri, 11 Jun 2021 05:04:24 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id m65sm5739813wmm.19.2021.06.11.05.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 05:04:23 -0700 (PDT)
Date:   Fri, 11 Jun 2021 14:05:58 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Will Deacon <will@kernel.org>
Cc:     Robin Murphy <robin.murphy@arm.com>, linux-tegra@vger.kernel.org,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org,
        Krishna Reddy <vdumpa@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        iommu@lists.linux-foundation.org
Subject: Re: [PATCH v3 0/9] arm64: tegra: Prevent early SMMU faults
Message-ID: <YMNRpo0vC8Rjn+a9@orome.fritz.box>
References: <20210603164632.1000458-1-thierry.reding@gmail.com>
 <162339404910.6729.11145661496228624827.b4-ty@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="0FeCZruiAMHvtV86"
Content-Disposition: inline
In-Reply-To: <162339404910.6729.11145661496228624827.b4-ty@canonical.com>
User-Agent: Mutt/2.0.7 (481f3800) (2021-05-04)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--0FeCZruiAMHvtV86
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 11, 2021 at 08:48:00AM +0200, Krzysztof Kozlowski wrote:
> On Thu, 3 Jun 2021 18:46:23 +0200, Thierry Reding wrote:
> > this is a set of patches that is the result of earlier discussions
> > regarding early identity mappings that are needed to avoid SMMU faults
> > during early boot.
> >=20
> > The goal here is to avoid early identity mappings altogether and instead
> > postpone the need for the identity mappings to when devices are attached
> > to the SMMU. This works by making the SMMU driver coordinate with the
> > memory controller driver on when to start enforcing SMMU translations.
> > This makes Tegra behave in a more standard way and pushes the code to
> > deal with the Tegra-specific programming into the NVIDIA SMMU
> > implementation.
> >=20
> > [...]
>=20
> Applied, thanks!
>=20
> [1/9] memory: tegra: Implement SID override programming
>       (no commit info)
> [2/9] dt-bindings: arm-smmu: Add Tegra186 compatible string
>       commit: 4287861dca9d77490ee50de42aa3ada92da86c9d
>=20
> [3/9] - skipped
>=20
> [4/9] iommu/arm-smmu: tegra: Detect number of instances at runtime
>       commit: 7ecbf253f8d64c08de28d16a66e3abbe873f6c9f
> [5/9] iommu/arm-smmu: tegra: Implement SID override programming
>       commit: 8eb68595475ac5fcaaa3718a173283df48cb4ef1
> [6/9] iommu/arm-smmu: Use Tegra implementation on Tegra186
>       commit: 2c1bc371268862a991a6498e1dddc8971b9076b8

I've applied patches 7-9 to the Tegra tree.

Thanks Krzysztof and Will for your help in getting this over the finish
line!

Thierry

--0FeCZruiAMHvtV86
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmDDUaMACgkQ3SOs138+
s6EoFxAAniadn+i4fcWUq2ejwdfgme+Hn6STBgBar4sptJiRZwCfzyFMounIY8gw
5kc/6teVwJPzi0nVc/xnvM6FkCBgQKFkNCwgvoZO05gQ1tRMLWxtoRiJmpKpkCsF
D7Q4DBb7k5bUwy+wy1cT0UMMTFeRrdRGZ0wOesEQwAU+fAAjC6pzfGtlEAeIeUU1
8vsHuTO8Pws8LfeUVKPSRf2wIMjKsb6g5aR5oMrISKVCZvjoW+oOm1FN6o+/mwpS
Sh+GtZwbsrN/uzE9qdEWTxXRAj+RFUlYuuMeUuxEvSKj7cZ8hQ/k2lmm3fP+O4A6
wT6P9tqAv0TBwBeQ4Pgyqzmi5dptnuR5TsGAjDcaR6v2H0v2FfMa67dEF88LC4yp
f7rAdULjuqfgFaZ0miboE/o2gXCiz4eRFXmeff9RSToOTXl0/CasUbkQfkpjMaUV
cOqD6YpahFqjI+WTrLcAD7fJ+VdVOL2/Qrgss2ILXd1xyAdivSSEhcbuH7Q68wkT
hnYUzKvMCyQvMyjAAxvgy0QOhuDcdFn3g3vsxErO88I1qcy4+4Dzhf4oH4OzNY2A
lGzWv+SF1La4261QdOJW2FvLWVGmPQf+yBtsGMwqhUJPUyIBfiAmniNvDOtT4PSP
RcK5rqO4qkbZrLgpGvqnmNQG2c3Q3CuCXoqKu/d+V4r4M6P08H8=
=ZoqM
-----END PGP SIGNATURE-----

--0FeCZruiAMHvtV86--
