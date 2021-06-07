Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17C61C47082
	for <linux-tegra@archiver.kernel.org>; Mon,  7 Jun 2021 13:24:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E812861153
	for <linux-tegra@archiver.kernel.org>; Mon,  7 Jun 2021 13:24:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230177AbhFGN0r (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 7 Jun 2021 09:26:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230127AbhFGN0p (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 7 Jun 2021 09:26:45 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CEE4C061766;
        Mon,  7 Jun 2021 06:24:37 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id a20so17665616wrc.0;
        Mon, 07 Jun 2021 06:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kL0P6p7GVBccTmZFiVNv5dWuKJqRPj/e2bExCk7GY8U=;
        b=gJAqhKS/BcocY4c4HmeIirCyc8h7SJZPlPBiqHgX2CLV025tQNJKRtDhdk33WEsOLS
         GMuQgNto+1cha72jx8U6lAi6Q0FH1DRcVfSJkkKhQVf27SsA3lcOzayE0vsp5tqSHizF
         j6/JBPa4sE3O1skJNBTNf2ideKIz5rDbGWQ4EP25pe3u7ClBkBjxH513vpM9dJehPlgr
         VnpvBVxLyNU57Qsb3Bmb8SDXLJ9Q0weNlM5mT56a7L0u1fxWHipJ3oVjHn5tqpWqrZO1
         HMeJ5NEQno/tnu1z7IPHQKGPFbVPlh+qoAL9+CAL6QjKJkVV+XbcgBTHyQ8wFZpb4ZlC
         udtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kL0P6p7GVBccTmZFiVNv5dWuKJqRPj/e2bExCk7GY8U=;
        b=iaxgTTUc1aJf/du51OwAhHTWx1V0LGi0CDzy3uV8z5/Aqf++kidqU8i6Otbi9w56E4
         35ZiNh/6jokt1Cawt2U7cGLI4MWEfhf01I4pNiBFQoirgFihbdRCNOvBv497WinAqDXj
         wyo/TmkpV+OtHORpAKceERlAdy2fb7H13/r781uzm0x2/LQtn2YG8FJuHftESMcgUFUN
         pz538ghD1hlsNB8Hs2h4OvbMPI0wsbd+80ezx1s8Tx2YBMJESHLyiSzve1iL1c2HYD8C
         UMu0UamutDb3dSvhRY6w1BUewgHoZUT/CpQxyTIbkAzMMYUaJwtFg7VAsBEx9VXncdyl
         wcxg==
X-Gm-Message-State: AOAM532SvyECG9XiWVoC+s8kVHW8gx1oQ4Xkxb83lxWP6QCvdfhFsOI/
        NH5/TAAsykpCpE31BoLeJCE=
X-Google-Smtp-Source: ABdhPJzoAaTtJJq+pedRkcPQqkjWPLvJPfmb/qhIaZZAm7TAzcVlgKPd4LWUmQhwe6WZEF4LmeG14Q==
X-Received: by 2002:adf:e5c7:: with SMTP id a7mr16938952wrn.117.1623072276151;
        Mon, 07 Jun 2021 06:24:36 -0700 (PDT)
Received: from localhost (pd9e51d70.dip0.t-ipconnect.de. [217.229.29.112])
        by smtp.gmail.com with ESMTPSA id x20sm9754485wmc.39.2021.06.07.06.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 06:24:34 -0700 (PDT)
Date:   Mon, 7 Jun 2021 15:26:15 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PULL] memory: tegra: Changes for v5.14-rc1
Message-ID: <YL4ed935vYUb8L8d@orome.fritz.box>
References: <20210603143739.787957-1-thierry.reding@gmail.com>
 <772bf62a-fb09-cec4-ed4d-ddbfc2832e2b@gmail.com>
 <YLnzQk+suAG5clzB@orome.fritz.box>
 <3ed358ce-de98-0b42-2446-873af55ed825@gmail.com>
 <9f1fe71e-3900-fa8a-8c09-4bc2dc084156@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="DtDjyeay0fGCyGKR"
Content-Disposition: inline
In-Reply-To: <9f1fe71e-3900-fa8a-8c09-4bc2dc084156@canonical.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--DtDjyeay0fGCyGKR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 07, 2021 at 10:28:14AM +0200, Krzysztof Kozlowski wrote:
> On 04/06/2021 14:51, Dmitry Osipenko wrote:
> > 04.06.2021 12:32, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >> On Thu, Jun 03, 2021 at 10:56:29PM +0300, Dmitry Osipenko wrote:
> >>> 03.06.2021 17:37, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>>> memory: tegra: Changes for v5.14-rc1
> >>>>
> >>>> This stable tag contains Dmitry's power domain work, including all t=
he
> >>>> necessary dependencies from the regulator, clock and ARM SoC trees.
> >>>>
> >>>> ----------------------------------------------------------------
> >>>> Dmitry Osipenko (18):
> >>>>       clk: tegra30: Use 300MHz for video decoder by default
> >>>>       clk: tegra: Fix refcounting of gate clocks
> >>>>       clk: tegra: Ensure that PLLU configuration is applied properly
> >>>>       clk: tegra: Halve SCLK rate on Tegra20
> >>>>       clk: tegra: Don't allow zero clock rate for PLLs
> >>>>       clk: tegra: cclk: Handle thermal DIV2 CPU frequency throttling
> >>>>       clk: tegra: Mark external clocks as not having reset control
> >>>>       clk: tegra: Don't deassert reset on enabling clocks
> >>>>       regulator: core: Add regulator_sync_voltage_rdev()
> >>>
> >>>>       soc/tegra: regulators: Bump voltages on system reboot
> >>>
> >>> This patch is a build dependency prerequisite for the "soc/tegra:
> >>> regulators: Support core domain state syncing" patch. Will you send a
> >>> new PR to Krzysztof with the remaining soc/tegra patches?
> >>
> >> soc/tegra patches usually go in through ARM SoC. This is merely includ=
ed
> >> here because it was part of the set of patches that were needed to
> >> enable compile testing for the memory controller drivers.
> >>
> >> I've applied the remaining soc/tegra patches (12-14 of the series) to =
my
> >> for-5.14/soc branch but ended up not pulling that part in because it w=
as
> >> unnecessary for the memory controller patches.
> >=20
> > Does this mean that if for-5.14/soc will be pulled first into mainline,
> > then the patches will be applied in a wrong order?
>=20
> All of the branches of each maintainer should be bisectable, so order of
> pulling by Linus' should not matter. Assuming current Thierry's branches
> are bisectable, how Linus' tree can be broken after specific pull order?

Yeah, I don't see how there could be issues. The for-5.14/soc does have
all the dependencies that it needs, as far as I can tell, as does the
for-5.14/memory branch. If for-5.14/soc gets pulled first, then the
sub-branch that's included in for-5.14/memory will end up in ARM SoC
before for-5.14/memory, but that should be harmless. Once
for-5.14/memory is then pulled in, it'll pull in all the dependencies
with it, except that part of them will be there already from
for-5.14/soc.

The only way this could break is if either the original series wasn't
bisectible, or if some of the later SoC patches rely on patches from the
memory portion of that, which rely on the earlier SoC patches. That'd be
a very odd circular dependency and would add to the complexity on how to
handle this. But given that all these branches seem to be building fine,
I don't think that's the case.

If something like that ever happens within a series, please make sure to
point that out. In general a good way to manage such circular
dependencies is to post subseries separately and make a note of the
dependencies in the cover letter to make that clearer. That's also why
it's usually a good idea to send series such that the patches within are
ordered by tree. That way it's trivial to find out if there are any such
circular dependencies by doing a bisectibility build on the branch.

Thierry

--DtDjyeay0fGCyGKR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmC+HnQACgkQ3SOs138+
s6HEhw//SjMQbtd1X1kFxYO1XG6oQfHevfIcOu1eVxj+c1CyCIzKwO9XPmUP3mi8
jua0he0jPjJ1fY7fmSDm7zVCqks8Fq93/AMMvWgBbo5olUAanVeWaFLJPKKCwsPN
L6RR1VF5FIHY5+KVYrXC+EQdfGah2qApxnzdntzOP7AitsBsfCPa8WAlzVoKFxXc
On2l1gtVV6rfQe+fM/cc+qepE0PJAdTPTaR0BN4HDhvjIouQE+Hlm1xj1YBpeR/S
B2YbgFzjc0lllDzj22D0MkWVr7BgreBTWK9fyzGkGIFuIBJacM4HnYsVTvcFPRx8
XUinQVahEXfK++NXYUcjvWKThZj/qHxggL21Wc/J/cS2F9HIbOZO87COmxAtBLGv
eYHYMHpc3+BTe3obc0hKRFtjUrCCLCXfOs99yNK6L+a56pAo6Jl17+RDrcXLAFnV
W09KyvaqaEmFdwnjTYLQ4LikQ9cugKOCu1gWOCSm+/rxgp9mWFWjDKbOrZxObNdT
SU+xxSgG7qWAHNkUk/aVHaN/zRIFJ67MCrE+zpB3y5Os8TPfrAaUtCLE4PF9/qhB
cSkf6Nyr7kAPlT0RsAtC9895lZ5OlC7Do+XxoJjkkjcVvpEi/4Jw/e12ORCu4Hw2
s5QXGke94oZ4IEO4hZw9Gjs4Lnf9wXYdGF4kgL96b5+4zyPCz4k=
=vmZq
-----END PGP SIGNATURE-----

--DtDjyeay0fGCyGKR--
