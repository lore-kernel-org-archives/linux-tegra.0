Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34393C07E94
	for <linux-tegra@archiver.kernel.org>; Fri,  4 Jun 2021 09:31:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1D88361405
	for <linux-tegra@archiver.kernel.org>; Fri,  4 Jun 2021 09:31:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229989AbhFDJdR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 4 Jun 2021 05:33:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229936AbhFDJdR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 4 Jun 2021 05:33:17 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A5B7C06174A;
        Fri,  4 Jun 2021 02:31:15 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id og14so8186197ejc.5;
        Fri, 04 Jun 2021 02:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZK4LmCaIr7Xqlx+SG8IZ/uyEL38xEcwwM37gY4NSJCo=;
        b=q9kPD28pLGgsGN47c05VINNSAe1yGjXNs2SDwUSJiO9jBVxAFcP0pa039Ujij+JBP4
         9/xiuiOe9Vuok8HN2dI//McMggIFrlMIABldMtUsQoU7iE9LBPUzZHTGsl323LpavS/K
         ZFmZ8UnLZ7gxAUII4HDQ42mEzfrXLlj4kJul62eeQND+Hge9JAoWUMGz0uxT+yzH6ATB
         5z+083+AeWcRkyechWGO66z77vU//EAcLvA83TLpCdyRUgRCyqnmgubDe1OI33pvvOKs
         H0xViJp1WEtA5RvzUtMHA0UkrtMfMqJ2zQLzHkpgg7gnUWQmTrjT/hjQ/cgeKBLZinJR
         me5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZK4LmCaIr7Xqlx+SG8IZ/uyEL38xEcwwM37gY4NSJCo=;
        b=sk3uX9S2DlJOaE7wXDmM9ZB4AXfYTr7uzHk7X9yKoUiLFLaKLu/jKa3rHv2w5PrJB4
         qY/WNoFzKjOgLsRjRIra/+zyW3DxeaiBAC9XF1bH+dtrqco6IkYQldp8wMp96f/3l2eZ
         1aQ/p4PEBLKoeXnPPv0Niz236HVtnFgLrXRhTgGPCbakCY6xdRes4VPxn947Z261Na28
         WwcdsLmb76l2/rZXL+qhxrZqv7kMcizWR97KDYjmd/3fLRu0AyKt7VVPZvrctlUtahI+
         FKDhnABGQ+bKHKsCEbNVcW6EflS1PJ6J7GIGSPmS7ySCrQ9KKrt2hpplF2SI6z9vpHjt
         ZryA==
X-Gm-Message-State: AOAM531RmG3yfaYDUggQ0HeEGOo7SdXveQOCqhDjXTwyurgIzP5Ye/Cp
        DhA0IpBcJGfZPT5+HWxFBq4=
X-Google-Smtp-Source: ABdhPJx6tzcFNdI2XXYOjJkGwkaxn/9xQbynNrggcx3sBOOMzUVueY1oRMxFbnW8Qx0oZGeCBYQeKA==
X-Received: by 2002:a17:906:757:: with SMTP id z23mr3187311ejb.537.1622799073500;
        Fri, 04 Jun 2021 02:31:13 -0700 (PDT)
Received: from localhost (pd9e51d70.dip0.t-ipconnect.de. [217.229.29.112])
        by smtp.gmail.com with ESMTPSA id r21sm2991543edy.78.2021.06.04.02.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 02:31:12 -0700 (PDT)
Date:   Fri, 4 Jun 2021 11:32:50 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PULL] memory: tegra: Changes for v5.14-rc1
Message-ID: <YLnzQk+suAG5clzB@orome.fritz.box>
References: <20210603143739.787957-1-thierry.reding@gmail.com>
 <772bf62a-fb09-cec4-ed4d-ddbfc2832e2b@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="iOQBahxQkN69PIlR"
Content-Disposition: inline
In-Reply-To: <772bf62a-fb09-cec4-ed4d-ddbfc2832e2b@gmail.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--iOQBahxQkN69PIlR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 03, 2021 at 10:56:29PM +0300, Dmitry Osipenko wrote:
> 03.06.2021 17:37, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > memory: tegra: Changes for v5.14-rc1
> >=20
> > This stable tag contains Dmitry's power domain work, including all the
> > necessary dependencies from the regulator, clock and ARM SoC trees.
> >=20
> > ----------------------------------------------------------------
> > Dmitry Osipenko (18):
> >       clk: tegra30: Use 300MHz for video decoder by default
> >       clk: tegra: Fix refcounting of gate clocks
> >       clk: tegra: Ensure that PLLU configuration is applied properly
> >       clk: tegra: Halve SCLK rate on Tegra20
> >       clk: tegra: Don't allow zero clock rate for PLLs
> >       clk: tegra: cclk: Handle thermal DIV2 CPU frequency throttling
> >       clk: tegra: Mark external clocks as not having reset control
> >       clk: tegra: Don't deassert reset on enabling clocks
> >       regulator: core: Add regulator_sync_voltage_rdev()
>=20
> >       soc/tegra: regulators: Bump voltages on system reboot
>=20
> This patch is a build dependency prerequisite for the "soc/tegra:
> regulators: Support core domain state syncing" patch. Will you send a
> new PR to Krzysztof with the remaining soc/tegra patches?

soc/tegra patches usually go in through ARM SoC. This is merely included
here because it was part of the set of patches that were needed to
enable compile testing for the memory controller drivers.

I've applied the remaining soc/tegra patches (12-14 of the series) to my
for-5.14/soc branch but ended up not pulling that part in because it was
unnecessary for the memory controller patches.

Thierry

--iOQBahxQkN69PIlR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmC580AACgkQ3SOs138+
s6ED+w//ejuQWav/05e/dknVFjg0PXu7AtDngrubvVl00S1aEZzv5kVdqQDooaf4
9f3vngq2UlNMbyQTkP3H2tv1ahjA/w35XxJDDEWpaVsPvNR9X9dLTJgFkrRAqmyI
YZw6UsD9FaCgQu24CzNVgrf9kqxZZLbi74+z9AAdTXiR8IFi5dIl27JW+5vEUNMB
I5DlYlVsG5LHil5vCiJYiJxXe1JOH9tWwbg/rse9QzbJQDMiPrudi/htIVtnejVE
80EAYHp3HhZzYhjsKXa4ViCoEGwZ2opa/WDoNVMRkWAIarernXdy1T7c8KvguxgS
IaGhfDporPuptXFvUnt9CcEgorHizm7/kmUs7CEH0utCluWreBjB3SEaTZDraxFW
KhHwuvh3LLlPDSc8u+GmE4MOjCyOkJic+xQdzUMnPgg2Po4Obbfv1hz3ZExY+Qc5
y2z6NVkgZA0RZ8WEqLJV+iQWRudXW4kFlVbDConJiKaF2LixFqYhoV8MiHAfl9zO
Hc4nL960i3LCa+7GAhyuNiAZVpjHjazPyacmHZDN8ICSonICbKE1d8MTcY14ZAnW
d5xJGQLiZVXt1irl00NCFg/HWCDTXli0qSiuUdMzvfeuq8VbGfOywxLTCXUsZw65
xSOz+0PZKxV3tA55CErZMN5BEi4MgrSUA9HCDVeNRDVkoW/Uyko=
=igjZ
-----END PGP SIGNATURE-----

--iOQBahxQkN69PIlR--
