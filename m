Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DA1DC4708F
	for <linux-tegra@archiver.kernel.org>; Wed,  2 Jun 2021 14:58:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6CE15613BA
	for <linux-tegra@archiver.kernel.org>; Wed,  2 Jun 2021 14:58:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230456AbhFBO7x (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 2 Jun 2021 10:59:53 -0400
Received: from mail-ej1-f53.google.com ([209.85.218.53]:43531 "EHLO
        mail-ej1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230445AbhFBO7v (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 2 Jun 2021 10:59:51 -0400
Received: by mail-ej1-f53.google.com with SMTP id ci15so4265101ejc.10
        for <linux-tegra@vger.kernel.org>; Wed, 02 Jun 2021 07:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9RLU/826fL0tWIk2PrvJDBE7HJXooGGXs9jpMJCjFmk=;
        b=QAnEBPM0bz46mcSUJMsqPwBeBOS6PzdZ3pO2u+CwmZ5N8gyzfkZoGFTknvwVHDvBRn
         fm5DhLt+LvRJmnPK5wyy+BRzxTWm2rVKPg6YBzKd9QWjPbLXroSCUe6zwIx7NU8Q2O3S
         Z5AJH/z1h2RWrvub9IblT3h7/oyqwxXjdJfwEgHA9D6KbzYsk/pJfFYwsxcPZ+T+DJl5
         sQ7PFLl9g0moUcxFEBOo5aMS7n+iJMVTklvREVzLi4zSRAVye/RV8nq1F8RkXMgBb5Jm
         ZOu6m5yMM2Oabson/PLKtvOwyLaKIqzMif6UlBpcA9swXxF1VJHHJb8tLqY6NNdZCTcc
         85MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9RLU/826fL0tWIk2PrvJDBE7HJXooGGXs9jpMJCjFmk=;
        b=cjl5BnWKdWLN1Vnd4HxCEzezhKsk18N2Y2Qg6GDWBUW9gtbxFv/V+ZWntmRUbKv/+/
         qccvnQbK4S+TwqKgxd9m8cqBZ+gqo2wveZxgm6hkzgQKlJ8AsVrY/b9O090NO8S4PZ20
         Yjcu8JUY89+IH60KjF+8wLhvmx0IFkJcZbCkYfzWp5OuJFBtLxPcBJuY+5VMu+PgodUo
         OrnkHOa2WAqspI1r5+R/4Y6lF7zz4hn09Lz6TNkMd59jdYPk2ZEyGTXFK236BR3zKNIR
         LnkRTeW6H8f85cw1Cu+XeXAPuH4bAgxCSSztxQ2132CJFK7ZZib8zWSzfJNy9sD8jGXi
         GYlw==
X-Gm-Message-State: AOAM531+7ZyHeMeS7NS8q10P4IDk9Qz3Xg3rH+An1SDyiQPDGMMxpPq0
        bq4AcB8/rzXHnCe8LJpJg/I=
X-Google-Smtp-Source: ABdhPJxcl5AxBDibOdNUu+8zMhKTO7KIau9/v+b2PNTkAe8Cqa/TRnHv5OrqQdQzkXZ12hw5MhrRfA==
X-Received: by 2002:a17:906:5299:: with SMTP id c25mr19095821ejm.85.1622645814812;
        Wed, 02 Jun 2021 07:56:54 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id dk12sm131166ejb.84.2021.06.02.07.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 07:56:53 -0700 (PDT)
Date:   Wed, 2 Jun 2021 16:58:29 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Will Deacon <will@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 00/10] arm64: tegra: Prevent early SMMU faults
Message-ID: <YLeclZlP8l3dMX4o@orome.fritz.box>
References: <20210420172619.3782831-1-thierry.reding@gmail.com>
 <YLEi2FonP568wYrE@orome.fritz.box>
 <20210601122646.GB27832@willie-the-truck>
 <YLZ3qPC8ofjsGkPi@orome.fritz.box>
 <6826d892-d1ac-e3b1-ebee-68392d11d7c5@canonical.com>
 <8c70f82f-0db9-2312-7fc4-c079899c25a0@canonical.com>
 <YLdGwD0dxfER4USn@orome.fritz.box>
 <e2341ca1-7b6d-cc19-8c43-1ada0b1f5601@canonical.com>
 <20210602114049.GF30593@willie-the-truck>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="NklhWG4Eau+rgwxG"
Content-Disposition: inline
In-Reply-To: <20210602114049.GF30593@willie-the-truck>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--NklhWG4Eau+rgwxG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 02, 2021 at 12:40:49PM +0100, Will Deacon wrote:
> On Wed, Jun 02, 2021 at 12:44:58PM +0200, Krzysztof Kozlowski wrote:
> > On 02/06/2021 10:52, Thierry Reding wrote:
> > > On Wed, Jun 02, 2021 at 09:35:13AM +0200, Krzysztof Kozlowski wrote:
> > >> On 02/06/2021 09:33, Krzysztof Kozlowski wrote:
> > >>> On 01/06/2021 20:08, Thierry Reding wrote:
> > >>>> On Tue, Jun 01, 2021 at 01:26:46PM +0100, Will Deacon wrote:
> > >>>>> On Fri, May 28, 2021 at 07:05:28PM +0200, Thierry Reding wrote:
> > >>>>>> On Tue, Apr 20, 2021 at 07:26:09PM +0200, Thierry Reding wrote:
> > >>>>>>> From: Thierry Reding <treding@nvidia.com>
> > >>>>>>>
> > >>>>> Probably best if I queue 3-6 on a separate branch once you send a=
 v3,
> > >>>>> then Krzysztof can pull that in if he needs it.
> > >>>>
> > >>>> Patch 5 has a build-time dependency on patch 1, so they need to go=
 in
> > >>>> together. The reason why I suggested Krzysztof pick these up is be=
cause
> > >>>> there is a restructuring series that this depends on, which will g=
o into
> > >>>> Krzysztof's tree. So in order to pull in 3-6, you'd get a bunch of=
 other
> > >>>> and mostly unrelated stuff as well.
> > >>>
> > >>> I missed that part... what other series are needed for this one? Ex=
cept
> > >>> Dmitry's power management set I do not have anything in my sight for
> > >>> Tegras memory controllers.
> > >>>
> > >>> Anyway, I can take the memory bits and provide a stable tag with th=
ese.
> > >>> Recently there was quite a lot work around Tegra memory controllers=
, so
> > >>> this makes especially sense if new patches appear.
> > >>
> > >> OK, I think I have now the patchset you talked about - "memory: tegr=
a:
> > >> Driver unification" v2, right?
> > >=20
> > > Yes, that's the one. That series is fairly self-contained, but Dmitry=
's
> > > power management set has dependencies that pull in the regulator, clo=
ck
> > > and ARM SoC trees.
> > >=20
> > > I did a test merge of the driver unification series with a branch that
> > > has Dmitry's patches and all the dependencies and there are no confli=
cts
> > > so that, fortunately, doesn't further complicates things.
> > >=20
> > > Do you want me to send you a pull request with Dmitry's memory
> > > controller changes? You could then apply the unification series on to=
p,
> > > which should allow this SMMU series to apply cleanly on top of that.
> >=20
> > Makes sense and it looks quite bulletproof for future changes. Let's do
> > like this. I will apply your patch 1/10 from this v2 on top of it and
> > driver unification later.
>=20
> Okey doke. Thierry -- please let me know which patches I can queue. Having
> the SMMU driver changes in the IOMMU tree really helps in case of conflic=
ts
> with other SMMU changes. As I say, I can put stuff on a separate branch f=
or
> you if it helps.

Given that the SMMU patches have a build-time dependency on the first
patch in the series, and the series depends on the unification series, I
think Krzysztof would have to pull the memory controller branch that I
have with Dmitry's work, apply the unification series on top and then
take patch 1 of this series on top of that. That's the state that you'd
have to pull into the SMMU tree to get the right dependencies.

The SMMU pieces are the leaf of the dependency tree, so technically no
separate branch is needed, because I don't think anybody would have to
pull from it. However, a separate branch might make it easier to back
any of this work out if we have to.

Krzysztof, I do plan on sending out a v3 of the unification series to
address the two cleanups that Dmitry and you have pointed out. After
that I can send out v3 of this series to fix the ordering issue that
Krishna had mentioned. After all of those are applied, would you be able
to provide a stable branch for Will's SMMU tree?

Thierry

--NklhWG4Eau+rgwxG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmC3nJUACgkQ3SOs138+
s6G5qRAAi9IkZoO8OpHp1SldqyZjWSfQI0mnh9AhIX/kBkbvi378AFhSPNoAH3rG
pZINISZZIP7WlB/dkV/YQKTiveEHfBgHPxF/i2/ES9SIah6o2BJMKUh7AdpgB+Nk
oEv3BTH4z12idTkydBdAdzX21I1O41noQnFdNYxhfiO0q5zCSjP+SNaW5CL0H9tW
VqO3O2nGETEHymcw/2u1oLNHld0ALPUwSiVzB6x32TlTNnusFrgU2SH/ymLeDLgA
AJ4atRdjjQZPabBymAfzbL6tGSshV7d6Vb7qI6pcEzqEXmgPtcB+CKo8uoSpue6n
zg3WwdBMtjc4AKSnEQ82kHafaUdW0Cjz0Xp6jeIFJmSYYPNQCF0W3j9sQcQIOQ6e
/RHB8OGhardOiwZ1QbEz+eQDc1umCPExfm8WCtFi7DxA6mIOkrb2at/fSVVCWbG8
a9MxLd68bpPuhCWxzgMdjyW3rmCl8S7xLRc0FwjDoxZ2n0XURAwqwWwsIwrUMeUA
OsvMv+Tq4vmFMV6MEc0kxEnzNsUTXoVL1uPTkwDsxfitb1CqgOxQbnZwOESPhO80
0rIIAfqoI5QWjiNrNePwlBnwrmZNhTF57wMWm4ELR5bG5CeIYXKCUF2Qf+hjHYEP
B7GMc1oAkKi978C8VU2hhyIjypSEhqBJRejaIitADr3UdxctPF4=
=R26M
-----END PGP SIGNATURE-----

--NklhWG4Eau+rgwxG--
