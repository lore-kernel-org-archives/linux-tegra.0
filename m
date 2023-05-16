Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C014AC77B75
	for <linux-tegra@archiver.kernel.org>; Tue, 16 May 2023 21:25:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbjEPVZP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 16 May 2023 17:25:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbjEPVZO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 May 2023 17:25:14 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 681A861AE;
        Tue, 16 May 2023 14:25:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 025C8632E5;
        Tue, 16 May 2023 21:25:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8F62C4339E;
        Tue, 16 May 2023 21:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684272312;
        bh=1umulZdDiGPUWQvj0v589IQrQVVVOdXVeNxrMO+6g9Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=F2LFJuhNA+0Wt4PzLYktclr+g/uugoI+BBddZfscUi4cfmmhVFJBqSbDbOGXMc2gA
         hIj1cLID36tY04YMPnAU9diyg34zpmty6gQKiUcdtj9u7QqGLVYUXJU88dY0vq8+kI
         rquoBg1PqbgRD1OmSXgWUqfcCnC7trrs7sl7OlVbPrTYmaasRf4HXx03roQuhmtLiS
         OVYcKQIpsmfyMNFssMoLqeLIcisBfUVc3GKQNBl/s60oAVtXSQcITu3nP3nx/MXvyf
         ZnaCZbnb4hp+oL6kqLFdER6gXpQ/F37uzTndoupjm5ULBy3Ly+rQVnapxmqUiz4CHX
         z09d4ZKTqg6+g==
Date:   Tue, 16 May 2023 22:25:08 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: tegra: Document Jetson Orin Nano
Message-ID: <20230516-tapering-drivable-f92a7c7cfd4c@spud>
References: <20230516095850.2426604-1-thierry.reding@gmail.com>
 <20230516095850.2426604-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2ZB8yiEGFrw3P+Hz"
Content-Disposition: inline
In-Reply-To: <20230516095850.2426604-2-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--2ZB8yiEGFrw3P+Hz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 16, 2023 at 11:58:48AM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> The Jetson Orin Nano is the little sibling of the Jetson Orin NX.
> Document the corresponding compatible strings for these devices.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Thanks,
Conor.


--2ZB8yiEGFrw3P+Hz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGP0tAAKCRB4tDGHoIJi
0lQzAP4kNVgMa4XP33NuO/L5b/k8AYM62y/j0zdeM30qkNjb8AD9FMX4bFKiIzVf
bd/qFZGxT4UhtykWrrkfiY2FNwmTlgQ=
=OJ6u
-----END PGP SIGNATURE-----

--2ZB8yiEGFrw3P+Hz--
