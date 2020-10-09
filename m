Return-Path: <SRS0=2JVP=DQ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 889F4C43457
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Oct 2020 12:21:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 36C15222B8
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Oct 2020 12:21:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pZ2oP5rf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733005AbgJIMVQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Oct 2020 08:21:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732974AbgJIMVP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Oct 2020 08:21:15 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8CBDC0613D2;
        Fri,  9 Oct 2020 05:21:14 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id ce10so12778441ejc.5;
        Fri, 09 Oct 2020 05:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wqW8tLiDohXCRPeIW2J1lirrHi6UIgJCyYAWG9nSsGw=;
        b=pZ2oP5rfYx1WSdVSTXAOLi7JIksRbP3W2mUtEUFh5x3bGY39SZ4zLnvFOmRb9ozutM
         OMKWIZPk9qWDHqbuP1ZfST2Hx1Pf31leUu43PAKCDq0mVHFD8eNMKQBPfKBPCx/XG0Sj
         bAhMU5pP4Gq9L6XjZ8/i9FpCGY4N5hYqPalYjJHj8y5z9a4DRFSz8qOmWsDxatEbU2SN
         DhLS/9mCClwJB+JxI6BRb3LFUDCaNmGyrF/j7d8Nt96yVVrnqOOeUzSwti9W3CMqFU4S
         RwOlKLOnrghzS/cEc64fEpMcA8gch/hRBSqS524zjrvwHDVi07bRZj6LWiZ/JIT2MxP+
         KapQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wqW8tLiDohXCRPeIW2J1lirrHi6UIgJCyYAWG9nSsGw=;
        b=jzOkWG93VwVGSbVzo+6/WhUK084ZjhdeFPciQcU+bofrdhdJtQZPEJpY8lT6SEt6Bt
         +QwSg8ShD5iPAn5uUqDFMxIbivHy+DVMxT5vBwzkR/c5i8yr7arghJPc5F7zGU6iXAXk
         yeWzbGN9wT5ZjY1qbV0sjYlMMgXSavIh7pJBzAuZCPWBmRjARXJaS1ePHNR9n8l92Fs+
         yaqyFvnOMYur8gGVPOCVRZ3541lR126S3xz+n0iQhtnorH15t1qXj1i1UFlpYBDZ035Z
         gPAfcHxhRp/dWSPL43TxzN4MOLYr7tY9rc6jWBI3Z6gnWkco+oGl2I6eMQtgcNhDnhp9
         ALnA==
X-Gm-Message-State: AOAM530JamE9qoKuO8HZcOLtTyoDpThHJmyzbSKtiHJePwbeUbBltrq7
        HYtgRsZq3zAJptxWNvsfPWM=
X-Google-Smtp-Source: ABdhPJw+iNVHcU/8xFz64o6lEQtVQ3Zwrk6X3Hl6RtS7BHWq3UuQGfKXLZa5khMX/UUNf9wiW0cSfQ==
X-Received: by 2002:a17:906:d8e:: with SMTP id m14mr14407722eji.448.1602246073460;
        Fri, 09 Oct 2020 05:21:13 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id j18sm6256432ejc.111.2020.10.09.05.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 05:21:12 -0700 (PDT)
Date:   Fri, 9 Oct 2020 14:21:10 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     krzk@kernel.org, robh+dt@kernel.org, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] dt-bindings: memory: tegra: Add missing swgroups
Message-ID: <20201009122110.GD458338@ulmo>
References: <20201008003746.25659-1-nicoleotsuka@gmail.com>
 <20201008003746.25659-5-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="k4f25fnPtRuIRUb3"
Content-Disposition: inline
In-Reply-To: <20201008003746.25659-5-nicoleotsuka@gmail.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--k4f25fnPtRuIRUb3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 07, 2020 at 05:37:45PM -0700, Nicolin Chen wrote:
> According to Tegra X1 TRM, there are missing swgroups in the
> tegra210_swgroups list. So this patch adds them in bindings.
>=20
> Note that the TEGRA_SWGROUP_GPU (in list) should be actually
> TEGRA_SWGROUP_GPUB (in TRM), yet TEGRA_SWGROUP_GPU (in TRM)
> is not being used -- only TEGRA_SWGROUP_GPUB (in TRM) is. So
> this patch does not add TEGRA_SWGROUP_GPU (in TRM) and keeps
> TEGRA_SWGROUP_GPU (in list) as it is.
>=20
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
>  include/dt-bindings/memory/tegra210-mc.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/include/dt-bindings/memory/tegra210-mc.h b/include/dt-bindin=
gs/memory/tegra210-mc.h
> index c226cba9e077..f9fcb18a6d9b 100644
> --- a/include/dt-bindings/memory/tegra210-mc.h
> +++ b/include/dt-bindings/memory/tegra210-mc.h
> @@ -33,6 +33,16 @@
>  #define TEGRA_SWGROUP_AXIAP	28
>  #define TEGRA_SWGROUP_ETR	29
>  #define TEGRA_SWGROUP_TSECB	30
> +#define TEGRA_SWGROUP_NV	31
> +#define TEGRA_SWGROUP_NV2	32
> +#define TEGRA_SWGROUP_PPCS1	33
> +#define TEGRA_SWGROUP_DC1	34
> +#define TEGRA_SWGROUP_PPCS2	35
> +#define TEGRA_SWGROUP_HC1	36
> +#define TEGRA_SWGROUP_SE1	37
> +#define TEGRA_SWGROUP_TSEC1	38
> +#define TEGRA_SWGROUP_TSECB1	39
> +#define TEGRA_SWGROUP_NVDEC1	40

I'm not sure this is right. The existing list is based on "Table 4:
Client to Software Name Mapping" from page 28 of the Tegra X1 TRM, and
none of these new swgroups seem to be present in that table.

Where exactly did you get those from?

Thierry

--k4f25fnPtRuIRUb3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+AVbYACgkQ3SOs138+
s6EjYw//d7rFLljg4uUz0GAYrWkU+KA1cHfZKLDjjJMNLRm6osUpTfew22WmLk5r
UupPbHAWPLRE6JEmRvd+YZo9woJR6PENh90tv05ZeyzT17OyqEhIcdwF6tvO+ToQ
4k1uvcuG2PIC1Ea7a9Q+jpi2H4g60bocm1StHVN0WCj5HzkmIXlK8rlgA7TkXNGC
eNvIYHq7orAhlk2OMgTzloYk0FcoJgykE3HuJhXbL4k5kO2c65F5Nf07TUyklK3y
2S2pZcGa7Qs1ztKWB8gHrhai9o6er4v+l2KGN/XNeyaDEzOIMqmfDxbSSyQPnTBL
IKHvWLLsDijohAT2FJpJkOOl8yDKDWD8Poi9S81JBEIhQzzWavy7X9vY4kfJqRhc
C2bUVvLswzKbiST2zSGuR7g38yqdW3JPa7yiKBjCIca+MYo0N2DZ+lvFoXvBWvOC
p6T5uVFBd7qhz/jWfcDD3n2hCcFEIXaljoLPNTEU3OhaoAymwPpgZFQuKlZrHuOK
/U1SkTGphPxLNf29TJiCeCfPUHmFCOY7QpJCcDeQ+gyB9dfXf9TZqwxSJE5341uo
PP2P86/Kiv/f/x0AnHFkDs7A41CgDEVX87y3x6lzCrUGHJOZH4VK21urVt1HwzVD
jrkTX4VOKj825TFTgY9ck/vxiuk/YkKlfReKqlzbbiTVxlvAkK0=
=C4t1
-----END PGP SIGNATURE-----

--k4f25fnPtRuIRUb3--
