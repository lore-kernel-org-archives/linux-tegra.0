Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79105C433FE
	for <linux-tegra@archiver.kernel.org>; Wed, 23 Nov 2022 11:33:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237295AbiKWLdw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 23 Nov 2022 06:33:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237147AbiKWLdf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 23 Nov 2022 06:33:35 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82C03FBAAB
        for <linux-tegra@vger.kernel.org>; Wed, 23 Nov 2022 03:33:33 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id f7so24435868edc.6
        for <linux-tegra@vger.kernel.org>; Wed, 23 Nov 2022 03:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SzLQWYzwDc/zuOXIznr0v/HidZjKEnivIgiwSqbSHmg=;
        b=TqD5t5T3SYYqxFldgxw3OvbO67Q1ZCe7qaGTPjfCXBNUg1Ha2lcx3wnczkBaXkhpFU
         nJdSMCHeSW6v9dgziC1yBPggPbOwtY0Sqbekuoke40Eoxxcta3f+0CEv9YFTUdiEr0sX
         P9VBZuyDzGd3kUJ91xOPVYUogT3tVXqJLAAyak+aWulagpm6U9EbmniI24U0jCA0O6RR
         4d0WxCgmOjPLrkUZ1tPq/7vj+WjiJYqtnIsUf0TudXLCKzE3I30+muHfm8fX/nb1noax
         mWzBf4JdmF/anFSt++0ub4Xy8m72o7iT/ynntafg2iLm0yO5EkOr3BehLyUJKT/YAFKK
         sRSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzLQWYzwDc/zuOXIznr0v/HidZjKEnivIgiwSqbSHmg=;
        b=cmHN3V9l07cy2/NrjqGCYqdymkeH8J3Ifq3kOBaaGEExKipACORSWrYO62rSOlZasc
         J0fbx1TaR47LWzQKxPUf9hdW3LQ4CTg4aOTWLYB3RPnfvvmtXmCAIXoeuW4MTmCDhFrW
         MdI3Ce51VBWMz5a+iDcy9GmUHaqgcVaSarkCMZ4F9DPP7YsUdtpXJ4ODVsuc/MbtUqgp
         P45o3BPG14Cz0+bw11PF692g4Upjsj1Kz4vOwehSDKKBYXm0Xt/EKw1fMMeG9bYmC5go
         IHXdTYmrCuA5depbRVT1GkZuQN2WLRe2tM5RQCuKxLQOuA0dWziPDDJiQE1wYvZT8kET
         c4Fg==
X-Gm-Message-State: ANoB5pmF/h/HloFCKKq5nf3aqECe3IXyHUFcZ6oWjiA2aAFqcCRhmi5n
        sodlNXUxX5SyKQjUi7+9kS8=
X-Google-Smtp-Source: AA0mqf5iSEROS3LcNnKM8IIN9i2M+PDi1fqpfIx2lAZF+uaiXeo4bQybwjsnfFKch9X0Hp75ZqHgzw==
X-Received: by 2002:a05:6402:b1a:b0:469:15eb:71b5 with SMTP id bm26-20020a0564020b1a00b0046915eb71b5mr20061892edb.312.1669203211653;
        Wed, 23 Nov 2022 03:33:31 -0800 (PST)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id fi17-20020a056402551100b00459012e5145sm7504132edb.70.2022.11.23.03.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 03:33:30 -0800 (PST)
Date:   Wed, 23 Nov 2022 12:33:29 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     arm@kernel.org, soc@kernel.org, Jon Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL v2 2/7] firmware: tegra: Changes for v6.2-rc1
Message-ID: <Y34FCQ3xTmcjqKRT@orome>
References: <20221121171239.2041835-1-thierry.reding@gmail.com>
 <20221121171239.2041835-2-thierry.reding@gmail.com>
 <374ae4ef-2f57-4737-95af-b1bdfdb03740@app.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6mgO8wWChS9M+MSI"
Content-Disposition: inline
In-Reply-To: <374ae4ef-2f57-4737-95af-b1bdfdb03740@app.fastmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--6mgO8wWChS9M+MSI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 22, 2022 at 10:25:50PM +0100, Arnd Bergmann wrote:
> On Mon, Nov 21, 2022, at 18:12, Thierry Reding wrote:
> >       firmware: tegra: bpmp: Do not support big-endian
>=20
> I pulled the branch, but I think this patch is inconsistent with
> our normal approach: Since all ARMv7 and ARMv8 processors can
> run with both big-endian and little-endian kernels, we normally
> try to keep drivers portable between both ways, even though we
> don't expect anyone to actually want a big-endian kernel any
> more. Changing portable code to nonportable code doesn't seem
> helpful here.

The only reason I dropped this is because the driver is in itself
inconsistent. Parts of it use byte-swapping for 32-bit values and other
parts don't. I was originally going to fix big-endian support but it
would've required changes to the BPMP ABI header to avoid sparse
warnings in lots of places, then these ABI changes would've needed to
trickle up to the canonical source, etc. All of that didn't seem worth
the effort if we couldn't even test this in any way. So the easiest fix
was to stop pretending and drop the partial support.

> On the other hand, there are already examples of important
> drivers that are fundamentally incompatible with big-endian
> mode, notably drivers/efi/, which is required on a lot of
> machines.
>=20
> You don't have to revert this patch, but it would be helpful
> to mark code that is explicitly unportable with a 'depends
> on !CPU_BIG_ENDIAN' line in Kconfig. If you agree, I can
> add that.

Yes, feel free to add that.

> Do you know of other tegra drivers that only work on
> little-endian?

I'm not aware of any that explicitly wouldn't work with big endian, but
it's not something we've ever tested. I know that people have in the
past done experiments with running emulated Tegra on QEMU in big endian
mode, but it's probably not something that's very common.

Thierry

--6mgO8wWChS9M+MSI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmN+BQYACgkQ3SOs138+
s6GLBw/9HosNyKYV4SDWqIlX2onvjcjilJosiNzWnGWTLz1/pWb1321Y2BoH9R5J
d8I6QCF/qd5KpmswOTYjPPpgQ1PAo/90TJFG+RvgFN5dXIkyjgGMMMpzj/drUJse
bakxQ6N0fkMJ1w2vSamiwXG70ehO7iv+5AT4Npo8XGR4LSUwGXBtMcE5+NQA+iDr
+IAdIkaY9GAWlErzz5NUWBxmO55XME/6AjIpsDgt+LzNneECb1WbtuYtldeFysyu
la9aZ7rvTKNqCYaOjofqIQiv2S2w0PRdZjldwkOf4cGKUaitRrKthgLD6AI/5N+1
KkS55/kTtGmyqK66SAlyAeH+CyKImUvENLtADXnVT5wVnvrBrB9L9A/5Xf6o9Zhu
WI9FVsBOAxeT1E7A+P3rAWdVK3/r0Zo7Y9q8iOJlqMKatMXSViwCVHYoKojBp5iv
BKTVXSiBczGaAuP6+TrbSknN91z4MfGynSvj44Q3bZibmp1QstA5PgVTfVl22VTb
08bbdtQ184ULXj/E+Ut/SP3/wOacmY2ChcohPoVdZpA/j61T73j1pVjrJIErcQ/M
2CMucnqqv9BAVjxGR7N3trMdaZnhaSuINbcwH9qpYUF4R585FHANjbuqpZ3H9Lz/
ONWmFnAuhLCYHGHfm6BPh2DFMiQGfZb2PvFIsw418o/lf5jfpkw=
=JPSy
-----END PGP SIGNATURE-----

--6mgO8wWChS9M+MSI--
