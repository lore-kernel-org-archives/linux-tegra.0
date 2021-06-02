Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7926C4708F
	for <linux-tegra@archiver.kernel.org>; Wed,  2 Jun 2021 14:52:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CB1E6613AD
	for <linux-tegra@archiver.kernel.org>; Wed,  2 Jun 2021 14:52:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230169AbhFBOxn (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 2 Jun 2021 10:53:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230344AbhFBOxn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 2 Jun 2021 10:53:43 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B10ABC061574
        for <linux-tegra@vger.kernel.org>; Wed,  2 Jun 2021 07:51:59 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id o2-20020a05600c4fc2b029019a0a8f959dso1861979wmq.1
        for <linux-tegra@vger.kernel.org>; Wed, 02 Jun 2021 07:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Nkt8KPfqDi5TWbmstglfL/OjBRc12eUZyJN6dfxcyYY=;
        b=BDMMSY1r3vq78bjj63/onXAzk5YkXmwDy3/sAEHfpPzBLxNb9fCTeksBW2hODNwTwy
         8wSAi6uKRHoiNsQwvcG7TqA7xxVdYf3N8oQ8mIoXwUBy9IHxNzVs/fcSnzDLBYD2K2F2
         j21MnMC0cCynQ5vNhDGn1prpPjD0A0hOLLGDPIt97H+Gk1nm7ZWZhmitkZLJpPYzE3ur
         Wqei6CiD1o0hFdwF6nCqDrvGUNNVJ+Cw8HQ9b8q/UausgN6FwzgSWLg3fugUbo4eLYo9
         aEEMcHRonggkPeABE5ULJgTf20C3SXejxfjEx4dSSDfWpJCYcQ2iKj7Lif/jWC/bMT1n
         DQYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Nkt8KPfqDi5TWbmstglfL/OjBRc12eUZyJN6dfxcyYY=;
        b=Xb7A0A50nB4YkLZmi6SZ6sTm5MqVhvl8jVHgtVRJY0QkLUYboZ9y64YXwvNTyUj86G
         AeSBx/NJX+4+J2vE9TmGedpTV5R6NgKUJKcD/49MaL8rYvcXGlPJEUL/6TgRQ9DCdJQn
         htnSyEx0yT4Xav0PfkZ+UtmYkSlILDKaugQYXwVC1+SyJeEuRP9iTDNLn3o4AaTpCFZt
         7jBquBEVd6yZKac0jnFggTw1rYM6dWqNL7Fcy8T8lIREfjnaQhBjQKvWNiFIFDAR9FSC
         kowqxobNdnmrvo66dfzWe2515Orux//EH7w1XINA+bE9M/Fh2JP6q2og30Fbrjy+sGtd
         fNow==
X-Gm-Message-State: AOAM533JKYqE9voKG5V5YiwCcsNL4WCQOqyn+aLeMyPOTnY82lCNKo2E
        NGO5dwWU+1H9Xq34HcNMULc=
X-Google-Smtp-Source: ABdhPJzGxjKaKFjAqs6BqyH5Kj1Mmxy0tLQHDRb8S3XCS8M8JiNPS0yt/Vl7BSPAGGmUgNtADYcMGg==
X-Received: by 2002:a1c:f213:: with SMTP id s19mr16770790wmc.61.1622645518300;
        Wed, 02 Jun 2021 07:51:58 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id v7sm189546wru.66.2021.06.02.07.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 07:51:57 -0700 (PDT)
Date:   Wed, 2 Jun 2021 16:53:33 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 00/10] arm64: tegra: Prevent early SMMU faults
Message-ID: <YLebbQZlROtSq124@orome.fritz.box>
References: <20210420172619.3782831-1-thierry.reding@gmail.com>
 <YLEi2FonP568wYrE@orome.fritz.box>
 <20210601122646.GB27832@willie-the-truck>
 <YLZ3qPC8ofjsGkPi@orome.fritz.box>
 <6826d892-d1ac-e3b1-ebee-68392d11d7c5@canonical.com>
 <8c70f82f-0db9-2312-7fc4-c079899c25a0@canonical.com>
 <YLdGwD0dxfER4USn@orome.fritz.box>
 <e2341ca1-7b6d-cc19-8c43-1ada0b1f5601@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="d7meRK8uCRENx+0w"
Content-Disposition: inline
In-Reply-To: <e2341ca1-7b6d-cc19-8c43-1ada0b1f5601@canonical.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--d7meRK8uCRENx+0w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 02, 2021 at 12:44:58PM +0200, Krzysztof Kozlowski wrote:
> On 02/06/2021 10:52, Thierry Reding wrote:
> > On Wed, Jun 02, 2021 at 09:35:13AM +0200, Krzysztof Kozlowski wrote:
> >> On 02/06/2021 09:33, Krzysztof Kozlowski wrote:
> >>> On 01/06/2021 20:08, Thierry Reding wrote:
> >>>> On Tue, Jun 01, 2021 at 01:26:46PM +0100, Will Deacon wrote:
> >>>>> On Fri, May 28, 2021 at 07:05:28PM +0200, Thierry Reding wrote:
> >>>>>> On Tue, Apr 20, 2021 at 07:26:09PM +0200, Thierry Reding wrote:
> >>>>>>> From: Thierry Reding <treding@nvidia.com>
> >>>>>>>
> >>>>> Probably best if I queue 3-6 on a separate branch once you send a v=
3,
> >>>>> then Krzysztof can pull that in if he needs it.
> >>>>
> >>>> Patch 5 has a build-time dependency on patch 1, so they need to go in
> >>>> together. The reason why I suggested Krzysztof pick these up is beca=
use
> >>>> there is a restructuring series that this depends on, which will go =
into
> >>>> Krzysztof's tree. So in order to pull in 3-6, you'd get a bunch of o=
ther
> >>>> and mostly unrelated stuff as well.
> >>>
> >>> I missed that part... what other series are needed for this one? Exce=
pt
> >>> Dmitry's power management set I do not have anything in my sight for
> >>> Tegras memory controllers.
> >>>
> >>> Anyway, I can take the memory bits and provide a stable tag with thes=
e.
> >>> Recently there was quite a lot work around Tegra memory controllers, =
so
> >>> this makes especially sense if new patches appear.
> >>
> >> OK, I think I have now the patchset you talked about - "memory: tegra:
> >> Driver unification" v2, right?
> >=20
> > Yes, that's the one. That series is fairly self-contained, but Dmitry's
> > power management set has dependencies that pull in the regulator, clock
> > and ARM SoC trees.
> >=20
> > I did a test merge of the driver unification series with a branch that
> > has Dmitry's patches and all the dependencies and there are no conflicts
> > so that, fortunately, doesn't further complicates things.
> >=20
> > Do you want me to send you a pull request with Dmitry's memory
> > controller changes? You could then apply the unification series on top,
> > which should allow this SMMU series to apply cleanly on top of that.
>=20
> Makes sense and it looks quite bulletproof for future changes. Let's do
> like this. I will apply your patch 1/10 from this v2 on top of it and
> driver unification later.

The SMMU series here depends on the unification series, so the
unification series needs to go first. It'd be a fair bit of work to
reverse that because the ->probe_device() callback implemented by the
first patch of this SMMU series is part of the tegra_mc_ops structure
that's introduced in the unification series.

Thierry

--d7meRK8uCRENx+0w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmC3m2oACgkQ3SOs138+
s6E4eg//aFBqXZzywd1NQPNcq3zTATqjd/of/rM4RoIKdQ/wYGhm+Ur8KI4gqdvL
Y0kfriu2nyazB5sOTW8avX9HldBX+Pey5Th0/9c/RnkKmc7Z8KyaL0ojdXt7je/K
HOmKbNn8ndcpZWGQXqMSz6F2v9DQFNr27eJnPBQMCj+RGJeje50FQd9sQz8pedkm
mjaNs9d0aV/oa/poHWYU+R0nIyDYVAaEVZvajtOP4nJo+kacKp1zf5wa0OCHKUed
8VmvD817JVUj7FOSLn6y7pCiJnbZcLsSoL/DwGqv/ehq7dd9bq1iAh+FMX2yggr+
B2Y6fKnLEh+6D75ncsAE7ouD4f3jNNF9tHk3w5e5ci9fV0l6W8J3dlEWTMYurfa7
AIP38eZwDNtxazgYx00CXdHOzPfrDP3oHfLGBo48fmsV5zesLvzZQujxFXpiSzfP
wYdHWCok+79iu4FxO7lqsj3hlCxfAtKrnz/itYbSLrkooe5DrYoLmBHQVBNauQJz
2juAU0hyYP5OSN7T/rtQvj3OR8e/XIX10pJxOPiYTS2/bkWBEvUxM61+oc4OMy4r
AvKuNI70T1vHlfr8EN4X5ucttyoBNqeADiKmzlAD9RaGA1zucEesp8vd5xzDNsBs
8lr2OA03q+sX+VpMHufXXOiLZFDJZ5ADd8Xys+CNfEIfJ6sL/OY=
=FosS
-----END PGP SIGNATURE-----

--d7meRK8uCRENx+0w--
