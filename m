Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28D38C25B4E
	for <linux-tegra@archiver.kernel.org>; Tue, 24 Jan 2023 13:59:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234008AbjAXN7H (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 24 Jan 2023 08:59:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233977AbjAXN7G (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 24 Jan 2023 08:59:06 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AF616A72;
        Tue, 24 Jan 2023 05:58:44 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id x10so18346057edd.10;
        Tue, 24 Jan 2023 05:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kv/V9kv4Qw9mC2y/3NXDPgWh5KFLMZhP18StRaLsMf4=;
        b=b0vq3ki/oZelrGO9npP979eibsIhpgngEz5mupo/2q4r8Vj8F7wwfjBJ6CACjn326I
         qZdBmve63Pbq7rBilsqZSckVCbWV6aUrg06xQsz9El2ncmrDAQRWG7d7PBZPP+rWZ4GI
         Es6Qmco+yPtDnJikRshKCYId9fumCtdcjusPTt/rPjgKKP4Zj/A6T0N2Jg5uJcqbcaUp
         1FpbOiMvj2i+igLlTWbuq+WV8AYZqFqLZQgq7Qgadh3L76NJRFxXsXykkEJ4xTckXbzp
         /7Y89Bs4SvQPxnGZAGo8aTFsklt6XyIw7TfaKxc45fDdrIstBUdSSfx3nH6KKdHq5ffe
         IURg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kv/V9kv4Qw9mC2y/3NXDPgWh5KFLMZhP18StRaLsMf4=;
        b=2N4n63Qh6yKhC5hmBGl0+Llo2VMjFkbxhwfVi0p86d7DpkFQc3TIJVl3u+lwfH17KV
         zLEMVWe66yZfMLaYsYpMI3BF1EV7wnU8Ihw0ikceu0v26c+grNOOQszHzUkalGKWRzh0
         wXKLz0C4J9Xx8GPNnq3Y4gyNbKuUkLumHjud6YEpYOkUbzdEVDQzj03h5s8hzQf9SWc2
         Xhk08tJQPiKaCjBOiPha0jaS9FoDJRcXoMZpFhtKZ1GOH6kRJ6d2cy6i+OSgczn6Tv4Z
         gz+KXYJwayS6vj0X6njLrbhMKzXm1dFQSqZPen9QUFQJdKZZe8TZAdxvSpx5Plxz3DBI
         ii6g==
X-Gm-Message-State: AFqh2kqLztXwcdJOyDFCfpMQKDhNDI/xKvYXQO8z5mEowOYBeShP39zQ
        jBjuPZR92MangZgye9Hnac+3VeenfCg=
X-Google-Smtp-Source: AMrXdXsTRK4FHr6YPLwwx8BuQySB5cl7aj7yFsFoSwziEghuvhO5WTueiVhh0ThM0KcOz/KEmslTRw==
X-Received: by 2002:a05:6402:28ca:b0:499:c294:77af with SMTP id ef10-20020a05640228ca00b00499c29477afmr30148755edb.12.1674568709837;
        Tue, 24 Jan 2023 05:58:29 -0800 (PST)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id fg14-20020a056402548e00b0049f29a7c0d6sm1080282edb.34.2023.01.24.05.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 05:58:29 -0800 (PST)
Date:   Tue, 24 Jan 2023 14:58:27 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Wayne Chang <waynec@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH V5 3/5] dt-bindings: usb: tegra-xudc: Add Tegra234 XUDC
 support
Message-ID: <Y8/kA3mx5dS+RuKp@orome>
References: <20230119104208.28726-1-jonathanh@nvidia.com>
 <20230119104208.28726-4-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="FmDma+W0yLXwjQ0o"
Content-Disposition: inline
In-Reply-To: <20230119104208.28726-4-jonathanh@nvidia.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--FmDma+W0yLXwjQ0o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 19, 2023 at 10:42:06AM +0000, Jon Hunter wrote:
> From: Wayne Chang <waynec@nvidia.com>
>=20
> Extend the Tegra XUSB controller device (XUDC) tree binding with
> Tegra234 support.
>=20
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> Co-developed-by: Jon Hunter <jonathanh@nvidia.com>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> V4 -> V5: added Krzysztof's ACK
> V3 -> V4: added 'dma-coherent' for Tegra234
> V2 -> V3: nothing has changed
> V1 -> V2: address the issue on phy-names property
>=20
>  Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--FmDma+W0yLXwjQ0o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmPP5AMACgkQ3SOs138+
s6FppA//QL+WaW89i4HER+s9v5hw4IfAYDsV73jDV58DKm5CsU+cP2WcPVirrZRQ
Gp07jaY8CbZOgXHTk//XHb99tGEtjDMhpI6XONr1vyOidHRW39Y+whqIzPx8dC5o
ztbhUNKjsdlYFiNbXDE/PAQdxHsScuokGA/OnNV1pyiIplsdd7cNFtsD0NCEhbCS
p5+5CPm4x8ojFhb/ZnPEygYAJll3vItC5eyxWaYPLev91Hr/4+uogG2VC/egVkx2
nx0FjPep+l48fAKyhxtgROkyjBabShrtk/PQ+gYq+zTWfotIaGMMsdscwMWIQWVn
jXX7KJ2eBSUSYNemo6OhDU1Zhg1FggyQzmi4A6KQgKKYdiVvB+dsn7sXjD1GH8y5
igaGmwtcOpKFhI7R5oFl4BofKTUo6K4Dil4r+E83nElmbUAyZTkksf4x4v6S3bF5
GrMNOhdrjY3Twhg/mWR/7L9jhsDEk2DIH8h4Df/CyqWRVFuqLZHLGL8mShsOGN7m
PhlTlQjnPb5oHTxGEJZBUD1ukXAckNYyIgwOqiW2pvUy4J80rdQj+KoZVPogkBuB
zITfDU7Lqckj5WTpJzy12Bpx9BSQNuFTSrmC9hPcopOXbbnouMup/sIOEK0Mw+C0
pxLRti2RsZuG7QscBj4VAP5Io8Qq1BVCcpH3a3nmPJkl2cb4e34=
=vkP7
-----END PGP SIGNATURE-----

--FmDma+W0yLXwjQ0o--
