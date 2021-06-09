Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 260D5C48BCF
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Jun 2021 16:58:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F420613C7
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Jun 2021 16:58:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231151AbhFIRAU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 9 Jun 2021 13:00:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbhFIRAS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 9 Jun 2021 13:00:18 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9ADFC06175F;
        Wed,  9 Jun 2021 09:58:21 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id t4-20020a1c77040000b029019d22d84ebdso4740481wmi.3;
        Wed, 09 Jun 2021 09:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LPZcUYkPSO1G9Scw6wuN7k1L83/gjShJz45DKE2h3Vw=;
        b=fq1E5Yg6kO//k62W+a0n72IjuxqjxyWo0DKahVV/OY5GxnCjOkZa1RQ6DViBqQJ2w4
         qoFaz+K1H/0zMidI+4MsQM4h1PltmefZAJIomoZL324PEdo40SSBfZVL2SOR5Y29skic
         Fvr3NHKlbaCZm9p9REFbjR8bgy/eTtBdAnkdcC+Ue4meIeeEYyUdSP42BVyf0oHNHrlD
         M8uemqAbSTJXkxTjatmw5MM9nkLvSVXPyHQ+LaCIpwwBfDXSuWecU7k8p92BlLpnQhjv
         xEQ/5MIT2UhfwML2fKchY3lVa2v2lmZx4QkelCi9Js+4s3cb+77Yb7HQw0KLOQMvKh6g
         VdfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LPZcUYkPSO1G9Scw6wuN7k1L83/gjShJz45DKE2h3Vw=;
        b=Dew1VC6VebYZVSk1zSSA0XwsMdEU3uC9yaM5PTehDoFNbnHs06d3DaTtHtufgbDanh
         +JbXZACmpkcJsnRGoia6we6woXUYdrt5+x1sS4pF07G1P14wcCXfs4OjOj1IabnSD+9x
         7sHXX5SYBozplFt4c33o/aI/4CRUFjaQU4BxGOW/mcBa1TrvvVOsoe2BttSgU8xMOwTN
         K03uT/09CxYYG4NpS1Eg1xc3SnChenmvFFdhceCXcgoNDrVlzvDrHgzC3BmgR3xUeSlu
         px80RzlA1aB4QxXxQi0HoYZaFqX+rpl0x/HZjx80ghkjG24PNnBXEn6HrUqEUfBhyxvB
         OCwA==
X-Gm-Message-State: AOAM532wy6/yIIb85xtm40WLQ76gOtdpW8uuwgAzBucjUrsfhsCqofmT
        emOMiu/M42V3KluMY0IpeoI=
X-Google-Smtp-Source: ABdhPJz4fXParEX2RlRjH8jPzx2kjKUPTrWE9TSE/A2MlXIRozdlBJF/0umNzW0FaATfo8kWiUkt8g==
X-Received: by 2002:a05:600c:4ec8:: with SMTP id g8mr10698766wmq.62.1623257900500;
        Wed, 09 Jun 2021 09:58:20 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id l16sm7083014wmj.47.2021.06.09.09.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 09:58:19 -0700 (PDT)
Date:   Wed, 9 Jun 2021 19:00:03 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] memory: tegra: Add missing dependencies
Message-ID: <YMDzkyjaMhoJjMzL@orome.fritz.box>
References: <20210609112806.3565057-1-thierry.reding@gmail.com>
 <20210609112806.3565057-2-thierry.reding@gmail.com>
 <0c762772-929e-2eb8-6568-4aa82ea2f9ad@gmail.com>
 <ee2846c0-9274-0888-90ac-dac72d2ab5fd@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="L5qRBreJQ3rN4PcD"
Content-Disposition: inline
In-Reply-To: <ee2846c0-9274-0888-90ac-dac72d2ab5fd@canonical.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--L5qRBreJQ3rN4PcD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 09, 2021 at 03:19:12PM +0200, Krzysztof Kozlowski wrote:
> On 09/06/2021 13:58, Dmitry Osipenko wrote:
> > 09.06.2021 14:28, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >> From: Thierry Reding <treding@nvidia.com>
> >>
> >> When enabling the COMPILE_TEST Kconfig option, the Tegra memory
> >> controller can be built without ARCH_TEGRA being selected. However, the
> >> driver implicitly depends on some symbols pulled in via ARCH_TEGRA,
> >> which causes the build to break.
> >>
> >> Add explicit dependencies for OF_EARLY_FLATTREE and OF_RESERVED_MEM to
> >> the Tegra MC Kconfig option to make sure they are selected even if
> >> ARCH_TEGRA is not.
> >>
> >> Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> >> Signed-off-by: Thierry Reding <treding@nvidia.com>
> >> ---
> >>  drivers/memory/tegra/Kconfig | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kconf=
ig
> >> index f9bae36c03a3..ecfb071fc4f4 100644
> >> --- a/drivers/memory/tegra/Kconfig
> >> +++ b/drivers/memory/tegra/Kconfig
> >> @@ -48,6 +48,8 @@ config TEGRA124_EMC
> >>  config TEGRA210_EMC_TABLE
> >>  	bool
> >>  	depends on ARCH_TEGRA_210_SOC || COMPILE_TEST
> >> +	select OF_EARLY_FLATTREE
> >> +	select OF_RESERVED_MEM
> >> =20
> >>  config TEGRA210_EMC
> >>  	tristate "NVIDIA Tegra210 External Memory Controller driver"
> >>
> >=20
> > Will this work if CONFIG_OF is disabled?
>=20
> Yeah, good question. That's why I propose "depends on". No issues with
> unmet or circular dependencies.

I couldn't find a way to make this work with "depends on" because
OF_RESERVED_MEM is not user-visible and the only way to get it enabled
is if something also selects OF_EARLY_FLATTREE, which is only ever done
at the architecture Kconfig level (and for OF unit testing).

So switching this to a "depends on" causes the TEGRA210_EMC never to get
enabled.

However, with OF disabled, the above causes issues because it can lead
to unmet direct dependencies. That, in turn, can be fixed by appending
&& OF to the COMPILE_TEST branch, which seems like a good enough
compromise.

Here's what I have on top of the above patch and that seems to do the
trick.

--- >8 ---
diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kconfig
index ecfb071fc4f4..1c553895160c 100644
--- a/drivers/memory/tegra/Kconfig
+++ b/drivers/memory/tegra/Kconfig
@@ -47,13 +47,13 @@ config TEGRA124_EMC
=20
 config TEGRA210_EMC_TABLE
 	bool
-	depends on ARCH_TEGRA_210_SOC || COMPILE_TEST
+	depends on ARCH_TEGRA_210_SOC || (COMPILE_TEST && OF)
 	select OF_EARLY_FLATTREE
 	select OF_RESERVED_MEM
=20
 config TEGRA210_EMC
 	tristate "NVIDIA Tegra210 External Memory Controller driver"
-	depends on ARCH_TEGRA_210_SOC || COMPILE_TEST
+	depends on ARCH_TEGRA_210_SOC || (COMPILE_TEST && OF)
 	select TEGRA210_EMC_TABLE
 	help
 	  This driver is for the External Memory Controller (EMC) found on
--- >8 ---

So in a nutshell this will only get compile-tested if OF is enabled, but
then it will select OF_RESERVED_MEM and OF_EARLY_FLATTREE to get the
required symbols.

Thierry

--L5qRBreJQ3rN4PcD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmDA85EACgkQ3SOs138+
s6FXohAAvr/Os9xEEF1T2Sg8TGkz+SsYcoexhDi4owZ5aKwIz/reoQ4D2njF2vcp
NQgReb2ktNChl2jU7fVtJQ6nf8XyRJBQq77G45LZ/QNNi8S7WLJzKM72M1x6Ph7b
7wVDfsO2zHCRiDErSDAxNMgoP4GXnT6JInkLtnIKuvKSdj0jx6qopjtmWEqq+QNh
YX7jtvbJK+04aCcalWZ4upBptHpfXZbntddNgvn/Z35ZzdKsSMxv4pHoV+nDWpa1
wSyFuhy503wwzcnEYZTtffdxtJnb1oY4D89LCB7Q24nrm3Bz1EBx7iAn2IL+P+5f
R2q8doh/YFbEiZ4IQ4RDUqzJKEja1TlhVycFcWyjKoYz0Kx9qBos8U8PYwtqWQpf
SwUtQvWyPj9Jyb7Mu7REmvLoccoR7vV+uTwvV6KMlaN1II+NOeys8bdfXt1p2OmG
wZ4Rr4dy/9Ybj1uRGb4QZGYAJxNQK9aeV8Ie/ANW01J5R4tCCzuDXXdBr6h2Ad8c
i0FHJvaPnUtM5KzBnBP02RXthgYoxejxOEx5vA525VWcKBSTZ55l0K70aWizZUcF
DtyVjxNkQmc6mpRNYDXw2GrghHMqq/TELoVlSjXnNr+GY8L2oNwJDG7LQ1Z2agJD
J1szpCPXL9arb3hd4Nuxs/dN0UHWNeWMn5L7uAgy+lBGh6JrmCM=
=dvBq
-----END PGP SIGNATURE-----

--L5qRBreJQ3rN4PcD--
