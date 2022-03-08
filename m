Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDDC4C433F5
	for <linux-tegra@archiver.kernel.org>; Tue,  8 Mar 2022 16:01:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234007AbiCHQCG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 8 Mar 2022 11:02:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348217AbiCHQBW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 8 Mar 2022 11:01:22 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78689506C4;
        Tue,  8 Mar 2022 07:59:24 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id r4so7368103lfr.1;
        Tue, 08 Mar 2022 07:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NaE7cTQwn70u1r2AKLM8OGzQ4OE9faei/DLoyJgl9jA=;
        b=VRPHWSeVxAe0zzcub9Ifrphfq3vr9WDr5L4YHSLIsd11VDwIpBZDRvRH8IbcY1OT72
         z9WZmwfmji8cFr3J12q5XmZqUEurVI2+O4IyvYE8GN5U2dxsGhx4onik/dTh2hVwYkFD
         85+7dOQJ5eJaXGacmAl3cAcqlVZdEJUSwiBB9SLFAAnpRWy0b7WhHdqmNurFl+2KUoZj
         NQu8CGHAskOJBctsWFmOCOE4gQcryo5tmKdNAxwqehxyP3mZLz9iWu5D3kaMZ5cis5LD
         ggjjXeyJ7zulpzmDNNGzijx1dbfzeaG3QH3r0TGrk5WZ/fdO18mDjoVcnBNRVl50zOLG
         V/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NaE7cTQwn70u1r2AKLM8OGzQ4OE9faei/DLoyJgl9jA=;
        b=fl/jFdnCXzPqUgZIeayY2yaQlUDzevTF/Ysf/IM+c8vvrCvQtyPxi5FIeAshId83i+
         wT4HKWML3Zb+N2a3bV1ALPlZP3JbNtvNR11W79ErhmQLB+ypc7J76GHUr31xC0hyNBwe
         bqQUhZ/3r5ySyBzpcNwPMYcvV2emcyRRrkGyDZ6TfDxN1D0KTd78vPt7dVO81CoBpc/L
         llZKf3qG6+E6zWpk3Iongrc0U/s5JEUFXdz7neNq4SzgsTCFN86drggjXMLdqpt24Ugk
         i6739UOQ/HL6mMimsBfB6+AbMlGnW7kb9yckGx45YgIN1AbgCVbipSMHqE63uoSEA0Jk
         VaWA==
X-Gm-Message-State: AOAM530lQR0J9JNaR26f/r9YrKbTb8zbA5hcmiVRsudiiZep91HHDOt/
        mvu6wJbvGPEiWgrn64Q2a+M=
X-Google-Smtp-Source: ABdhPJz3GlGEMEtV6DBobJaEdrCeckQzYNCFVzAA4bMQl2QX29aS9D+umGV5hV0A6B1ySdUHX2ipjg==
X-Received: by 2002:a05:6512:33c6:b0:446:e0ce:5c3c with SMTP id d6-20020a05651233c600b00446e0ce5c3cmr11894879lfg.26.1646755152081;
        Tue, 08 Mar 2022 07:59:12 -0800 (PST)
Received: from orome (p200300e41f181700000000000000043a.dip0.t-ipconnect.de. [2003:e4:1f18:1700::43a])
        by smtp.gmail.com with ESMTPSA id p8-20020a2ea408000000b00247e5087157sm1471161ljn.101.2022.03.08.07.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 07:59:10 -0800 (PST)
Date:   Tue, 8 Mar 2022 16:59:05 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] dt-bindings: arm-smmu: Document
 nvidia,memory-controller property
Message-ID: <Yid9SWbpPQQhNgA4@orome>
References: <20211209163600.609613-1-thierry.reding@gmail.com>
 <Ygz7QD4EJX3vZJtD@orome>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rFDGFzVNzKne2qqP"
Content-Disposition: inline
In-Reply-To: <Ygz7QD4EJX3vZJtD@orome>
User-Agent: Mutt/2.2.1 (c8109e14) (2022-02-19)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--rFDGFzVNzKne2qqP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 16, 2022 at 02:25:20PM +0100, Thierry Reding wrote:
> On Thu, Dec 09, 2021 at 05:35:57PM +0100, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > On NVIDIA SoC's the ARM SMMU needs to interact with the memory
> > controller in order to map memory clients to the corresponding stream
> > IDs. Document how the nvidia,memory-controller property can be used to
> > achieve this.
> >=20
> > Note that this is a backwards-incompatible change that is, however,
> > necessary to ensure correctness. Without the new property, most of the
> > devices would still work but it is not guaranteed that all will.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> > Changes in v2:
> > - clarify why the new nvidia,memory-controller property is required
> >=20
> >  .../devicetree/bindings/iommu/arm,smmu.yaml     | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
>=20
> Hi Joerg,
>=20
> can you pick up patches 1-3 of this series? DT bindings have been
> reviewed by Rob and Will acked the ARM SMMU change. I can take the
> device tree changes (patch 4) through the Tegra tree.

Will, Robin, Joerg,

I haven't seen this show up in linux-next yet but was hoping to see this
go in for v5.18. Anything I can do to help this move along?

Thanks,
Thierry

--rFDGFzVNzKne2qqP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmInfUkACgkQ3SOs138+
s6G49w//Ygjl2iHsMwI94cYoUH9dcGuDS8MJQNrU1Cnul3dW5pIzNyFYD6S2n3AU
gK/YYeZA1Ik8G4Q/Um+xmNSC0ZOVMng6fVmjpL2xVdOv1qeN135Hue1QZuUXzFV9
6fas+Y260jHRvPG1t0oS/HEvzmlRwDiYoKQe7h26kH9BpdLj/H0aMWhlu3Cb/coi
UnypSm2sScPaIuCY1/cPlb50NrgxqQ4R/LrNa6Aud/x+HsZTPCMHCOLPnQUvkYyR
Q/DEIFW8lyqJeOskopyuOqd43fPpzY+1Y0NwJuZhcpk0x4ikt8hh3J04eaEHsP67
af0twj+ENQvJ4fKiH0I1E38xtPi5uhtAKlTHU0hJs5LgZyoGLTvhiNAp7oOgSZXy
0I61nD65TBAqiv6AmpgFkXNRMBaS17BlkuhrwbKtbCwI+hbV8ppZSSbJr/AVQoDi
oo6QaGhkMYNVRUnXRA7Vi5mA32vxOf/5328W4SS9OTs7kV7xeRNsfHe6ZXOtqzc+
f2WUOfSJ3FgCEoAITsCCMK9NI6oaqMBSQOFsTG4yuXgYn2Px3PdgfRVE6X7cBbYr
0aTiGmzx3Im8dUSm82LZovu55yDlJZ0Q0/EU+zNLfQC2rs2biLhJyNqcRgD6fCmH
2W0sB+udBwSjicEc3XNRzk70i3J++uk7f1oQ6Ak+gL0Dvl2YBBY=
=z2UF
-----END PGP SIGNATURE-----

--rFDGFzVNzKne2qqP--
