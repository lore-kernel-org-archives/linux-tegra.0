Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6FF5FA373F
	for <linux-tegra@archiver.kernel.org>; Mon, 24 Oct 2022 15:50:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231137AbiJXPu2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 24 Oct 2022 11:50:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231180AbiJXPt6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 24 Oct 2022 11:49:58 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A07884E4C;
        Mon, 24 Oct 2022 07:44:02 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id be13so17098441lfb.4;
        Mon, 24 Oct 2022 07:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wws1mMsw1YTMQ07RWYoDX9a2zbpveRVrUCZRq8Irt44=;
        b=L5fKDtVhEkm5VuHoIQMPZVmW/6RT0RdKBCsWJZPWo72q4MiqBBhz0lsm+H2wqmN+Wo
         uVlhirH42xxioqvZZMoysd+uSMDXO+aSSuoM4xq0V2ZOQPdns+tWxRrmKiuGWNm6Ad6q
         8o4kOFTJDIHZHQIaVy9nvjJZL6WeDSz4BpGXuZbBv3ZQrd1RRrLu1ihxMaYXn/ZRoQG7
         KwgbuKt/SD8CbKinQ5WIBVBtgovF9RqKoxOfFi60HvY06cfhrrPKFzxRZ6oaatRv+3uZ
         m+53KkPx+F3+S6xXOoT9T0QGQA8tYGCtkVzlT2pufwYgW93lLzR+qcoPSbyHKeDlSoHE
         eP3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wws1mMsw1YTMQ07RWYoDX9a2zbpveRVrUCZRq8Irt44=;
        b=KxDhUlMqFTdsIOQOUTfME328sOa7pPKmUbFpHHT1uh+rWaOTHEaPiS3BjsFAzJx2At
         oFmTAfz2d+cgguq11+oKSLGyU8PE891AdBlWkea0bHZmEWM6wBNa91oODmQxHdY8NDyJ
         MhJ14iPHMSR9/jGHwAV/e8ngSvOGLZ3qvdqBAQJA2pKdGJujPZdqmBPghAg0NC6XeQfi
         +d5xx9NqtITEhd1FKlLp37DqGizHZv8v3mwg/NpaqiUlfss5qwbxaaH8NYYnDwaFUCdC
         J1fWTlohRe+cTTntmTOMQA3fN7YGFJNUfVGpgRnZMEjGcP+ipCrAOCfYtsRg1Q/WIw3g
         iz7g==
X-Gm-Message-State: ACrzQf1yx/89ZThsRxSmCya0EvzjAPRLE5SFLzjGMODnPkCyo905f5QS
        4s3PVMDVp1D38SDJSwozdp3sfad4if0=
X-Google-Smtp-Source: AMsMyM6MTSRabFAETglS/99cRnW2VgWqxf1NIFxBpCoO7tYNP/1T1A9FyjUNrY7f7nyEJ7xi4TWQZw==
X-Received: by 2002:aa7:c78d:0:b0:454:fe1d:8eb1 with SMTP id n13-20020aa7c78d000000b00454fe1d8eb1mr30716463eds.59.1666618396989;
        Mon, 24 Oct 2022 06:33:16 -0700 (PDT)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id la22-20020a170907781600b00779a605c777sm15700935ejc.192.2022.10.24.06.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 06:33:15 -0700 (PDT)
Date:   Mon, 24 Oct 2022 15:33:13 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] arm64: tegra: Remove unused property for I2C
Message-ID: <Y1aUGd3mcFBGghRV@orome>
References: <20221019131613.145999-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="WfiwGyo3MHxVECf3"
Content-Disposition: inline
In-Reply-To: <20221019131613.145999-1-jonathanh@nvidia.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--WfiwGyo3MHxVECf3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 19, 2022 at 02:16:13PM +0100, Jon Hunter wrote:
> Commit 156af9de0932 ("arm64: tegra: Add Tegra234 I2C devicetree nodes")
> populated the I2C device nodes for Tegra234. One of these nodes
> contains the property 'nvidia,hw-instance-id' which is neither
> documented or used. Remove this unused property.
>=20
> Fixes: 156af9de0932 ("arm64: tegra: Add Tegra234 I2C devicetree nodes")
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra234.dtsi | 1 -
>  1 file changed, 1 deletion(-)

Applied, thanks.

Thierry

--WfiwGyo3MHxVECf3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmNWlBgACgkQ3SOs138+
s6EXJRAAnErKNFLH5ZELdnJhbUkQg0RvgQGNsDNyhmzbffyu+aDoQmC3PL3nVQCH
xqAoa+1BlpNXoGnMxhdLKa1lSmv+nL/4ufs3gpyQIS//RCFrA5rOYEqDmy/iHRtz
qg9Bws/+YE49z2srbgb5gckqUc65YLrdZzq3MVcHDq1yNp2eRqK4onxTUP+qJ6Kw
qKnde1VLLfopoPtRdaSDcx0zzEzAlMbUSL1Sep/s7MjN4l/1fdFKWdD4j7V7cHPt
w92sSHjIu40l1r7jiyTTAVUCilnTnZRBFRmHi+oDWpgG0GKCE5P6n7+6x0rIUj2R
Wyh1EjJY4U80NwEHsraCPvhslFgzSTvDfc0TevVTtUynDykPU0d8JjLtnk5/fGfK
HM670MYtoZUf5Hm622bcxbDvdu1VuMUCLESYXXxbCQi+VzJpvEBdai4YqDAQvkiJ
hp+R3dgQXypoGs57tm3o7i2j79/zNdF2aGDpRxoflr9wwhkczhvyzRqpvV+W4qTh
V9mTiadtY6gPsMlVQJ1SCcnlPh4gNoR2Ibr7PFCbjTCdlkrQiHX2FFn6m6ATUcE4
a3gRmpnP1ZF+ZcaOWFbaktW/Qeu3mAXmtI5ja7ZNOPph6xTNfDgSyhVivEj0ssui
zvFdWoBY2i7zHtzb7WaxH33OXRRgCVsOLzLcEzJxiXqOss+glFI=
=WjFU
-----END PGP SIGNATURE-----

--WfiwGyo3MHxVECf3--
