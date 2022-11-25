Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22983C4167B
	for <linux-tegra@archiver.kernel.org>; Fri, 25 Nov 2022 10:12:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229914AbiKYKMx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 25 Nov 2022 05:12:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229944AbiKYKMw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 25 Nov 2022 05:12:52 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D39C1B9C6
        for <linux-tegra@vger.kernel.org>; Fri, 25 Nov 2022 02:12:51 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id v124-20020a1cac82000000b003cf7a4ea2caso5809609wme.5
        for <linux-tegra@vger.kernel.org>; Fri, 25 Nov 2022 02:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hRQplXnMXO/j/dCZjN3HfCgc8e7q8b/J3KcgZO8A6M4=;
        b=fMOeP9nCS5t+pZle+lEPgvncKlBVKQJrYeRlsw13Iv6caTMJUK83conG0f2KvRuWJK
         IudkWYY+HdY7/T1DnVgqrmlMxBO6MfrXLts0XY1ZasHwwH25oA/NmwHjwl3vH5JLEqvc
         atr679e3hHVSW61APP2EGpUobDeW00V6SqrD8iosN+awnFUTMFXs7yTaNFBfF1sFcjZP
         y9tpo0c5Et1QHlPeji29wT3CNpR5m7L20kVhcjBuG0S17+5HzRAQVHs1anZxNt6zClAm
         rZqQCUp3GyWLim3ZWK6Fvhf1B76ZPSMX2dAdbwyko+C8VZK1OTB2kzKAO06KbMiLSFGq
         LVLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hRQplXnMXO/j/dCZjN3HfCgc8e7q8b/J3KcgZO8A6M4=;
        b=QeJTGCP65vTW4aopxjvv5uNCia3eDkbM8n5kGaCevrz1bjfSLJwESnzixBKq/rveNz
         v3TLwEB5LZO+yMnahR0qOhGwe2ickAhM46RLijhSJMhjyKnyu4WGBIODDujPPbvNnTV3
         UezlnKQqk9RjlHhHe8irz1OC2FJSVGXvoTMnVBCQ72i9i/HI4lK5kRodGmcMyihSMrh1
         FBOYMvSdnPQBpqO3lv4TmPF0RnQhCXqweR6M7ZDg57FNthQvviVvi6Lndbkr220TWfwp
         /0e3QQHgijFrxIcutM3gnOShbHkxg8jabQSWwNEX0qMnB6o8fFoQi5/0IhfbzWWK5Q/Z
         kUbw==
X-Gm-Message-State: ANoB5plzhmlMk3yaWf9d78Z1+5OlP7KbAGWjMCQLWY4kmp8IDCkslgz3
        lsJ1hQVAGGgOg/G+ndlrpsY=
X-Google-Smtp-Source: AA0mqf4SkxGZvAfDpVzz5RjSY7y/fdsN4OmHKyI0bdV7W2ZZpPr1g53i3cpPReq+Ti5SOPBvN55ukg==
X-Received: by 2002:a05:600c:a15:b0:3cf:7126:1fd0 with SMTP id z21-20020a05600c0a1500b003cf71261fd0mr25606681wmp.14.1669371169559;
        Fri, 25 Nov 2022 02:12:49 -0800 (PST)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id r6-20020a05600c458600b003cfd4a50d5asm8944926wmo.34.2022.11.25.02.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 02:12:49 -0800 (PST)
Date:   Fri, 25 Nov 2022 11:12:47 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     arm@kernel.org, soc@kernel.org, Jon Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL v2 2/7] firmware: tegra: Changes for v6.2-rc1
Message-ID: <Y4CVH7TAnAm1BF4M@orome>
References: <20221121171239.2041835-1-thierry.reding@gmail.com>
 <20221121171239.2041835-2-thierry.reding@gmail.com>
 <374ae4ef-2f57-4737-95af-b1bdfdb03740@app.fastmail.com>
 <Y34FCQ3xTmcjqKRT@orome>
 <6476b823-b47c-461c-b948-752e2671015f@app.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="dtq8rxI/m1Pzd9kE"
Content-Disposition: inline
In-Reply-To: <6476b823-b47c-461c-b948-752e2671015f@app.fastmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--dtq8rxI/m1Pzd9kE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 23, 2022 at 02:23:36PM +0100, Arnd Bergmann wrote:
> On Wed, Nov 23, 2022, at 12:33, Thierry Reding wrote:
> > On Tue, Nov 22, 2022 at 10:25:50PM +0100, Arnd Bergmann wrote:
> >> On Mon, Nov 21, 2022, at 18:12, Thierry Reding wrote:
> >> >       firmware: tegra: bpmp: Do not support big-endian
> >>=20
> >> I pulled the branch, but I think this patch is inconsistent with
> >> our normal approach: Since all ARMv7 and ARMv8 processors can
> >> run with both big-endian and little-endian kernels, we normally
> >> try to keep drivers portable between both ways, even though we
> >> don't expect anyone to actually want a big-endian kernel any
> >> more. Changing portable code to nonportable code doesn't seem
> >> helpful here.
> >
> > The only reason I dropped this is because the driver is in itself
> > inconsistent. Parts of it use byte-swapping for 32-bit values and other
> > parts don't. I was originally going to fix big-endian support but it
> > would've required changes to the BPMP ABI header to avoid sparse
> > warnings in lots of places, then these ABI changes would've needed to
> > trickle up to the canonical source, etc. All of that didn't seem worth
> > the effort if we couldn't even test this in any way. So the easiest fix
> > was to stop pretending and drop the partial support.
>=20
> Right
>=20
> >> On the other hand, there are already examples of important
> >> drivers that are fundamentally incompatible with big-endian
> >> mode, notably drivers/efi/, which is required on a lot of
> >> machines.
> >>=20
> >> You don't have to revert this patch, but it would be helpful
> >> to mark code that is explicitly unportable with a 'depends
> >> on !CPU_BIG_ENDIAN' line in Kconfig. If you agree, I can
> >> add that.
> >
> > Yes, feel free to add that.
>=20
> Added this commit to the soc/drivers branch now:
>=20
> commit 4ddb1bf1a83783cebdb174b0efaf62f63ad64e0b
> Author: Arnd Bergmann <arnd@arndb.de>
> Date:   Wed Nov 23 14:21:16 2022 +0100
>=20
>     tegra: mark BPMP driver as little-endian only
>    =20
>     The BPMP firmware driver never worked on big-endian kernels, and
>     cannot easily be made portable. Add a dependency to make this clear
>     in case anyone ever wants to try a big-endian kernel on this hardware.
>    =20
>     Link: https://lore.kernel.org/linux-arm-kernel/Y34FCQ3xTmcjqKRT@orome/
>     Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>=20
> diff --git a/drivers/firmware/tegra/Kconfig b/drivers/firmware/tegra/Kcon=
fig
> index 1c8ba1f47c7c..cde1ab8bd9d1 100644
> --- a/drivers/firmware/tegra/Kconfig
> +++ b/drivers/firmware/tegra/Kconfig
> @@ -14,6 +14,7 @@ config TEGRA_IVC
>  config TEGRA_BPMP
>  	bool "Tegra BPMP driver"
>  	depends on ARCH_TEGRA && TEGRA_HSP_MBOX && TEGRA_IVC
> +	depends on !CPU_BIG_ENDIAN
>  	help
>  	  BPMP (Boot and Power Management Processor) is designed to off-loading
>  	  the PM functions which include clock/DVFS/thermal/power from the CPU.

Sounds good, thanks.

Thierry

--dtq8rxI/m1Pzd9kE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmOAlR4ACgkQ3SOs138+
s6Fb5xAAoHyriQLf9Zt60TezBoZcJ0d1vzc0fW5d78b9KVOQSWrp3nh0R8HfOlJz
iDQ4/hJvuSEbLVJHNA25Llo9OYwJHqtDpV+tNdJrjeX5IRZ522vv0xYSUWPF9zxE
aqSU6xnthj9N7iA2PzMaWo/P0Io+K1YNJWw+6iTWODhQna31rn5aXNz0x6KBKYRm
er0yzSMGdwxAA7tpYDF5232T/oV3zdD89NS0vHPfHTezSe/9gsd6EBdr5te/dKFA
voqCG6Z1jL8TpMvJK7aJbkjDXAbhqaXEFnk5teFW8gYM8okuI6J8FpTmJUP93M8I
O4HPmdyp9xKUh8BC+ELBHdDvzdrbY2oplBMIcVAz/OHyrLaVLahQ5+eJhloXGF50
bjElUbIIPO9Cq1LgEgmPLm1uThfT0v7Vwx6z0FDcjOE6pLbvcudtvDLtXC+l808L
jTecsl4H8cSKy8c/7IEqn86XPZb5gmAlr1PXyzv9KzEubG/IRVxvatkbeifdZNw4
zesg8l7SyO5YJjvDHenTPw6mAx5O1GasLnYp/1PBYYCECV6PczZqKGBJu7uN75Sc
JWkgg4zLsOIWMnlIFgxtTdosZWqs74+WtnXNFbhEKuDMt/mtT4TJT+WAhVd39J8E
FxvRzYrJyskJmO9d4qqkhvwgQorxo/4xrtlV1F+sYTlDAEOcJTs=
=MHQ+
-----END PGP SIGNATURE-----

--dtq8rxI/m1Pzd9kE--
