Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06A3BC38142
	for <linux-tegra@archiver.kernel.org>; Tue, 24 Jan 2023 13:58:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233813AbjAXN60 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 24 Jan 2023 08:58:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234012AbjAXN6Y (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 24 Jan 2023 08:58:24 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD48245F45;
        Tue, 24 Jan 2023 05:58:04 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id ud5so39249268ejc.4;
        Tue, 24 Jan 2023 05:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C8ITfvJMUbAB9n/WNUOpYEt4kZtbu9A4WESFL60Ocvw=;
        b=ZCtu7IpZipWMzHYjJD0NrrG0vXhqkl79/l3MyZHXQK1Cs6QvbiCxwtznkmkbsqvGbJ
         jreeqva9ctlonoJJCob2KEpQjuNJfsV0epWdPYXMQICW2/osZ71WEMNLHnh4+yzFvV0S
         tn9JLmrWHSRzo3sQWlJvMyHXUGvpKRkAsxv3LaMegoLvFB74IBKM6gJ5VyYnxtIz4+zJ
         /wEGRsE7IfqbRiB1UDRtdhNvM8wmQf/ds580YLZsEwCbRboOgDWR59Bq3/DEhrFINwm3
         SQNFpNrNNBJhR5dE4SG4VSbwmFJfVP7UOcA1ET1I+Jp5dEP4oHJ1ast5WB/yjM+B5S04
         zbJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C8ITfvJMUbAB9n/WNUOpYEt4kZtbu9A4WESFL60Ocvw=;
        b=6MWaVPMSMF/8ud3UYT+INatCR2sj69juwqsSRbjtKMe23E2NiSDDb68qWaPR6lBtNI
         vYRPz42ekcX8ttQzQRNJe8okfMVWNRO/GhQT+H1+fU8cRn9L7Z0XA+WPSyHQxDox7FwJ
         eNt832cCldn0Y4OZSMQUwKEorsEMydJCfDw1twZb1h7puKbC6ki9ug5Lz1PWOv7RpoWU
         4I88riaXk1aeGn9U3+6LllxrDZWdgM3C4y8kGfJRZmGYYqDUMi7FEhdx0ImGoVCmfBxB
         WDWTNJHioAcJXhhSw1L9dwVbhAhUq5tRCU6XbeBI5F8BXq7Lah9m+G6aGrJZV8sQHmWi
         8yQQ==
X-Gm-Message-State: AFqh2kqwJZ3jyddT5fCadkljWquH7QG9YizHum01Os/iNW+9fkpnW9yL
        mPCW44ErFgz6w07Tpe6QmGaDlFrZD0I=
X-Google-Smtp-Source: AMrXdXvHVx3+V2x2vQ/cKtaZnanXiKGMRWRB+3IJ86B/PWOPlcnH+ESdWYf7R+bBQDGuUb+6lQp5QQ==
X-Received: by 2002:a17:906:c02:b0:83f:cbc0:1b30 with SMTP id s2-20020a1709060c0200b0083fcbc01b30mr30097434ejf.10.1674568662510;
        Tue, 24 Jan 2023 05:57:42 -0800 (PST)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ck1-20020a0564021c0100b004835bd8dfe5sm1090288edb.35.2023.01.24.05.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 05:57:41 -0800 (PST)
Date:   Tue, 24 Jan 2023 14:57:40 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH V5 0/5] Tegra USB device support updates
Message-ID: <Y8/j1HBwgEdd4Mp2@orome>
References: <20230119104208.28726-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lZx75aZqCyuqNaGg"
Content-Disposition: inline
In-Reply-To: <20230119104208.28726-1-jonathanh@nvidia.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--lZx75aZqCyuqNaGg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 19, 2023 at 10:42:03AM +0000, Jon Hunter wrote:
> This series adds USB device support for Tegra234. 3/5 patches were
> originally part of the series to add both USB host and device support
> for Tegra234 [0]. However, the series was getting quite large and so I
> have split this into a separate series but calling it 'V4' to indicate
> that this is not completely new either.
>=20
> I have added two more patches in this version to fix DMA coherency for
> Tegra194.
>=20
> [0] https://lore.kernel.org/linux-tegra/20221114124053.1873316-1-waynec@n=
vidia.com/
>=20
> Jon Hunter (3):
>   dt-bindings: usb: tegra-xudc: Add dma-coherent for Tegra194
>   arm64: tegra: Add dma-coherent property for Tegra194 XUDC
>   arm64: tegra: Populate the XUDC node for Tegra234
>=20
> Sing-Han Chen (1):
>   usb: gadget: tegra-xudc: Add Tegra234 support
>=20
> Wayne Chang (1):
>   dt-bindings: usb: tegra-xudc: Add Tegra234 XUDC support
>=20
>  .../bindings/usb/nvidia,tegra-xudc.yaml       | 15 ++++++++++++
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi      |  1 +
>  arch/arm64/boot/dts/nvidia/tegra234.dtsi      | 23 +++++++++++++++++++
>  drivers/usb/gadget/udc/tegra-xudc.c           | 17 ++++++++++++++
>  4 files changed, 56 insertions(+)

I've picked up patches 2 and 5 of this series into the Tegra tree. Greg,
can you pick up patches 1, 3 and 4?

Thanks,
Thierry

--lZx75aZqCyuqNaGg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmPP49QACgkQ3SOs138+
s6EjWxAAiwl3LlrF8B0u2Tsd2ejPHnkYfVryWSQsA6npc4Qwdks5Quo+LeaqJkDr
BORwAJLaFSBXbRoBfdE8DG0VgqJsS2a5Hej+kDUocMpfm6XDyuGm5QxcRvmnKO0S
HYgpt+3K2dZMLZx4Ah+XpYOsk78HBmH5ZqXtyYJTby59dtryILvHCwCgGqCfedob
wgW6khfeho+ejVsTJ9TvE7Jfy4BaqzwovOcmbNOqmRwwgeCvdsE/mpD6jBQhiE4q
TKNoUz1EsalEORT/1Op1FBgYHdKJ47O+1cJ0umuLJEXucFlpnFJFt9W9nOHyFwZJ
Y4U5ss84CNtf/LQwHPNkZTus3ITpHGb70kdEF2XeqDvPBd4rDa5fs1icplTqTvKG
ds6PQeBeKZwq9Z8je2U/WZ4d2cjb3+4vIXHWcxCjZjQqSJ9ch1CowPzpHyetQx4o
XeWsp3W+v7x9+C44KY02/G7snziCmiv6/d34ksYxRphtuHGGn+jlqEHS+2MabsB2
JVPDwztnSF8v8tOsu2/iHcLQktAiCR2hrcOD69ZcXEbS9RKnFxdHfpX6BHqv/VMw
veqR/YXY7bdVUnpeU1KTqBIce4RFOBXPwD8SVO85YjTzrT+BvuXN5hIT3Taf0Txb
aGhuA2TdwJLvH36DQNycDv8zbR6jlhRnynZioe496PAMidFvY9o=
=fzSZ
-----END PGP SIGNATURE-----

--lZx75aZqCyuqNaGg--
