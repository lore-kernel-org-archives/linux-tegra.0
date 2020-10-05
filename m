Return-Path: <SRS0=kAmo=DM=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC678C4363A
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 10:27:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5C69920795
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 10:27:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IWJeKhIX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725930AbgJEK1s (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Oct 2020 06:27:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725887AbgJEK1r (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Oct 2020 06:27:47 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C996C0613CE;
        Mon,  5 Oct 2020 03:27:47 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id l24so8701722edj.8;
        Mon, 05 Oct 2020 03:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5KmV2gDNIgSSSWj29BV9SBfsq532geSZKQtqfX0xzgc=;
        b=IWJeKhIX+kos+LH759fRya86SswM6Y+55TCgc7CYYuSqqZyD3eISdLQfWqNUPlv8iz
         I1QdXl1p4vOZQnJq8KjI6DsGKezE165a7f4Eu2gR8hRjPRjWhraWfT1pqT9OlEstHFNy
         vWqf7Za9uBG8qe/DpNkVqwC3DRctaDbRplu0RpJqJysqtVMzGv6U0v0n8nFgxbDbtQB8
         p8jYrYoI0ZjzzYvaxYKOyAO8wy6a/mvhc75Ds4YNfecQbftYbLqm3CHz7Sv+nRH1MWVc
         6S4cFcXLNByeanNs/0vb01p0Y9cvAwi8y42LmQtX40mEsPs2RvH8IBc2fpjs/1PDEUNA
         yVWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5KmV2gDNIgSSSWj29BV9SBfsq532geSZKQtqfX0xzgc=;
        b=isKT/wjvJGCotZapGoj5Jx42eTrilnn9HIoJvGc4e/sm2S1/ylyUeUE1G2jrosR+Yb
         UR6n2xa1iESGCSL9gL9drm+KUMFakEezZuAGeQJtJQ3hp5kOHAA3DLin51lnI8gVDL5q
         dsKrQBLCb42mPDV29szufwNzRaquEYHMOtA5otMxF7tTFQ096d+9Iiis/cRjoGnh3t9y
         cUrxpCgwxgzneknpO+ral+2LxDdp4FvhUCpistrD9gCANdgUOk1+sZx4TsKT0jXXesQ1
         lsMe74LK6f+mKAn+YX9LGevMDxKLfw171z9Y4d961a+WQSOpm3ycXbpP0c3gY3A6s+7m
         AEnA==
X-Gm-Message-State: AOAM532ICOw/WaH23SHOvzXcmiypzUS4KTWIeUjPR6Q0LxE2zoeYN1Vf
        8WLGSD1Jwdhuo9s/e2IA6ts=
X-Google-Smtp-Source: ABdhPJzC/yBKkW5Vj60He0Lq8p3op1rsl2V7E8B0k/gS5cJ9Eb0A6RXbkq5xQZU07OZozb+SFXY5Mw==
X-Received: by 2002:a05:6402:1c1b:: with SMTP id ck27mr10813669edb.218.1601893666133;
        Mon, 05 Oct 2020 03:27:46 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id m2sm7806717ejo.4.2020.10.05.03.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 03:27:44 -0700 (PDT)
Date:   Mon, 5 Oct 2020 12:27:43 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Nicolin Chen <nicoleotsuka@gmail.com>, joro@8bytes.org,
        krzk@kernel.org, vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
Message-ID: <20201005102743.GM425362@ulmo>
References: <20200930153131.GB3833404@ulmo>
 <ece615ad-8d6b-96ae-d8b4-9667aef17281@gmail.com>
 <20200930160626.GD3833404@ulmo>
 <f11d7d8a-8ce6-a53c-6219-ceec05432002@gmail.com>
 <20200930164707.GB3852280@ulmo>
 <35115ac1-fb25-7226-7b50-61193669e696@gmail.com>
 <20201001075811.GA3919720@ulmo>
 <4dbf5bcb-76af-53c5-31cf-880debbcebf3@gmail.com>
 <20201005091610.GC425362@ulmo>
 <1adede6e-ecbd-eea4-bd40-4969cd8719cc@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qySB1iFW++5nzUxH"
Content-Disposition: inline
In-Reply-To: <1adede6e-ecbd-eea4-bd40-4969cd8719cc@gmail.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--qySB1iFW++5nzUxH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 05, 2020 at 12:38:20PM +0300, Dmitry Osipenko wrote:
> 05.10.2020 12:16, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
> >> I think you meant regmap in regards to protecting IO accesses, but this
> >> is not what regmap is about if IO accesses are atomic by nature.
> >=20
> > Then why is there regmap-mmio?
>=20
> To protect programming sequences for example, actually that's the only
> real use-case I saw in kernel drivers once. In our case there are no
> sequences that require protection, at least I'm not aware about that.

True. But I'd still prefer to have a more formal mechanism of handing
out access to registers.

Either way, this isn't very relevant in the case of tegra20-devfreq
because there's really no reason for it to be a separate driver with
device tree lookup since it's all internal to the MC driver. The only
reason (unless I'm missing something) for that is to have the code
located in drivers/devfreq. We can do that without requiring DT lookup
either like we did for tegra-smmu/tegra-mc, or by directly copying the
code into drivers/memory.

It's become fairly common in recent years to group code by IP rather
than functionality. We nowadays have good tools to help with subsystem
wide refactoring that make it much less necessary for subsystem code to
be concentrated in a single directory.

> >> Secondly, you're missing that tegra30-devfreq driver will also need to
> >> perform the MC lookup [3] and then driver will no longer work for the
> >> older DTs if phandle becomes mandatory because these DTs do not have t=
he
> >> MC phandle in the ACTMON node.
> >>
> >> [3]
> >> https://github.com/grate-driver/linux/commit/441d19281f9b3428a4db1ecb3=
a02e1ec02a8ad7f
> >>
> >> So we will need the fall back for T30/124 as well.
> >=20
> > No, we don't need the fallback because this is new functionality which
> > can and should be gated on the existence of the new phandle. If there's
> > no phandle then we have no choice but to use the old code to ensure old
> > behaviour.
>=20
> You just repeated what I was trying to say:)
>=20
> Perhaps I spent a bit too much time touching that code to the point that
> lost feeling that there is a need to clarify everything in details.

I assumed that by "fall back" you meant the lookup-by-compatible. But
what I was talking about is the fall back to the current code which does
not use the MC device tree node at all. The latter is going to be
required to ensure that the code continues to work as-is. But the former
is not required because we have fall back code that already works with
old device trees. New code that is using the memory controller's timings
nodes can be gated on the existence of the phandle in DT and doing so is
not going to break backwards-compatibility.

But perhaps I was misunderstanding what you were trying to say.

Thierry

--qySB1iFW++5nzUxH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl969RwACgkQ3SOs138+
s6G1uw/+POISSA1dSYwJw8XxtVmoFQobW0FgPp8MEtDSZyOea5EwjMXveabSeRTz
nNTOnZ5uvaC6YRvDRaX/8m1vttDVyJvJsh+z+WJVA4HiJjArkZn9xTL7blDLikru
bwhR78xyrBOEDRGFHsYWOWFLSNwhgbWlf10Q6hX3+Y5tZinZ/1j+bGW38AcDpweL
1lCuth97mrmlZX/adEoGXUCzz1P1YdGh35adRXd0GojfZ9wIuVYvPzZkGSC1FuXk
mnXl/h26SIf8mr6wFberNXlqazexCnnfih6hLLPj7F02hupbgJ6So4K8usEaQHZq
UJNz/B6vmapODjYA1runxE50eBKPNV6+33D4h7UaSb0xrwBPWH451Vh4Om6DKJMu
l9I8yLvwR3K0MdhI8kc+PU2/qp3a6HOgI4FtfYuAbWJbbVxb9MbdplWsWhlwqgg+
JIhZ6l8J9nXpM8ExkTOhKgc6LvJDzncdMnNG/QJGUbDP0wSPisIenwR6Cr5UCYOV
yy9R19+JxgPRoDLz/zF5hELJpqbuWogHCWrUSpvYk4cLZabYAtbUSygudC28CnI/
q6zKlWwxbSlPqHVijHrQVJSfVj+qRLPLHYUcGj4V5f544yIwUyRCB2e2XkzwbWTa
BMWVa4uPsvkkgqg6pic/9NA0DELSS25reEYeNcBkc1u07EIb+rg=
=i1Fp
-----END PGP SIGNATURE-----

--qySB1iFW++5nzUxH--
