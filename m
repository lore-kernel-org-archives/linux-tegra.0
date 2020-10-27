Return-Path: <SRS0=stlo=EC=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B9F5C388F9
	for <linux-tegra@archiver.kernel.org>; Tue, 27 Oct 2020 13:01:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BCC1C2076D
	for <linux-tegra@archiver.kernel.org>; Tue, 27 Oct 2020 13:01:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eHsHaWhS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2900407AbgJ0NBQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 27 Oct 2020 09:01:16 -0400
Received: from mail-ej1-f67.google.com ([209.85.218.67]:44992 "EHLO
        mail-ej1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2900405AbgJ0NBQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 27 Oct 2020 09:01:16 -0400
Received: by mail-ej1-f67.google.com with SMTP id d6so2053081ejb.11;
        Tue, 27 Oct 2020 06:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gijXyxUYg/sm9vcPsGH6rXQSXPD6lE8QK5IFGNpnRWg=;
        b=eHsHaWhSlzA5RNFo9ar6nqT67tKUnFKILsEFikxKkCKwNxN94ctjT034lltQXn7+7+
         npEnhpWg2vcyQTDSmovUgwjlwI5aQriLHUPa5YEs72aVkDhlGqHrABxGwzxy4haP6kyI
         h2oK5NCVGbtj15JGWjLhkkAoLMNBTmynaKNQI9jkKuUq3yfANd06jIe+XN/Jt2ltOOAu
         HTlOwl2TD+wy9abJYilLu2r3cOVR+2Uwws8GPEhrXXPRQ5lRy5BzbfiVbzPvW15VWXWJ
         pg15SO5TuUDSbcSCaGbarYG5dFurFV3o3c+hHO03By3oEIQi48QkTGLYV24LyRuNZY5t
         FR7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gijXyxUYg/sm9vcPsGH6rXQSXPD6lE8QK5IFGNpnRWg=;
        b=sehqlAF05hqHzRHo3fedgamrwQEeiR1knhLWa4PNmT+9Faf4IhQT6iqrzRxWaqaRzA
         ddB7fKTJ0npZKlNxZ6j6bQgKVmn01h7DJp5qEsoOhg4fB9NmUefCExw/+bl7lr29zlDc
         LeK95QHUxMTq5S6DNernYflvxOhDCA6M32LqXEpTQ8brXeM+pPQh8J09nB5h2mNpi9kK
         FrBh7vNOl5XfDlihIPVKn1xe8q59k1l+ACAlSHIWUbl29LA8PlDAGiD1OOlgMymLY9hs
         PMJ3EqebvPmW07WeJhWUe5GFM9UfrG6+bvHX3iRmQZbvc4fJh3oPy7Nkcag6XIA3re9E
         EVQQ==
X-Gm-Message-State: AOAM530GPT2zKyklI1TiPcpxRfS+uAlnOvIEI6ARdN03Qg41QIQf5Y87
        2JGpToLDfCEPKHUH+DeHo9g=
X-Google-Smtp-Source: ABdhPJwp9iGCj0RTXGYDhvmDcSCN2SgHIvLdqu8zXYSMhpZxCkGl3H1UWmcWtsN6ciGICmaYnrCCEA==
X-Received: by 2002:a17:907:11d0:: with SMTP id va16mr2211187ejb.22.1603803674151;
        Tue, 27 Oct 2020 06:01:14 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id r24sm914865eds.67.2020.10.27.06.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 06:01:12 -0700 (PDT)
Date:   Tue, 27 Oct 2020 14:01:11 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     krzk@kernel.org, robh+dt@kernel.org, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] memory: tegra: Complete tegra210_swgroups
Message-ID: <20201027130111.GB1822510@ulmo>
References: <20201008003746.25659-1-nicoleotsuka@gmail.com>
 <20201008003746.25659-6-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="St7VIuEGZ6dlpu13"
Content-Disposition: inline
In-Reply-To: <20201008003746.25659-6-nicoleotsuka@gmail.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--St7VIuEGZ6dlpu13
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 07, 2020 at 05:37:46PM -0700, Nicolin Chen wrote:
> According to Tegra X1 TRM, there are missing swgroups in the
> tegra210_swgroups list. So this patch adds them to the list.
>=20
> Note that the TEGRA_SWGROUP_GPU (in list) should be actually
> TEGRA_SWGROUP_GPUB (in TRM), yet TEGRA_SWGROUP_GPU (in TRM)
> is not being used -- only TEGRA_SWGROUP_GPUB (in TRM) is. So
> this patch does not add TEGRA_SWGROUP_GPU (in TRM) and keeps
> TEGRA_SWGROUP_GPU (in list) as it is.
>=20
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
>  drivers/memory/tegra/tegra210.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/drivers/memory/tegra/tegra210.c b/drivers/memory/tegra/tegra=
210.c
> index b400802c9f14..b3bbc5a05ba1 100644
> --- a/drivers/memory/tegra/tegra210.c
> +++ b/drivers/memory/tegra/tegra210.c
> @@ -1028,6 +1028,8 @@ static const struct tegra_smmu_swgroup tegra210_swg=
roups[] =3D {
>  	{ .name =3D "hda",       .swgroup =3D TEGRA_SWGROUP_HDA,       .reg =3D=
 0x254 },
>  	{ .name =3D "isp2",      .swgroup =3D TEGRA_SWGROUP_ISP2,      .reg =3D=
 0x258 },
>  	{ .name =3D "nvenc",     .swgroup =3D TEGRA_SWGROUP_NVENC,     .reg =3D=
 0x264 },
> +	{ .name =3D "nv",        .swgroup =3D TEGRA_SWGROUP_NV,        .reg =3D=
 0x268 },
> +	{ .name =3D "nv2",       .swgroup =3D TEGRA_SWGROUP_NV2,       .reg =3D=
 0x26c },

Oddly enough I can see these in the TRM, but they are not in the
internal reference manuals that are supposed to be the canonical
reference for the TRM. Perhaps the TRM is out of date?

Thierry

--St7VIuEGZ6dlpu13
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+YGhcACgkQ3SOs138+
s6Gs7w/+NnyjKzJTeMqiNTu+JrNR0LUAPyE84D55SoweRFJRqj5qd4QYRmPNxACG
8ARl63jbR9zR94HplRkUpxvxYd2z+Z9udpg5ADm2TVoj6rSxBksxeNa9XAYZ/S+F
A5/EUTWbkhqppMyH3TGQn5/l/Gyx6h79dtmmz0BK5dB8KhfQypX6L5TCzuNscS80
JRJbrtFkiWdR3Z9SnpnPmJD6+1mnJIHnK/3wbVp7TOOUp7VSo/fABJazXr+VXHzB
8wGxk1h8o220pKAc2WNBmlHdnJUs4FukjRQZ6Skalt1ZRXpe6wIzjG9L0+n6jESP
hxaPIQ9JdPghTGkusF17CIECe6Ex0H1igvfxK59IXzrTI2tjrkWjIofVyLQ9v0ZH
45l0/plCrvxoNUtwXRKAxQP+YPQCbQ7MRetuQ2E3WJQBnmZ03M3E9c93ArABtilH
YMF91N11uOtqLS3wf0+A28/z7saIK8AxYVD/33ep742I4MKtkqj0FS06N33I8y26
rjPpkdIWhDW0WjVAYuHYX1RgT1VTVPAQdwanpV1GJuX0qk0CM+D7CONUBT+282CA
wOKjHKi3XcCyLZYw6igetXNJo3JiAjtaoSCDAQVTgyR/9FN+1kwRDBukNLRHxNcx
IA5jt6ru/tVg6Dne2DQ8sYp8L+2bBNr2vOh93iS7mAc2TTNXxAs=
=ypbK
-----END PGP SIGNATURE-----

--St7VIuEGZ6dlpu13--
