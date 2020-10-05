Return-Path: <SRS0=kAmo=DM=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3801C47095
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 07:13:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B1D46207F7
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 07:13:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dONUoJUP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725984AbgJEHNp (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Oct 2020 03:13:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725973AbgJEHNn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Oct 2020 03:13:43 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6DBEC0613CE;
        Mon,  5 Oct 2020 00:13:42 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id cq12so4356317edb.2;
        Mon, 05 Oct 2020 00:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9UYGdvvrN9kR7U+w8b3/m+eI7gEt+1auK5RXKAkG5vU=;
        b=dONUoJUPuAg3TUpTEulTTlr+mcBul4FAEH6eUuX3M2CWDrRdvs5wnkkUrA4qfpVaPD
         xw4ZFFTK4lcEMQc/1I+h0VTQ29Dqbtp35K+y9LbwXs/SwCp5DZx/Amoy7FhZPEu2Ys+v
         LIZCWphWu/Be8yCF1SnyPjAgvyv5uRK0Ik42URBnVgCox53wG2JmGoCwDMsHie7hD+7L
         tHukYAe4WCUG/7bL3aTHcxLlKk2TRXSFmJUAVWtWLKvLEWIKePpMZAhguxuLm+MFzL9s
         KgemufbL7cqLhegNFnQ0HY+nkkYDVlL30+ykZs8scCk+yBzo3kVXm3nlqS6xelBrGkM8
         YoWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9UYGdvvrN9kR7U+w8b3/m+eI7gEt+1auK5RXKAkG5vU=;
        b=GrnVgtjFjPIlM0TLGtTvhicLNWPLwZQd/fsv61InqDTRabX7HZwNbO7pY7t3RQUgIf
         fDwjy7G3HzaobZFmxfmZW1r8bEa5/7PhobVp7rFgH8fp8weUpm/j9fpMjuk7g9E3B4a7
         FonCIhMnysmNxEFiurcek2NFK6H/+B88FfZzBZrb0GfuTuZ3vDN+Y21EKATPL170POJw
         frRW+RGBjgMdVHJ8lcTtLQw3kIfZ0Krbgzss6gwl3aiYwS9wJhp14SPvLcBtnrkd0hPx
         tQMR+aq2iUcPdnC2Uz3PuhUPLtksYeWjtukHUUImgIlVJwsXjSf81qkD+S/onyQsO0UT
         qUug==
X-Gm-Message-State: AOAM532k75VbsFHyFiTDiIiU21TfxQwSxs4M1TaVPCauL7m8sz/wW/uo
        Wk+N5tWcHEe7R5bUYYS/io0dtv/0Rz8=
X-Google-Smtp-Source: ABdhPJyovGGbPEK/etbT03yzqWlL8f2Ix1tRzN+U8k+CQ1WgVaHOqJLnm3jbZhuklNbz3eO1MqT98g==
X-Received: by 2002:aa7:c7cd:: with SMTP id o13mr15521489eds.114.1601882021308;
        Mon, 05 Oct 2020 00:13:41 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id a22sm7451720ejs.25.2020.10.05.00.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 00:13:39 -0700 (PDT)
Date:   Mon, 5 Oct 2020 09:13:38 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Nicolin Chen <nicoleotsuka@gmail.com>, joro@8bytes.org,
        krzk@kernel.org, vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
Message-ID: <20201005071338.GA425362@ulmo>
References: <20200930203618.GC2110@Asurada-Nvidia>
 <13746922-0253-cda7-e9ac-2bd20bf1a17f@gmail.com>
 <20200930213244.GA10573@Asurada-Nvidia>
 <5945a63e-79d8-e3ae-ab53-cee8c220ac7d@gmail.com>
 <20201001012630.GA28240@Asurada-Nvidia>
 <72b11925-5857-8ce5-d084-cab01ca1b396@gmail.com>
 <20201001024850.GA28456@Asurada-Nvidia>
 <20201001102316.GF3919720@ulmo>
 <20201001110425.GB1272@Asurada>
 <b966844e-4289-3ff0-9512-852f8419a664@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5vNYLRcllDrimb99"
Content-Disposition: inline
In-Reply-To: <b966844e-4289-3ff0-9512-852f8419a664@gmail.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--5vNYLRcllDrimb99
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 01, 2020 at 11:33:38PM +0300, Dmitry Osipenko wrote:
> 01.10.2020 14:04, Nicolin Chen =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Thu, Oct 01, 2020 at 12:23:16PM +0200, Thierry Reding wrote:
> >  > > >>>>>> It looks to me like the only reason why you need this new g=
lobal API is
> >>>>>>>>>> because PCI devices may not have a device tree node with a pha=
ndle to
> >>>>>>>>>> the IOMMU. However, SMMU support for PCI will only be enabled =
if the
> >>>>>>>>>> root complex has an iommus property, right? In that case, can'=
t we
> >>>>>>>>>> simply do something like this:
> >>>>>>>>>>
> >>>>>>>>>> 	if (dev_is_pci(dev))
> >>>>>>>>>> 		np =3D find_host_bridge(dev)->of_node;
> >>>>>>>>>> 	else
> >>>>>>>>>> 		np =3D dev->of_node;
> >=20
> >>> I personally am not a fan of adding a path for PCI device either,
> >>> since PCI/IOMMU cores could have taken care of it while the same
> >>> path can't be used for other buses.
> >>
> >> There's already plenty of other drivers that do something similar to
> >> this. Take a look at the arm-smmu driver, for example, which seems to =
be
> >> doing exactly the same thing to finding the right device tree node to
> >> look at (see dev_get_dev_node() in drivers/iommu/arm-smmu/arm-smmu.c).
> >=20
> > Hmm..okay..that is quite convincing then...
>=20
> Not very convincing to me. I don't see a "plenty of other drivers",
> there is only one arm-smmu driver.

There's ARM SMMU, ARM SMMU v3 and at least FSL PAMU. Even some of the
x86 platforms use dev_is_pci() to special-case PCI devices. That's just
because PCI is fundamentally different from fixed devices such as those
on a platform bus.

> The dev_get_dev_node() is under CONFIG_ARM_SMMU_LEGACY_DT_BINDINGS (!).
> Guys, doesn't it look strange to you? :)

See above, there are other cases where PCI devices are treated special.
For example, pretty much every driver that supports PCI differentiates
between PCI and other devices in their ->device_group() callback.

> The arm-smmu driver does a similar thing for the modern bindings to what
> Nicolin's v3 is doing.

I don't really have any objections to doing something similar to what
ARM SMMU does. My main objection is to the use of a global pointer that
is used to look up the SMMU. As you see, the ARM SMMU driver also does
this lookup via driver_find_device_by_fwnode() rather than storing a
global pointer.

Also you can't quite equate ARM SMMU with Tegra SMMU. ARM SMMU can
properly deal with devices behind a PCI host bridge, whereas on Tegra
all those devices are thrown in the same bucket with the same IOMMU
domain. So it's to be expected that some things will have to be
different between the two drivers.

> >>> If we can't come to an agreement on globalizing mc pointer, would
> >>> it be possible to pass tegra_mc_driver through tegra_smmu_probe()
> >>> so we can continue to use driver_find_device_by_fwnode() as v1?
> >>>
> >>> v1: https://lkml.org/lkml/2020/9/26/68
> >>
> >> tegra_smmu_probe() already takes a struct tegra_mc *. Did you mean
> >> tegra_smmu_probe_device()? I don't think we can do that because it isn=
't
> >=20
> > I was saying to have a global parent_driver pointer: similar to
> > my v1, yet rather than "extern" the tegra_mc_driver, we pass it
> > through egra_smmu_probe() and store it in a static global value
> > so as to call tegra_smmu_get_by_fwnode() in ->probe_device().
> >=20
> > Though I agree that creating a global device pointer (mc) might
> > be controversial, yet having a global parent_driver pointer may
> > not be against the rule, considering that it is common in iommu
> > drivers to call driver_find_device_by_fwnode in probe_device().
>=20
> You don't need the global pointer if you have SMMU OF node.
>=20
> You could also get driver pointer from mc->dev->driver.
>=20
> But I don't think you need to do this at all. The probe_device() could
> be invoked only for the tegra_smmu_ops and then seems you could use
> dev_iommu_priv_set() in tegra_smmu_of_xlate(), like sun50i-iommu driver
> does.

Have you also seen that sun50i-iommu does look up the SMMU from a
phandle using of_find_device_by_node()? So I think you've shown yourself
that even "modern" drivers avoid global pointers and look up via
phandle.

Thierry

--5vNYLRcllDrimb99
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl96x58ACgkQ3SOs138+
s6Hfqw/7B/INAr45UG7ZsLTRvp3N71EyInAaBUIUOAPBFkbeYyCUVXvprTSg0b7B
U4lUcYRYeuk/mMA2qHEBhDU9lJEgF2VGcR2IV9WmmZlzw81pst/LfnWx+2QFPgf2
U65wX6W+bFfw2mjnqng9Zd5a2DN2LT0hrnubqHLHd7tdJmvZSfaKzeU6HBMXQhou
LYBUt7EKJxXp9JyShzKQIX7sOkBkHNxCfNHyPuzdZDA+wvzObuswOOraJQBo1tdt
AyFyiFSK07qCJaHChDjjiZs+ZKTJK9/nhEaoOihnuaBxXc6ChQ/+TT2xrivzbsfz
c/lwcqE2jMFD/bYlzR4mnAtBwV+3R+n0thCaOzwfuY73wQ2Zgn16memCG4xgmUcg
Eiynic9UIuyJ1tCXYeuuiyeKLlhppvP/wYw7TKUJ1Ngn68gaqo+LmJk3UoH6Pcbu
zySppMLphqozxDGjTVdO9SR7DLw+ZKNsqWis/ZPtOdleSQzkyzkSI15q5kZfBoCf
EBmYDBRpjTnoLxbm8Mpr+uckqvITDoaP3FtXNDNTXfZtw/KbTzD1pWE5nVzZ8x00
SfZmvn7IjVp62pEORdm3/Z+PKZkoAq5/spXUl5SsSZpuOZ7I+hhZ1w8HqIng8v3+
72Gmm5kg3V5xBsGxoT6+qF6i996VWCRmB4LPGltMi7l3vmmtYxI=
=i1bH
-----END PGP SIGNATURE-----

--5vNYLRcllDrimb99--
