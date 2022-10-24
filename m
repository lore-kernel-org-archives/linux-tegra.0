Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCC58ECAAA1
	for <linux-tegra@archiver.kernel.org>; Mon, 24 Oct 2022 16:10:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233157AbiJXQKg (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 24 Oct 2022 12:10:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234512AbiJXQKA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 24 Oct 2022 12:10:00 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 924FC12D81E;
        Mon, 24 Oct 2022 08:01:00 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id g1so17129637lfu.12;
        Mon, 24 Oct 2022 08:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QH9vrydljtEsiSqewc9jX+ikxJzGf74SotLD+fTFu9M=;
        b=KDPq7hA632tVDeQJttw4msDSupu/4Ak/334/Eg1JfXXOLEiLL+SgzmEsQeB4iOOMQa
         LoMuAgYcEq5WQh4rZb5k89xvJeXj1Yb4oGxEiUIDjuG4ZLCVFyMZbG0LQ9OW2vVaSfXF
         o/st02//QdLK99U5XODLlLkkuMHy2BWYYdXGJ+cgmJ6NvjZ5UTNKCYxxRqsA3lqm82jE
         9uB7+lSmhjG28E7+hL0JiL27TlPdatgznIBeT/E+CQJ6NQ+/jzb41N8CzjfZcgMrm9ac
         YncESVwM3P3p5on3MH2s4wVA5syLQUEAaoOJiLCXa0a6oV5n+OZn8qHLVwB/bXH5G3gM
         7V9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QH9vrydljtEsiSqewc9jX+ikxJzGf74SotLD+fTFu9M=;
        b=LLOMw0a//ni7Ey7xtJ3nRcIB3QAb/0dUZ9FLlctvIfS7APnh1CCEN1ZoSqMyj2DdB8
         GERiESKQey64GVnU/a5/T+kOgnXoqxz/i9lGQYl0rVzs19VrRAaF7mAEYP9W/Mf0syaM
         urkUpdjGTsxh8C8OnpGx7YKcmHr3lR6ivJE3k6sKwiZcEOJv3yVG3AtL2UOdl9lYpSoe
         CY3DkZp2xecuuiQfo+OqxqJFYvNvH+AEzPTVLZbf3kE8fKa3BFcyudEDuZchiARRwl1L
         vBb+YbHDwF6A8+9xjWy9jUG7kLt7tqWoKOO9iSo0yOc36lQ2Gfkfprq+gue40v1vfYdT
         /Mvw==
X-Gm-Message-State: ACrzQf1gIfO0ybMrzBT++vsWNenQz/BjuSgxr33lB9JM0+K6+IQovubd
        EiVBdp/3/vUdyahvqIRF+YyVKU8cZXI=
X-Google-Smtp-Source: AMsMyM6+ihYseLhuPetxOgACMdrw4+6PTt13a0SzWG33ZIwnX30iiXRIb2P3zSrrf4JuuvZ40isgbQ==
X-Received: by 2002:a17:907:86a0:b0:78d:df8b:4d17 with SMTP id qa32-20020a17090786a000b0078ddf8b4d17mr27483640ejc.254.1666618263850;
        Mon, 24 Oct 2022 06:31:03 -0700 (PDT)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id bs15-20020a170906d1cf00b0077958ddaec6sm15311943ejb.186.2022.10.24.06.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 06:31:03 -0700 (PDT)
Date:   Mon, 24 Oct 2022 15:31:01 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: tegra: Update headers for Tegra234
Message-ID: <Y1aTleJZSsvrzen+@orome>
References: <20221003125141.123759-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="y4vL6YN2AIRy9JqK"
Content-Disposition: inline
In-Reply-To: <20221003125141.123759-1-jonathanh@nvidia.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--y4vL6YN2AIRy9JqK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 03, 2022 at 01:51:41PM +0100, Jon Hunter wrote:
> Update the device-tree clock, memory, power and reset headers for
> Tegra234 by adding the definitions for all the various devices.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  include/dt-bindings/clock/tegra234-clock.h    | 639 +++++++++++++++++-
>  include/dt-bindings/memory/tegra234-mc.h      | 440 +++++++++++-
>  .../dt-bindings/power/tegra234-powergate.h    |  15 +
>  include/dt-bindings/reset/tegra234-reset.h    | 111 ++-
>  4 files changed, 1175 insertions(+), 30 deletions(-)

Applied, thanks.

Thierry

--y4vL6YN2AIRy9JqK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmNWk5MACgkQ3SOs138+
s6H6ug/+IkbKRcLux46oSmLbYD6AcIFgK10ORKNfKd7HCd5bZRL1u1sn+ZkhJkBo
xsmZtQfyMu1NfoLRfLXEJR8GAYd/UZerrPfVODtTvH81HPcaqkeA2tdQL2ZmSGv6
OxhD+PdyAfybB0htrtzXepcTUGmDorJRF8yeyEXlUL7kQiE5cfEfZoEySPy5UCfN
IIeZMk7JerKL/Db8S2Uxhbu8O3zYTQ227K9kVlj/rC0v7wXa22xZTBV2SUKxw0Hq
KRXlwyYpWjktW3RK9dhc04sp2JBLYIIvKwZsmIQYV/q6udqbTWBT/z+S2qDjhkTK
ztfPv+WHw5g735bR1guzpuPRIfP5Z2e6fdKTgNPn3M4TmbD9jI2PBNblcn4Gogal
cvk1qvODtUCNOho+Pv/3G9hdU1gx/CwzK2FzfnlZYmcD4OZeL+DXHld+d2XAdfpO
tjr4LswmqruKaFh7LTRHgj7up9hMZGP+g6lgpWRzZLiESNZpAXXEsLcATqb8EHKP
VThKadJex2sGD6JhAHBx6ulWKv9SUcKeu05olqoo7QEYp7Sfn/Ct/PiGxZ1v4Gpf
4Qib/f620Z/qgUVpUHDhPFQqzfp7/KgGxm4tzC1FHsArKvhCpEfkzPqBrwdXg6aL
iS1/FQyoFso8dpSAhfPwwuDfF2NkVUETOjzjQazmOk0ItlB9ojc=
=riAe
-----END PGP SIGNATURE-----

--y4vL6YN2AIRy9JqK--
