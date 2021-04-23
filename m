Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAB0BC433B4
	for <linux-tegra@archiver.kernel.org>; Fri, 23 Apr 2021 12:55:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA92E61422
	for <linux-tegra@archiver.kernel.org>; Fri, 23 Apr 2021 12:55:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231289AbhDWMzy (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 23 Apr 2021 08:55:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231132AbhDWMzx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 23 Apr 2021 08:55:53 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72EC5C061574
        for <linux-tegra@vger.kernel.org>; Fri, 23 Apr 2021 05:55:17 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id h8so17220972edb.2
        for <linux-tegra@vger.kernel.org>; Fri, 23 Apr 2021 05:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vrSCOv0VrXCxUxxR4cIzAHuXg+FaGnuPTqrTgUKwoDo=;
        b=vI32s9qwDMCK2NLicnXa4U1S5MTepJieLW+ANoBdfKh+msuAULtlF+SgliTn7/5dCH
         OI84mqpBiucXeJ2HmpmYk0s2GAQiFXLv37YpRDgwcKXu8hXTWkqpBRLA1H9Lj3zr+9hK
         YZ1NZ38Gu5Hf2fYuyWDWDod3l24AUn1kQDKz6tOjSLvuP2Z0M7CvgTblq6AyxSg7vYBJ
         4CBjEikDJwfOAoa2jz/M+IrLYwqGywHCqGs0qqaQhlKlsCIJ8tsR0TGgJvSgZlT+Xw9I
         teQBsKwg+sGqOLwh5y18I+g6HbYf6YbluPJIdAfj0zTFzqlwieSBiWQQNYMLD5lvA5tm
         onpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vrSCOv0VrXCxUxxR4cIzAHuXg+FaGnuPTqrTgUKwoDo=;
        b=KpVXVgTsFr3NxN6Ybxb4p81n6m9DmClR88bQBmDqtA9wMiW1CUg7Xz+F1QxKDEBNkv
         yom5k7Y4Hz6SjQk017/ALBW2EuolBpn+9pQvNnn1XPt6kOxEl67xgh53SXuTjHMxXtNy
         6oHJH6Rt3xXPZV36W+ShCb6Zpdg//l8FwpaXRFjpPi+Oy4k4apDfHWHxV/2VLpFURKDF
         AOAJRxo+5mNGYbZdY+u4T60XKso9TBE3cPXLEVo5MDZeG5KocvbNTHa6V83oyETrufYD
         iuqbSuw3bg99wVR5GSpHPfgDGZa5Y/u2X2kKojiSzjabmd7OHFCU6Ix+PyomJ527lp25
         4ALw==
X-Gm-Message-State: AOAM532dfGb+6f4tRwUm+bUjnJDMvRDYEDFBOC+yl6CHK4luOvtlPHGN
        /h7jTtPD+zd387wIVsuJHdE=
X-Google-Smtp-Source: ABdhPJz5BEEFOUq5CpBS8XyPBWYY9NVLe29Da3ThTI+NsPdsuAUbCIDGj4AMUIfOtg6qarhv1pLFAw==
X-Received: by 2002:a05:6402:4386:: with SMTP id o6mr4327860edc.33.1619182516158;
        Fri, 23 Apr 2021 05:55:16 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id t1sm3915307eju.88.2021.04.23.05.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 05:55:14 -0700 (PDT)
Date:   Fri, 23 Apr 2021 14:56:03 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To:     Arnd Bergmann <arnd@arndb.de>, arm@kernel.org, soc@kernel.org
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 5/5] arm64: tegra: Device tree fixes for v5.12-rc6
Message-ID: <YILD4yyPXuiYbHW1@orome.fritz.box>
References: <20210401172622.3352990-1-thierry.reding@gmail.com>
 <20210401172622.3352990-5-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="0+uDXqlHZoQ8VZ/1"
Content-Disposition: inline
In-Reply-To: <20210401172622.3352990-5-thierry.reding@gmail.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--0+uDXqlHZoQ8VZ/1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 01, 2021 at 07:26:22PM +0200, Thierry Reding wrote:
> Hi ARM SoC maintainers,
>=20
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab=
15:
>=20
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegr=
a-for-5.13-arm64-dt
>=20
> for you to fetch changes up to 405fa9e9d8664e830982c5fbcb70f9ba8656bafc:
>=20
>   arm64: tegra: Move clocks from RT5658 endpoint to device node (2021-03-=
25 14:04:49 +0100)
>=20
> Thanks,
> Thierry

Hi Arnd,

I noticed that v5.12-rc8 is still broken because of the missing
fw_devlink=3Don patch from this PR. This PR was meant to go into v5.12,
but it looks like you pulled it for the next release.

In retrospect I realize that the way I sent this out was rather
confusing. Any chance you can still pull these into v5.12 to unbreak
the final release?

Thanks,
Thierry

> ----------------------------------------------------------------
> arm64: tegra: Device tree fixes for v5.12-rc6
>=20
> This contains a couple of device tree fixes for the v5.12 release cycle.
> These are needed for proper audio support on Jetson AGX Xavier, to boot
> the Jetson Xavier NX from an SD card and to be able to suspend/resume
> the Jetson TX2.
>=20
> ----------------------------------------------------------------
> Jon Hunter (2):
>       arm64: tegra: Set fw_devlink=3Don for Jetson TX2
>       arm64: tegra: Fix mmc0 alias for Jetson Xavier NX
>=20
> Sameer Pujar (1):
>       arm64: tegra: Move clocks from RT5658 endpoint to device node
>=20
> Thierry Reding (1):
>       arm64: tegra: Add unit-address for ACONNECT on Tegra186
>=20
>  arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts  | 2 +-
>  arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi      | 2 +-
>  arch/arm64/boot/dts/nvidia/tegra186.dtsi            | 2 +-
>  arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts  | 3 ++-
>  arch/arm64/boot/dts/nvidia/tegra194-p3668-0000.dtsi | 4 ++++
>  arch/arm64/boot/dts/nvidia/tegra194-p3668-0001.dtsi | 4 ++++
>  arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi      | 1 -
>  7 files changed, 13 insertions(+), 5 deletions(-)

--0+uDXqlHZoQ8VZ/1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmCCw+EACgkQ3SOs138+
s6GOhw//bxyGQ3ijzatDn52shnkQStaMkg2Qx6YO8yxrFrsfJNHwIUCbjGM7Dkyg
paEzMs0vaJo67kAKR3tr+sOkyQN2IUvM4mpIm7eGJJJBTXY7H4HVc1GUi76YiH+L
X+e4QxUcJadW09q2b0UbjRyDD20rdKxQ3OtJ1iigoLnI8lLSRYFlTlI5FOZ65Tzy
SNAiWM93MF5yEfDKQSzDHEY2XKMpabyhFJizYA0KcMCAJ+NC8WrZxxzIYjWeVAY4
ezG0kdthaYZPDUoJ19GScp/oJsZ3ItrjiFpJL5ZPadH0s4nbCnUDUW/a0YV4SGQt
Okc4PXjiOCDl5maJJHSkemLWiwjA3fyaX+heJwfe1xfmMBlE+138J3XS5Uj4/QyW
LTdg+2sJ8uN3Qb9Yg3Ln8Dg5oHVLWY3OhaGJgu3TiW9NiWstN/YOFqMYWJxe5ZzO
90iEcAakpVlBkcbEVU0WlzXxbiWF7QHpGc8uaH4tkerNHdtlMggymLTiIa3sSiQa
c8D9MaMYbiyvXVlhp4oNzABijJYlWQr5cUHRrdHWv9D6MGFk1Ta5IGvTBSSxsT8B
POT3Zx7KSXI+k0cj6/O176OrOnRlaNLZRpy8StLfKNToP5Rv/bOrnj0MT3BjXKWA
1Kx8k7PBS0HHdl1ZxuhRXITUwoqsuEGAbRal4qVqcl23NZ7/I/Q=
=SDbQ
-----END PGP SIGNATURE-----

--0+uDXqlHZoQ8VZ/1--
