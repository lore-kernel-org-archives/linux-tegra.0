Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7834C433B4
	for <linux-tegra@archiver.kernel.org>; Mon, 26 Apr 2021 12:21:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8C1626127A
	for <linux-tegra@archiver.kernel.org>; Mon, 26 Apr 2021 12:21:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233340AbhDZMVk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 26 Apr 2021 08:21:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233294AbhDZMVk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 26 Apr 2021 08:21:40 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9187C061574
        for <linux-tegra@vger.kernel.org>; Mon, 26 Apr 2021 05:20:58 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id p6-20020a05600c3586b029014131bbe5c7so1815694wmq.3
        for <linux-tegra@vger.kernel.org>; Mon, 26 Apr 2021 05:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ulhzN17rFTv8ShyLccZNWUBXUvgJ9X45n+wNPsrHQu0=;
        b=rgH47xTEG9YpALSqXF8+EKyQy82ZhhnDlKtMrfL1fHY3TT9Qv7LkPBIQowFjYRqb+a
         Fir/N8m/rUhUlfMpO8azbOPAd7z6z/3SjSrqtlSEEKQx1EjRXVrOaZ9TRH3wcx9cf0i9
         KmgS/jnd9d7WFtLrcyVsyRgOIVu6NTklAZxf9cBpwRB/TfbUz/8z2jJTN1iKioweWIdi
         5YKJGvCY8Cb/JfLsYwwDqkxZCX9hgDIuXBUzDdXFXVRA2zQRif+nZvAyBXSkLMfn0h07
         ka68X8y/83yPo62vLPFto0KuHubUeX9O8l4LgT4mnASSBQX7ECm+KhTEGao/nwQ4LjST
         urgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ulhzN17rFTv8ShyLccZNWUBXUvgJ9X45n+wNPsrHQu0=;
        b=eHpQtFg/k3PVHaz7XzeD3GrtinwwX0EI8KCdIgj9vctrziC2SM2r19TMMFGNM0YW9g
         BZ3IBoaIa2hK3FtG7whQwG5WqIlYmnASy3jg55Dwx9i/QE/NOLkuIAlBYnHfhH+ht2yp
         KWs+36rvuU8bvj956j6jiaINVtArWsSTR9qAk8B7fK2PnzWIIw0y8M31l+HvPugCSqSk
         Khj16WdLuCkyC9LWIuoPeMv4i5Fi2X6n50tkebI+3ZRjvRxqjt5Ur1e+O/s+U+7lKLqR
         iGlcYA6ydSn4Lgi/5A/vTE9+YgxICntRUo/31nv+Fwj6xeNrL/xXJMlB2d4r7MZOcvKO
         Jgkw==
X-Gm-Message-State: AOAM531guHmu3t82tGOejIejGM2r4WAEePDskdWdBDNZkAi0BSENP0yi
        QbMs96Bv9uq9Ri3yPuebeETRDSLVun4=
X-Google-Smtp-Source: ABdhPJy8OHINcd0a4dbr6xTpT4gnYmBDfBwU3UAHYIgPdSjgAZF9G9409T/O4ZBB/jYDBWJexNyGlA==
X-Received: by 2002:a05:600c:4f45:: with SMTP id m5mr11798287wmq.132.1619439657477;
        Mon, 26 Apr 2021 05:20:57 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id r5sm4637916wmh.23.2021.04.26.05.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Apr 2021 05:20:56 -0700 (PDT)
Date:   Mon, 26 Apr 2021 14:21:49 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 04/10] memory: tegra: Make per-SoC setup more generic
Message-ID: <YIawXTrsClV1gRU8@orome.fritz.box>
References: <20210420165237.3523732-1-thierry.reding@gmail.com>
 <20210420165237.3523732-5-thierry.reding@gmail.com>
 <200ebdd4-bee0-caf3-e0b6-f4ba5e55b0e6@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3s2/xHblvyO7tZOW"
Content-Disposition: inline
In-Reply-To: <200ebdd4-bee0-caf3-e0b6-f4ba5e55b0e6@canonical.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--3s2/xHblvyO7tZOW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 26, 2021 at 10:49:52AM +0200, Krzysztof Kozlowski wrote:
> On 20/04/2021 18:52, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > The current per-SoC setup code runs at a fairly arbitrary point during
> > probe, thereby making it less flexible for other SoC generations. Move
> > the call around slightly, which will allow it to be used for other
> > implementations.
>=20
> You moved from one arbitrary point to another - please therefore explain
> the rationale of new arbitrary point a little bit more (e.g. after clock
> initialization? before HW access?) and put it next to struct tegra_mc_ops.

Okay, will do.

Thierry

--3s2/xHblvyO7tZOW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmCGsF0ACgkQ3SOs138+
s6EcAg//Z8+t2WB6KSUUiP+83M+tIc2BM4Rp2X+ZyzQjnux1Yw30K7JmR0sI4Ryp
XCJANkqGEq5cTF0p9XEJV4OhPnn1qDspZR6FUV18MN804G+zoYG06FfPSevkEGV2
06q8lQupxBec6Twjub1YcypjPA6fcNcTH1Urgn+ku1SVugn0gyW82kfp+YsXaa7w
io8oeuvRPUVn50jej8QsyMzPS5fsMSNF01ZweHS0NpXBQkqPLiFgORiy7L6pZle5
/0H/yd+JksG53wRe02I8xxroTXGHlC6JArCV/FJ1UWPIJOSMSXzt9hf9s7lyrrPU
XxFbFDpYSriNBL30Gfp474CBD9kkWbMJcNh0Wke5b90mXyFlFO79BuJZu3Qjx++O
BtRwsYeh1LT201wOtqZq/GG1lS1eFOjqrm+fUAtPDTUsPCv6uMNzLGGw3hEcBuDA
obja45JUzeQ7chMzytU1OWDPZ5lit0a3D4QRmN+YpUwGaXJo6f4926vlVj41KAtD
y6+JAqYRw6IU+wWE6SnTkXcAB+94x70+zZQiyWd/HvK+h6zr+uP2nW0vG9A6WkRA
OJk0DBjvL7c26ZMbCL+awWvsJ5Y9NaGK2cbJw3xwiRfn1kol0WjPeLhW1kwxqIZR
DvzNbWWz2+g5BCBMpUo3jh+2qmMxqlKxMSf9HHlIWDO5K/q6QcE=
=TdZd
-----END PGP SIGNATURE-----

--3s2/xHblvyO7tZOW--
