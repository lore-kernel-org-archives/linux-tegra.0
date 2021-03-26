Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCCF7C433E0
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 16:35:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B705361A28
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 16:35:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230159AbhCZQf2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 26 Mar 2021 12:35:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229871AbhCZQe7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Mar 2021 12:34:59 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15700C0613AA
        for <linux-tegra@vger.kernel.org>; Fri, 26 Mar 2021 09:34:59 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id l4so9300249ejc.10
        for <linux-tegra@vger.kernel.org>; Fri, 26 Mar 2021 09:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=DYwWzdJEBzx1SFbP6o+W3lvVZLD7xCnLCW3uZibaJIw=;
        b=ra7O7EGO7kua1/vRqLHsWA6AGslJLSFS6SGj+n9mpVKXqmm43fj3AcoyVJppazdtsT
         ZoGVTky868NXpMq7EcIU6oN3cULfQIRRGtldsmAfGaMEAKlYhMF3ZGDbqlpqwoMG38cw
         +OnrADk57TPJt+sNG00lzdPy8fpPQas+VBOggXWtYQtIQHxLSPeNFgMabbwdYdKHf5rt
         pfmlj0d5SJKB0XdfT/fvDvwGAJrNX8k9LmWoaX2OrSq/hx8fzI0lK4nJQUDcRdzxWQV2
         BpX75futHas6xZzXB9cPRxG3Fn8YKx/1127ippw9IxEjxPP587RBotmm4SNKKWcsPabY
         59aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DYwWzdJEBzx1SFbP6o+W3lvVZLD7xCnLCW3uZibaJIw=;
        b=n55D4yuLUwaAO7xaKgRdBxfKH3AZjFKi+ZLnazfXa3AqRI2fAckQTyzdbmwX2e17dP
         61QonPtIifWXOQMuodP4IB5iG2hx+0LUhbVta/JjVl/RRwbPxFPXolrEOswMxl3g1zXQ
         0worY2DOgIY5cqiciP3b9AN998n+xzA1q18mi2L8U6M9SRYGrLzPPhDfijpmpXIAEQcf
         3gyc36DL2ABuPxlM27Cr9fAyLFoyN+fIN7DZRwPBOn/Wo1X0EhFGxovPRIkQPTxNoVpP
         /l7kQ1+soTDA+XlQAOBnLJ/8oyrXZc/GswQOaUhQ5ixjn26x28Y08G4f/oJuqGuyJS6/
         gL7Q==
X-Gm-Message-State: AOAM530rb5O/WYXB/ZsLWyRSosVacMKK96l1MOYE/Z+qAgWbMBZOnxM9
        1QgWvDSrfFu7QPPbhOoS0z4=
X-Google-Smtp-Source: ABdhPJyYe5iQKyUcqU6wM3M1dHZGmNlszMW7R3NcLT8ST52XN6zIOdZSXz/rtW7ufzGmLTUxnHmP+Q==
X-Received: by 2002:a17:906:7257:: with SMTP id n23mr3008392ejk.412.1616776491669;
        Fri, 26 Mar 2021 09:34:51 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id sb4sm4093833ejb.71.2021.03.26.09.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 09:34:49 -0700 (PDT)
Date:   Fri, 26 Mar 2021 17:35:12 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        iommu@lists.linux-foundation.org,
        Jon Hunter <jonathanh@nvidia.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/9] arm64: tegra: Prevent early SMMU faults
Message-ID: <YF4NQPee+/Qi6zVd@orome.fritz.box>
References: <20210325130332.778208-1-thierry.reding@gmail.com>
 <197876d1-0046-f673-5d3e-818d1002542b@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="E3RehJV1Q5CrEkmM"
Content-Disposition: inline
In-Reply-To: <197876d1-0046-f673-5d3e-818d1002542b@gmail.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--E3RehJV1Q5CrEkmM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 26, 2021 at 06:29:28PM +0300, Dmitry Osipenko wrote:
> 25.03.2021 16:03, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Hi,
> >=20
> > this is a set of patches that is the result of earlier discussions
> > regarding early identity mappings that are needed to avoid SMMU faults
> > during early boot.
> >=20
> > The goal here is to avoid early identity mappings altogether and instead
> > postpone the need for the identity mappings to when devices are attached
> > to the SMMU. This works by making the SMMU driver coordinate with the
> > memory controller driver on when to start enforcing SMMU translations.
> > This makes Tegra behave in a more standard way and pushes the code to
> > deal with the Tegra-specific programming into the NVIDIA SMMU
> > implementation.
>=20
> It is an interesting idea which inspired me to try to apply a somewhat si=
milar thing to Tegra SMMU driver by holding the SMMU ASID enable-bit until =
display driver allows to toggle it. This means that we will need an extra s=
mall tegra-specific SMMU API function, but it should be okay.
>=20
> I typed a patch and seems it's working good, I'll prepare a proper patch =
if you like it.

That would actually be working around the problem that this patch was
supposed to prepare for. The reason for this current patch series is to
make sure SMMU translation isn't enabled until a device has actually
been attached to the SMMU. Once it has been attached, the assumption is
that any identity mappings will have been created.

One Tegra SMMU that shouldn't be a problem because translations aren't
enabled until device attach time. So in other words this patch set is to
get Tegra186 and later to parity with earlier chips from this point of
view.

I think the problem that you're trying to work around is better solved
by establishing these identity mappings. I do have patches to implement
this for Tegra210 and earlier, though they may require additional work
if you have bootloaders that don't use standard DT bindings for passing
information about the framebuffer to the kernel.

Thierry

--E3RehJV1Q5CrEkmM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBeDUAACgkQ3SOs138+
s6FTLhAAsms9EhZS86Rj5VNrBEWU74zsV3diOV1Hmg6TmT6zHATv0FZVRT15AZFk
fzSOBlfxyKFYvXBmMfJtgF0SkEuVGWeCL9NAnwEMPRcDM0gQ9ULvswFqzGe68oRL
8AMMfi3/2p+E6h+SLOxF1v5Is2lYE8Uc3c0AzWUr6d6WYeZL2FUQKd83pF5CMp4A
iTHAVSzBdSAmrnyDOHAQVX/UZ/01LpJEwFvYXXJLWAHZNhjWTbF4VDSL6S9OzLkd
oWeNf8CXgmwwtg6JTDVdYYz9/YAQQBYrFWVqkcXbJKn1AzcqCh2N2eWqgdBkMNWj
8qmpxrNSqBnnrpVAX9tVnSZFOCW3QhMC86DGch0PS7x4Uj1uhByknghn7LIH2/9H
nCrUBK6OccS/4RTNHKIyPMrcrGpB0CbgjJ6M8suEKmtDS4JNxn8JWu7b5FvkRENe
AYTxhOxRW1//Lmo2pKpjo8pIh+odd48h2jTjRqvhqtIxIUkAkRsFWvceWmmxZ6bH
OELd0Xnk1w21GrKNWlMInSkyGZNFQbXPYDcnybOrpf9olj/QFNtxS+OAgOAIstt9
SSMDamnz+l7sIV5mKo2LNkuUHxiosiU9KaDGGjT/MgIJEAFCRHlPFq2SeqAI8HUO
53EDGC2Cf4chVLtUiA0vxQkry3Vyj5ELz7dP+XLkjwhXKUOlGZc=
=+uZ+
-----END PGP SIGNATURE-----

--E3RehJV1Q5CrEkmM--
