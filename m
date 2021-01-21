Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4784FC433E0
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Jan 2021 15:11:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 11007238E3
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Jan 2021 15:11:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732429AbhAUPLQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 21 Jan 2021 10:11:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732300AbhAUPDg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 21 Jan 2021 10:03:36 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E236C0613D6;
        Thu, 21 Jan 2021 07:02:56 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id a12so2056137wrv.8;
        Thu, 21 Jan 2021 07:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rn7bqja/hjsV21hhP4YsXCz0nt90F/2AcPINKmzjka4=;
        b=fLi2Z8Eq7UWNXbf6WeWQ1hMalTKrb04/uKUUzxuMGodhDFxwjEITBjrIqw9j+gEl8H
         GrJmYP/czPbpT0RmNoheSK7ADRmW4nSY4Hh7LxaIjGvQZkAkkHBQYwhHAoR7i1EKxlyb
         TTpJoF9oSKBQEFG/m7IVwEXJmmnmeLYNpuktoEHTdrnp+BOYVcbbiq7aSYBQJ8gbJOMV
         wezedunwgyFtP8iR7k61bgqCFiC9QEv4rEihwIx8n5Jv/2/y+nNOVnWlWNW+I+qXRWMh
         d/dEpnLTjQovmFjMI4Rr+zCC3qPLm7rwR1VjJZHrNsizEwpnMnsPfjdhw8LdSUkrm3B1
         itUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rn7bqja/hjsV21hhP4YsXCz0nt90F/2AcPINKmzjka4=;
        b=SxEPa0a16Oo0pmDcZjBYwxM+KwRC1BZsCB03fvystlXxL1tm2FrFXoVFYgWpaDLLEG
         o9NL+DAmJbgnjStX8+Nt/Oc2bMETFPWloFi2vy+Taxp3XjXzj4G9mSo0eMIJ01PxPnle
         61ciDOIBd2N9VicxIT7sbswlXVG1fLR7c/7ptnkGNOOUwJSjQPo5A6rfQ39oy55g95dZ
         6Lq9Af6ThJVjFS9KyJnmTZb21wNXlYqH9qrqYTdRK6Wm8xCz+YZY7B7nAO0fh46YwF9e
         clkqN3kZPPNv74QZfbbfPqIMcluL4oQlgZU8MuAboi+u1aiWN4r45mOCjSVYIIClg4XO
         3YGA==
X-Gm-Message-State: AOAM531jqWcACyNw0tyYlpbk/S++0XD8WDppTBS7ZFXIYtC351iuxYEi
        aI9hAqvzAhp5ZDxRVBhSYz0=
X-Google-Smtp-Source: ABdhPJxDLK6FDyVY8vrSC9WiRz1lqEbbiMMYfloHXLfXaIfgIZXqxlsdX2Q97Ky1u1gFkxt2ntO8ag==
X-Received: by 2002:a5d:4443:: with SMTP id x3mr13248358wrr.409.1611241374905;
        Thu, 21 Jan 2021 07:02:54 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id l20sm9524242wrh.82.2021.01.21.07.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 07:02:53 -0800 (PST)
Date:   Thu, 21 Jan 2021 16:02:52 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To:     arm@kernel.org, soc@kernel.org, Peter Geis <pgwipeout@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Matt Merhar <mattmerhar@protonmail.com>
Subject: Re: [PATCH v3] ARM: tegra: ouya: Fix eMMC on specific bootloaders
Message-ID: <YAmXnCSPVTcNrJxx@ulmo>
References: <20210107165658.1354191-1-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fGGnx9KInWbJddqW"
Content-Disposition: inline
In-Reply-To: <20210107165658.1354191-1-pgwipeout@gmail.com>
User-Agent: Mutt/2.0.4 (26f41dd1) (2020-12-30)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--fGGnx9KInWbJddqW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 07, 2021 at 04:56:59PM +0000, Peter Geis wrote:
> Ouya fails to detect the eMMC module when booted via certain bootloaders.
> Fastboot and hard-kexec bootloaders fail while u-boot does not. It was
> discovered that the issue manifests if the sdmmc4 alternate configuration
> clock pin is input disabled.
>=20
> Ouya uses sdmmc4 in the primary pin configuration. It is unknown why this
> occurs, though it is likely related to other eMMC limitations experienced
> on Ouya.
>=20
> For now, fix it by enabling input on cam_mclk_pcc0.
>=20
> Fixes: d7195ac5c9c5 ("ARM: tegra: Add device-tree for Ouya")
> Reported-by: Matt Merhar <mattmerhar@protonmail.com>
> Tested-by: Matt Merhar <mattmerhar@protonmail.com>
> Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> ---
> Changes v3:
> Removed stable tag, applies to v5.11+ only
>=20
> Changes v2:
> -Added stable tag.
> -Improved commit message.
>=20
>  arch/arm/boot/dts/tegra30-ouya.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

Arnd, Olof,

can you guys pick this up directly for v5.11, since I don't currently
have any other fixes queued up?

Here's a patchwork link:

	http://patchwork.ozlabs.org/project/linux-tegra/patch/20210107165658.13541=
91-1-pgwipeout@gmail.com/

Thanks,
Thierry

> diff --git a/arch/arm/boot/dts/tegra30-ouya.dts b/arch/arm/boot/dts/tegra=
30-ouya.dts
> index 74da1360d297..0368b3b816ef 100644
> --- a/arch/arm/boot/dts/tegra30-ouya.dts
> +++ b/arch/arm/boot/dts/tegra30-ouya.dts
> @@ -4352,8 +4352,8 @@ cam_mclk_pcc0 {
>  		nvidia,pins =3D "cam_mclk_pcc0";
>  		nvidia,function =3D "vi_alt3";
>  		nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
> -		nvidia,tristate =3D <TEGRA_PIN_ENABLE>;
> -		nvidia,enable-input =3D <TEGRA_PIN_DISABLE>;
> +		nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +		nvidia,enable-input =3D <TEGRA_PIN_ENABLE>;
>  	};
>  	pcc1 {
>  		nvidia,pins =3D "pcc1";
> --=20
> 2.25.1
>=20

--fGGnx9KInWbJddqW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmAJl5kACgkQ3SOs138+
s6EKPA/8CPZIippS9fE8NcFsxBz/e79qQJtdtCEE9x1jcmpCe+59A71pXnkvD2W6
iEUGXkfZUrYzmS4tbe36d36qqx9Z592uKMw4SSEQidNPUUvO8uxVDgXvXcSQhvAB
5rN+PJ/uOfl6HVdyO5/uZR83ipk5EtWX78F12QkAst9oc0AgAgGvkvtiS/hKZ+QV
qbdG7sre7EKIiYUaN6zY8v3P75a2lYglqmlVevdnyFDzoK2OTUIZmrMbeUQ4vsJ/
a6yzqKXUdnOGAi7ePHPc/BHizzZxN2x5BqFS+HlOCqI7c0tmnhFq3A7VycSEvBce
DHxkyXZuhWYb+4JT0VLwYMmtZ1vjWoc9FhjBh1c3pho0t5nAoSKbd7IRSF6pLGrz
AFQIzS/jY+A2BJ2W8otkWb7+ciNUqooXQzaCHmEmDgklM2vzRE+Gtu3QHVAczi19
a091GUMYWbqV4reh80rZN23HlrCMczzcd/SkVzvDeMSSbk8buSY/aKS3XEKuoQMN
Q12unnwncq76ux0MH+k2iFWp89g9S77/QNLINunNxuzuowJ0QMKwx3MpBeJ3Xr3H
9BzgY5+r9/mXAheD44d9JSXzepTuURITqRbKdVitAil1FqnShOM/WbvMDWTPWle9
/y87+qUOYY1IV0TxWAlvXwB1GvJQOvXw0A1I6i+35JdoM8etc2E=
=Y5ex
-----END PGP SIGNATURE-----

--fGGnx9KInWbJddqW--
