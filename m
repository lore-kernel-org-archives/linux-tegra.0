Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D390C433EF
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Apr 2022 15:41:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235838AbiDFPnL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 6 Apr 2022 11:43:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236348AbiDFPm2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 6 Apr 2022 11:42:28 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E37F554DECF
        for <linux-tegra@vger.kernel.org>; Wed,  6 Apr 2022 06:13:23 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id l62-20020a1c2541000000b0038e4570af2fso1588792wml.5
        for <linux-tegra@vger.kernel.org>; Wed, 06 Apr 2022 06:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=45i/CvfTddvxblmcHvQsxR/rIMn4CHfVmtuYXswnVdA=;
        b=ZcNkS8zLmzW0LMlBUGAKpiIBoOGt7ErwgWPdn3INTlgoe/0elFOEZYsKtZV4gRFKyB
         6AIczeW0IlCpEi94avR1IPizDVjFUA8CwEzmQBio9r0djW5S7zS2AmmcxUmRWCkPPPto
         CSEcun40J4Q7v9OPKfxUDDLT+/1bYTMUmPZaH7NK4GuiQwDSX4+jzcedM/ds6ZGNp9BM
         EAcSETKjAQcqAseWTNdwV5l7I6tZiqH4fhP4QetU435FO5uCfhnTIB1AzdNefABplo8l
         eGc3lfvWcp5PvWsTWzWJuETr1L3Tnt3KYpkuU5PLH3a418ASTOSFTx6LaHjQd9YD6+uu
         Xm9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=45i/CvfTddvxblmcHvQsxR/rIMn4CHfVmtuYXswnVdA=;
        b=EFwMKfPDNk0BQJZVBxj0xWDveaOX2rsUF37nmW+2c46wu7dSSgfILUfUNJlRFvfGjw
         E/QlbG5bqVIigiAJo1PMiPdva2feeOb+t8X0dBoY4LAJ8BIsZEuVbw+KKEknUT606tHn
         gyBTQeFi85E9oQwSWNPxVrpnb4WJGjFPr2SZLxvS2vSSFWtj3WQV5Pss/Z+Xi6mrMl0O
         BxBJwg5kriVX/V/IrZruisNRhYN1uttl73JG6nuAwq4opY3vIaREfPRx1J6DO4sKnAFe
         Vt3Cg5JyOIqh6eRVMJJSs+zPdDXnf0QQyg4wDIcuIgcY0duUrVFgcB0MoQihY+0gcSZm
         fvUQ==
X-Gm-Message-State: AOAM530aaz6Mds1i8Dg0so0XqesU53bAmQyzMYO5Yb+vohGu+pVcmVLG
        V+G7w+IkCMEU9BaSL71B4jI=
X-Google-Smtp-Source: ABdhPJyoPGoFFi1IQASTHhSfsn93F7IYsEEwkYxbqGGCWaBV5Gvcee+lcG3JeAihYRzWLP/t5HC1oA==
X-Received: by 2002:a1c:7c0a:0:b0:38e:7c61:eb9c with SMTP id x10-20020a1c7c0a000000b0038e7c61eb9cmr7292405wmc.69.1649250801727;
        Wed, 06 Apr 2022 06:13:21 -0700 (PDT)
Received: from orome (pd9e518f7.dip0.t-ipconnect.de. [217.229.24.247])
        by smtp.gmail.com with ESMTPSA id h8-20020a05600c350800b0038cc9096507sm5412067wmq.3.2022.04.06.06.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 06:13:20 -0700 (PDT)
Date:   Wed, 6 Apr 2022 15:13:17 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Mikko Perttunen <mperttunen@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] gpu: host1x: Do not use mapping cache for job submissions
Message-ID: <Yk2R7SBLy7ZnQJNR@orome>
References: <20220324103025.2660775-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="HxpSELrC68ALoLx1"
Content-Disposition: inline
In-Reply-To: <20220324103025.2660775-1-thierry.reding@gmail.com>
User-Agent: Mutt/2.2.1 (c8109e14) (2022-02-19)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--HxpSELrC68ALoLx1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 24, 2022 at 11:30:25AM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> Buffer mappings used in job submissions are usually small and not
> rapidly reused as opposed to framebuffers (which are usually large and
> rapidly reused, for example when page-flipping between double-buffered
> framebuffers). Avoid going through the mapping cache for these buffers
> since the cache would also lead to leaks if nobody is ever releasing
> the cache's last reference. For DRM/KMS these last references are
> dropped when the framebuffers are removed and therefore no longer
> needed.
>=20
> While at it, also add a note about the need to explicitly remove the
> final reference to the mapping in the cache.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpu/host1x/job.c | 4 ++--
>  include/linux/host1x.h   | 5 +++++
>  2 files changed, 7 insertions(+), 2 deletions(-)

Applied.

Thierry

--HxpSELrC68ALoLx1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmJNke0ACgkQ3SOs138+
s6Gj6BAAm6+AEy/Yny+Uvy+JcDhdeZbr22dLQqGgQ+pkczQP97N3tG1pncFny09M
+c8WGxZeqCpIxA+ddWgZ/JS4NskknWSDi6GHCeT3/8X5eEZ/bOhfnSnUP5zYAIB/
yCRm2vJMzmhDUjsl7gie8R6wLaEL2yXpdKEFPBXrYYNym6wTfpOCdiLgkqW3MN1i
8g8qOIZTpXKdKBMrlkHi2JSYAhKy9cT42lt0woiDEWiHS89C43Jok44piLPYNPhY
iVZbm0jjdBOg1SUO4v0TDCXStx/zIPxMg1S7Y7Ip+flPzRhBFnIZZrbFPTPwF/u1
G900plqSHoREcSX7nCTJCpf5xUZoUA6JM75rVtynBxEYXeuPiUjhA5mgCxQOCPbJ
lDkncLImc3nOwWX/a2Ch5r65NCwHyF/pqturpXbFrM6RIAJBfVcvMRjjGUMSUeGd
mZFwnwAQnwUT+3IGYqEo8kQhT1Qwhns+5wgrXzwuqVLqzxkb7GZBzf4VHR23vUzK
HzPeZpKVVFPdJyiR7YgHCo5Wey+jyyNahgF4vEZEpdSV44xhgXYhNO2dxt2O1fmR
3SEVUktaENFAjTi0l0buQxCCfbv7LjSXmHALdjG/XX3Bf0t2mUjnyYZR8SazMLa3
ex8whYuqnHv0TIB9C7ptDhXS7NlpXFyp4Ikzx3Si7CEOuU2ZRI8=
=vUAo
-----END PGP SIGNATURE-----

--HxpSELrC68ALoLx1--
