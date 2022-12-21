Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FD97C4167B
	for <linux-tegra@archiver.kernel.org>; Wed, 21 Dec 2022 09:19:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234515AbiLUJTB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 21 Dec 2022 04:19:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234544AbiLUJS4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 21 Dec 2022 04:18:56 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EF51193E9;
        Wed, 21 Dec 2022 01:18:52 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id jo4so26415073ejb.7;
        Wed, 21 Dec 2022 01:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kcMzF+WmuHMTMDvAuOKuZ35XY2hzq12Zyc1lbHQpmGo=;
        b=jyKo1uRyktfPU6rKblpJPWQnKnogGjABlhGN0Jn01hjh3UOCtE7PtKCERFZoAQACjv
         3fa8d+3nqEmoPGBknMYy3MIO5WTcGgVueqCvzbtgA09klfhRKY7au/Z9d8U0yuDm4Q/G
         cyfkwWfVIQLqLLE0nLmXAbrsmv6Su/N+2efdaioNJfeqKJWLYjFIloNxyJCfPeKJQKOe
         5vqOClNmae+p6mS0nBGNauRqt1o4LF2hK7L07felO2FpPAmv6T1yoKKxT4VCmd9VZa22
         hyx0R0j0U5+fbh+6AQy82QrWYC1i3B9AzVS2Q4xuwa+A1VVTmqLg8Qe9Ds+fKUrsLdMp
         Wjdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kcMzF+WmuHMTMDvAuOKuZ35XY2hzq12Zyc1lbHQpmGo=;
        b=NgdHIJJMU2rjx5y4wtzlAmxq6Zj9udpH4vNkVl7wljPz+b8l2ZCEaavPg2RIM65+Wa
         3n6B/RxhD6ZNQWDNusP1eEoVpfkiMOyxXIkWnwH1CvPkeKpeD3ushejcfWLDw4wkjJDV
         HIubVDBEHk3awgyvWyfPypqdfzN2SYn4eEScfbE+7YnqYvB3kGi6xmQLNjo3W4H98rdp
         0Bcu7IawjaQQaFPMpYdiU4mJF3VK+xX1xiuozOO/GH6GOTxZH07GppXQE1xkH7WXcc2e
         /58CztJcbBqwttYgQu2HA88FCGhWut+xnP4wPL47uiOQrafLF14mqpOqY1cv0we3UWAx
         gYSA==
X-Gm-Message-State: AFqh2kp7JobxwMBLHbhg7HfHEt5T2t3kdkU4mMnmSvSvpVDjT74QUmcD
        PuOAzCDn1ASm0KVI4VM/IT/zJpO8NF0=
X-Google-Smtp-Source: AMrXdXsulvB6x9a5oKB/oA4DuERlCElQtDtT5DM5P+JL/Eiru0zIVrFLCnJSdXDiQQaDE0u5Bv1RcA==
X-Received: by 2002:a17:907:3ea1:b0:7c1:7f84:10ac with SMTP id hs33-20020a1709073ea100b007c17f8410acmr1160690ejc.33.1671614330992;
        Wed, 21 Dec 2022 01:18:50 -0800 (PST)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id k24-20020a17090632d800b007e0e2e35205sm6842373ejk.143.2022.12.21.01.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Dec 2022 01:18:50 -0800 (PST)
Date:   Wed, 21 Dec 2022 10:18:49 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH] dt-bindings: usb: tegra-xusb: Remove path references
Message-ID: <Y6LPeU5uVDuCezXD@orome>
References: <20221130154111.1655603-1-thierry.reding@gmail.com>
 <20221216174034.GA2986753-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="w4D87bXtqw+lG0J1"
Content-Disposition: inline
In-Reply-To: <20221216174034.GA2986753-robh@kernel.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--w4D87bXtqw+lG0J1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 16, 2022 at 11:40:34AM -0600, Rob Herring wrote:
> On Wed, Nov 30, 2022 at 04:41:11PM +0100, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Unresolved path references are now flagged as errors when checking the
> > device tree binding examples, so convert them into label references.
> >=20
> > Reported-by: Conor Dooley <conor.dooley@microchip.com>
> > Suggested-by: Rob Herring <robh+dt@kernel.org>
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  .../devicetree/bindings/usb/nvidia,tegra124-xusb.yaml     | 4 +---
> >  .../devicetree/bindings/usb/nvidia,tegra186-xusb.yaml     | 4 +---
> >  .../devicetree/bindings/usb/nvidia,tegra194-xusb.yaml     | 8 ++------
> >  .../devicetree/bindings/usb/nvidia,tegra210-xusb.yaml     | 8 ++------
> >  4 files changed, 6 insertions(+), 18 deletions(-)
>=20
> As this is the only binding issue remaining in Linus's tree and it's the=
=20
> only thing in the Tegra tree, I've applied it for rc1.

I was waiting for more fixes to come in before sending out another PR,
but nothing else showed up, so taking this through your tree makes more
sense.

Thanks,
Thierry

--w4D87bXtqw+lG0J1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmOiz3YACgkQ3SOs138+
s6HZhA/8CEEXxmDBtXgd4WS3cSXenLk5KZnesS+el0VyZ/srSysqosP2SvjjIBSU
VkWP2EodgYrEFFQHfXKGijQRxTHfwoy2FbYeyhtgKK8DnIM/YQQD2cqqWRPY8AWQ
6prw79Ir8uSuxnX6w0hinkwUfWek2VRGgBJ51rOoWOeaD6pDHokMg2HO4P9a4pHl
pSvhHYsIrL5FgQJUDZoSQ//ZqYtQeLzlccs8926xA9QnwWgWSE3JKkJbVdAUwgQF
GjV+Cnb0Kx/NHf8LtxbqxbxgPQ6DZW1+fb3adsCiChA/K4UJEq2Wn7U3TEESjbia
wW51ARWfe/srPq4G7q8So/nAhtu8o8nSlHecKR5vL609YAm+EzXdauhal2Iic3ok
FMrHVVLHEm9kORQLAC+iJJpJMv5if/mUDwbnwjl2nNbJBqaDqLtBLQrVc5dzg36r
OTCfblLS0ZtPUDPPwg7JdTHvF7DhN6HzwX++4HE4dY/zhycoTHYdyp4BZ2qpTFl1
nXjZafti+6vaZAiWWIzGZdccoH2mR+vUM9Vmc1JukwU48spcjYUJIw8AmootFKXQ
FRStsfKyk5liMrqLDfutvNo323L4x/1Q4P3KG8QbgPsNNxoYvuN8o7bmSxLTvurL
9KeufWXN9t8fsJeQJpE2607+h+UPhmnJj1LdKXrUcSrhcDkJMuM=
=NUeD
-----END PGP SIGNATURE-----

--w4D87bXtqw+lG0J1--
