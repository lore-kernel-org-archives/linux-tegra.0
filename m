Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3B78C433EF
	for <linux-tegra@archiver.kernel.org>; Mon, 11 Jul 2022 16:42:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbiGKQmF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 11 Jul 2022 12:42:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbiGKQmE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 11 Jul 2022 12:42:04 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D62FA31DD6;
        Mon, 11 Jul 2022 09:42:01 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id l42so3287768wms.5;
        Mon, 11 Jul 2022 09:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=GofJyRq+7UKvjzex3/aHo9ZdBlG+JkNJZR7LPnNErW4=;
        b=OQsKTTvwz5VL4MTTg1nFYNgXCoiYbvTATCO7IqBAC134ZB1HUYw5P9Vh7mi8WXnCB7
         Jea9oQ777TYbMBDGDqSWwi8sddRL3FEY0luOUISZWXNgCNwaufnu0x3Hm+KIJngVJA6L
         Ek58IUXVYE9M2MJwNa0euNMx1icVMAcIJXP0q98QVqemkhXkMzrOWaz4MQO2x2KT9uto
         0+904hLjE4j/FuKXwgJB5MbkwIok1k0Hd073JlVcXIi+3ywCwnojgiiUjvHjU8NWR4i6
         BvskR1xpI1Xjv0YbUEP7AE6ytLyVtHCYnNNPINNC7ZT3WSLOwKQrx9rX6F+FMnarftFV
         CGuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GofJyRq+7UKvjzex3/aHo9ZdBlG+JkNJZR7LPnNErW4=;
        b=NKTYqFEQXCUhLvlzZ7omnEaXqpUZ+GOMMA0MyNLx1kZBJNE/GNcpePVPj60oPc1nOf
         ruaFUVRwIKwjuM6eI+sBNqEEo7Ng6vZWBUcCiapN2GgWShXfO4BB7ZFbwWbK7/xFLLVW
         SdKl5KMx1Wz1ezwYIKi47A2xl0ZaYFQn0wSnKt1uoMHdOyiuvChZzAcPd5KflOQrWIci
         1qs5EwcnvUFlJxm6lvI5ypfHCII8L/xCLx3A8M5r67U+8s7zGyL01d++1B7BqjNqjcCN
         tFd6pngKSaAOrKDylm2DeeectyZepnGUR4GypRzY8hEbmILWzoFDDH58ohu/7eX6v1KC
         iMHA==
X-Gm-Message-State: AJIora8LSfVwmmNyxEekUKFpcPs7h/UmW9AQprqc1EilI5kTx1jwTFQ6
        O50veFVvzPon/zBI3qvgZQ4=
X-Google-Smtp-Source: AGRyM1tei6azboIakXEmm5PE3FtrEj2QyNFB3IOsCPT/joGHELh8IAnw0PR3wDRMkIoCelop9hyfEQ==
X-Received: by 2002:a05:600c:2258:b0:3a1:8cba:646 with SMTP id a24-20020a05600c225800b003a18cba0646mr16947518wmm.7.1657557720410;
        Mon, 11 Jul 2022 09:42:00 -0700 (PDT)
Received: from orome (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id n68-20020a1c2747000000b0039c96b97359sm7098795wmn.37.2022.07.11.09.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 09:41:59 -0700 (PDT)
Date:   Mon, 11 Jul 2022 18:41:57 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Francesco Dolcini <francesco.dolcini@toradex.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 5/5] dt-bindings: arm: tegra: Add missing compatible
 strings
Message-ID: <YsxS1ekvkMYA7MDV@orome>
References: <20220711152020.688461-1-thierry.reding@gmail.com>
 <20220711152020.688461-5-thierry.reding@gmail.com>
 <20220711153643.GA212710@francesco-nb.int.toradex.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qGK2vAVnkH1b9S8B"
Content-Disposition: inline
In-Reply-To: <20220711153643.GA212710@francesco-nb.int.toradex.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--qGK2vAVnkH1b9S8B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 11, 2022 at 05:36:43PM +0200, Francesco Dolcini wrote:
> Hello Thierry
>=20
> On Mon, Jul 11, 2022 at 05:20:20PM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > While at it, also fix a typo in the compatible string for Apalis Tegra30
> > v1.1 evaluation board.
>=20
> Appreciated! Maybe you can double check the Apalis change? I cannot see a=
ny
> related change in the patch.

Heh... looks like this was already fixed by David almost a year ago:

	commit 55c21d57eafb7b379bb7b3e93baf9ca2695895b0
	Author: David Heidelberg <david@ixit.cz>
	Date:   Sun Sep 12 18:51:20 2021 +0200

	    dt-bindings: arm: Fix Toradex compatible typo
	   =20
	    Fix board compatible typo reported by dtbs_check.
	   =20
	    Fixes: f4d1577e9bc6 ("dt-bindings: arm: Convert Tegra board/soc bindin=
gs to json-schema")
	    Signed-off-by: David Heidelberg <david@ixit.cz>
	    Link: https://lore.kernel.org/r/20210912165120.188490-1-david@ixit.cz
	    Signed-off-by: Rob Herring <robh@kernel.org>

Clearly I have been carrying these patches locally for way too long...

Thanks for noticing, I'll drop that comment from the commit message.

Thierry

--qGK2vAVnkH1b9S8B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmLMUtUACgkQ3SOs138+
s6HeVw//XDUarDlvko2TJkP14gtSVsXgQNS3QLW9oMYanUPm9KpSL1aXIVy/KbC+
by9C/Rf/dyqr51sQqdVrNg0LBwpO8140Y41syszYyuup9psg//tH5u+EMyCwv+Bz
JQqWbJz5yxVk3ocQkv5KnytmT0U/JNPbUBPPznnKd93kuBVvtekhXGpS4siRLAF8
EMcx4ocVscy0S7ej/JHBMrNpa2j0s9C9ve8w8+haP3LiTid+RYkewtgM40F6OILQ
8o8uKthvMd5FWPESyFkc32LD5zTdJICODiMSI9Ebt4LPVlhUQXX0M8bY3uSyVRjM
hkVsYlIwdm6Og2PLoYTxUbh/EMtlr+KQQnzQ/f/VMM933XA6IQvMcHav8MXTHfKY
dL0gGk+b6p75MMpeg+heFvopE+zjLiA+qaOhHqhNZs0zgdJWlWwSJecCMh6nOfQm
zbJVPK8UF9ESdA0hbqQ8/FTJ1gOf2ZbHA5kF8TZX2O38IFrmktyhe+NK4zHN9/WX
FZDEXr6lWYMo2k69qCMSBtl3SDgzDCtC4NPnkZ/NKDLo8C/JSYl/cxro3Cbbp4df
GyOQJHyJcq4qplTrxhGo1QeDmeNvJ89I63Q0FO0n/3lU4L07UDDIIFdzJxzESFNL
yDpBasqESR2uyvyC91GCSs0I0T6zbiWOMwyPH5BAZK8LbiUDJSA=
=2WJu
-----END PGP SIGNATURE-----

--qGK2vAVnkH1b9S8B--
