Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD054C48BD1
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Jun 2021 10:59:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA11561287
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Jun 2021 10:59:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229969AbhFKLB1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 11 Jun 2021 07:01:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231388AbhFKLA5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 11 Jun 2021 07:00:57 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D20BC0617AF;
        Fri, 11 Jun 2021 03:58:41 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id l2so5602154wrw.6;
        Fri, 11 Jun 2021 03:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sHlXs/4AyKqoaFt3FlQwbKcplTb0p0q5KbnQ6QD748Y=;
        b=UNePa+LGPO/qu2rxwuG+FplDO8SjhAQKaGQFp8ptREA05j2gfjDS1w3rgHbwx1lN/m
         7oZQTNmvksu5uM4gMzrmtYxH5d6pAjRCgswlYMwPYaShdHu56JAK7DD1fzAtoZGS8P7K
         m1OxNx/V7dJQpzRla9qeeXqQqimF33QFT7ZLK1vwx9QDeBzoIiCqo1YP+2BSqQc4ZTQs
         Bt1SvHT/fyFQT7m8kZ0/lXNZePC9dbSfQ5cpbsnlDN13QojUKA6tj5Th1VpDh7CbKNC6
         ta3HUblaOLDxdEF4v+HX9sfsdZ4GDwQhXiw2I5VtAJtofuwW2cWYDsmGWNUT2LRSxs4B
         LY8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sHlXs/4AyKqoaFt3FlQwbKcplTb0p0q5KbnQ6QD748Y=;
        b=m4QgVWZtEQuIuRd0W7egn3DFRPm5b8cYZgyDTOAzwvei4CxkOwBUIjSeqzCgoR01cD
         kxB6L0lBN9aJ1h7uGJogdVa+vbg1lDrYln/sgNGM9rpWcBd1GFuoo0OywVFd/jPuUxPy
         T8YiHyMKdiJISvEm9AGGY3z0xCQo8T+m79iEiiYrVhf6LMSWCBOzcUU6rjfOenWqJMHj
         I0u9Lh8BvE3t5VP9JXMl/lJ4QQkrYaWgnsvXoErrr+JQ7Vd6dGmwPTl0fJdLInGYmpgv
         3xSijdB/GdJv1mOJuEvgecD0mUw9xuoeXMS4p/CPf98W5r8uCNrbqLkc6NE7HXM+If6/
         i1Kw==
X-Gm-Message-State: AOAM531ViqWZ00buIbjq0LxQPrvsYnFIQEZXvNX+YOIjRlfZIBZR/mc0
        1sYrUtrcpcmPouigoC+nD/c=
X-Google-Smtp-Source: ABdhPJyWcljzY01pf/Yv0vuW+Np+ixRm30T4eKTiemPFR4ffbw1kdU3OAI1vgB1O8VjiQ4JqM/yl4g==
X-Received: by 2002:a5d:618f:: with SMTP id j15mr3451243wru.348.1623409119959;
        Fri, 11 Jun 2021 03:58:39 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id f5sm7446206wrf.22.2021.06.11.03.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 03:58:39 -0700 (PDT)
Date:   Fri, 11 Jun 2021 13:00:14 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 1/2] memory: tegra: Add missing dependencies
Message-ID: <YMNCPhHx+s4W7BP3@orome.fritz.box>
References: <20210609112806.3565057-1-thierry.reding@gmail.com>
 <20210609112806.3565057-2-thierry.reding@gmail.com>
 <0c762772-929e-2eb8-6568-4aa82ea2f9ad@gmail.com>
 <ee2846c0-9274-0888-90ac-dac72d2ab5fd@canonical.com>
 <a3110fbd-c4af-0317-5a6d-1f780f1dac91@gmail.com>
 <1400979c-c7a7-9618-1168-70185ed10546@canonical.com>
 <8d8d019a-34c1-50bd-5eba-ce361c263d35@gmail.com>
 <57f8e55d-d708-f304-cf35-3036ec2e64f5@gmail.com>
 <99f98088-fed4-45bf-b0a1-241bfc896487@canonical.com>
 <f5112945-1b07-8760-4180-4d7152b7dcba@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vZYIGLNQbIe9Yg1e"
Content-Disposition: inline
In-Reply-To: <f5112945-1b07-8760-4180-4d7152b7dcba@gmail.com>
User-Agent: Mutt/2.0.7 (481f3800) (2021-05-04)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--vZYIGLNQbIe9Yg1e
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 11, 2021 at 10:21:41AM +0300, Dmitry Osipenko wrote:
> 11.06.2021 09:50, Krzysztof Kozlowski =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On 10/06/2021 18:23, Dmitry Osipenko wrote:
> >> 10.06.2021 18:50, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> 10.06.2021 09:43, Krzysztof Kozlowski =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>>> The stubs might be good idea anyway, but the driver explicitly needs=
 for
> >>>> runtime working reservedmem, so it should select it.
> >>>
> >>> The OF and reservedmem are both selected by the ARCH for the runtime
> >>> use. They may not be selected in the case of compile-testing.
> >>>
> >>> Both OF core and reservedmem provide stubs needed for compile-testing,
> >>> it's only the RESERVEDMEM_OF_DECLARE() that is missing the stub. Addi=
ng
> >>> the missing stub should be a more appropriate solution than adding ex=
tra
> >>> Kconfig dependencies, IMO.
> >=20
> > Ah, in such case everything looks good. Stubs is indeed proper choice.
>=20
> Although, I see that there are only two Kconfigs that have
> OF_RESERVED_MEM, one defines the OF_RESERVED_MEM, the other is QCOM
> Kconfig which depends on OF_RESERVED_MEM. The OF_RESERVED_MEM is enabled
> by default in defconfig.
>=20
> You're right, we need the Kconfig change to be entirely correct, since
> driver won't work properly without OF_RESERVED_MEM.
>=20
> config TEGRA210_EMC
> 	tristate "NVIDIA Tegra210 External Memory Controller driver"
> -	depends on ARCH_TEGRA_210_SOC || COMPILE_TEST
> +	depends on (ARCH_TEGRA_210_SOC && OF_RESERVED_MEM) || COMPILE_TEST
>=20
> I will send that change later today.

That's completely unnecessary. OF_RESERVED_MEM is enabled by default if
OF_EARLY_FLATTREE is enabled, which it is for ARM64 and that is always
enabled for ARCH_TEGRA_210_SOC.

What Krzysztof had originally proposed, as far as I understand, is to
add "depends on OF_RESERVED_MEM" so that the dependency is always there
(including the COMPILE_TEST case). However, that's a bit problematic, as
I said earlier, because OF_RESERVED_MEM is not user-visible and neither
is OF_EARLY_FLATTREE, so there's no way to enable OF_RESERVED_MEM unless
the architecture selected it, which it doesn't on x86, so it kind of
defeats the purpose of COMPILE_TEST.

So I think if this really has to be compile-test enabled, the only way
to do that is to either make this select OF_EARLY_FLATTREE, or add the
stubs.

Another option would perhaps be to enable OF_UNITTEST along with
COMPILE_TEST, since that also pulls in OF_EARLY_FLATTREE and would allow
this driver to be built even on x86.

Thierry

--vZYIGLNQbIe9Yg1e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmDDQjwACgkQ3SOs138+
s6E+LA//fQQwkqN9XDGLiugVFwOV58OdpLrGPxg1iXmjBJmbp55XJz4nnqMxSvi2
4/yGkqNDpMPGsZRx9gJU3SyNhPrf38BWiHfEXw01NmjqtrDtCNiFxgstNZ2YzLY3
Sewb5WuM8A1WocFhpS6eRQcsEaO4xRfWuzjltMD+mChWlghY2kKYnDGKACkRldJc
dG41AhawvXoGKuo2aKX9GZfTknMrOIJCVsahWjigYEyU2z6OWtV1d6hhUWVO6mb7
mRK9HDf4cl4w3KWezn2xxcJP3ReatMGOjTRihrWVih8R9DmwqEVulwoE/zd6BtrK
CzMfsdAFBQwakRPdcXaXZthfHyA1q+CBHSAQd558u5aQfyX4726D6+DcDo5yo4IM
E8TS03UihWeC6FUcAwEF7BIARf7T/PcCs5A0Xq4iZduNh0YRTUMDWXFV5KFT3aaL
cMkFvzox4nBUUxQM4W2Wh6m+6CDVkJMj18YBY0nJf2RdhjCzXp0xVWMt8SjpBQVp
y7/U2nGrOwcXH0Ih0zXGSBZqaCe+Qm/4+8BMs/afGuK8y1IA8KKdM1OoinOpWVyJ
t9pczoD3aK7a7g5Wd6i4wzsZJZp0SWkcVa4LqOz6cACz/FN3uMziS08WUZmiZdVR
ussnNFyYBo9lITocWgYvOqx5jWgTmHZlc0e8t6G3v+DEvm6nUpE=
=CPro
-----END PGP SIGNATURE-----

--vZYIGLNQbIe9Yg1e--
