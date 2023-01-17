Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 647EBC678DA
	for <linux-tegra@archiver.kernel.org>; Tue, 17 Jan 2023 13:21:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237075AbjAQNU6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 17 Jan 2023 08:20:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237062AbjAQNU5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 17 Jan 2023 08:20:57 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B048D39B96;
        Tue, 17 Jan 2023 05:20:55 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id v10so43809136edi.8;
        Tue, 17 Jan 2023 05:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gAENUVi4hhqvr1Q4evBoJVIdY6Hm7+5BmFRw2zMQP3E=;
        b=lFCutm1+3XZlFSKBub+eKQ6GZK2WVaZXlDPfgogV3UltlZYGCKmrEWjx9CKuBamN2P
         6NMhyLip/09+ysj7VHQ1qxVybSVi2erPX2QfA6msuWn0fXANMpmrgJ+CiC6FAcjx2R0F
         ZZG+K9Ocacne5RqSFNqgGwCYL5xA35tiWlCqYrIm1HrePGl1awCC6RgM0BIO4IpTswO7
         mrQP8Ywo+7NLn7c75JQfMhyCOKQq5SvmLohNMWS+XJYLffoM/xpFyOyIVcEjt8qCpK/z
         dnNq+94TRF294EQ5USVL8qTqXp19QW/lOC1uFPysXNWOTQbjnAzToFrgDMUtPj/4Tdc/
         n5uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gAENUVi4hhqvr1Q4evBoJVIdY6Hm7+5BmFRw2zMQP3E=;
        b=NmVFxiCeCiUBUlhayYK+bOhho1B0uwgyi1/HZ4UrlDJHwC2fqNBrGGjeqyUiDBfi7i
         G4N9vWuacuU3upPRKC7QUXHPnsoDpunkFrOf39uHmAwaAZCWyKR7rPHciyGlNN0EVusL
         7N7D3cuJXq2txj6fCzjBUFDerh3lROiSnyCfQ9wMqizvk1h0KtzVz1z0260uUOlP/+FC
         ZCC0QSZtq6u2cnI8nfVA7XN3ShNnLvzLe76CuXAJJn3GIVKhueOBaYZ3h8T7N/vjDkeN
         SOvnxq1CSLj6EG619BI2RAupz5Z7Hf8ggYVpJJtbcP53dWuw7GNryBaREv88bZWDFAYr
         L/rg==
X-Gm-Message-State: AFqh2koWXKaKyBESBxbvyAk2mPRe0LQW2SrfrLpzG9vsKmhJVJvAkLVZ
        w+QHdw0GD+FLRQchFbrHeNo=
X-Google-Smtp-Source: AMrXdXtQXvor5PlCUzsmPWyNvzJ1vB0kNUSsCYvtw03M0cG5pZjRA35SwZ7Nj8g2AZQi1hcivGI/hQ==
X-Received: by 2002:a05:6402:e01:b0:49b:65cc:faa6 with SMTP id h1-20020a0564020e0100b0049b65ccfaa6mr3604962edh.16.1673961654011;
        Tue, 17 Jan 2023 05:20:54 -0800 (PST)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ed6-20020a056402294600b00499e5659988sm7471427edb.68.2023.01.17.05.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 05:20:53 -0800 (PST)
Date:   Tue, 17 Jan 2023 14:20:51 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH V2 1/2] arm64: tegra: Populate address/size cells for
 Tegra234 I2C
Message-ID: <Y8ags26lApi2xINF@orome>
References: <20230116120626.55942-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7djJaBeADaPdS+tF"
Content-Disposition: inline
In-Reply-To: <20230116120626.55942-1-jonathanh@nvidia.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--7djJaBeADaPdS+tF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 16, 2023 at 12:06:25PM +0000, Jon Hunter wrote:
> Populate the address and size cells properties for the I2C devices on
> Tegra234.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> Changes V1->V2: Added address/size cells for i2c@c240000
>=20
>  arch/arm64/boot/dts/nvidia/tegra234.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Both patches applied, though I had to reshuffle some of the regulators.
They should always be listed after the nodes with unit-addresses.

Thanks,
Thierry

--7djJaBeADaPdS+tF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmPGoLEACgkQ3SOs138+
s6E+jA//dTqWoyJNJouBPI05hn4hSrhaCBe2Tr67FdKpax86R3/NTrvnpFqC9t/W
IUfnjHUSYpIlMLbIVN326RB8EF2f3m+muwy+P6ZSe142os9q1CtS7qt1MsKRTtma
BbamcWGZ8T/J1dv/xfjCNmTpVIuGJI1JMBhVowY7L4AgiX48EYijEhZ4tijtZeNh
QMUBYSsdFjGeqWsEiCayz4oNmIwSxNwUfVI55UqjOsXpm6kWYBMfsZFmg5cuL07e
DDv5p9Aof94XF8Y/RDSGk+MDPOYTwQbYD9ph4sD2ImtcSIEKegakB3LvgKogkWUc
zHcMVg5ez+tn+6TaSvUDPSbZ5ZN8ToXTB7LwOJcKPmjshbFtcBaYE8owFKpT/q/n
j4/IH1z0PYfvbIlB5N6wT887emKreU52Pu6NVizxwJ7RleQ8fx0MkRc/B2C+/Qg7
Fx9elxewiKp7aXftO9ic37H2Ma0I4Iee37arau6BH44JZJB765hQ1Td32Okh8yG/
f7+cE7oqI/ehwg9nR8MGmcI2i9UCpq2jipI74gN9I/sYkbbnF2AjeYNVGi6PRSQl
bC15FtGt95TCDNMkqEf3/BsHOvhknudOooS7ZDaFock9O2jOzeANFO5dLt760ipY
3/N55iwm0tbDEGa0NDDg6QnvRVd84gLbhTTvEiywVnhkl9xlp3k=
=r0S9
-----END PGP SIGNATURE-----

--7djJaBeADaPdS+tF--
