Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA292C433EF
	for <linux-tegra@archiver.kernel.org>; Wed,  8 Dec 2021 15:12:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235781AbhLHPQU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 8 Dec 2021 10:16:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231429AbhLHPQT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 8 Dec 2021 10:16:19 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA56BC061746;
        Wed,  8 Dec 2021 07:12:47 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id t18so4587126wrg.11;
        Wed, 08 Dec 2021 07:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+3+k5Qx2WYCX3YZQ8Luc5I7tkoXV9xRTkByLcpdAiwU=;
        b=YWhqbUPttCn+X67fi/wKarcbdzupYVzlL4pQ53rAI4v3yx57aMgCf/tbRXaCemGEnK
         Y7wadIFzQ6yCN5l67Wl0HakPcRUhzgDO4l9/w3c2spBw95qYtshTcgD2J4/6pAC3LuYx
         TgKBN1WrCR7ZlUlgliojtYn8Ya3S+ra2Er0mnxv2eNhhSxhxpXmetSC5/hTQfLTP0mad
         yFONotMPR0faWmCohUllhJXEm+8uXefwKYL07uaNCQxPkZK9EBkAnGn09SgE/LJsecwC
         4mU+72NE8H/ZrlDUSJjNf+FyuaokocrtIdvrzn6nrcMLVKlgcjXIx25LSV5CLG8ifzS2
         3KgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+3+k5Qx2WYCX3YZQ8Luc5I7tkoXV9xRTkByLcpdAiwU=;
        b=cZ9zrp7uGhLBiJz3cYS9lOSSGdyg/EGZOV9atTvIz2jk5wCJ3twOgTrVbTaZSZxJEZ
         69QnL5+AV5l/tFt1qbtpllVL/7hH2Q6smap2k1yHPlIbknX7IJm6LxaZjfXu8DSw5LGs
         zpkgt4GgE/tO/wifwEVLB0CmUIcK2o1EHssfzwwvVuK4bCxYlRWa2gNmmMk4brh05D7w
         WHiLKorGq1NnrMeoe4VE7/TkHt0+zy/AgPV7WMAWX0E8ggoijZCneYxYpebAbkr2F3XJ
         wVXgu//bJemq85Uf89HRKGNPh4N4Q8LBdPqqkdUGxsPu0i+ZqtqLWnoanmEVtEDbHU5A
         +pwQ==
X-Gm-Message-State: AOAM53020/7XwETA/MG7hZHGFR/8ofsj6rHDgZAxtHF/fchRp4P80MNG
        JasjjxVFSXtzh4Dyz29Kp0Q=
X-Google-Smtp-Source: ABdhPJzViu+/GkUGBZH3tJStOMrixDVj2U/cFGWrX4eMv/2jgCnOnUWv7dihWvS30wEIymh0cerMBw==
X-Received: by 2002:a5d:4e10:: with SMTP id p16mr58343234wrt.454.1638976366069;
        Wed, 08 Dec 2021 07:12:46 -0800 (PST)
Received: from orome ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id p27sm2901958wmi.28.2021.12.08.07.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 07:12:45 -0800 (PST)
Date:   Wed, 8 Dec 2021 16:12:42 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH] ARM: tegra: Drop reg-shift for Tegra HS UART
Message-ID: <YbDLaiT+D16f0Hv4@orome>
References: <20211207101316.381031-1-thierry.reding@gmail.com>
 <91755ddf-0b4d-aa73-f898-f15ccc214804@gmail.com>
 <24a7e99e-0a00-08c9-eb32-b9b64d747bac@gmail.com>
 <YbDIYjlActbuTuyf@orome>
 <97c48f01-1224-2538-9368-41d23b617bd2@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="13V5rdJe8LG75oPP"
Content-Disposition: inline
In-Reply-To: <97c48f01-1224-2538-9368-41d23b617bd2@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--13V5rdJe8LG75oPP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 08, 2021 at 06:04:45PM +0300, Dmitry Osipenko wrote:
> 08.12.2021 17:59, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Tue, Dec 07, 2021 at 05:41:52PM +0300, Dmitry Osipenko wrote:
> >> 07.12.2021 17:19, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> 07.12.2021 13:13, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>>> From: Thierry Reding <treding@nvidia.com>
> >>>>
> >>>> When the Tegra High-Speed UART is used instead of the regular UART, =
the
> >>>> reg-shift property is implied from the compatible string and should =
not
> >>>> be explicitly listed.
> >>>>
> >>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
> >>>> ---
> >>>>  arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi               | 3 +++
> >>>>  arch/arm/boot/dts/tegra124-jetson-tk1.dts                 | 2 ++
> >>>>  arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi | 2 ++
> >>>>  arch/arm/boot/dts/tegra30-colibri.dtsi                    | 2 ++
> >>>>  4 files changed, 9 insertions(+)
> >>>
> >>> What about Ouya?
> >>>
> >>
> >> What about T20?
> >=20
> > I went through all of the above based on results from a dtbs_check run.
> > I don't see these errors flagged for Ouya or any Tegra20 boards. I have
> > no idea why and will need to look into it some more.
>=20
> Alright, something is wrong then. The serial@70006200 node on Ouya is
> exactly the same as on Nexus7, T20 Acer A500 is almost the same.

Indeed, looks like I no longer get any reg-shift related warnings even
if I revert this patch in my tree. I don't immediately see why that
would be. The reg-shift property is definitely not defined by either the
HSUART bindings or anywhere that it references.

Rob, any idea where this might be coming from? Doesn't look like
reg-shift is defined anywhere in the core schema either. Is this perhaps
some fallout from the additionalProperties: true fixup? Perhaps that's
not applied correctly in all cases?

Thierry

--13V5rdJe8LG75oPP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmGwy2cACgkQ3SOs138+
s6EJvA/+IxWXkotbbQ4bqPvyIViCKlnFmE/ckPNiZEyxr2igm07MPMWOcRUZovr9
StO5usOjOCNv5999zKePwE7uMdMpsvu6TWSzjeWl4jVDqDKxFlibi8pbvXKO5WfU
1H03IuwER86kYk6ynNs0fubDjm+TfpaU1XRxAxL/KmI/WVPdS6yb1gbD2FgPKPqK
K+BIetr+/ZjnAGHXdn80Xqrn6kUjSEZjMAPbjOJs3iDhwkMj0hRddWZ0mC5lT27G
z22e8eKFmDv6Sqp0LQ0YRFpHfGNNV1nIJ6QypqVOCUB5g88iHOQhDRarhIxXUBc8
5wYLCFVSH4Y0kTbrmt51A9EX4L74zL2tPTtbED1vNlNYKSTO5yTkBBov8k3REEFx
kmKvtJc6BMBr3476deX2los3WhwQyY2Rjk7hvF3cj000goES0ES1QNZ0hbfOyHZG
aQOsKSKsxGZXHNDAFlHIigkmUV3KaW9Q9uGtfHjIPLRIhJwsUfyUTfl0V9Mk7vFL
itd44w76nydbT/VG/BJhZggRr/ucIu5n9TGjcCXpjkPIAikerV/t9Gs2PUbMLQ6m
p8ylHFzBemftm+FuwXoxkO7NFsrs8zOHFfm5tG1LVxgd6Ep8YK9yuqjpaSJoQo8V
8cPimVWmwkk5yORa4KLA+3RyhWR66bI7Xlmg4l1q7Z+SLEBoUZg=
=YcMT
-----END PGP SIGNATURE-----

--13V5rdJe8LG75oPP--
