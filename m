Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58F43C4332F
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Nov 2022 22:38:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239612AbiKQWiJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Nov 2022 17:38:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233394AbiKQWiE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Nov 2022 17:38:04 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70A8B8C0B2;
        Thu, 17 Nov 2022 14:38:03 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id gv23so8794354ejb.3;
        Thu, 17 Nov 2022 14:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y4FEqDwt2OJQIPwzA8rhRmkuZy3M8G+5UGpUikysDjY=;
        b=ZiNlb21YSs5eJJPpE61IyQ7l+oG9v0IQZdqlW/Jgd13u1m+8fDKyvO0w/kvR1rnEVm
         2zlWkPDp9TMl+qRS/hcwCD9YlJJvep8ykckZ9rfufcM6xQ8WlROoKs8Snu2IV8YOYbk2
         41fW4CZ8+gHsRowLtZ6+JGcWiRIC1ZmGQKJDhhVmcYpSceUM0JXSx0o4Hu9jbskzNU2D
         H0uJlagWktARiahQ/7R6q3qrBXdt+c4x11wtSgG/J5p0knExAY6lav8kTjNigsil7j4+
         kg6x0tozTuebsgdaNM2q02Xkd9SaOESK+ne+5eZ2vAnCKHHWCbNjYeYzK281eosbII8m
         wUkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y4FEqDwt2OJQIPwzA8rhRmkuZy3M8G+5UGpUikysDjY=;
        b=MN6vhWDcRv2m8BEMJH3oQKvSMZkOtTlPOJuI3DTDDFdng7yOS9ke/Gjtro2JzjqBtw
         sb1MlwSa84nxH1BqNwKVimYU/LGiPZXmQzFCOqJOh59T13TP/hlfprKLyEjt8WbU+Tpc
         95uZzG8YzDkVR890vEm/vtszc4FxGzHbK+ftrfeUtafkseqmeUKrjChjHzUrYep0to6C
         EiiutY5WHjsu7Dr2He0d1+G+wXijjvUlCpiwDIUAvCGwenHrxXAN0Cpmcai3K2psOMkw
         /+eXbyQY84LTGkYVWwNKOohRipZEyj4xsq78bR2C39vvZP1iKBM4H3CfeLhnm8kPlHIC
         IniQ==
X-Gm-Message-State: ANoB5pn/THnItCSjQ960IfMtklhGZZ1gEFb9UE3EojWMVY+vHusP2mBJ
        W8hrfLiDaw+kkTOrxI/ajHA1eFPTGdU=
X-Google-Smtp-Source: AA0mqf5H/AQkJHPhp6JsNA1cttajv1d6choEzo8/8McwNLA9VFggcKqoFNYEI94tWj6Wpz4F4NdZeA==
X-Received: by 2002:a17:907:d042:b0:78c:c893:1965 with SMTP id vb2-20020a170907d04200b0078cc8931965mr3707574ejc.247.1668724681912;
        Thu, 17 Nov 2022 14:38:01 -0800 (PST)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id i10-20020aa7c9ca000000b00461a6997c5dsm1051288edt.83.2022.11.17.14.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 14:38:01 -0800 (PST)
Date:   Thu, 17 Nov 2022 23:37:59 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Peter De Schrijver <pdeschrijver@nvidia.com>
Cc:     treding@nvidia.com, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 1/2] firmware: tegra: Update BPMP ABI
Message-ID: <Y3a3x5x9W2GQVJ7f@orome>
References: <20221027121354.1481945-1-pdeschrijver@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="XebLCJygTHckxoCF"
Content-Disposition: inline
In-Reply-To: <20221027121354.1481945-1-pdeschrijver@nvidia.com>
User-Agent: Mutt/2.2.8 (2022-11-05)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--XebLCJygTHckxoCF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 27, 2022 at 03:13:53PM +0300, Peter De Schrijver wrote:
> Update the BPMP ABI to align with the the latest version.
>=20
> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> ---
>  include/soc/tegra/bpmp-abi.h | 1802 +++++++++++++++++++++++++---------
>  1 file changed, 1357 insertions(+), 445 deletions(-)

Both patches applied, thanks.

Thierry

--XebLCJygTHckxoCF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmN2t8cACgkQ3SOs138+
s6GDlg/+PlvkPertwUHftLHjPp26CGDPfF50yaJPA0NJts/tukaybSrhpmUzgUXO
WKiCq9Y9xZuw8ZHxrvgngZ4F3VwYkQtfP1Hb1KGZGV9LTX1A7t4h0A0ty0pb9XBC
LMaSIp8lUvC7hhaXaB5yqe+bO4rjwPPEis+Mm3G1ec5s3IMDrb3xsyjneLLrOVtF
behmB6cSOqbv+ZKHIl8fLCWIONIxAJB8ri1r8Hl2ijwMogfiePWMgvJaUK4nhuEv
Zey12buV3VbRoU8TpHXGwmZxLUfZVQaRiI36s6+EeKmLEQQU0+hq4kumuj8cwBZ5
5ANiWkpJfLAPkGQAjqvyvxATiUHz0PFbEh5LGi61foFdwxo2FoEl49DndlXUkqjz
pukjNQf/pI4gjDPjS6AoT9TUJ3dtRZKqMdizKu4URqTFG2HgrYLtzJU9ajCqyePQ
xqgmY1hksQlIeaydzjLNSUR0GK/WA7Zxk+MluoUux17nobhD78yS40Zmg2D905fF
bn67tEOgJIFVJLYLm3DB22sCtYNCSCaWRXvff5vwYkXdIukMG3Q9ad6KHVlo0CST
MA78EbgQ3v6azgxc/y5I9jvnXqgV4df8KKShky8fNnTjx4FTNtVwvOgHrg+8fOiJ
kNzoGTtwMPcBONVIBiA+K/Tgj5fOBoaYFTgTIJJBwLZamUP8fqI=
=5Ank
-----END PGP SIGNATURE-----

--XebLCJygTHckxoCF--
