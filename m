Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62751C4727C
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 16:47:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 10BB12076B
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 16:47:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LlQtzLTo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726335AbgI3QrM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 12:47:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbgI3QrM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 12:47:12 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF9CEC061755;
        Wed, 30 Sep 2020 09:47:11 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id nw23so3833154ejb.4;
        Wed, 30 Sep 2020 09:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dwBlOQMq5+8l62W5AsOI0m1SQ7GJFufU2mYg0ww+V+s=;
        b=LlQtzLToUwS3qc2V6Fs0G8CkvwmD023iz6KwLcB21kscwYk9l+nG0/DS4EC5KQk+bs
         JHwajX4MQ/jQTSVtpBbGsX+XtseJgnHt1hwF4yd3TkaCX9NHAl1XRKUmjeNKTUu433OO
         XIBvHE+5y54gL2vA6+OkIWmguj7pr8BHo5BjMDYcerS6wthRscNfajxXY08EK+sicuHI
         VpW4h97A6UrLCSsYq/5iWEzHTm9QEE2cOazc3h1ArQwTYTXB++EDUkftvtURcXMEcpto
         BhIu1OU7+O0C3ExcsCQN37jedc7S0AWpbW00ZLR3vtAkf0NegcdXj+SMYcDDtxsxSFKd
         UC1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dwBlOQMq5+8l62W5AsOI0m1SQ7GJFufU2mYg0ww+V+s=;
        b=QFgrlhewfYcigad7XmWcAyvd8si7gnhwEGHGZgXdjyJRzC8SxnwmP+T/TNVaIBPrzA
         0KWxwNaW2x7IKEZcQ+hOpTinhrR/LdmN+1I7PT04/7PdN9s/BPymLw7p5Z4fIMNfm8wm
         h4ljAKOTQx0UXVD5ZWCjJFao2rXxucGNLxz5Qdsq4cc1zkISyDkjSPs7RIW2V6I+zxEN
         sqzeYpMcXElYplJfLfA3GN86uNXPUVTBsJLpjhWH+kMFM05H9FAukZewt4rvmM2r6fiE
         cp2MFjqOig5J2s7Ik7U3//pYvoqdKAmTHkkahAPMnVre3ki5qZkwCqoIUEwmdhd6FLGI
         +aLQ==
X-Gm-Message-State: AOAM530PcAEZFEzdJ9wi0qBVwIOJUSpWFwAmv9DO2D42m7wKkEsIto0B
        HGfRdTLllmXElzkDDUNCG8o=
X-Google-Smtp-Source: ABdhPJxN0Bp5azrA9FqdvL0cQlEeFs+oVhNgLWX+Hq82bBXYkN+lAk0XbQ1f8vNtQAlDB3wlNxix8A==
X-Received: by 2002:a17:906:2dd:: with SMTP id 29mr3886541ejk.31.1601484430509;
        Wed, 30 Sep 2020 09:47:10 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id j20sm1978041ejk.31.2020.09.30.09.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 09:47:09 -0700 (PDT)
Date:   Wed, 30 Sep 2020 18:47:07 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Nicolin Chen <nicoleotsuka@gmail.com>, joro@8bytes.org,
        krzk@kernel.org, vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
Message-ID: <20200930164707.GB3852280@ulmo>
References: <20200930084258.25493-1-nicoleotsuka@gmail.com>
 <20200930084258.25493-3-nicoleotsuka@gmail.com>
 <20200930153131.GB3833404@ulmo>
 <ece615ad-8d6b-96ae-d8b4-9667aef17281@gmail.com>
 <20200930160626.GD3833404@ulmo>
 <f11d7d8a-8ce6-a53c-6219-ceec05432002@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kXdP64Ggrk/fb43R"
Content-Disposition: inline
In-Reply-To: <f11d7d8a-8ce6-a53c-6219-ceec05432002@gmail.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--kXdP64Ggrk/fb43R
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2020 at 07:25:41PM +0300, Dmitry Osipenko wrote:
> 30.09.2020 19:06, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Wed, Sep 30, 2020 at 06:36:52PM +0300, Dmitry Osipenko wrote:
> >>  I'...
> >>>> +	struct tegra_mc *mc =3D devm_tegra_get_memory_controller(dev);
> >>>> +	struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);
> >>>
> >>> It looks to me like the only reason why you need this new global API =
is
> >>> because PCI devices may not have a device tree node with a phandle to
> >>> the IOMMU. However, SMMU support for PCI will only be enabled if the
> >>> root complex has an iommus property, right? In that case, can't we
> >>> simply do something like this:
> >>>
> >>> 	if (dev_is_pci(dev))
> >>> 		np =3D find_host_bridge(dev)->of_node;
> >>> 	else
> >>> 		np =3D dev->of_node;
> >>>
> >>> ? I'm not sure exactly what find_host_bridge() is called, but I'm pre=
tty
> >>> sure that exists.
> >>>
> >>> Once we have that we can still iterate over the iommus property and do
> >>> not need to rely on this global variable.
> >>
> >> This sounds more complicated than the current variant.
> >>
> >> Secondly, I'm already about to use the new tegra_get_memory_controller=
()
> >> API for all the T20/30/124/210 EMC and devfreq drivers.
> >=20
> > Why do we need it there? They seem to work fine without it right now.
>=20
> All the Tegra30/124/210 EMC drivers are already duplicating that MC
> lookup code and only the recent T210 driver does it properly.
>=20
> > If it is required for new functionality, we can always make the depende=
nt
> > on a DT reference via phandle without breaking any existing code.
>=20
> That's correct, it will be also needed for the new functionality as
> well, hence even more drivers will need to perform the MC lookup.

I don't have any issues with adding a helper if we need it from several
different locations. But the helper should be working off of a given
device and look up the device via the device tree node referenced by
phandle. We already have those phandles in place for the EMC devices,
and any other device that needs to interoperate with the MC should also
get such a reference.

> I don't quite understand why you're asking for the phandle reference,
> it's absolutely not needed for the MC lookup and won't work for the

We need that phandle in order to establish a link between the devices.
Yes, you can probably do it without the phandle and just match by
compatible string. But we don't do that for other types of devices
either, right? For a display driver we reference the attached panel via
phandle, but we could also just look it up via name or absolute path or
some other heuristic. But a phandle is just a much more explicit way of
linking the devices, so why not use it?

> older DTs if DT change will be needed. Please give a detailed explanation.

New functionality doesn't have to work with older DTs.

Thierry

--kXdP64Ggrk/fb43R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl90tosACgkQ3SOs138+
s6EhVBAAqjpxYzLulCcunbD3SM+z9yRrHLZopF7aAF00WcEq1K4Mp4veCap41y0t
64EvmoHiMuoTAz8LlZkIv6L1ydvzO1F/K37VIWmCHbjHVrTC0qiH/O++wZ3PvNmC
uHLPRV7RWGTjYUs8rpcFiVkubdzql+RMiD0nb8GrgbnQbFFLzm8he7Q35b7RtPrr
BF6IbyBWLziNYRaPZsDq/XEzcz9KLOycjnpuPnAFQRhFP0whZEBp7nqCbcfPlD5w
bpKyQjBywba/5Qi6DB4751HRaKa1l6iyWsOOkW9EV4ZpAagtnOaG6i+pNiwdiebD
tw24SQZ+RcIc4Mj4iuly+rgcYVg4pof7qHpJW2Yf6ZYy0x+XHTdzBx/hSx6jhiag
frIEyRYSRn1o3F4Y2CwFu/n3iM6JgIgsx+t+qrIz7oQDf2RDOpWMzGU1hZw0bDDh
2LJdKHQ5Xb3tOuIsHvMLD6pp7eCgWkMj87XoTqcUv/IiNxuxrHxmgUExnxXyBGDL
JwSVsLxnGe0uo4aMyLsNqfv3swWjsoSfS5gKme5tIdMR/7xjEBHs/HtNzu9otHqU
AaE6tuZHc0DxA5CIIgW/OroLkFi9fDFDhRJGL1vrrkeoXGrXhcN6WnJVtLX8WxYS
PxBneEM8mVUh0K5AUbL13EMbnm5bgMl/nDS+7fZerv/KmJgef9o=
=I0Za
-----END PGP SIGNATURE-----

--kXdP64Ggrk/fb43R--
