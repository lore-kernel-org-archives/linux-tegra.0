Return-Path: <SRS0=kAmo=DM=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F04EC4363A
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 15:47:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0694E20663
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 15:47:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hbc5KDiN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727056AbgJEPrs (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Oct 2020 11:47:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726057AbgJEPrr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Oct 2020 11:47:47 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7E6FC0613CE;
        Mon,  5 Oct 2020 08:47:45 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id h24so6112051ejg.9;
        Mon, 05 Oct 2020 08:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=uVzdx4iW64L/8P8eovtAWrQeLX5Ntc+hO2LaVKxCA1w=;
        b=hbc5KDiN4sN5G4Gg2xtDlkggQYAeyH3Her6sik0q4Ic4/9XpzvHG7poli0zqObN2ay
         um/mWzmsEXqD62RgeMKBN+9qFe8+gV0ydnGqHcDNVrHVbzjBaQu6svIS9T9w8ox3fBpv
         mWGkXnMwtaXxHTKdYdJHsRFNnfZEzwoPiylodW8xFjUfgVzi/hmbIm3rK3GG2PMLhVSs
         R/sazrclt3+XF5UyKvZn4+oNdlNMfh1OnQgHHdu6bjo0IV9hGWhAHmjzkgnCHJ8tHvrs
         cbJB47VF+4I3qYLWQF3bp6XMaGnLnaVHaGOkzmvzppyiqqunT3w7sKtQiNmugGZkw0bP
         dPIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uVzdx4iW64L/8P8eovtAWrQeLX5Ntc+hO2LaVKxCA1w=;
        b=p0Lp+Eu+/fE7MxiN6h//p380Lt5fXqgoFXu6bx0oIC0stlzVTLmR8ROLt3pPEK18QT
         DKqup1haTCH/7CxaIp3c4FoBUpJW4fg4RAjWJeAOxgyGVRqduXGO01LMAFKqYRfD1ltu
         GceioyXB0Gxc8hZLj/omd5v47NkjvRfdE+Aeiq3WO+6xmIJxJCasbRLjSD8hLzxKjhWA
         63O6iEbs3DMZHxJosjCzjWRv0lDhuIgZIze+wkwyAZDk644eVjTpZZOdYncEPBKCph/3
         +TBPifbD5RQHKk4t7fEgknzaxdcAjEY83Uzxz2bX1yBruLuDUgAgOWz3zz6wzm+ARt9G
         5ZhA==
X-Gm-Message-State: AOAM530DSoy4R47kOHX4n13Xh51Mi/hZXMvawBZINBHJPm0cSkSK/X9N
        2KHn/eLgrO/YZg80PK4bMl4=
X-Google-Smtp-Source: ABdhPJxJ2YMuyZGMQSK47z00GJx06vbge++4EgwuyMPmupiJuuZvE0wwM+WhtQhaRuD0C8xDOiI4Hg==
X-Received: by 2002:a17:906:5247:: with SMTP id y7mr292007ejm.503.1601912864439;
        Mon, 05 Oct 2020 08:47:44 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id c8sm42753ejp.30.2020.10.05.08.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 08:47:43 -0700 (PDT)
Date:   Mon, 5 Oct 2020 17:47:42 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Peter Geis <pgwipeout@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Stephen Warren <swarren@wwwdotorg.org>,
        Bob Ham <rah@settrans.net>,
        Leonardo Bras <leobras.c@gmail.com>,
        Michael Brougham <jusplainmike@gmail.com>,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] Support NVIDIA Tegra-based Ouya game console
Message-ID: <20201005154742.GC628746@ulmo>
References: <20201004133114.845230-1-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="E/DnYTRukya0zdZ1"
Content-Disposition: inline
In-Reply-To: <20201004133114.845230-1-pgwipeout@gmail.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--E/DnYTRukya0zdZ1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 04, 2020 at 01:31:11PM +0000, Peter Geis wrote:
> Good Day,
>=20
> This series introduces upstream kernel support for the Ouya game console =
device. Please review and apply. Thank you in advance.
>=20
> Changelog:
> v3: - Reorder aliases per Dmitry Osipenko's review.
>     - Add sdio clocks per Dmitry Osipenko's review.
>     - Add missing ti sleep bits per Dmitry Osipenko's review.
>     - Enable lp1 sleep mode.
>     - Fix bluetooth comment and add missing power supplies.
>=20
> v2: - Update pmic and clock handles per Rob Herring's review.
>     - Add acks from Rob Herring to patch 2 and 3.
>=20
> Peter Geis (3):
>   ARM: tegra: Add device-tree for Ouya
>   dt-bindings: Add vendor prefix for Ouya Inc.
>   dt-bindings: ARM: tegra: Add Ouya game console
>=20
>  .../devicetree/bindings/arm/tegra.yaml        |    3 +
>  .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
>  arch/arm/boot/dts/Makefile                    |    3 +-
>  arch/arm/boot/dts/tegra30-ouya.dts            | 4511 +++++++++++++++++
>  4 files changed, 4518 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/tegra30-ouya.dts

This looks good to me and I see that Dmitry is happy with it. I'll make
a mental note to apply it after the merge window closes.

Thanks,
Thierry

--E/DnYTRukya0zdZ1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl97QB0ACgkQ3SOs138+
s6EFEw/+K4KzjvNDPMR+5dTRN9MEJ4KjDsLvb06WkHnrDB6sopAoMMgGW8g/Jdf7
TJZlUz0HcYnuAdwfETulI1PL5R2InsZL+cIyKy0o/naiUw6Y94SJhV/cufh2KkKK
aUXsFJw/9OR6f7l/olzXYvRTmh2+Qv9xlo7RJdMZnqSYcp/ZfRYw+530f/20VySS
06ib8XLpwLyeVWOlUv3+8CGg8YHaPAaXNlCpEkLULLd8ZYDCnJfRlVsN8G1bJxOY
qxaZkKSReTggvajwvi6P/pAPtiGRaOJfGjVlGiPSzoIvgSBFQnsEZkolydg0FzqA
1QOvPhjdW9HbiBtUGpEtFCiZySMBq/V/sEmKIreeZnlLkNSUTTirydJDOo8NsvNb
6BDAIfO2REUEJ8gmk2VvplBg18VVr3muzuKYRFDFpIgSB8dILjjCL4+LrtslsEKQ
UBuPceLCTTkwl6+ntzIV4ODtJfx2qRFTSVDZpRmemK1GdC6K+rIaQJqDViN/Vvyd
6ooJ+KcxbhkBYcE1QGhiImwovoz8APsOJqq4SPE4pJdK61UPkAzGf2Vemszs+8pk
wJikQzHqDn0JJPZO7xR6Vcp5fHeMTFqz1YtoFXh2lZmo0LsbwJ7TN70804YIF9Ax
3VWwoFmTiJ21y39PxCZxEczrBap8jsPbT7EViYD5tMz8sKhfuJc=
=cAxQ
-----END PGP SIGNATURE-----

--E/DnYTRukya0zdZ1--
