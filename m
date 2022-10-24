Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5DA3FA3743
	for <linux-tegra@archiver.kernel.org>; Mon, 24 Oct 2022 19:50:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232110AbiJXTud (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 24 Oct 2022 15:50:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234204AbiJXTuC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 24 Oct 2022 15:50:02 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C09618C94D;
        Mon, 24 Oct 2022 11:15:56 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id a13so33043920edj.0;
        Mon, 24 Oct 2022 11:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XX7YiiGevtISI0XSZZMb5osn/jTMBowrI9vJR9V/T7A=;
        b=Ahsq7/pmrfp2KoGqVXZoy5NBZKbqm7VWN1fU1FMWrNnTBGWCdjNE/nO+W1BulZIcpJ
         F7CG77QLQdmggVsasOP66jRulbVV2HWk5qelObkdurv0nYW86hJHJIUrDAWRHXNZCYdD
         Wc/gKchScqlR0Eaj0tPz66EtFONYSHcw3iSfv5BXexdXgnpQ2BttKk+VvOX6xy1gBUDh
         jZIwRBo1YgLKmh+AISNGxdczpCmjqUUitA1aixioGwyfIOu1DxG5MDcL19spcr9+Vr46
         YHypK7hBgXXyUpMWtEb7TvRlIyxGfsgZT4yXHkXxSe1Y+cwfSfmyJAa9OSMPH3nV+aYi
         NQYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XX7YiiGevtISI0XSZZMb5osn/jTMBowrI9vJR9V/T7A=;
        b=PJWRdNNeIO4pilxKOvFxsMPSADxMtPazbPjR2kOnAewtigeuwkuaoQmtJ9LO4QHtwD
         soVdBT7FxUA3Z1or7v9DP7C9qSxWxfD2DaJyloDMFqpUimuMWhpGV93aS3C+uer7t3Ef
         fMoshdqOA2V4/IEVQKRc1KTJRultQ0GZl/w/4uvtWdnksQDUrt2G45ky75VUVsfegPTN
         ZItDvXv2mtCJo+SboZQtcVE3Cx/Axprd8oPuA+oAgW+iGHnIKetIQV35X92lVIdlH+ss
         bKCwi0Lv1+JtfxzBsEga1HE2pJeRDzMDLYMRp3n0hYtZAMr0ApS+9HL0/kkaovDUTCvh
         Sd/Q==
X-Gm-Message-State: ACrzQf0ssPJfq7Z2N3xxBlJb6AqZzWUqjvGeMVbrGKY2wDpSsdmtW6b+
        o3VDBEwHEczO69ecC3CJ76QU0WYJjEM=
X-Google-Smtp-Source: AMsMyM5cvHqhuapFX+2hHyIxLP375qizLYhAMFBowVkQdXgh5rljsTJ4VXgwPUAZtVjvYG/chFwEJg==
X-Received: by 2002:a05:6402:2813:b0:461:e7bc:560a with SMTP id h19-20020a056402281300b00461e7bc560amr2301115ede.340.1666619119953;
        Mon, 24 Oct 2022 06:45:19 -0700 (PDT)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id k26-20020a17090632da00b0078082f95e5csm15506063ejk.204.2022.10.24.06.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 06:45:19 -0700 (PDT)
Date:   Mon, 24 Oct 2022 15:45:17 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] arm64: tegra: Add SBSA UART for Tegra234
Message-ID: <Y1aW7R/Yb440/fey@orome>
References: <20221019144700.170361-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ZO0HNTfB+6/jabfj"
Content-Disposition: inline
In-Reply-To: <20221019144700.170361-1-jonathanh@nvidia.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--ZO0HNTfB+6/jabfj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 19, 2022 at 03:47:00PM +0100, Jon Hunter wrote:
> Populate the SBSA UART for Tegra234 and enable this UART for Jetson AGX
> Orin.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  .../boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts     | 5 +++++
>  arch/arm64/boot/dts/nvidia/tegra234.dtsi                   | 7 +++++++
>  2 files changed, 12 insertions(+)

Applied, thanks. I noticed that the nodes have become a litte disordered
after the P2U nodes were added in commit ec142c44b026 ("arm64: tegra:
Add P2U and PCIe controller nodes to Tegra234 DT"), so I sorted the SBSA
UART node correctly and then reordered the remaining nodes correctly.

We should probably have a check for that. I'll see if I can come up with
something quickly.

Thierry

--ZO0HNTfB+6/jabfj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmNWlusACgkQ3SOs138+
s6E8lxAAnklCc6KaKmir/m+hgmJ334h/0FV65JsGKbVcBbJQ9rGEUBtsetO5XA5Q
uxSdOmSFOwBlq3rohi+TCuPlad8iiOfykl4qZtlIu84/a6lJSIfg2u02rHrUjw18
QW7Ywdpj2FTeQisA4c5oOx1+spp7DPdM/osLHDxTXi3Xx1QOmDx1X+kMPcU39pG8
9PqNsmxX0o9jLzxXz9NMKhw1xs5aIDRVzpk4mcopPaNH+1LnaIfxx601w+rwAzY+
q6Ws8bSmaI5HZnUyL9P1fknMJx/wXc4DM5JEE+10WtS03KX9eKtPwCQPVtEzy+P7
1HO7lX8+tP1/NJuQ+rpVgxbpNzABLuV0nzuSuIJw58ZPCzOpLMcw+VCuG7FcoS1N
gQMhTD5uI1NbLBn4vFhDsgbcej530blYInnVG35Q3X4CRbg7SsakMQIJTrHUgyKi
KfCkqIGb8ElLZMOUHb0OVAH6ZBJL8JNBV3VwawRyShyCxt+1TghA/EZSDE50eRZp
nj6Xt+HQdZ+fWIitzSMg9D3glp3X22wo69K2ta1iCAOte0Kqicz4++R6NFetxM0b
gYPg/VWJopl4cCmyBn5CwSEZWGmmmDOQtppi8uV+MyfK/q14wMF+cIn0nTiQ0lBN
bZ8OEaZ63OhaaNtKrx4rD4qIs4UeJVP0hV/ddMxPiJDdJIL0jjU=
=9Fws
-----END PGP SIGNATURE-----

--ZO0HNTfB+6/jabfj--
