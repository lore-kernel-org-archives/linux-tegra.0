Return-Path: <SRS0=4JQ8=EL=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C76EC4741F
	for <linux-tegra@archiver.kernel.org>; Thu,  5 Nov 2020 16:23:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC54C2080D
	for <linux-tegra@archiver.kernel.org>; Thu,  5 Nov 2020 16:23:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ODPCIZLT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726179AbgKEQXq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 5 Nov 2020 11:23:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725998AbgKEQXq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 5 Nov 2020 11:23:46 -0500
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E2B7C0613CF;
        Thu,  5 Nov 2020 08:23:44 -0800 (PST)
Received: by mail-ed1-x544.google.com with SMTP id k9so2166569edo.5;
        Thu, 05 Nov 2020 08:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Hu62pbz3neBXikSEmZ96SWPoUOawE1pLh+7ImLoJflk=;
        b=ODPCIZLT9TxECYCyI34q91uUAYLgf1QXIkyyrMHTZc2oG7+nMbbeYH0ZBTz0jUD8+T
         UfHs2aB8JxpS5ENaGWHH7IWJyJJWVY66hsJrTKGOOFhNIm5RUBYJxsaSFWwBCGBB23Qc
         dDlVdhL9GM94iNNakLW4OgUyPE8UQGCaSvKHhzvwfdaJQroJZZibnBaw2KHrS+92TeDx
         uzb6zPSUDemAJqWh2x6y5X8fT6iDesPSGoIdGUf9jtvyr/YFbts0mR4kZGbcoZwWECTP
         JqwVSKBnbhRf8Mbe3Q6ExfgUmUii7LVwACDjrLTVNu3nP1uAxuvP/SKsHHzLbpS3ioEV
         i+hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Hu62pbz3neBXikSEmZ96SWPoUOawE1pLh+7ImLoJflk=;
        b=GJYnhohKfU2G+uN0MpbJez0Hqh7gvwYvXumBvRRSyuvB8vlKexiO9mPEz9fMG+AHU3
         SHzjRfcnsfdZqbUjGZehriErUcXnQaoiKpFESVX9v5CCCmnOJ2CN7tE9bpr0YEpdqAAv
         EvlzWMdxJX56PS21fC1TA5ey1vJBQf5d5g0jRBYPswli0UrDilQ8gV28roJhkgdYd2T2
         IxFrhScMlRS6Nw/tXJ0v7Nd4XT9xDLvAsPZIXwZe3QCKcGN/JAxG4onC7pFy61kR3lmC
         Bq+vECE0kLZZ1kaGJQhg2cxnE9HXuoeqaftQzh5Go5A1ODMrh+7P9SdniOaOOcEGbznn
         /ZJQ==
X-Gm-Message-State: AOAM5316un1bo3umZq/q7VECcKitX27wgvqxvEMWpohqeHZyDCCM3MPe
        nh2ujzCPYPcEHaj07dAALNwKlYvwkYI=
X-Google-Smtp-Source: ABdhPJwtkbqUO5nQP/ZnEkBUiql0jynh2IPlmxMX5hd6q7UtoT97fCCdkNL4Y8AU+grGmbc2FNSdog==
X-Received: by 2002:aa7:dd49:: with SMTP id o9mr3295364edw.143.1604593422985;
        Thu, 05 Nov 2020 08:23:42 -0800 (PST)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id bg4sm1252002ejb.24.2020.11.05.08.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 08:23:41 -0800 (PST)
Date:   Thu, 5 Nov 2020 17:23:40 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Will Deacon <will@kernel.org>,
        iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: reserved-memory: Document "active"
 property
Message-ID: <20201105162340.GC485884@ulmo>
References: <20200904130000.691933-1-thierry.reding@gmail.com>
 <d3d69cb4-b0f9-40b0-b526-52fdc1a4b876@gmail.com>
 <20200924140130.GA2527337@ulmo>
 <ba16b795-34df-8f8c-3376-3d629cc30f8b@gmail.com>
 <484b9e90-7395-6161-577c-4d3f3716997e@arm.com>
 <70712ca4-8971-3af4-d0d0-b73788d6cfa9@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="LwW0XdcUbUexiWVK"
Content-Disposition: inline
In-Reply-To: <70712ca4-8971-3af4-d0d0-b73788d6cfa9@gmail.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--LwW0XdcUbUexiWVK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2020 at 04:21:17PM +0300, Dmitry Osipenko wrote:
> 25.09.2020 15:39, Robin Murphy =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
> >> IIRC, in the past Robin Murphy was suggesting to read out hardware sta=
te
> >> early during kernel boot in order to find what regions are in use by
> >> hardware.
> >=20
> > I doubt I suggested that in general, because I've always firmly believed
> > it to be a terrible idea. I've debugged too many cases where firmware or
> > kexec has inadvertently left DMA running and corrupted kernel memory, so
> > in general we definitely *don't* want to blindly trust random hardware
> > state. Anything I may have said in relation to Qualcomm's fundamentally
> > broken hypervisor/bootloader setup should not be considered outside that
> > specific context ;)
> >=20
> > Robin.
> >=20
> >> I think it should be easy to do for the display controller since we
> >> could check clock and PD states in order to decide whether DC's IO cou=
ld
> >> be accessed and then read out the FB pointer and size. I guess it shou=
ld
> >> take about hundred lines of code.
>=20
> The active DMA is indeed very dangerous, but it's a bit less dangerous
> in a case of read-only DMA.
>=20
> I got another idea of how we could benefit from the active display
> hardware. Maybe we could do the following:
>=20
> 1. Check whether display is active
>=20
> 2. Allocate CMA that matches the FB size
>=20
> 3. Create identity mapping for the CMA
>=20
> 4. Switch display framebuffer to our CMA
>=20
> 5. Create very early simple-framebuffer out of the CMA
>=20
> 6. Once Tegra DRM driver is loaded, it will kick out the simple-fb, and
> thus, release temporal CMA and identity mapping.
>=20
> This will provide us with a very early framebuffer output and it will
> work on all devices out-of-the-box!

Well that's already kind of what this is trying to achieve, only
skipping the CMA step because the memory is already there and actively
being scanned out from. The problem with your sequence above is first
that you have to allocate from CMA, which means that this has to wait
until CMA becomes available. That's fairly early, but it's not
immediately there. Until you get to that point, there's always the
potential for the display controller to read out from memory that may
now be used for something else. As you said, read-only active DMA isn't
as dangerous as write DMA, but it's not very nice either.

Furthermore, your point 5. above requires device-specific knowledge and
as I mentioned earlier that requires a small, but not necessarily
trivial, device-specific driver to work, which is very impractical for
multi-platform kernels.

There's nothing preventing these reserved-memory regions from being
reused to implement simple-framebuffer. I could in fact imagine a fairly
simple extension to the existing simple-framebuffer binding that could
look like this for Tegra:

	dc@52000000 {
		compatible =3D "nvidia,tegra210-display", "simple-framebuffer";
		...
		memory-region =3D <&framebuffer>;
		width =3D <1920>;
		height =3D <1080>;
		stride =3D <7680>;
		format =3D "r8g8b8";
		...
	};

That's not dissimilar to what you're proposing above, except that it
moves everything before step 5. into the bootloader's responsibility and
therefore avoids the need for hardware-specific early display code in
the kernel.

Thierry

--LwW0XdcUbUexiWVK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+kJwoACgkQ3SOs138+
s6ERrg/9EQcqVKr72kFSZhGQZ8IsbYN6n9XzzYePwKbGLs/jpZhn1eFHLZcsP7e+
sh62xwiC4yJBAayyE/o6pv8azUYB0RdRHbcDTkk6yWygZL6QNQ5rRrFxTaoNqvEB
sZg8+dHup/ZTQQALWM5gV7L6jroJUMbZKKkZZ3lUvrS+JutqR+vDkNAQWhrMT5+z
OrcNd3leMG6DV0V2gLQzoPawLCuZKAtjB7OWaLjNzqRP0wmuCEydrZqeBN7j1DC5
4epDr9wxMF0hlJ9M3Bmgh3cj6zVhUcwK95oMTu4Ugf43JIsAtNZkIgb+o4+tEtBo
FQRKzV+52IwfQeXeGJwz6Wl0oSH8INyy3Y6Klw5Nlp2hAGyUKP3W6LyGL2kWbJO5
0YJYW9IxRQO3+/IZLWUlb4JKu1vsjyBgzXyem/U0gyn0txUytW805qmo90QtIM5J
jJW3KrzfTqRP7S09R/fhNwWCVYmZrP509+CJDaIGEuhWNic6GERqbzMTG4XzVs6L
s2HmOBEzVdoOlqMqyiK5ftooQotP3gSm2dnc7sOxQ+llPtxoXo2c+G210IMPvWxp
9J0vzZ2RTNnoyhZtAMfYW73+Zr2xIS+6PODiYuc5ymU/gnpHLrONeSv7jRDyPBzM
G652Pg5lVeHIvVPFySxiqjG982iZw1Tpeoy2qZEy2S3IBZO04S8=
=gf22
-----END PGP SIGNATURE-----

--LwW0XdcUbUexiWVK--
