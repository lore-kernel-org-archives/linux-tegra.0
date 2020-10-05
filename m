Return-Path: <SRS0=kAmo=DM=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0044C4363A
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 09:16:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7EFF82068D
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 09:16:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FOXr0IXR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725922AbgJEJQP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Oct 2020 05:16:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725891AbgJEJQO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Oct 2020 05:16:14 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AFB6C0613CE;
        Mon,  5 Oct 2020 02:16:14 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id e22so3999178ejr.4;
        Mon, 05 Oct 2020 02:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xmHCQUtfKVABNmoQUgBMAoybe0dc0l5wioiNkeBOjgg=;
        b=FOXr0IXR5AWAWZ+VnjVzEP8tfAtws6geapiURCgZIH+gvJECwmYeOjCKSLbp0Gk0qZ
         h6WG6mxxSOxgatvNAb0D14qdKAoicButBdZc+FF93avekJHZEOtXNVYUn9/qJlfH87li
         7VkzALTDXIz1WnB/xyK9Hd3mWWepSYDcBzJfQdknumERGTmUeTwzkfd7bFGn37nCWyYW
         cjQEyMH5n2HCURclYxuGsT803CMlfgfksNcuQg5ZWBhPMTSe6NIb4ZhgTmvcJA4fELUJ
         DS/7aBOJkXPpCpDKG8lX1GIjEuoiJsDDPKrNDcM+kC7uQWdBf0GrGAuOvk1C1cPPjT1O
         WOJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xmHCQUtfKVABNmoQUgBMAoybe0dc0l5wioiNkeBOjgg=;
        b=A2JaVh5XTY+rZj5+A6PfR7dbcXY27ATxQY0ozGBsaEI1U74pbhtEB8kWnlDPfClPa0
         fdZc+nUcf3/r+6q5nPID/Dg+oA8doK/eR28g4FJAuI7lPujc4OUi7UOfAP5QADDscySc
         HrRYAGGuD0RsnG1h6IUDj0VaR2IvHxby2HPxfb5j0ExrYkty8ow0/vbC0RqYmkHGNgnN
         ry4sZxLY7RdTg6eIRtSgoiB2E9NgIPIJo2NyDP4MaK1peXS20LkDwPRM5TBTozn2mdkw
         ZuuEZJhg0Isp8wfd9e/I2O2B9/F9ACrPZAOOO5p4pg3/WE1ZesX9MSzkduXkOUdbXysA
         lDOA==
X-Gm-Message-State: AOAM531IKp22QmOElluqyjd687JI2WJBGuFjfkXrwRcXWzDCAaq4k53m
        RUFWbhFNNEMGBafZl+YIuqY=
X-Google-Smtp-Source: ABdhPJwviIoujy+n/qGTlPYi9SjOkqgh7s6fN0wA1BnPad2GXJX6tKJQFjKvno1ZDFJN8iUUJx9AIw==
X-Received: by 2002:a17:906:4941:: with SMTP id f1mr15121460ejt.417.1601889373155;
        Mon, 05 Oct 2020 02:16:13 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id w21sm3621647ejo.70.2020.10.05.02.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 02:16:11 -0700 (PDT)
Date:   Mon, 5 Oct 2020 11:16:10 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Nicolin Chen <nicoleotsuka@gmail.com>, joro@8bytes.org,
        krzk@kernel.org, vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
Message-ID: <20201005091610.GC425362@ulmo>
References: <20200930084258.25493-1-nicoleotsuka@gmail.com>
 <20200930084258.25493-3-nicoleotsuka@gmail.com>
 <20200930153131.GB3833404@ulmo>
 <ece615ad-8d6b-96ae-d8b4-9667aef17281@gmail.com>
 <20200930160626.GD3833404@ulmo>
 <f11d7d8a-8ce6-a53c-6219-ceec05432002@gmail.com>
 <20200930164707.GB3852280@ulmo>
 <35115ac1-fb25-7226-7b50-61193669e696@gmail.com>
 <20201001075811.GA3919720@ulmo>
 <4dbf5bcb-76af-53c5-31cf-880debbcebf3@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="GPJrCs/72TxItFYR"
Content-Disposition: inline
In-Reply-To: <4dbf5bcb-76af-53c5-31cf-880debbcebf3@gmail.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--GPJrCs/72TxItFYR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 01, 2020 at 10:04:30PM +0300, Dmitry Osipenko wrote:
> ...
> >> There are dozens variants of the panels and system could easily have
> >> more than one panel, hence a direct lookup by phandle is a natural
> >> choice for the panels.
> >=20
> > Not really, there's typically only just one panel. But that's just one
> > example. EMC would be another. There's only a single EMC on Tegra and
> > yet for something like interconnects we still reference it by phandle.
>=20
> Interconnect is a generic API.
>=20
> > PMC is another case and so is CAR, GPIO (at least on early Tegra SoCs)
> > and pinmux, etc.
> >=20
> > The example of GPIO shows very well how this is important. If we had
> > made the assumption from the beginning that there was only ever going to
> > be a single GPIO controller, then we would've had a big problem when the
> > first SoC shipped that had multiple GPIO controllers.
>=20
> This is true, but only if all these words are applied to the generic APIs.

The reason why this is true for generic APIs is because people actually
think about generic APIs a bit more than about custom APIs because they
need to be more future-proof.

That doesn't make it wrong to think hard about using custom APIs because
we also want those to be somewhat future-proof.

> >> While all Tegra SoCs have a single fixed MC in the system, and thus,
> >> there is no real need to use phandle because we can't mix up MC with
> >> anything else.
> >=20
> > The same is true for the SMMU, and yet the iommus property references
> > the SMMU by phandle. There are a *lot* of cases where you could imply
> > dependencies because you have intimate knowledge about the hardware
> > within drivers. But the point is to avoid this wherever possible so
> > that the DTB is as self-describing as possible.
> >=20
> >>>> older DTs if DT change will be needed. Please give a detailed explan=
ation.
> >>>
> >>> New functionality doesn't have to work with older DTs.
> >>
> >> This is fine in general, but I'm afraid that in this particular case we
> >> will need to have a fall back anyways because otherwise it should break
> >> the old functionality.
> >=20
> > It looks like tegra20-devfreq is the only one that currently does this
> > lookup via compatible string. And looking at the driver, what it does is
> > pretty horrible, to be honest. It gets a reference to the memory
> > controller and then simply accesses registers within the memory
> > controller without any type of protection against concurrent accesses or
> > reference counting to make sure the registers it accesses are still
> > valid. At the very least this should've been a regmap.
>=20
> Regmap is about abstracting accesses to devices that may sit on
> different types of buses, like I2C or SPI for example. Or devices that
> have a non-trivial registers mapping, or have slow IO and need caching.

Those are common uses, yes.

> I think you meant regmap in regards to protecting IO accesses, but this
> is not what regmap is about if IO accesses are atomic by nature.

Then why is there regmap-mmio?

> The tegra20-devfreq functionality is very separated from the rest of the
> memory controller, hence there are no conflicts in regards to hardware
> accesses, so there is nothing to protect.
>=20
> Also, Regmap API itself doesn't manage refcounting of the mappings.

That may be true now, but at least it is something formal rather than
just dereferencing some pointer and accessing registers through it. If
this ever becomes a problem it's something that we can more easily
address.

> > And not
> > coincidentally, regmaps are usually passed around by referencing their
> > provider via phandle.
>=20
> Any real-world examples? I think you're mixing up regmap with something
> else.

syscon is the most obvious that comes to mind. It is meant to address
the kind of use-case that tegra20-devfreq apparently needs here, where
you have registers for certain functionality that are located in a
completely different IP block from the rest of that functionality. Often
there are better alternatives to solve this, by reusing existing
infrastructure, such as pinmux.

In cases where no subsystem exists we typically use syscon, which are
implemented via regmaps, to gain access to shared registers.

> The devfreq driver works just like the SMMU and GART. The devfreq device
> is supposed to be created only once both MC and EMC drivers are loaded
> and we know that they can't go away [1].
>=20
> [1]
> https://patchwork.ozlabs.org/project/linux-tegra/patch/20200814000621.841=
5-32-digetx@gmail.com/

Huh... why is the tegra20-devfreq device instantiated from the EMC
driver? That doesn't make any sense to me. If there aren't any registers
that the driver accesses, then it would make more sense to subsume that
functionality under some different driver (tegra20-mc most likely by
the looks of things).

On a side-note: once we move tegra20-devfreq into tegra20-mc, there's no
need for this look up at all anymore.

> Hence the tegra20-devfreq driver is horrible as much as the SMMU and
> GART drivers. Perhaps not much could be done about it unless MC driver
> is converted to MFD. But MFD won't work for tegra20-devfreq driver
> anyways because it depends on presence of both MC and EMC drivers
> simultaneously :)
>=20
> Besides you didn't want the MFD couple years ago [2].
>=20
> [2]
> https://patchwork.ozlabs.org/project/linux-tegra/patch/675f74f82378b5f7d8=
f61d35e929614a0e156141.1523301400.git.digetx@gmail.com/#1902020

That's because MFD is a misguided effort to split drivers into parts
that fit nicely into Linux' subsystems.

See the above devfreq vs. memory-controller mess for why that's a bad
idea. If you have to jump through hoops like that (i.e. create a virtual
device for a driver to bind against and then look up the device tree
node of the originator of that virtual device to get at its resources)
there's something seriously wrong.

I'm glad we caught this before this made it in.

> > That's exactly the kind of hack that I want to prevent from happening.
> > If you can just grab a pointer to the memory controller with a global
> > function pointer it makes people think that it's okay to use this kind
> > of shortcut. But it isn't.
> > Given the above, the lookup-by-compatible fallback should stay limited
> > to tegra20-devfreq. Everything else should move to something saner. So
> > this new helper should look up by phandle and not have a fallback, but
> > instead the tegra20-devfreq should fall back if the new helper doesn't
> > return anything useful (probably something like -ENOENT, meaning that
> > there's no phandle and that we're using an old device tree). Bonus
> > points for updating the DT bindings for tegra20-devfreq to also allow
> > the memory controller to be specified by phandle and use a regmap for
> > the shared registers.
> The tegra20-devfreq driver doesn't share registers with other drivers.
> MC statistics collection is a part of the MC, but it has no connection
> to the other functions of the MC, at least from SW perspective.
>=20
> Apparently you're missing that it's still not a problem to change the
> T20 DT because all the MC-related drivers are still inactive in the
> upstream kernel and awaiting the interconnect support addition.

Great, that means it's not too late and we can still add that phandle.

> Secondly, you're missing that tegra30-devfreq driver will also need to
> perform the MC lookup [3] and then driver will no longer work for the
> older DTs if phandle becomes mandatory because these DTs do not have the
> MC phandle in the ACTMON node.
>=20
> [3]
> https://github.com/grate-driver/linux/commit/441d19281f9b3428a4db1ecb3a02=
e1ec02a8ad7f
>=20
> So we will need the fall back for T30/124 as well.

No, we don't need the fallback because this is new functionality which
can and should be gated on the existence of the new phandle. If there's
no phandle then we have no choice but to use the old code to ensure old
behaviour.

>=20
> >> So I don't think that using phandle for the MC device finding is really
> >> warrant.
> >>
> >> Phandle is kinda more applicable for the cases where only the DT node
> >> lookup is needed (not the lookup of the MC device driver), but even th=
en
> >> it is also not mandatory.
> >>
> >> I hope you agree.
> >=20
> > I strongly disagree. We look up a bunch of devices via phandle, and in
> > only very rare cases do we care only about the DT node. When we look up
> > clocks, resets or GPIOs, we always get some sort of resource handle. It
> > makes sense to do so because we need to operate on these resources and
> > having only a DT node doesn't allow us to do that.
>=20
> We don't have this problem because MC drivers do not support unloading.
> Hence this is not something to really care about for now.
>=20
> Maybe MC drivers won't ever support unloading and then why do we need to
> discuss it at all? Should be better to get back to this once there will
> be a real need.

We need to discuss this now because it has implications for the DT
bindings, which, once established, we will never be able to change
again. At least not in a backwards-incompatible way.

That implies that any code we add based on that assumption will have to
be maintained in the kernel basically forever. As you see for the case
of tegra30-devfreq that means we need the existing fallback to remain
backwards-compatible with older DTBs that don't have the link to the
memory controller to get at the frequency table.

Now, this is obviously something that we should've done since the
beginning but we didn't and now we're stuck with it. But we shouldn't
further compound the problem by doing things by halves now.

> > Ultimately this is a matter of principle. Yes, it's true that there is
> > only a single MC on Tegra and we can "cheat" by taking advantage of that
> > knowledge. But we don't have to, and it's not even very difficult to not
> > rely on that knowledge. Treating the MC differently from everything else
> > also makes it more difficult to understand the associated code and on
> > top of that it sets a bad example because other people seeing this code
> > will think it's a good idea.
> >=20
> > The big advantage of uniformity is that it drastically simplifies things
> > and causes less suprises.
>=20
> But we aren't talking about the uniformity, at least I'm not.
>=20
> To be honest, it feels to me that you're talking from perspective of
> yours generic memory controller API series and want to see everything
> tailored for it, which is okay :)

I had actually given up on that idea because it wasn't gaining any
momentum. But your point is valid for a different reason. Just because
there's currently no generic framework for memory controllers doesn't
mean there never will be, so we should design things with some
genericity in mind so that if something generic ever comes around we
have a simpler way of transitioning to it.

> While I'm merely wanting to improve the existing codebase with minimal
> efforts and without a need to change DTs.
>=20
> Alright, I'll consider to add the phandles as a part of the interconnect
> series since you're so concentrated on it :) But the series is already
> 40+ patches.. although, the vast majority of the patches are very
> trivial, so maybe okay to add couple more trivial patches. I'm very
> hoping that you will manage to allocate time for reviewing of the
> upcoming v6 and that it will be good for merging into to the v5.11!

Okay, sounds good.

Thierry

--GPJrCs/72TxItFYR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl965FcACgkQ3SOs138+
s6F83Q//bRKGB2O7N3kclRtle7IeGCFsDURatZU6G2yIa8CQcpd3LyBNBO8wvEKS
xgcQ0hKFgickbn2izai/VPUxhUATIYmLLaUzmXCRy/1Dr5PWyiGqyCHDIy0jFqKt
3wDj4oVLj5QA1Ga0DaitUmQl9m0W8DUKFQSwCFp4nNb2Q1KvruJbdE3UcR7ThlNW
d6n99RZmbHFH7catRxilH9GBWDovKDLPcVnLChMG0TXMTVSWiC/G2jW5lHxqq3XZ
rxM813waNVqOeATg6oiKCjZvMAIZjC+21T1cTJWohhVtuJUO5tSCTN5+t8nTqoYn
qaRze83Ls1DasEpIxXWLtgr3YBNTfmoIVkgldQVFMBihFP00XR3kImFnHSq0rxll
4UvYDXniCu77k1aUec8n2lXOJ+6EfQJ13fdqoy8PjhXnTeOS6p6A5xlPXxfqzF24
vDtBNLbgN1kI4RK0tryN4nLGUEY+N41vlkUrJUpU8+yU9B68b8mmskp0DwzGN5yZ
FZwjiLHFgNQvMGC6/bJum2HMWKzn4ucH9zDkzUOS2Ef6WaPwRxJeCsKPZetDbKq+
trfvEfB73SwasyhN90V36SmDhqMfsXgTBKHpk5lldWrq9TmbuItzHBw1knt1UdG2
5H3yefLvmpSZ7SkmUo1ylDE6bub8RDDnjkXZ/zlgB352D+kLsP0=
=HqQv
-----END PGP SIGNATURE-----

--GPJrCs/72TxItFYR--
