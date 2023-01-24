Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C33CC25B4E
	for <linux-tegra@archiver.kernel.org>; Tue, 24 Jan 2023 13:59:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234111AbjAXN7U (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 24 Jan 2023 08:59:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234173AbjAXN7N (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 24 Jan 2023 08:59:13 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4236458BA;
        Tue, 24 Jan 2023 05:58:50 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id tz11so39310028ejc.0;
        Tue, 24 Jan 2023 05:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tyS09iPK0DCYeu1k2np/Lw2q5U8sfGkE7o+j/ZBbbEk=;
        b=hSXMxqIUVw0YXLEHAnflcYzGaJVjbxV4NQamcSVrGsQ1mTw+cbiCbG3rRQBj7tRHcp
         yC+t1RJpsL8lAm2fHl/MHrxT833aOGHp9Mz95pmI4IaqNbTTeXnSNGTMOYOcktfHdakn
         kuGhQRJ29eii7k6Adg+mRxppLuw3P7K2+Qi+IimCoTj2TLr7On55DE+6hUB1XHOVO5ej
         pzi0FjkH8F6mZhuYfjedFB5eQZwqV4ymVbBN5xTOgg6lRycaRcoNmn8YBzM3VOSUPslL
         2p/oXTlURzXB+arTIWV6wnGw+6lb9zJZWeptF5+oTB/BU0OCzpPw9qmLFqk5/KFtInWs
         J81w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tyS09iPK0DCYeu1k2np/Lw2q5U8sfGkE7o+j/ZBbbEk=;
        b=gjVaCuveWfzzJkd23ALWenyxtvIYM4rf+Ox6BUmXzhWFB+X18K8hOlX6wOpt6Rtev7
         hxaoJPfldlg6+dU9WewheR11eY5x6fcwoOvZqjqgwpEmEVsZFR1P4i1LdlBzBPbfjNt+
         RNUiIAbuipUKvuFPeCHFT4gBtgkPOkzLPn6PVE7Pfrvtpju34WinoZzklG5LRzi7sl1d
         TBq2ZY3agidx2jMNTIAu04JAj4OblPSUDeE3bNbUGRDkIFg8p/uce53M3YdPmoZLYyt2
         lb2oOA4Unkxp8c7CkhytSu6vJShd9yHBD9VAJxE0xavhUqQVs1kcoWHAkVNJy1mSGbJ8
         qT4A==
X-Gm-Message-State: AFqh2kqBJlsgQS4x3X6crneuPyXfFueExfq/CLUU8Diq/asoP5PWqL/F
        Lyor/eam+1d6I9FMIl3eyZTNMSPQwiA=
X-Google-Smtp-Source: AMrXdXs9x6lO7pLRpVdQQlG8xcWqKVa0Z5bVOV6s5bdZ3jagKcjIg7Bc+TBoGhyzB1xZjrkGLXjcfQ==
X-Received: by 2002:a17:906:762a:b0:7c0:be5d:59a9 with SMTP id c10-20020a170906762a00b007c0be5d59a9mr39013379ejn.20.1674568728913;
        Tue, 24 Jan 2023 05:58:48 -0800 (PST)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id v1-20020a17090690c100b007a4e02e32ffsm945743ejw.60.2023.01.24.05.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 05:58:48 -0800 (PST)
Date:   Tue, 24 Jan 2023 14:58:46 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Sing-Han Chen <singhanc@nvidia.com>,
        Wayne Chang <waynec@nvidia.com>
Subject: Re: [PATCH V5 4/5] usb: gadget: tegra-xudc: Add Tegra234 support
Message-ID: <Y8/kFh1La2p0uYAI@orome>
References: <20230119104208.28726-1-jonathanh@nvidia.com>
 <20230119104208.28726-5-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tv4pc/YfO+eURpsY"
Content-Disposition: inline
In-Reply-To: <20230119104208.28726-5-jonathanh@nvidia.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--tv4pc/YfO+eURpsY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 19, 2023 at 10:42:07AM +0000, Jon Hunter wrote:
> From: Sing-Han Chen <singhanc@nvidia.com>
>=20
> This commit adds support for XUSB device mode controller support on
> Tegra234 SoC. This is very similar to the existing Tegra194 XUDC.
>=20
> Signed-off-by: Sing-Han Chen <singhanc@nvidia.com>
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> V1 -> V5: nothing has changed
>=20
>  drivers/usb/gadget/udc/tegra-xudc.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--tv4pc/YfO+eURpsY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmPP5BYACgkQ3SOs138+
s6Gfcw//bnh2FIbYTcyAxHQPZAYQLo2296iB8u8nUhqjHIbIH7scC1KyGQ8IpEDR
oWw2yvkBY5Kf5Da6EptK8JhEBsqAURXHm6H143mDpRUU4Wq+hrZj4jr90/6kkFGY
0qW3ERQS3pVhGZvmMUdqlfg1zPBu+mZcxOujpYILR5h5sIkf7eTDuKSWj2zB4HAY
EPTwwvW2S7HlCj8pWPjQH+iPwNSCH2UZldAbZNMrwMj7iknL4hgQemFN76YygmOT
aY1R3n5x+dISxUi/iYZuX6Oz/a0FGByJIb9awp57v/xzA7QBscYC5/Lh7knbTrtj
/gAvt9eP2x/VHIzAzNDuqCNr4eclgPoIx0S67gV6HAqCDtu/x/MmuX/2j05g3Sa3
qZwLlPiwNamqj63tnszn5cKz9LAfyLycRQYLMmIUphW5goNortB0rD0TyAig7QOH
PLtDy9kQGLdBaG2OeUoHVK8Op4O6SUuKHPiyjUSH8FqbN+v1XMYUNYpNVWQUNNr4
+yQIn9l0GtLR6/5ck58qjEQU8kihTTUbjtGz2vguzaHhyITDw/vsiz3vn2X76vsG
pI94ER9JjDEyOipeILgfE+myQf6MhzZ29F6kKcWplkaOME5s7zYsL+VR5YVvjRcl
JfsEV7a3DXsUgCy/KAFMtZQGLuD0S5AyB5OKvOkmlkPCjyEaNQg=
=z+Kl
-----END PGP SIGNATURE-----

--tv4pc/YfO+eURpsY--
