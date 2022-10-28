Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DB15FA3741
	for <linux-tegra@archiver.kernel.org>; Fri, 28 Oct 2022 14:24:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229909AbiJ1OYP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 28 Oct 2022 10:24:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230404AbiJ1OYG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 28 Oct 2022 10:24:06 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E233D7F08E;
        Fri, 28 Oct 2022 07:24:01 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id l11so6923768edb.4;
        Fri, 28 Oct 2022 07:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1WNx4yfmC2U2E4sOpj8fuWYGqScB4dVY74TwkvhFBpE=;
        b=BdMcIjkGtdB6QHnO0UqPMIgIbwrcBaBsurYNtLQNWtQdjYYAk0QJ/qtkXsdk3KU4oc
         D0rYoyX8uo2Hs2p28sgxsY22aOyR76J53s4uRgyYAGwUx9eNhFXRePS0rvuyHiK5vruP
         X2ZpVWwq8gL4V22UiHsdY1V9f+pXT99i7DYkgtR4LdVwioc4ONSn3YDtKZmuMnjA5gTg
         4F6qZ9TNIeBQY4uNhZZOQ+vRrAfHipnIMT3XBX/Hu6GqWdVcu00MawmARpPjgXki28lH
         zDNbjH/hZr4B65wO/QGmTMG2oYd3Rrt56XEbKkicKKoq8QDnnOmiumXfCe1y6gHWNwYZ
         Ltrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1WNx4yfmC2U2E4sOpj8fuWYGqScB4dVY74TwkvhFBpE=;
        b=pPpW0+5SSVnt0kS6NRk1SwOPw20xh1yeBy8jZqtA8ZcMo6GgR06x0YvRHLYpSGB6pR
         Hth6/SMK773fEGkwYHZK2QskKWHvPlLwXatvPtP0qP3lnNiPzrxB6YlYpHdIh8kUNo4F
         OayXRMw5wXnRPC/ckr8lvjf4MzMRuI5bDcfxNUFjcCmX7/q5sNsGwT20u1rVZIwpm4KF
         gsqTMx3vEPBFtEnAe1LDW2Ln5dcUrIIYLyjRsI/aRKJxwV2WO4Oi0qwwhV6lXpbkUDqK
         +gxzWqgXd/XvfJPgxnmdM4E5yZBR/NWyvmqJr0aL40bzcc1e/PPgw9zCSXMjhFHUNEmm
         zAfA==
X-Gm-Message-State: ACrzQf2q4nKnirRNJQa289I2NUHOxXpNoi1s+4uXuS8tKjvqFF4TOKfb
        KhTYmqbSr6SgHCWUHUiDgp8ycSnTx3Y=
X-Google-Smtp-Source: AMsMyM4ik7rZcQCOXBPPYJ3o+aIYHG80fp5tiP5YBP+g26Vh2wZbIWjETpw9Q40LUbXywZdlf8pfLw==
X-Received: by 2002:a05:6402:90b:b0:45c:16a0:ec1e with SMTP id g11-20020a056402090b00b0045c16a0ec1emr52558047edz.427.1666967040383;
        Fri, 28 Oct 2022 07:24:00 -0700 (PDT)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id r19-20020aa7cfd3000000b004611c230bd0sm2794945edy.37.2022.10.28.07.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 07:23:59 -0700 (PDT)
Date:   Fri, 28 Oct 2022 16:23:57 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 2/2] memory: tegra: Add DLA clients for Tegra234
Message-ID: <Y1vl/cyDUVFWzz1z@orome>
References: <20221028123741.134880-1-jonathanh@nvidia.com>
 <20221028123741.134880-2-jonathanh@nvidia.com>
 <ce3fdd20-248f-4fdd-fe83-2aa79fd297c5@linaro.org>
 <073073ae-d921-e11f-8ff4-67f1a61760d0@nvidia.com>
 <c1465ec3-a903-f1d1-621f-2cbe95ae53e7@linaro.org>
 <1c22af7f-fa73-6f79-ad12-d460b7c534c8@nvidia.com>
 <4a4c2b3d-79e5-1f34-a031-77d1d1941000@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="SGWPt8G5BjvFgXNp"
Content-Disposition: inline
In-Reply-To: <4a4c2b3d-79e5-1f34-a031-77d1d1941000@linaro.org>
User-Agent: Mutt/2.2.7 (2022-08-07)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--SGWPt8G5BjvFgXNp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 28, 2022 at 09:07:28AM -0400, Krzysztof Kozlowski wrote:
> On 28/10/2022 09:05, Jon Hunter wrote:
> >=20
> > On 28/10/2022 13:52, Krzysztof Kozlowski wrote:
> >> On 28/10/2022 08:51, Jon Hunter wrote:
> >>>
> >>> On 28/10/2022 13:46, Krzysztof Kozlowski wrote:
> >>>> On 28/10/2022 08:37, Jon Hunter wrote:
> >>>>> Add the memory clients on Tegra234 which are needed for initialisin=
g the
> >>>>> SMMU for the Deep Learning Accelerator (DLA).
> >>>>>
> >>>>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> >>>>> ---
> >>>>>    drivers/memory/tegra/tegra234.c | 160 ++++++++++++++++++++++++++=
++++++
> >>>>>    1 file changed, 160 insertions(+)
> >>>>>
> >>>>> diff --git a/drivers/memory/tegra/tegra234.c b/drivers/memory/tegra=
/tegra234.c
> >>>>> index a9e8fd99730f..9bdaf8af8c97 100644
> >>>>> --- a/drivers/memory/tegra/tegra234.c
> >>>>> +++ b/drivers/memory/tegra/tegra234.c
> >>>>> @@ -170,6 +170,166 @@ static const struct tegra_mc_client tegra234_=
mc_clients[] =3D {
> >>>>>    				.security =3D 0x504,
> >>>>>    			},
> >>>>>    		},
> >>>>> +	}, {
> >>>>> +		.id =3D TEGRA234_MEMORY_CLIENT_DLA0RDA,
> >>>>> +		.name =3D "dla0rda",
> >>>>> +		.sid =3D TEGRA234_SID_NVDLA0,
> >>>>
> >>>> This is now not applicable because you sent dependencies separate, m=
ixed
> >>>> with other subsystems... Split pieces based on subsystems.
> >>>
> >>> Sorry I don't understand. This patch is dependent upon the first. I h=
ave
> >>> not sent anything separate.
> >>
> >> You sent mixed between subsystems patches adding TEGRA234_SID_NVDLA0.
> >> That one should have been sent separate so maintainers can pick it up.
> >=20
> > The original patch [0] I sent had no dependencies and so Thierry picked=
=20
> > this up. However, when adding patch 2/2 here, I noticed a typo in the=
=20
> > definition for TEGRA234_MEMORY_CLIENT_DLA0WRB so thought I would fix=20
> > this up while I am at it.
> >=20
> >> Now, it's not possible for me to pick this patch.
> >=20
> > Yes now you cannot simply pick this up. We have had similar problems=20
> > before. I am not sure if it is easiest for Thierry to pick these up.
> >=20
>=20
> And there is simple solution as I said - split the patches per
> subsystem. Why the dependency was combining multiple subsystems into one?

Splitting per subsystem doesn't really work in this case. The main
problem is that the dt-bindings headers are used by multiple subsystems,
and the content is not generated in a git-friendly way. So even if we
were to split things up, at some point there would be conflicts between
the various branches that these changes end up in.

The easiest solution for this is to simply take this through a single
tree. Normally this wouldn't be a problem because the symbols defined in
these headers are only used in device trees. However, for the memory
clients it is slightly complicated by the fact that the memory
controller driver also needs access to these symbols, so it creates an
interdependency between the dt-bindings, DT and memory controller
branches.

One of the reasons why Jon originally sent the larger patch, adding all
the missing IDs in one go, was precisely so we could avoid this hassle
in the future.

Thierry

--SGWPt8G5BjvFgXNp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmNb5f0ACgkQ3SOs138+
s6F97Q//TI/SluqHTnhnTLlvEv5LTZ2qz+g4U/DR8qX2ixpoYjQohofq08SkRmAm
MwWRXqFsr6aB/CKUFtW2XoMJEKnRQUkBQHHTapTCp9WsN7w8LjjVjbBNr/EbZ9wA
p6ZZr4/i2JkjlLD0IdqIX3py9aWZcNO1ek7td56o+tONtKwQU5I5EoJ7hvuPaCTc
UQ/jzVrmFYK+1jeaicrdKdd/GADap1+BVoG48WBmxFTYv/nSl3WQAzJdirCh8DBP
bzHVaG5cDOf8QxvX7czdEjACVqfEY5v9k7wb6bHQckdDq2kNWSC33gcEps2FO3Ke
9HTp1nuUPZRBttrXOo+RNS5ckRirBKUaaQnVplT/fL35ebTKR1CQ5cogbcc3as7t
EyPkldde+Ic8nu8y15+d2OBjjy4VHga7o/vWHLmYUiVEck29wO4kyPYMH9ZsDW40
yjNs3hDs9++ICpDKnbmK0Veu3LWuJSAgL/rZpaL6RQJvNd1Y/5RlljLqlO8blYzo
+6J2MS+yoai5XZwkjF1EVeZMDyMBb83UXnbHCAymgYGHUX6otzIhom1azZmW7tOg
3JgPmt4SatRwb9dJHN+244fRggp/JL6Wga1o+TP7zGFBbBIXb3hNNL6UOVgOPe6a
irlq6UIIS/Tk739d9KhvwR1FhNeBpsQIW5Ey0hfZ9J6sTCbyaC0=
=SPDS
-----END PGP SIGNATURE-----

--SGWPt8G5BjvFgXNp--
