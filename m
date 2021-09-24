Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3A66C433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Sep 2021 14:45:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7DF6C61038
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Sep 2021 14:45:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346792AbhIXOrR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 24 Sep 2021 10:47:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231627AbhIXOrR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 24 Sep 2021 10:47:17 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDF77C061571;
        Fri, 24 Sep 2021 07:45:43 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id t8so28396643wri.1;
        Fri, 24 Sep 2021 07:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Av3zDDdFclAJ+F3cYjMxG9S2t2QZDbTVI1TKO+ZOq0U=;
        b=qzTQPLx2pQ7IPYH1fZk3RYVZ3m7w1uxl01fD8LeZpjwMoKzjli/RQialtHZFNgDBiT
         9iSSG91zp0kgluN17z8mmZd/TkYJ9O1MzEbgOWZmz0tuBJWn7Eu+wlVqUW11+walr7y9
         knysK4Xj+CyJbap2IbmEEphC0Oxs+Gm8pLTND5/hgt6gsPVmMr1nuoWBATURPSjBM8PA
         0hu1wtLgIXJUuMCUtE7hN/Gov6jAAGyY9gnnb+J5L5xTxwCZqZUVVX2oYv3Am6Jx/ElD
         +crwwzJg3koza9y7be5aDwo5iDch8I4Rdczd8PrdmA8IlUNPdfKNuvTkzVmCXZZN2OXB
         2ACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Av3zDDdFclAJ+F3cYjMxG9S2t2QZDbTVI1TKO+ZOq0U=;
        b=0R6xeQw+fLa3fY5Kf/qmcnw7AUA0cgNR1QBBlN7+/v6Lykjgl2yI0QELoSM/l7MQPj
         Nug0jwcs30OifJC5iQ/p/Njl4JiADmIvK5+7qXHunfk/uEobDyBr1kdXzWtGjAANR9j9
         lSiM5Y7WUDbw7fkttb6tEu+Y/DVzrQ3Qfc6sZeK+na5A6yyc1Iu1uTVwdjEqu4udGZN3
         KYC9BHxfyLhUlCW4mramaYOQDyKhpOO2Q9WHDF4Kuo2YT7nMceLfPkRglV40S9yDCu1f
         33yS/X4ji9wVIYAdwn3M1RsIlYF0FTevjIgOFRf1d8lL1K0yWZ1lEoDE8Q7uLkYOntyb
         174g==
X-Gm-Message-State: AOAM530XCzJBsNQFCwBVU1rhky87i1wYsq6qE7TzhNI8W9QXRFcHzzql
        wN0+YZsVsSYtpz2A4PboNxU=
X-Google-Smtp-Source: ABdhPJwHjtoFD+Em8zF6DgZZeR4AHAuHQ16zsehQw1pH91pQnp/t+obC1c5ieSc6Ox36UZ4ogR2Z+g==
X-Received: by 2002:a05:6000:1889:: with SMTP id a9mr12076973wri.300.1632494742467;
        Fri, 24 Sep 2021 07:45:42 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id 131sm12249784wmc.20.2021.09.24.07.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 07:45:41 -0700 (PDT)
Date:   Fri, 24 Sep 2021 16:45:40 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Sameer Pujar <spujar@nvidia.com>
Cc:     robh+dt@kernel.org, jonathanh@nvidia.com,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Audio support on Jetson TX2 NX
Message-ID: <YU3klOTbfIeUzw6W@orome.fritz.box>
References: <1629809770-7456-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="dVMhuQ+ZlCXbwm9U"
Content-Disposition: inline
In-Reply-To: <1629809770-7456-1-git-send-email-spujar@nvidia.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--dVMhuQ+ZlCXbwm9U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 24, 2021 at 06:26:08PM +0530, Sameer Pujar wrote:
> Add support for APE (Audio Processing Engine) audio on Jetson TX2 NX.
> As part of this exposed I/O interfaces of I2S and DMIC are enabled.
> Similar to previous generations of Jetson platforms, audio-graph based
> sound card driver is used.
>=20
> HDA sound card is already enaled. Update the sound card name as part
> of this series to be consistent with other Jetson platforms.
>=20
> Sameer Pujar (2):
>   arm64: tegra: Audio graph sound card for Jetson TX2 NX
>   arm64: tegra: Update HDA card name on TX2 NX
>=20
>  .../dts/nvidia/tegra186-p3509-0000+p3636-0001.dts  | 506 +++++++++++++++=
+++++-
>  1 file changed, 505 insertions(+), 1 deletion(-)

Both patches applied, thanks.

Thierry

--dVMhuQ+ZlCXbwm9U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmFN5JMACgkQ3SOs138+
s6HPUg//bpmXGozlR4xs+n2kA19SbxK0oc7LsiYh7o9c6R81QMedLmRfdDo3Sb7r
XvwpXBdxTG5BWUmnmlMwIg8gmHACZQ9lZKj1sk3HeuNMhezdmrkVGquybFSMP4Vh
5B1DiSQdaQLX0rRgDKnQLYWDiIOXI5PvOUAeLP01CW9Hg2I8c+hxcb9I1Dg/ldNx
YXNbCS4Mm3JKuIBTRjCsa6F+OafjzwPXh0g/gBO6VyZ7+dzJHEO8AbB2UEeEjde5
o0r/dxA6RhCAvFr9GxioLYNo8j13nqpJ14y6l3mLj5HjeWLZ7Z6K3eDzMPMxNvcZ
5CxQ74OqO8dALV/JPlQkGQR1q1vqxwVe35aCvGzGygzJ0nuGendU9XstuwpON3Qf
J0kmJIf10WyTmVmJ5uI9kBK0Kx4A5ejEdwse5JXSeHWoYLSwv4i8AcAl5iZraQuR
6/tVrjrw7LMqn+nt0cGmauK06qoSYWed1dbN6SqPEePw9PGMccj60nwD0OR5EY2B
WZ6/D4m7qF3gB6DDcsf3P9lx5ZTdrW2QFqtQW/FfdZGAIZ6uAZZpBqEekuMLHz3/
wXCyZvz1xia/KogCZZsIxs6X1+LGKEUj4ah96S8g3kpseobyJ/EJeAzlRB4Cjr1C
NeqUkuHGpVDNKz1hwxklJY+cVuhC7XXF70KqyH+JyOILlYU1jM8=
=ImHS
-----END PGP SIGNATURE-----

--dVMhuQ+ZlCXbwm9U--
