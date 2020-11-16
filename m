Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D816BC6369E
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Nov 2020 16:28:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8EAD120776
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Nov 2020 16:28:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UxBYdxDX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732112AbgKPQ2m (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 16 Nov 2020 11:28:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730795AbgKPQ2m (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Nov 2020 11:28:42 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52D46C0613CF;
        Mon, 16 Nov 2020 08:28:40 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id d142so24300305wmd.4;
        Mon, 16 Nov 2020 08:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kc1ukQL6kODEhYMjeZ7pxJqnx32Rr60HwhEN3ntpjVc=;
        b=UxBYdxDXJqyuI9q1ZSGmjgAUJ4mL+wy4j4uuuWqfc4yEwtZ10juLennZBZTj7M1uyz
         J1aJoJjcw6tMmTizfzahUIp1EE9twSatetgO3KoKmr9MZFX6GkMe9KPCfN54Rl/gIQqZ
         bbcNnh6jJP4xtjTWw6CuN/Ymf8NKE5J3v4jcqILCiXe7VjnapOP3SuVG2fx9JO2W3q4W
         SGEW49mharcANcfNwrt4FegjKfklH64NT2ydo3iBfgWQB7lD4mWTc/f7qivs9xPHujpy
         iioN+HWyAq86yCGdkEbDF2uZQYAijZ0t3oQaGCGfs9GolKBlIG53xyJy3oyszRR1q7wF
         ODcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kc1ukQL6kODEhYMjeZ7pxJqnx32Rr60HwhEN3ntpjVc=;
        b=hKnZUmZN98T+GThpd2JUWBw9zY/DPzNizuBbhyjQxGwxcMT8duj1BKvLz12EahDrUl
         Ly3hMfuE5/kT+bYl//PNidlKiNKlUXlBh3bzgdVi0EmnDyBM34HjitJN3zaVY9OSuqnj
         ZvZCWBj8r0SljK8lDUxn5fXWViWCz85lp/uF3+ZmafE9bhUuvqAhg60uod/l8N8lDGip
         kPr+6fV5bmW3G4OOQ/Xc/EeSx8qVqHNzcRLWsLbXA/fDQCStyvhB3PEEQiR2x0dOvqVe
         IlNCHhTnLL+5MzQ1U/WaCZNRdCWKFlXhsSErA3VTQ7tN236dGst+Ype15LflhrVf3i/D
         EItQ==
X-Gm-Message-State: AOAM530LL7O+2Zcl/n7WsPIddSJOzkrBwx2HbqKYbGDJSvPeBsbV8H7q
        EP5VEm2WYKYYxJNlM2XUSy4=
X-Google-Smtp-Source: ABdhPJxKuChqUtkDnjK9Sld3PAl+AhOvfZ1+a8Q+TWJTveN8BrHyvOHpKKlNCUQ5gyrEg8tY19Phpw==
X-Received: by 2002:a1c:67d5:: with SMTP id b204mr16685204wmc.92.1605544119102;
        Mon, 16 Nov 2020 08:28:39 -0800 (PST)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id s133sm20597171wmf.30.2020.11.16.08.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 08:28:37 -0800 (PST)
Date:   Mon, 16 Nov 2020 17:28:36 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH] ARM64: tegra: Disable the ACONNECT for Jetson TX2
Message-ID: <20201116162836.GA2584498@ulmo>
References: <20201116162026.5324-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6c2NcOVqGQ03X4Wi"
Content-Disposition: inline
In-Reply-To: <20201116162026.5324-1-jonathanh@nvidia.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--6c2NcOVqGQ03X4Wi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2020 at 04:20:26PM +0000, Jon Hunter wrote:
> Commit ff4c371d2bc0 ("arm64: defconfig: Build ADMA and ACONNECT driver")
> enable the Tegra ADMA and ACONNECT drivers and this is causing resume
> from system suspend to fail on Jetson TX2. Resume is failing because the
> ACONNECT driver is being resumed before the BPMP driver, and the ACONNECT
> driver is attempting to power on a power-domain that is provided by the
> BPMP. While a proper fix for the resume sequencing problem is identified,
> disable the ACONNECT for Jetson TX2 temporarily to avoid breaking system
> suspend.
>=20
> Please note that ACONNECT driver is used by the Audio Processing Engine
> (APE) on Tegra, but because there is no mainline support for APE on
> Jetson TX2 currently, disabling the ACONNECT does not disable any useful
> feature at the moment.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 12 ------------
>  1 file changed, 12 deletions(-)

Applied, thanks.

Thierry

--6c2NcOVqGQ03X4Wi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+yqLEACgkQ3SOs138+
s6Hpcw/+Iu/rWot+hOpP6WeujWh6gTdlJ+IGP2y3hjXg3r5lSOQXG3VuFiT0dgmg
Mt7eQuJdHOKMe5r4+CD28sS6KXxd7UDcjZvfq0xf0wEz8jL0eSttbypeR/Z5Fh6E
MG5YDIQwJZt1uQlEeErR1lwNyKl++IJpfccIiJPgl2jeSaOECQeECK8O3SdfZEAJ
cLjxOADSGmFqTCw8JqbTXhaRotY7wTUgm/adXuXoIrfjXNuJSnSBnk3C3qxIbD4p
eIymWbSCsfR5JZxarJkpbjZSRMguDt643xNEWKukSw+JbNRGt4XPym56RsG23+LE
7+p/ZMMwbLf4H7M5YUaP4j+vo88z71s2HwiMIn2W4Bxl7I0oEymAY9IkUfBZ2DpB
Wo9YbrKQhcwKsUuWfZyDTsG/hVWxc6lOTPqXq+Il6bhhHBaSSqHKyitqcSDKk/0t
VAknYpAv+xXzPTks6zquGVLYpIdhMoDiA3QNOTgl1xYq24EripZwZkPxdKY+njA5
6dcFvMjoZf3TeeC/JWw/iO7lT75mSdh2cRZn4juh5iwMsJMmO8K+Vhs3DVR1cijr
5U+GK9bcYID7mJ6NlG3Q80/BOEzhgGo2wjfcmkp2PF8Oy0+AvBtYePa8lxP1VV7a
ZADisDv3RniYRwPwwCtW2qrhTRnEJWUI7Mlf5bUplcPMgZkGROs=
=gD68
-----END PGP SIGNATURE-----

--6c2NcOVqGQ03X4Wi--
