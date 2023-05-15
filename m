Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DEF3C7EE22
	for <linux-tegra@archiver.kernel.org>; Mon, 15 May 2023 15:07:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242005AbjEOPHA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 15 May 2023 11:07:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241849AbjEOPG7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 15 May 2023 11:06:59 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E92D1BDF;
        Mon, 15 May 2023 08:06:49 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-965fc25f009so2090756866b.3;
        Mon, 15 May 2023 08:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684163207; x=1686755207;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ClsAc+MQWEbajrlHlPJBJiVswUOmZH90ORl3dfNFYBQ=;
        b=O8zV0zQwfKIr5rH7o5lHONZT52pDSOBEsASAlgUsXYOwKSUCuOPOTKazqC7mndtM4K
         86ZF26CFTysSxAJJnmuNKuUwQTDHoCR//VRc0lW3M69IUV8HLyshViBuA9Ksjae7psSz
         34cDjjhRvuA2cqxuTR3Rc1fJMgwV3t6vw/8Mmdenf7kMCRt+122BkjExd2/OVO0rtv+k
         N5s3aORmbyjfQ7WvrMF/V4HAU9Gy+Xt4SlBzUH9HceVYxDer8GMlisKRcx8jIEV5e9Sf
         dDnP0uz4Un4SsiLmXBCD1u6cbblcczkIgfkAqfqTvHC+zeLvlAz6H1n83QFIGYkKyqEX
         7hTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684163207; x=1686755207;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ClsAc+MQWEbajrlHlPJBJiVswUOmZH90ORl3dfNFYBQ=;
        b=N1ZCZIcerVg+nbegPC+2+7tuFdK8dqUh10fEYeY+h2E9bSH2Rmt2dz1fn81dc554zS
         M/OEJYcrP05TzE69HvW7qPlWrMtI6gSSayr1ncDjPmWSv5MJeaSciH9T0E5amzDG17x+
         E90opbZVyAfOsWJIBeMaLwPnZGMKKWAq/YPFA+u4TfG+KuwxTBs9YDQ/N2ldganxuIyF
         sgZmi76hze3tWJbv8Cg21gbOJcblOMoXQ3x6LpsEOIBzbuYK2n96YxulWdqo5vsgFg5V
         5niCEJ47GrHXOpJ2gm5WTRPWmtEBIeT51Av1MJqmyPkc6kBu+UtWs4u8BNv+hSZHA2TR
         bbkw==
X-Gm-Message-State: AC+VfDxwNq+BJjv/VHlkY+B0nHkeQgm+yBgJSUBDGCE8gHYkxHovPDhs
        gVFaLaEMkuK8JKlR/XQeOI2SLjbzil2nvg==
X-Google-Smtp-Source: ACHHUZ7L/BMseVSQpyf69tujmTDgJlIjLXeqvkKh5mCCAWwCg9c7cxmQWtCE5GyuRsGBWMPUWkZ+Lg==
X-Received: by 2002:a17:906:7312:b0:961:800b:3f5e with SMTP id di18-20020a170906731200b00961800b3f5emr31396103ejc.72.1684163207327;
        Mon, 15 May 2023 08:06:47 -0700 (PDT)
Received: from orome (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id lv4-20020a170906bc8400b00966293c06e9sm9499977ejb.126.2023.05.15.08.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 08:06:46 -0700 (PDT)
Date:   Mon, 15 May 2023 17:06:44 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: Document additional Jetson Orin NX SKUs
Message-ID: <ZGJKhGm-UAN88LN5@orome>
References: <20230331163159.17145-1-thierry.reding@gmail.com>
 <3a8724bc-fb44-0080-fd24-c04e3841385e@linaro.org>
 <ZCwAnBbeYVVUMti8@orome>
 <4129f3d5-1df8-a767-6783-1d7123b2e9d4@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="UzM2R6eGT/Bqb/nB"
Content-Disposition: inline
In-Reply-To: <4129f3d5-1df8-a767-6783-1d7123b2e9d4@linaro.org>
User-Agent: Mutt/2.2.10 (2023-03-25)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--UzM2R6eGT/Bqb/nB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 07, 2023 at 10:52:58AM +0200, Krzysztof Kozlowski wrote:
> On 04/04/2023 12:49, Thierry Reding wrote:
> > On Fri, Mar 31, 2023 at 10:19:00PM +0200, Krzysztof Kozlowski wrote:
> >> On 31/03/2023 18:31, Thierry Reding wrote:
> >>> From: Thierry Reding <treding@nvidia.com>
> >>>
> >>> Beyond the original 16 GiB SKU (0), additional SKUs exist, such as th=
e 8
> >>> GiB SKU (1) and an internal-only SKU (2) that comes with an equipeed =
SD
> >>
> >> typo: equipped
> >>
> >>> card slot.
> >>
> >> Is there a point in documenting all of them if there is no DTS? Also,
> >> size of storage (eMMC?) pretty often is runtime-detectable, so you do =
no
> >> need a new DTS and new compatible.
> >=20
> > This is for the sake of completeness since these compatible strings
> > correspond to the part numbers that will show up on stickers on these
> > modules. In practice, yes, most of the differences will be runtime-
> > detected and the DT updated to reflect the SKU differences by UEFI.
>=20
> Just because there is some sticker, it does not mean we need a
> compatible. We actually omit dozen of versions per device - all PMICs,
> I2C IIO and others have some packaging bins and revision numbers.
>=20
> Although here if I understand correctly, UEFI firmware will add these
> compatibles?

That's the idea. UEFI does some probing of the hardware and currently
writes information about the detected SKUs into the /chosen node. I
think we could achieve the same effect in a more standard way by writing
out the compatible strings instead.

So while we likely won't have these compatible strings in the DTS files,
we may very well end up having these in the DTB that is passed to the
kernel. So we don't need these to be documented for validation within
the kernel repository, but I'm concerned it could lead to confusion if
people end up with undocumented compatible strings in the DTB.

Perhaps that's not as big a deal as I think it is, so I'll drop this for
now. We'll go with the "standard" SKU compatible strings for now and can
revisit if this becomes an actual problem.

Sorry for the delay, I hadn't seen your replies before.

Thierry

--UzM2R6eGT/Bqb/nB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmRiSoIACgkQ3SOs138+
s6El6w//Xg/pAHxUCf+hHGn4aycKajfi76NRWhI3+Lm99cGQ1/aX0/Ke8VT7Tdwn
JpxSFF8k0wlUI83EmJF/4iIW7YWW4L/b5R1iti3emm53BdWCvoJk4ODydTpOA+sV
YuX+PhPFKmXUUhz7Wu2wsLoGvcDvRampPA8NWWw4nCxGI3T8F/nea7CLIT+rWMiI
gFjXRGk8oNdnFSkGRXnZN8mmfZj2Jvpx6yqEkuYL9st3YlCaYJd720F7GeloTvsY
mkltj2tma7ly7ltYJ3FsguGPhU8PtuZ/J9+ZTsSScuopctDiHdK4egKJpEJqe5Kg
DSIEu3HqC00MX0Bl9ZumrQikKrJ6WcCpuF4mXQV+iwukK7iNsvpXTgf9bw6o1Gl9
j1oHNeVSH+bqX87GVdIKtTgZpRXYvH+cFsmv/4wvmdwYuOP2ccIm46QseokgyZUz
i6EPtUDGWfAPIJ+k3uZvMhdur/qD6t2LfAATI925BS58QcyqkYx6cSF2wpyFkY1c
zppAp2kp0GOo8t+EVj4PoC7S+aYgmcVDO1PkTjAt+onok7i6t3/Zb67+dRl0iQAj
2qQLXEpU8D+leZT3Vcg96hmi1QS+Rc/8iPY7nEOEggpzCEhwZblEMAE/2qWjCSJj
4bw3i1j6/h0EpzdekNy1w0MDHK4x/KaDJOT25mEO5vMqdqCWJEQ=
=yUiS
-----END PGP SIGNATURE-----

--UzM2R6eGT/Bqb/nB--
