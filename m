Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9201C77B7F
	for <linux-tegra@archiver.kernel.org>; Tue, 16 May 2023 21:24:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbjEPVY4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 16 May 2023 17:24:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbjEPVYz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 May 2023 17:24:55 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64A2F2693;
        Tue, 16 May 2023 14:24:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 02083637D4;
        Tue, 16 May 2023 21:24:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8237C433D2;
        Tue, 16 May 2023 21:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684272292;
        bh=9/jDjihy85UlqajaaGby045IOCv8K462SucgZe6vEPI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ig9S/2NoTZdCHBXmzAfJRE2AuMG4rAxRMAs7Z8bXoxo/IEXg4OZevROdlGbGdtmXD
         PZ2mtdNbcRBgJsEzFn3rcpqNMf1OPDXRsWg0NgipCdk9oFcWqIOoI/bAuv1drUbT+c
         ysdLtQn+MgYO2TGAqy15BAgAB+vRgof5ilpFZ5j8NdeOos26Jp94PL3Fi6uiPu+r7U
         mHLhCwYuWfHWBrkBgVtV+f5R9iPxEuNmdcDS1dtanxO0DP98Tcp2u7ezvzsazN7CB6
         tXB+wAMwWuRI6l5bGspyDRFxrPPZUevK1xp6Pq6T7vshCsUyiCjQnxvYav4zpXNVf1
         y3IC3ZWIdqqOA==
Date:   Tue, 16 May 2023 22:24:48 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] dt-bindings: tegra: Document Jetson Orin Nano
 Developer Kit
Message-ID: <20230516-trickery-untrained-aa55b6084f1e@spud>
References: <20230516095850.2426604-1-thierry.reding@gmail.com>
 <20230516095850.2426604-3-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="9KZkyjGcIjIlJZkF"
Content-Disposition: inline
In-Reply-To: <20230516095850.2426604-3-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--9KZkyjGcIjIlJZkF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 16, 2023 at 11:58:49AM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> The Jetson Orin Nano Developer Kit pairs the Jetson Orin Nano devkit
> module with the P3768 carrier board.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--9KZkyjGcIjIlJZkF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGP0oAAKCRB4tDGHoIJi
0sr0AP4496LJsOeNK8QKL9dOPRtlQvyg9h23al7StSGdVImBQQEA1Qi1oVagDZHZ
vKkZWiXcUkiQW/iEnrWMGvhH/Kx4bQU=
=xuVE
-----END PGP SIGNATURE-----

--9KZkyjGcIjIlJZkF--
