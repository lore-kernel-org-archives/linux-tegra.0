Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D7D7C25B4E
	for <linux-tegra@archiver.kernel.org>; Tue, 24 Jan 2023 13:58:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233370AbjAXN6k (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 24 Jan 2023 08:58:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233977AbjAXN6i (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 24 Jan 2023 08:58:38 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56A9E40FE;
        Tue, 24 Jan 2023 05:58:15 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id bk15so39141345ejb.9;
        Tue, 24 Jan 2023 05:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EsE8LAxbmcbJ8Rh9c45zJHgSKEw3j1IDQef94+hEZn8=;
        b=ERcsHbTxkmAGcUFsnWBLecWkyzZDcgK2pztKG0dmxEGdG0CR/8QSdDdGNC2L7HY7Bk
         cNYG08EnEmFa6jo/fZRzgbFdI2w5SYfWirsxevTACycubyVlzHtDjU1cZOhEOzAU5PRX
         UWXq06VPmijoCaqeQVHJObNcRzVwg3Ne8kudBGqykrCcFPAeljTchl7rIqYtVZgFcyIT
         gKu0E5MThC53FXO4VdySU0TX8slzU+2tnXbACq3IornNM36wg0iBhBVillwvEr79UKUc
         DYQtvSMbp6dyDNS2itSmZOeQfqkYV8PiKh9vJeqcExXdD1CUadi6hoORGuw1GN5xr0Te
         /yiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EsE8LAxbmcbJ8Rh9c45zJHgSKEw3j1IDQef94+hEZn8=;
        b=Ptrj4YJiHEEhuhKcWw+u0oaVM9UHWzLgYvGRgbv8nBHWF8NWKbj3VA0CKvtgmhbZh5
         V6KQHAWKqTMlts/qqk3jOXAimSGufdiRqPP6LgUeFBLDZJOpVHgqK/XI78/KMHWxOLh1
         xRBM92e5JdXtdiok/KZnqYdLGOE3/6FKXRnfyiEPoRGBcmKO3XytYHARq+9LwLrH0VPg
         u5z6FAkjlMVibjf9jtCNkZz32Dka7ZX4k2G9VjPr96CqvvIqpmeUr/7/Vw4WFfy4tT5+
         vSQoqj7HZEFg1SuurWeWNELkCyd/+X10EGrU4Brrr/8D0SwuhAIplq2amkJRTFP9wJCT
         TARQ==
X-Gm-Message-State: AFqh2krT8WnCsSmjHT++mIzmEfYBI5q5OJFQqhILLKIdJXsf60MA07oB
        yJVdsNhHi/+eslIadMpi1xE=
X-Google-Smtp-Source: AMrXdXsyq7toRa5W56MK7Pcofn3IR3CQf5VXhEAxy8VmJkn5cj7/wgxqMb9W3ZpWOrkfJhSgDBCsmA==
X-Received: by 2002:a17:906:af8f:b0:7c1:5098:9074 with SMTP id mj15-20020a170906af8f00b007c150989074mr25993652ejb.0.1674568687780;
        Tue, 24 Jan 2023 05:58:07 -0800 (PST)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id t15-20020a1709066bcf00b00877ff0c2bb0sm237151ejs.166.2023.01.24.05.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 05:58:07 -0800 (PST)
Date:   Tue, 24 Jan 2023 14:58:05 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH V5 1/5] dt-bindings: usb: tegra-xudc: Add dma-coherent
 for Tegra194
Message-ID: <Y8/j7Q1NPPsGjs5P@orome>
References: <20230119104208.28726-1-jonathanh@nvidia.com>
 <20230119104208.28726-2-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="n9EIHA5MKRYXq+mq"
Content-Disposition: inline
In-Reply-To: <20230119104208.28726-2-jonathanh@nvidia.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--n9EIHA5MKRYXq+mq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 19, 2023 at 10:42:04AM +0000, Jon Hunter wrote:
> DMA operations for XUSB device controller are coherent for Tegra194 and
> so update the device-tree binding to add this property.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> V5: Dropped fixes tag
> V4: This is new in this version
>=20
>  .../devicetree/bindings/usb/nvidia,tegra-xudc.yaml   | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--n9EIHA5MKRYXq+mq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmPP4+0ACgkQ3SOs138+
s6FQhA//Z8xJ8POz2V/1ENyhFPZ5ezbUKTPd0c//NQJKL8ZyBoxgtwAUXvsyMsSw
ooKN0DfsODsNLJNW4YApMDCI6a7VT/e49kNGZhHMWEXDv8RKjNY7sPVj+wGcy06P
KOHmaGKf2+AIVbuVu5cyPXidIjWYsTRbgK+zLLQL50B0ZrNFs7UQTBr5jQXAjo6v
cjpnCU8wwQibXuDiSz5Hrml4hVnYC/or4HDU5jRWOCo0LSISFrwatxNjrUwoxf4V
MPfqSCtB58rfeC65IQG+EbZjlAwgrtXG62dwRxaYGujwg7j0enaTROAhnVOgZ3Vr
CN8JkgM596AG2sgsPD6MniZrADucitTutUiRcrS8Uqu7gJmRcbweTSl61AENlIST
uj3GcyPR0dXBwdP+AORbxe8VBbbM2JJPQ26EAnnySkrVJELzhn4dkF8H09JRWDfT
3g0F5bXdU1JwHhVMexKiLZGilIbrHitzrjGfr4IlzWo0ySdK0iip2KtFSNu1L1FE
9w/wBWKRKPNR5KFC9TYhMkNTs+pk/+zzungs/hZhsVJvDVJqXjuxlpJBsUcZ8jXF
aq1C0baSCaEj87hN4uaCV6YSMgM2nHbi/VzO9fGIL2YBG1wRk71s8g9vll/qUrqG
Bqj2q69R4S4p9k2wCIRPV+uCR34exbkPWBGvbNXKitucrWbZNZk=
=gsd+
-----END PGP SIGNATURE-----

--n9EIHA5MKRYXq+mq--
