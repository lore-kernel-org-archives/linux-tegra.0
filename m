Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2143C63777
	for <linux-tegra@archiver.kernel.org>; Fri, 20 Nov 2020 16:27:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5F14A22269
	for <linux-tegra@archiver.kernel.org>; Fri, 20 Nov 2020 16:27:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OSUomNH1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729560AbgKTQ1s (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 20 Nov 2020 11:27:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729462AbgKTQ1s (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 20 Nov 2020 11:27:48 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79908C0613CF;
        Fri, 20 Nov 2020 08:27:46 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id d12so10554985wrr.13;
        Fri, 20 Nov 2020 08:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jBzR8Id+7M0Czb52UJefnNNvKcaDzi1oZktzIdquhwU=;
        b=OSUomNH10iI8X8CHGrnhpjxm5D/9PF6R3aqOYA8+rljoezLXLJNNMcLxlrYmX/He3x
         PRZPXvHESg+3fqH3h4T+PNvVSJv+WvT5pTNXYEbuGt639w7dbfw5Z7Nzojj09WTRfx0W
         +oWPLWjbWW914DDaorH15Z6EbSyDSOB6SEPct4KzsrhYLz3FhE0+eVsaI3T/ILL/CWVZ
         7Kn+wWzZrlj3zlbWp66cmoUtNOsiZ2yuMXoJhDTiEva4bgXSgw9jPZSp96EO5EfWbBtq
         pXOswbs0TmPG3BQi9ziJZYZkPEuM6MKa+HfvDxfdr4nunyWuL31Idrqat5B9u23AeQmC
         daoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jBzR8Id+7M0Czb52UJefnNNvKcaDzi1oZktzIdquhwU=;
        b=kdjhz3Hawt5XqXpKS5Q7eTIHZ/a+QS97Sh1SySWEgHpGRL7d8JnR2gXIDU6FpR80oB
         m7PrWQLC6qDU1mOc2rYbmqYU7NoYwgsPO4GKIG6bXxm4il2jpCWbT3iHMktekzSbs9Uh
         LoiozN9/GkJsVtG6yM08qaDIS/DuLDoaPMMqQ+4/qs9fIAAepDVBzwf1XcOmp51VE2rW
         sWELGyENO31bHeXk5DsQcjfFFMJ9yr5hj9zpbAF1XZcgPB+hGshwsk7WzFdOF52i3KjJ
         0TNZLdKm91gaRuLA+WOZNzAzgADjU4UuORTXAWQzFsCYIQi/3uCZ+stqz+FC+PqqCqra
         Rbeg==
X-Gm-Message-State: AOAM5319kwOblr3ddrwNIw2jRTeMuiVoJ+kfAs+Km+2apZ/XY8y5qLpF
        AdE6tDBlWjYkJbAQTxyLS1I=
X-Google-Smtp-Source: ABdhPJyL2aEAQVy2Ox6BqbPIexTfs9w8kV1rbhVdL3n8Uds1Kwsjl1pl2Xid/+VuxscVyuAl7xPo8g==
X-Received: by 2002:a5d:694f:: with SMTP id r15mr16635290wrw.165.1605889665216;
        Fri, 20 Nov 2020 08:27:45 -0800 (PST)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id h15sm5679944wrw.15.2020.11.20.08.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 08:27:43 -0800 (PST)
Date:   Fri, 20 Nov 2020 17:27:42 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     krzk@kernel.org, robh+dt@kernel.org, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] memory: tegra: Complete tegra210_swgroups
Message-ID: <20201120162742.GH3870099@ulmo>
References: <20201008003746.25659-1-nicoleotsuka@gmail.com>
 <20201008003746.25659-6-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ewQ5hdP4CtoTt3oD"
Content-Disposition: inline
In-Reply-To: <20201008003746.25659-6-nicoleotsuka@gmail.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--ewQ5hdP4CtoTt3oD
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

Acked-by: Thierry Reding <treding@nvidia.com>

--ewQ5hdP4CtoTt3oD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+37n4ACgkQ3SOs138+
s6FWAQ//UUcNf8R4DtwB33Rrlhx9IgMOi46MAt0hJ6dnJqbH4iWK6gL3RcUDEP9W
mzWucuL65XgDfERKWGKRAgv/F3Gxb/dyT5Kf2N/mhkLR7m41/sGENadQea6wQ4K8
/or83hB3hZuHcJoqlPtyCdszXq8acJxUBWZR23tyFalNq4MSKkwjteVWj+dCprlK
2sV5XVETey9gY2KLgsIamWFdhrCH1CLoPGvannn/t+47yAQyXt+JMinyUPc0aWXc
x3U2qIEdX798yvnwzzS2lcHPMI7i+fmtbnoUjWXLX7trxL6xU+yfiZZAxnKf2Fp1
yhffvZzOYnwxwW+DTDxOmmC92OYl8ArfvhR3Z2Z7QoNoRZ7xx0mYjH0ky9IKGT3P
gwXqGUfkGbCECE28WKm1ryswKo3IXn/cOq1wmGJAnko5Wyk+Er2wOHdAHGf6WBKS
U43OiO9mncq7xNqwnuUp2rL7k+q4gd/rqo8JwMJ8/R3mBPaO9OMendo/u3eNx+0y
8S9IvQ4sgdbFEUvhJDOwg5QGkR2izoYr2YlLUmtWBHq6ZyQqyqCQDDdgQRKemUh2
GLxhoWU1iCXGCTRWbEyd3el/xAVv3Ock7cW9orZ1F5cGa3oMKSsAxgKbas4DUeUZ
d26nI2DVhsRtOllxn7u9qU8TLk0+djr8eebM71Q0N3IygkKNI7A=
=PiTV
-----END PGP SIGNATURE-----

--ewQ5hdP4CtoTt3oD--
