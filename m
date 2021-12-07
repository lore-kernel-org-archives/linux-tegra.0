Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79A11C433EF
	for <linux-tegra@archiver.kernel.org>; Tue,  7 Dec 2021 15:52:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239121AbhLGPzw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 7 Dec 2021 10:55:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233306AbhLGPzw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 7 Dec 2021 10:55:52 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7197EC061574;
        Tue,  7 Dec 2021 07:52:21 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id a18so30466414wrn.6;
        Tue, 07 Dec 2021 07:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6P7zVBXhkZB89KSkmuzfPpvn7y6oK4PlBjq+KmslJgc=;
        b=kTgT5/8E3EUTUQafk5f1paXaflLhVpA0IkbfEnIBcV97d0q0HpIsfs+jRx+QNmh6v1
         YWNLjwIjPIGztgfmKAH4Vg1PM/NMdKstpdjBY/glNgAQZSu+rJh5gMXey3Vof0hRYQmA
         FPGVnaCE+x3HenaDrFbiYZ9ep0IihM5J6LwCdU+3B7c7Gvtfa7Q5L7C051i8D/lvGpCl
         mNAUCiQA+gPwoxE8+0n08aLFREIvoSbRiPI5SVMeUvdNIa/91aXhpkCBdqWOK3UFoyz9
         07+0vplmJj8kKOZYC48OuRZqT03E3D5yd2ngouapAa0ZqWO+Qkut2cf5STnuFCBo35p4
         Opzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6P7zVBXhkZB89KSkmuzfPpvn7y6oK4PlBjq+KmslJgc=;
        b=594nzXH9pm5FZkLHyekU2vdxz9P6fw8QWnjUSyPmQbYkSQ8QFgzJPEObvEUz/VjvXJ
         GW2SJGGJaOjLtg6yLyE4xtg0XoxvHQHbFOIbuAf66IEUzmWfIY3JPaoFBdESc937qMLR
         dGSBcRsjhUWNubSHkIgdLDFuQd+b7Px8UYEz8uKH5iK1qorZZdN+xSdTBtnJIUqRmlep
         YT94Sh/pmcFU+XywCipBe0e1RrnabG4WMQ2WuXIWPpeGN3QgqrvQ5T6bIFCsJF9e+eyF
         pJoMAPwB790xsORJDAfDFjPwBCs3aiEE1qQo7LSw1FTesFsppyRSn4XNZzpntD88DQnU
         krdw==
X-Gm-Message-State: AOAM533UIyC668L9C9PddlbINADncecW/m1bi9ywmU3iz/MpRDfMiMTJ
        5vuTmyhbPZmCi8jLmAdWOoU=
X-Google-Smtp-Source: ABdhPJxp5J4ipRp0e/VgzXH2/dNQBBjKdI90Vbc5z8GpoOljoQiRRPdqSRdlqBC+nv5z9grS7LxSaA==
X-Received: by 2002:a5d:66cd:: with SMTP id k13mr51720979wrw.517.1638892340030;
        Tue, 07 Dec 2021 07:52:20 -0800 (PST)
Received: from orome.fritz.box ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id z8sm69830wrh.54.2021.12.07.07.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 07:52:18 -0800 (PST)
Date:   Tue, 7 Dec 2021 16:52:16 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 05/11] misc: sram: Add compatible string for Tegra234
 SYSRAM
Message-ID: <Ya+DMHSYt7T22fYX@orome.fritz.box>
References: <20211112123542.3680629-1-thierry.reding@gmail.com>
 <20211112123542.3680629-6-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zeOIG0z7395Yc90d"
Content-Disposition: inline
In-Reply-To: <20211112123542.3680629-6-thierry.reding@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--zeOIG0z7395Yc90d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 12, 2021 at 01:35:36PM +0100, Thierry Reding wrote:
> From: Mikko Perttunen <mperttunen@nvidia.com>
>=20
> We want to use the same behavior as on Tegra186 and Tegra194, so add
> this the compatible string for Tegra234 SYSRAM to the list.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/misc/sram.c | 1 +
>  1 file changed, 1 insertion(+)

Hi Greg,

I forgot to Cc you on the initial submission, not realizing that I had
this one-line driver change mixed into a set of DT bindings and device
tree updates.

Quoting in full. Would you mind if I pick this up into the Tegra tree,
or do you want me to resend this to you for inclusion in your tree?

Thanks,
Thierry

>=20
> diff --git a/drivers/misc/sram.c b/drivers/misc/sram.c
> index 4c26b19f5154..f0e7f02605eb 100644
> --- a/drivers/misc/sram.c
> +++ b/drivers/misc/sram.c
> @@ -371,6 +371,7 @@ static const struct of_device_id sram_dt_ids[] =3D {
>  	{ .compatible =3D "atmel,sama5d2-securam", .data =3D &atmel_securam_con=
fig },
>  	{ .compatible =3D "nvidia,tegra186-sysram", .data =3D &tegra_sysram_con=
fig },
>  	{ .compatible =3D "nvidia,tegra194-sysram", .data =3D &tegra_sysram_con=
fig },
> +	{ .compatible =3D "nvidia,tegra234-sysram", .data =3D &tegra_sysram_con=
fig },
>  	{}
>  };
> =20
> --=20
> 2.33.1
>=20

--zeOIG0z7395Yc90d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmGvgzAACgkQ3SOs138+
s6FFww//R4hiT4esYUWFwYp5igNBAr6sYlk7+spTxbxaaLl0u/nQVRZdpRNa4GY9
x4NDxlBdARrO/fM2FQulAWhwN/uVsTiGxX3DZa3jDmQbv4vi9l4FriZU1UrtwUKg
rhc2GOV5GFOMq19hqiKgE2yw+xcbJG9iV2S8LnFiw8QeXhtc+4O7qk+nVg3VTHxr
oF4PSSb73YRy7qYKJJsq/yCdEuMTafUIHtGqktD7fdxPQ97W8abGuxc12ZoagqaW
xTx5ErpLKJsoji/x/MP9FprxK2Qt3DiSWh54bj6A5gur9ND8nRLAijl2MNRVrOvi
o2lB6N2MySecoIpHOBNAHii6/9zUX0herJaImCtqTQmhAEmhsst3Z3Ub9ZhUs7J/
WBp05Kt91SnWMedgdMOqh7O1p1hshM8ctBJ95lcdjeDZLUFoXUnbkmFA+vBXkBtU
wyF2oiLj7/L/zEEe3dms9FQJs6AA1dPVBjJUVp76aeKq9dA8Mqn/kG/7Cnv1JxJy
sI5fWkLYB+oTII9AwAF+yuMgTaJFRauCFJSigCmU1ZjNrgAT/T8+kwedU6Abr5qa
aVOLgVd6qIkydgNbtZ3z0aTI2AUfG2M8C9rj4brunu6Hiqm4X//GDb0NQgokSnB6
MFdYZQ4GqCq/tkdFLZrC0Pp0WG1DmHljUsBYCk29IlzIi6N0MJs=
=QKiv
-----END PGP SIGNATURE-----

--zeOIG0z7395Yc90d--
