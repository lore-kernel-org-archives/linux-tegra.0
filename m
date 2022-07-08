Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB2F9CCA47B
	for <linux-tegra@archiver.kernel.org>; Fri,  8 Jul 2022 15:12:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238450AbiGHPMD (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 8 Jul 2022 11:12:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231849AbiGHPMC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 8 Jul 2022 11:12:02 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 847A432069
        for <linux-tegra@vger.kernel.org>; Fri,  8 Jul 2022 08:12:01 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id b11so859017eju.10
        for <linux-tegra@vger.kernel.org>; Fri, 08 Jul 2022 08:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=iabJoYkjfq3/3xZK9v0EWEIYt27jDfDh2p6JWkdNFu4=;
        b=AqeIt+X/57fnInVt+8EXAZFuO064omExQfTcNiHUKA9xESgwkVvl74upScYNsAdiGr
         4P5ww0+4uvVSvsQPXNJkH1nYNYHAPjfRGcoDB4OL6Qh5mbUsbC5RuBMJh8a9Ke5+y9rU
         4y7uR+n21wXslBm4IM93T6+UGmVu183ZXyH2DLaG8NgZLsIhu3WhgLn0uiVbyYVRKmCy
         Wmlzg6Jsb4U9OK53qelBZoZGdL6SENdb9EvHmv8CTn7adtTR2BTTPmy8HbDjapSy+vjU
         S4UyRt9rBoyAl5XvH/ydKMIp71HpFxtG0GPfow9YgwSsUS11wD4z0jS1C+BtWzDNE62M
         rnPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=iabJoYkjfq3/3xZK9v0EWEIYt27jDfDh2p6JWkdNFu4=;
        b=nE5xOPYZkOGViNk/q1cJMd4nSEN6gOIJK9ANOx7r5DG55JF4xealTE78rfULzyKxbJ
         TT+eXKUYO9+b7urrEf+SYkUZJJ5WLkrYzWkhnZvSPfEGJUCQjajgTpjqIRqImkCNd2zP
         KPSMZnUrMqKDwF6mn1vtkhn7U4ruB3s+7/qLfnzCEn7Ks5X047yFlm/2hhwH5Seg0NMV
         FhU9ShwF32cBNMmCflMYXnDlbXkXX1rXuY9YpnN0vB8I3QglicQFrGN+Ph9ZCbKwAa11
         e4WSkDpyr+otmXQDiAEhYpVvgu+G9TemfVESnSxJJLoS7w2HwN222oidU5AasC8EFpp6
         2wFw==
X-Gm-Message-State: AJIora9sGTp3fkgMwfS0kjdlt8rRaDXw3BVhp6crTB6OoZl61G1hyY6g
        +0V25Fnxdcnw8W34lFH6WdQ=
X-Google-Smtp-Source: AGRyM1teRBLIsqxs8bfR7rwyDEiOkElkxnrW4MDwThQFlqHvMMYUNu0aZttJMp04EolUIzQUuqQOBg==
X-Received: by 2002:a17:906:c048:b0:718:ca61:e7b9 with SMTP id bm8-20020a170906c04800b00718ca61e7b9mr4061773ejb.120.1657293120070;
        Fri, 08 Jul 2022 08:12:00 -0700 (PDT)
Received: from orome (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id kv22-20020a17090778d600b0072b21cab5a5sm1335011ejc.133.2022.07.08.08.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 08:11:58 -0700 (PDT)
Date:   Fri, 8 Jul 2022 17:11:57 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     mperttunen@nvidia.com, iommu@lists.linux.dev,
        linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH] gpu: host1x: Register context bus unconditionally
Message-ID: <YshJPZMMlZVl5i51@orome>
References: <503bffe670b24aac0dfb03c8fc16437b8f0cca58.1657215044.git.robin.murphy@arm.com>
 <Ysg/7u5gRiDbEm5F@orome>
 <70cb6f20-7028-9cf8-6b3a-a074c0047687@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="TdDXjrDRy7AveTVw"
Content-Disposition: inline
In-Reply-To: <70cb6f20-7028-9cf8-6b3a-a074c0047687@arm.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--TdDXjrDRy7AveTVw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 08, 2022 at 03:44:09PM +0100, Robin Murphy wrote:
> On 2022-07-08 15:32, Thierry Reding wrote:
> > On Thu, Jul 07, 2022 at 06:30:44PM +0100, Robin Murphy wrote:
> > > Conditional registration is a problem for other subsystems which may
> > > unwittingly try to interact with host1x_context_device_bus_type in an
> > > uninitialised state on non-Tegra platforms. A look under /sys/bus on a
> > > typical system already reveals plenty of entries from enabled but
> > > otherwise irrelevant configs, so lets keep things simple and register
> > > our context bus unconditionally too.
> > >=20
> > > Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> > > ---
> > >   drivers/gpu/host1x/context_bus.c | 5 -----
> > >   1 file changed, 5 deletions(-)
> >=20
> > Applied, thanks.
> >=20
> > Do we need this in v5.19 or is it enough if this gets into v5.20?
>=20
> It's not strictly a critical fix, so I think 5.20 is fine. I plan to post=
 v4
> of my bus_set_iommu() series next week as the hopefully-final version, but
> at this point I think it might be safer to hold off actually merging that
> until early next cycle, to give it plenty of time in -next.

Alright, I'll send it for v5.20 for now. If things change we can always
backport to v5.19.

Thierry

--TdDXjrDRy7AveTVw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmLISToACgkQ3SOs138+
s6FLKBAAkw6SEiVZsl95AEj/egqGdizSq7N3RWr6sIggW+KUltCmuS6hgBZmciHs
V7mEGovB5Ah4MVzcWk6MUZ/i19ehPS6gUK3uSY/rOUKNucUIaFQJ40zYjJ2YLsSM
ai5WEzlBJCQDUfSug84o0ECWSF0RfYFoezjTKOcX1aax2nGWznyJIXm2LY4HA7Yx
qO40VNXGJCzEtRPIQGT9kY1S/TpRE83Ipp92a9Enp1l4fulhvA2Xwcoi0gxPUYVk
2+aZA0nK505Oxg1bmagY5Z7fIKL+Qe3xmGsRIcDU1VQ9hAwlEUif0cnc8nWHyjou
Ht5I/DJvdoai2ZjyI+pcSy6oTGg8xGpArPwEvmcj6rup74c+A9rG+myqCoEz69J9
aQhSHEdc949W9RFvG12JHL5HeUVtJY5nHucHeYb0daXnywJUm8NMtTuOMGEw523b
sUH4mJ3ThmPC/5L4+OxRH9vBouBJrEAsdSBWz8mz3WgMoXXG9Z9NXg0KhI+qEcev
cTae9mQegcQcZsZ6o/QQMwMPCxv+daC/NRAUAWQe2r5eN/VN4e/9XfMuHkGF981n
X9hT/OwT+lGbfgYGbLhR5koXET51D8fQEgAo/LeONAXKQKyWMT4zzVEqNwK6tktf
j2XL+HPpBKglEnfURm8jUKE3NzhlefbKQKAwYBHb6gBwN+LqEy0=
=pA2R
-----END PGP SIGNATURE-----

--TdDXjrDRy7AveTVw--
