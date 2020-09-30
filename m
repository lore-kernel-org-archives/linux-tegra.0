Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68CCAC4727C
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 16:06:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 21DD820789
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 16:06:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pq1CulC8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727749AbgI3QGg (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 12:06:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgI3QGa (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 12:06:30 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA4D9C061755;
        Wed, 30 Sep 2020 09:06:29 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id nw23so3637756ejb.4;
        Wed, 30 Sep 2020 09:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NDiay5Y7h+SHyza+gL5HDWZkjBPPCDcnbUKJ/AtUF+4=;
        b=pq1CulC8RWyAVCTp6GZippCf/6lEsda7nW2SZs4EhNYKXZYXmiGsLFQiTnFehZiBXa
         m7ZHC6pJrb7Q+EgDSythiLTfolFwqZKpsvLJdJYpWdojQVLE3sfj/pz8mJfC5VAIzX/K
         PYyBjR3r7kzN4MbCD9ADytGl16ElKsbTSWR1yMx1fG/nnhN5ds77vCQESOffIYVjEGlS
         smSGuvCxrJDWl1nf3lOOQRHJWFMXA46xe7y6Zi8JYiQK9Z42rE+e1OFUpRqYPYGYQ8bS
         GOPO76shdPu2S7WRTMjwOhvdBUbmY0bNanqOtfbn2plGYrhY0jit2jTtHuDx+t0y1YkO
         rxYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NDiay5Y7h+SHyza+gL5HDWZkjBPPCDcnbUKJ/AtUF+4=;
        b=U3n3xvO7CbBwLcMZ6Nsk33SUs8woCz1phFU/HRXGQwewqUOGdRPKAE7LhZlxAugyxj
         rtmTdSNLRj500zhjIvDxpjblkIZrfi+73D001rvxFLGwMBif/cMHCDOVRvgnP+O/s11F
         MIC4nc75n1UKw0Uu9k+qkFK7CqSvUqqsTt+otobTQS/RfS6hP4H7xAFUIELHela24Gvb
         nmaRzuyYVSqVBeUdtVmwvIGovw4XA/3Z+JMDXnctfSiTdVCRf33V7hbBipY3QquYJSm/
         pdKeSkaNUOz1Jx6AiyFVxir1bRU88dacoRJTGJmn0a2bcpLt7ZlBYbe/EO18AbBAixiR
         vhMw==
X-Gm-Message-State: AOAM533HNQjYyvJTHP9YldkGbSehMETTB9V492WwWk/fHSAUUYYvr1pI
        Xkl2ChXy88g7HyPvrpN86TY=
X-Google-Smtp-Source: ABdhPJyrvVrcQq2hFotX3BTY6j708efNUE4w28URGOKT7Lye6zyw4DN2Tcxgpskpi3WILDqBO2f5Ww==
X-Received: by 2002:a17:906:1fd5:: with SMTP id e21mr3698133ejt.349.1601481988391;
        Wed, 30 Sep 2020 09:06:28 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id k6sm1910354ejr.104.2020.09.30.09.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 09:06:27 -0700 (PDT)
Date:   Wed, 30 Sep 2020 18:06:26 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Nicolin Chen <nicoleotsuka@gmail.com>, joro@8bytes.org,
        krzk@kernel.org, vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
Message-ID: <20200930160626.GD3833404@ulmo>
References: <20200930084258.25493-1-nicoleotsuka@gmail.com>
 <20200930084258.25493-3-nicoleotsuka@gmail.com>
 <20200930153131.GB3833404@ulmo>
 <ece615ad-8d6b-96ae-d8b4-9667aef17281@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="sgneBHv3152wZ8jf"
Content-Disposition: inline
In-Reply-To: <ece615ad-8d6b-96ae-d8b4-9667aef17281@gmail.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--sgneBHv3152wZ8jf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2020 at 06:36:52PM +0300, Dmitry Osipenko wrote:
>  I'...
> >> +	struct tegra_mc *mc =3D devm_tegra_get_memory_controller(dev);
> >> +	struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);
> >=20
> > It looks to me like the only reason why you need this new global API is
> > because PCI devices may not have a device tree node with a phandle to
> > the IOMMU. However, SMMU support for PCI will only be enabled if the
> > root complex has an iommus property, right? In that case, can't we
> > simply do something like this:
> >=20
> > 	if (dev_is_pci(dev))
> > 		np =3D find_host_bridge(dev)->of_node;
> > 	else
> > 		np =3D dev->of_node;
> >=20
> > ? I'm not sure exactly what find_host_bridge() is called, but I'm pretty
> > sure that exists.
> >=20
> > Once we have that we can still iterate over the iommus property and do
> > not need to rely on this global variable.
>=20
> This sounds more complicated than the current variant.
>=20
> Secondly, I'm already about to use the new tegra_get_memory_controller()
> API for all the T20/30/124/210 EMC and devfreq drivers.

Why do we need it there? They seem to work fine without it right now. If
it is required for new functionality, we can always make the dependent
on a DT reference via phandle without breaking any existing code.

Thierry

--sgneBHv3152wZ8jf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl90rQEACgkQ3SOs138+
s6FhgQ//a+/NTVtKzfGbpKqEQ0N9/dM3xFZWr3Yuv1vue8BU4+eVrXxhSASrsa9x
c4740hqylshqqqPxmxYYhwBg1j5RK4UhGWPjZ8E0R59sKb+TJHhk4ij/jfu9PM9d
XD3LV5CBqkZsDQ6mQFbOWc8DK0CX9+XyH/tWevtlZtee0JUSSLcGj3Qc7BoZK2F0
pyL3bA+F6CyJ1tocb+EfaTxDvL9XlL5rg8ubZRKumlOdqEG8P5w4w8g1uxUzGBqF
g8uz7qmHlE5XRvIMHsulkB3SG6gXn7TbexAcWD0CG/yRk6UnKA4rRdhYWoFJeVkT
hUVV28gJk3nPvLKoqX5zkzIAhofy2s5YkhanPe8j5batn1ok0ixIfQbHyXBbrmLV
ZCWbHXRiPb0FZmpbiX/EBjmT697mI45gOvrmhcMpEMhFMZV8KaBll6tGQtOOGM6/
17DyfIe5vrYMvdv1TgUA3csAkd7DYPM4SpOOOiXYe8Uz7a+fxJXcfAga3gG/H+t2
4ZSnfxzHYNNJIq7QHyhoDHgO0EjlnF6PJ6oPRy5tN9NKG+igAux0eTgS5gMDrZgC
/DjFOh6B67RbhlVt3JQeqHqUFM0j8MD/BzTqW5A0vBXs0X+5eHK+G4BEBXE0M2hs
Gwq1NExwiMlZwueBUmGH6hHeiH+MySwoWu60U//ez1dUZkkdPeo=
=SlyZ
-----END PGP SIGNATURE-----

--sgneBHv3152wZ8jf--
