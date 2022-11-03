Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FE5CC4332F
	for <linux-tegra@archiver.kernel.org>; Thu,  3 Nov 2022 15:22:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232002AbiKCPWf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 3 Nov 2022 11:22:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231687AbiKCPWe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 3 Nov 2022 11:22:34 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAAD75FA2;
        Thu,  3 Nov 2022 08:22:33 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id v27so3589771eda.1;
        Thu, 03 Nov 2022 08:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c4hUxaoIlltMyh1kRECVN8fWa254kax7h7Dn3jeyI1Q=;
        b=apo/gUXTaM65duG9bPvYsBeaMkkEt1eh6vqG9adwjowV0QP+1ZYKtRXa0uwMsg6JmM
         YebznARCLJzZbgys0z7kFPgt8p8uEl0ROpemr81enP768veAivTr3Qyzmef9N8nJyGTT
         XL4NyNATLldzkoBh3ekCLotevY1op/+VuzDYLqW0dqBydoB+v7QgCvWMGLRsPObCtz/v
         ab7ScnygSwC96Bc22E8+Sp2rnbAYONMdJdARRsIGAYKdzfw0dYSWFQK/N3R+GDWOMwxb
         8BGzoJK4liO1jFiMZ8n4QEWgBxK0hV2e6Z5ZdhPAw0Dasx3VUHegygZx+yR4SwDw8YE2
         YsCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c4hUxaoIlltMyh1kRECVN8fWa254kax7h7Dn3jeyI1Q=;
        b=y55FAFezOE7ZkPMb/Wjo4abco7BVudInLvX1KAQSnWHlsJCKPxa1pyrE1M+Pow8VMI
         wrQSZRgLAlBzMCJefEqyKXq4jNoRWn1tKXfqKgoOM7RfAy39D3ogbhPVgr6b10V+NKfT
         Jdutue+7+sLu+JwulSe1yKH/tqiqIF1D/S0BPQHyk9W9Bdkn/Ha4QBnGkXPhqSCq1nEu
         DEBTnEHOf2nUHq6Mo4UI+HBsUKzZG1qAouooNvTqHAG9bPGZ8wUdc4maztaWknrvN5A4
         iyoak6ORoGnyHMV4sz7FlJa0VHzrYh0xjrQDIdGRN9NbsTAaddEe8RhsWkOwoXzl4Ws8
         F1LA==
X-Gm-Message-State: ACrzQf2Gf2184IWNxeiUDdJpN1MFKIndwStUjRADVbaaqqOE4QbIJwpV
        pT//27UY/6WGpWgMX1pLCydp8jymltY=
X-Google-Smtp-Source: AMsMyM6wesHXaLffx0Rh0B1YQrNuPz5gFMw3OgGZSw9rjc0lLHupdZDocVcR2sM727S7iOLIWqmneg==
X-Received: by 2002:a05:6402:3988:b0:44e:6f08:ddfb with SMTP id fk8-20020a056402398800b0044e6f08ddfbmr29907587edb.89.1667488952171;
        Thu, 03 Nov 2022 08:22:32 -0700 (PDT)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id f12-20020a170906c08c00b007ad4a555499sm577292ejz.204.2022.11.03.08.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 08:22:31 -0700 (PDT)
Date:   Thu, 3 Nov 2022 16:22:29 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] arm64: tegra: Enable PWM3 for Jetson Orin
Message-ID: <Y2PctR6+8o8l7cG2@orome>
References: <20221025142538.33156-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="/GahLIfkoQQ9DEsF"
Content-Disposition: inline
In-Reply-To: <20221025142538.33156-1-jonathanh@nvidia.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--/GahLIfkoQQ9DEsF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 25, 2022 at 03:25:38PM +0100, Jon Hunter wrote:
> Enable PMW3 for the Jetson AGX Orin platform which is used for
> operating the PWM Fan.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  .../boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts      | 6 ++++++
>  1 file changed, 6 insertions(+)

I've squashed this into the same patch that enables the fan.

Thanks,
Thierry

--/GahLIfkoQQ9DEsF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmNj3LUACgkQ3SOs138+
s6Fd4RAAwgaHcc7AaTuZzgiAzQsH5fdZJHu6kV5yo8aAazlITD50hcyf7Yx9WE/h
0jWe24w2cCSr2eMCgBPCNkmofIyu0P93b6b9wVimb/reBhdjCQhfrodA4ihxWqhB
umwd6MSjFRIBcnJfgEimOsyG5SgICP2gW81pzhYNh/LwSoRexLuZYWcZF73pnWm7
UIuaNhtI8o4wbsKZDXGSb+Oy9lEqkxMeyQA9QAbKiVJfdqOaKn1Hgw0ocyHBPPPY
TX5WgyC/8AX0vx39gd5366FOkiYgcmOZ7lkfOnN8z62nnDGoEHRU4NzVWJuCCQl+
IffWUv41Fvpy+odvOIkQUV5Wt0nGfzbdXZZ67rtt+MtrvMwoOyBKEfseH18fyJ0f
mXbAUsYFKwKhkeLca74c6ASciEtMZmKMYaWIThecg8vPr1wRBNGkPm6Z6+GTw8mg
4qdxLReOfKyUx3Nrciv831XpBM1NjvaBpk1wnXqqhlenvgrkwCCKVIpQtDEr6JqV
TJ77ApYW62CRvhRBQ1gHDq+G3qEuSAEwJvgRzZhBAYuXn1EEQVwiWxWSnltBSZqZ
ZHXGiI97pLFnFC/NBS1h1odddcL53pVeOuDUdF7MU0J57H0JTcYldRDlwTl9LLLz
WhNfbf+HVe08Q4lofZv9q8Pw2U8Jpu7BPLKiz0eM0G7hR4ZNtLc=
=La7F
-----END PGP SIGNATURE-----

--/GahLIfkoQQ9DEsF--
