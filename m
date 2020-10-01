Return-Path: <SRS0=WsFM=DI=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38C6EC4727C
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Oct 2020 07:58:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E16F221707
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Oct 2020 07:58:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WoYYrjyt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726992AbgJAH6S (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 1 Oct 2020 03:58:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725938AbgJAH6S (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 1 Oct 2020 03:58:18 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3DD5C0613D0;
        Thu,  1 Oct 2020 00:58:16 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id p9so6612038ejf.6;
        Thu, 01 Oct 2020 00:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zkb86cHhox/rga06645EOTTfJRON6+kEX9b4sGgRzJw=;
        b=WoYYrjytnBMThl+FSXySmUiNupW9j8wVuRdybxCGtbWXq1zmQapIb4KVKezIAp0w5i
         bK3GmfZlJ/XLDZgL226v7X0kCeaUEYEC//aVsfhJip+EQ2iRVaYnzaAMEcz3s517Oe8Q
         M+7aeXmG9/shzJokkbt+Dj691VtiqUuL6S6XW0jkNNzSmstK8WmpB2EMctjtboVQSrjN
         MKkcZLmTL5ytRSbyCY5ZWQr5JecgjOuNQLeQptKVVd6735bOmhZ+/SDQICqYxDdUYfj7
         V90a4SAUttAAvrV3XrrfeQfUBmsXF9T2+KsQeAXp7ftg53ISoAZUp2PMnIP/nvsyOQ5S
         VcsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zkb86cHhox/rga06645EOTTfJRON6+kEX9b4sGgRzJw=;
        b=iSt+y1T5v+hhfheLathRPrOuOm0Ll5xrTupGF3jjsJs5o/JBCt5gWiwoaoOHU/j9U+
         SaNqZ7/zC3JzEA6OSn8d3nccUHQuJiiW7YlBvNAn2siA1WPoyTmJvtem5DwoWd9zf7t3
         omPU9mdyHzZGlgTl7sWbBv7VdIvzQbfRYqnvjA4Cteu5Bd2tJzt8cPpYpFw2hpHT6i2k
         9f+VozIxxuPYZwLajtiH+poVthdZeJoiUL72wFXsfx+cwzK8hL5SgoavZYZGjtCtsnHF
         /n5Szbzl9E1k6o2D4p/kHod0u7G6GC6GX2mJPkQjMKR28KLVoQm+0K0Rym2cAZMA3pAS
         +QJw==
X-Gm-Message-State: AOAM531rNDgQB2Q9pZJNreW3GZDpp65Rr/5sGIYtfNWGvUpXaIQhgpI8
        Q4zuXOfEE66QMC5LudKEhC8=
X-Google-Smtp-Source: ABdhPJw0P1356E98vLlDmT5/kUhHwzd9ktRdWRMkqzUUWd3JwRWRp+lSU3LrW3uQdjfponlV5AJPTw==
X-Received: by 2002:a17:906:8399:: with SMTP id p25mr6673541ejx.243.1601539095325;
        Thu, 01 Oct 2020 00:58:15 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id w8sm3435792ejo.117.2020.10.01.00.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 00:58:14 -0700 (PDT)
Date:   Thu, 1 Oct 2020 09:58:11 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Nicolin Chen <nicoleotsuka@gmail.com>, joro@8bytes.org,
        krzk@kernel.org, vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
Message-ID: <20201001075811.GA3919720@ulmo>
References: <20200930084258.25493-1-nicoleotsuka@gmail.com>
 <20200930084258.25493-3-nicoleotsuka@gmail.com>
 <20200930153131.GB3833404@ulmo>
 <ece615ad-8d6b-96ae-d8b4-9667aef17281@gmail.com>
 <20200930160626.GD3833404@ulmo>
 <f11d7d8a-8ce6-a53c-6219-ceec05432002@gmail.com>
 <20200930164707.GB3852280@ulmo>
 <35115ac1-fb25-7226-7b50-61193669e696@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ibTvN161/egqYuK8"
Content-Disposition: inline
In-Reply-To: <35115ac1-fb25-7226-7b50-61193669e696@gmail.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--ibTvN161/egqYuK8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 01, 2020 at 05:11:30AM +0300, Dmitry Osipenko wrote:
> 30.09.2020 19:47, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Wed, Sep 30, 2020 at 07:25:41PM +0300, Dmitry Osipenko wrote:
> >> 30.09.2020 19:06, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> On Wed, Sep 30, 2020 at 06:36:52PM +0300, Dmitry Osipenko wrote:
> >>>>  I'...
> >>>>>> +	struct tegra_mc *mc =3D devm_tegra_get_memory_controller(dev);
> >>>>>> +	struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);
> >>>>>
> >>>>> It looks to me like the only reason why you need this new global AP=
I is
> >>>>> because PCI devices may not have a device tree node with a phandle =
to
> >>>>> the IOMMU. However, SMMU support for PCI will only be enabled if the
> >>>>> root complex has an iommus property, right? In that case, can't we
> >>>>> simply do something like this:
> >>>>>
> >>>>> 	if (dev_is_pci(dev))
> >>>>> 		np =3D find_host_bridge(dev)->of_node;
> >>>>> 	else
> >>>>> 		np =3D dev->of_node;
> >>>>>
> >>>>> ? I'm not sure exactly what find_host_bridge() is called, but I'm p=
retty
> >>>>> sure that exists.
> >>>>>
> >>>>> Once we have that we can still iterate over the iommus property and=
 do
> >>>>> not need to rely on this global variable.
> >>>>
> >>>> This sounds more complicated than the current variant.
> >>>>
> >>>> Secondly, I'm already about to use the new tegra_get_memory_controll=
er()
> >>>> API for all the T20/30/124/210 EMC and devfreq drivers.
> >>>
> >>> Why do we need it there? They seem to work fine without it right now.
> >>
> >> All the Tegra30/124/210 EMC drivers are already duplicating that MC
> >> lookup code and only the recent T210 driver does it properly.
> >>
> >>> If it is required for new functionality, we can always make the depen=
dent
> >>> on a DT reference via phandle without breaking any existing code.
> >>
> >> That's correct, it will be also needed for the new functionality as
> >> well, hence even more drivers will need to perform the MC lookup.
> >=20
> > I don't have any issues with adding a helper if we need it from several
> > different locations. But the helper should be working off of a given
> > device and look up the device via the device tree node referenced by
> > phandle. We already have those phandles in place for the EMC devices,
> > and any other device that needs to interoperate with the MC should also
> > get such a reference.
> >=20
> >> I don't quite understand why you're asking for the phandle reference,
> >> it's absolutely not needed for the MC lookup and won't work for the
> >=20
> > We need that phandle in order to establish a link between the devices.
> > Yes, you can probably do it without the phandle and just match by
> > compatible string. But we don't do that for other types of devices
> > either, right? For a display driver we reference the attached panel via
> > phandle, but we could also just look it up via name or absolute path or
> > some other heuristic. But a phandle is just a much more explicit way of
> > linking the devices, so why not use it?
>=20
> There are dozens variants of the panels and system could easily have
> more than one panel, hence a direct lookup by phandle is a natural
> choice for the panels.

Not really, there's typically only just one panel. But that's just one
example. EMC would be another. There's only a single EMC on Tegra and
yet for something like interconnects we still reference it by phandle.
PMC is another case and so is CAR, GPIO (at least on early Tegra SoCs)
and pinmux, etc.

The example of GPIO shows very well how this is important. If we had
made the assumption from the beginning that there was only ever going to
be a single GPIO controller, then we would've had a big problem when the
first SoC shipped that had multiple GPIO controllers.

> While all Tegra SoCs have a single fixed MC in the system, and thus,
> there is no real need to use phandle because we can't mix up MC with
> anything else.

The same is true for the SMMU, and yet the iommus property references
the SMMU by phandle. There are a *lot* of cases where you could imply
dependencies because you have intimate knowledge about the hardware
within drivers. But the point is to avoid this wherever possible so
that the DTB is as self-describing as possible.

> >> older DTs if DT change will be needed. Please give a detailed explanat=
ion.
> >=20
> > New functionality doesn't have to work with older DTs.
>=20
> This is fine in general, but I'm afraid that in this particular case we
> will need to have a fall back anyways because otherwise it should break
> the old functionality.

It looks like tegra20-devfreq is the only one that currently does this
lookup via compatible string. And looking at the driver, what it does is
pretty horrible, to be honest. It gets a reference to the memory
controller and then simply accesses registers within the memory
controller without any type of protection against concurrent accesses or
reference counting to make sure the registers it accesses are still
valid. At the very least this should've been a regmap. And not
coincidentally, regmaps are usually passed around by referencing their
provider via phandle.

That's exactly the kind of hack that I want to prevent from happening.
If you can just grab a pointer to the memory controller with a global
function pointer it makes people think that it's okay to use this kind
of shortcut. But it isn't.

Given the above, the lookup-by-compatible fallback should stay limited
to tegra20-devfreq. Everything else should move to something saner. So
this new helper should look up by phandle and not have a fallback, but
instead the tegra20-devfreq should fall back if the new helper doesn't
return anything useful (probably something like -ENOENT, meaning that
there's no phandle and that we're using an old device tree). Bonus
points for updating the DT bindings for tegra20-devfreq to also allow
the memory controller to be specified by phandle and use a regmap for
the shared registers.

> So I don't think that using phandle for the MC device finding is really
> warrant.
>=20
> Phandle is kinda more applicable for the cases where only the DT node
> lookup is needed (not the lookup of the MC device driver), but even then
> it is also not mandatory.
>=20
> I hope you agree.

I strongly disagree. We look up a bunch of devices via phandle, and in
only very rare cases do we care only about the DT node. When we look up
clocks, resets or GPIOs, we always get some sort of resource handle. It
makes sense to do so because we need to operate on these resources and
having only a DT node doesn't allow us to do that.

Ultimately this is a matter of principle. Yes, it's true that there is
only a single MC on Tegra and we can "cheat" by taking advantage of that
knowledge. But we don't have to, and it's not even very difficult to not
rely on that knowledge. Treating the MC differently from everything else
also makes it more difficult to understand the associated code and on
top of that it sets a bad example because other people seeing this code
will think it's a good idea.

The big advantage of uniformity is that it drastically simplifies things
and causes less suprises.

Thierry

--ibTvN161/egqYuK8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl91jAgACgkQ3SOs138+
s6G5BhAAhsDFWcYsds4TXV8zCOWiN6/FVO1+exUJWlAhmtJEhO93RdatzJ50ZiBn
hrfLtPDvZ+LV8Ye/t3MDZ9BS25JctJKIw4RjBV+9VA1mPE2irx3mEcMEqtoHX3qV
LIep7hH/Hb9WXDnmzSKByw6rWEFCs04vTr5n97we8Hr3tqk4InmvZeHDxlvPT6jq
7I3cy4MsPRlJgdkun1Bqu1BXNJLLO53/XzhErdidTVT8Hb3djP81niPyURCkKEqm
ty+bm520ylGRa4v88f3GIkpwf6uN64hY3VFJ8Omdx4ewsNU9yGasClihC3HkmbFu
yRahc4AfyROOsQWD7yKHPcdZ2RXKKqM8jdeLBQxTaccd2BavSPQMJcrQUjsKWlMD
+MUqcfhaRt+/jMWUEtxxQLBglSwWJMwHCaZ69ZlSIoGlL1N/UHJwHtSKL2eEpA4U
AOr/X7SCMN1EwMkM+5jbPNKFEjBkVSUoMeQQkzTbh4yfGoqbVHmjVBL2Vqtkecui
h8fd4DnmqmM528+X7FXW6iASTmkhpblA2+LbFAkenKYBlJpUp7b9Tgwf1h0mWrPB
0eLHvnQBmM42Tf9v8lK6umB13CCUwvH8VhtD+yKS5h5OZKZQMXS4ag9xs02IdV7e
WYRRsHzxIB4Gx+7XBmDgAQFL+vHlgQR1uhZlBr+B/ATly+bN8kI=
=DaaJ
-----END PGP SIGNATURE-----

--ibTvN161/egqYuK8--
