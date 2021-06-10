Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04006C47094
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Jun 2021 15:05:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DE79461359
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Jun 2021 15:04:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231469AbhFJPGz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 10 Jun 2021 11:06:55 -0400
Received: from mail-wr1-f48.google.com ([209.85.221.48]:35766 "EHLO
        mail-wr1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231452AbhFJPGz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 10 Jun 2021 11:06:55 -0400
Received: by mail-wr1-f48.google.com with SMTP id m18so2716351wrv.2;
        Thu, 10 Jun 2021 08:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=maDX1SqEQGmbJlvnWGoFUMoFJ5cg99gOE1aPzue8sQc=;
        b=CM3OxKfIneIAUiLf5Zk7CX1dZ+8sSdQ76IbHP2tuZgRjPcYy/z1Yv6PUlaqE9NYSBo
         QWw2VAs6hA/Rt5fp6On+lvmLyJXpiGVnNihRdFlPAjoGXJ361gMv8lMt4qkdtZAHUnlK
         +WB8MpPrfSQJoARGfQzv3XE4xtLN2foAvm4fcVvJdrgxn1B++udXsElXnAMJpTewDg2w
         ubV1bzDUShW6GGqKdbh+b5iiVANMa9DBWeBV3ce6k1PXFUK3ich76bw4yYXaTlTf/yY/
         idZsW7AX4esUjWByduaTJLezo70qlY0CUWWXtc/drySh17MBJAT8e/vM4/bav/3ulLIi
         09DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=maDX1SqEQGmbJlvnWGoFUMoFJ5cg99gOE1aPzue8sQc=;
        b=i7wOUioMzDiTB3mZcdygW7irR+QJy/P3rFBzlU7KinTz6qcFcXPLZQgxZfxZ8nmrjj
         0IqzrnYN3jJXvlLTUlD5z+Uab3prLjQUD0A2FhweBpX76H3mFaqJAQEC6++1iL6Sd08S
         xiohm8d7vSXRJxNP1g0NVfHpQKt+6+IaZfwlXbvndNADyszSuRdZ5EkUWqFecgOY2m+o
         7dwsXIhy+PRuI9dGQzBngPgZY65CYHpaZX+IHlHyz6Nwij3PmRAPoglsqT5zhfNblnVX
         w01RUVla5E+oQShxgPM02kmztyAesbL/buHwyYlH6tOIluNNNvRbDfa1IJRU/He5tuoU
         kP7w==
X-Gm-Message-State: AOAM531dDrqRJw1IDmYHTP1ay9h46BwKl9dgOVxoenaxN+F1VLHsYFEp
        U9cPPmS+FoCvy5JNVKm60gI=
X-Google-Smtp-Source: ABdhPJwI0pDe52r2vhAsfmYMLDJnqn5RBM1d0jDdXYIV9WJl4CSRRI62IkWpVAjPBPaE3eD5NbX/ng==
X-Received: by 2002:adf:f7d1:: with SMTP id a17mr6103816wrq.84.1623337424570;
        Thu, 10 Jun 2021 08:03:44 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id m132sm3222349wmf.10.2021.06.10.08.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 08:03:43 -0700 (PDT)
Date:   Thu, 10 Jun 2021 17:05:27 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Will Deacon <will@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [GIT PULL] memory: Tegra memory controller for v5.14
Message-ID: <YMIqNynz29Z9fYi3@orome.fritz.box>
References: <20210607084910.21024-1-krzysztof.kozlowski@canonical.com>
 <20210608120128.GB10174@willie-the-truck>
 <YL+A+MPjjaa3nSwq@orome.fritz.box>
 <20210608164851.GB10994@willie-the-truck>
 <YMHZCaRiQNQCSsVr@orome.fritz.box>
 <8c18edeb-2e3e-9072-6bb4-11637d0ca3e5@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7mpR+8HugVK1gP7Y"
Content-Disposition: inline
In-Reply-To: <8c18edeb-2e3e-9072-6bb4-11637d0ca3e5@canonical.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--7mpR+8HugVK1gP7Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 10, 2021 at 04:23:56PM +0200, Krzysztof Kozlowski wrote:
> On 10/06/2021 11:19, Thierry Reding wrote:
> > On Tue, Jun 08, 2021 at 05:48:51PM +0100, Will Deacon wrote:
> >> On Tue, Jun 08, 2021 at 04:38:48PM +0200, Thierry Reding wrote:
> >>> On Tue, Jun 08, 2021 at 01:01:29PM +0100, Will Deacon wrote:
> >>>> On Mon, Jun 07, 2021 at 10:49:10AM +0200, Krzysztof Kozlowski wrote:
> >>>>> This is the pull for you to base further SMMU aptches (prevent earl=
y SMMU
> >>>>> faults).
> >>>>
> >>>> This is a tonne of code for me to pull into the SMMU tree given that=
 I only
> >>>> want one patch!
> >>>>
> >>>> Thierry, if I just stick:
> >>>>
> >>>> https://lore.kernel.org/r/20210603164632.1000458-4-thierry.reding@gm=
ail.com
> >>>>
> >>>> on its own branch, can you stitch together whatever you need?
> >>>
> >>> I'm not sure I understand what you're proposing. For reference, here's
> >>> the set of patches that I sent out:
> >>>
> >>>   1. memory: tegra: Implement SID override programming
> >>>   2. dt-bindings: arm-smmu: Add Tegra186 compatible string
> >>>   3. iommu/arm-smmu: Implement ->probe_finalize()
> >>>   4. iommu/arm-smmu: tegra: Detect number of instances at runtime
> >>>   5. iommu/arm-smmu: tegra: Implement SID override programming
> >>>   6. iommu/arm-smmu: Use Tegra implementation on Tegra186
> >>>   7. arm64: tegra: Use correct compatible string for Tegra186 SMMU
> >>>   8. arm64: tegra: Hook up memory controller to SMMU on Tegra186
> >>>   9. arm64: tegra: Enable SMMU support on Tegra194
> >>>
> >>> Krzysztof already picked up patch 1 and I was assuming that you'd pick
> >>> up 2-6 because they are to the ARM SMMU driver. However, if you're
> >>> primarily interested in just patch 3, which is more "core" ARM SMMU t=
han
> >>> the rest, which are Tegra-specific, then I suppose what we could do is
> >>> for you to give an Acked-by on the rest (2, 4-6) and then Krzysztof o=
r I
> >>> can pick them up and take them via ARM SoC, based on the stable branch
> >>> from your tree that only has patch 3.
> >>
> >> I think you previously said that patch 5 depends on patch 1, so I can't
> >> take 2-6 without also pulling in the memory controller queue.
> >>
> >>> Patch 6 touches arm-smmu-impl.c, though it's a two-line change that
> >>> touches only the Tegra-specific matching bit in arm_smmu_impl_init(),=
 so
> >>> the likelihood of that conflicting with anything else is fairly small.
> >>>
> >>> Is that what you were proposing?
> >>
> >> I can queue as much or as little of 2-6 as you like, but I would like =
to
> >> avoid pulling in the memory controller queue into the arm smmu tree. B=
ut
> >> yes, whichever of those I take, I can put them on a separate branch so
> >> that you're not blocked for the later patches.
> >>
> >> You have a better handle on the dependencies, so please tell me what w=
orks
> >> for you. I just want to make sure that at least patch 3 lands in my tr=
ee,
> >> so we don't get late conflicts with other driver changes.
> >=20
> > Yes, if you could pick up patch 3 and send out a link with the stable
> > branch, I think Krzysztof or I could pull in that branch and pick up the
> > remaining patches. It'd be good if you could also ack the remaining SMMU
> > patches so that ARM SoC knows that they've been sanctioned.
> >=20
> > Krzysztof: would you be okay with picking up patches 2 and 4-6 on top of
> > your memory branch for v5.14?
>=20
> You mean the iommu patches? Yes, I can take them and later explain to
> Arnd/Olof why they come through me.

Okay, great.

Will, can you provide that stable branch? Or would you prefer if I
prepared it and sent you a pull request? We're kind of running out of
time, since for ARM SoC the cut-off point for new material is usually
-rc6 and that's coming up pretty fast.

Thierry

--7mpR+8HugVK1gP7Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmDCKjQACgkQ3SOs138+
s6G9mxAAvng5nEyjLg9tvjEBYmqVzd3B9QUm5jd6sZZq6YdD6wjrUpmwWSTcP7XI
dJ9T722dGWz3HENw9AIgv4zMj2/ws8g84+1dvjL/eo56PaWLoNdCpm2IokdKjl2G
3sjYPEBPyEr+nqvsu+wIMbYeiXGfK2nndGg+Mw5wBnt/dQ5fYPLtKc/o5XSo5M5R
7qmp3ekHSU5fD/X8F5+bCZajyaVyLFNU58FdsCf0yRTcqED5uWPO0TPp/VwPnlIw
Q19s+JQD+V4XbFMgSadlPF8VP/Dht7W8tiUBl5WpoPMqFpBa8AtkZ6VrAjaM92tf
fTyVdA/fZg04rh3M1yH8QpOOYA2z3YmGj3U2ShYAAQSnoiqLwW2fE+pEqQfmRDPI
2rJdP8aTuXzxdMVFpklP7iTPjOd2aNSZc3gQ9U9xNF9tDd74DDYVJqCt3D3C0bhP
Mk8hioQpf3HtY53fnBcF8g3zGgYrd2ZEQuAp5McB/mbhpmj+kiJs/iUZVVoYfu4H
GWAERzA11dmouEHyWWjtmVGPujs/Jxt6eSJiNvn4WvuS6ezYP55NQ0Z7U+17/QqI
1Xo+q01r+6JON6Rx730qOjuWJqqx8Oo1db+BBN/Tp/g1xlC0YmobTwchCC0RSgho
YOaTy2yuc++OIrpXDJT80MHodI4MBVDJHKqqsOpeH1szjvdGpqc=
=iL3y
-----END PGP SIGNATURE-----

--7mpR+8HugVK1gP7Y--
