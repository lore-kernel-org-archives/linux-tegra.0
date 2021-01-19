Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0323EC433DB
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 21:27:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B49C022D71
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 21:27:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728491AbhASSoi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 19 Jan 2021 13:44:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727366AbhASR4o (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Jan 2021 12:56:44 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29903C061575;
        Tue, 19 Jan 2021 09:52:17 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id a9so17150006wrt.5;
        Tue, 19 Jan 2021 09:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gv2/PYi0aGKQQV3NNP+/AyoxHWeD+l2D8Mb5mG065rw=;
        b=GhBc/yO1LHVTuTVTXwGDUXKyzz4etrMMp1ydZI8UHSghb6SEaJcOCeDhdkAAzVyWN4
         QUt4wTw5jkO3Hl2eLGCLR+BOp6WgI/L4ndLuUSjbcuN07ggE+AFOiDlVPI46v6vsDuVn
         d2bG102Kn38muF7oTAuFWOsXhey7HD94nOxqzzc3j0IzZS40VkgvSXRqun36+ynwh998
         X4dwXtCRYI0XJQd/V06Nr1aG2iFa68dPQnVqoeLRS1KiXpF/Y9djKje6RoWZ175x4Dq0
         RPLH8jEjmYSia3t/tboWBRcypnnOlvRx4+fIKLDNmg8NPiq+WcrTNj56dOLsKVR8sYYr
         RWhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gv2/PYi0aGKQQV3NNP+/AyoxHWeD+l2D8Mb5mG065rw=;
        b=qc1y+yYRodUWfRmfD474PJWkVsuF+ygWvllOACb23FzEneqY9mtoccyLqlcWQvYiwr
         PnKisGX+vN+HTMBsE7CMxMgTA+OkLs7VM7FXHhYzDsfe0NEQ7TPL7cGyKm4Im2ktYOXQ
         ITCvBPgN4Nrn4/ef811iU00M5Z0qvC5uyzwdtzTzfUehv3ZApTCLOdu+On00GoVOff6q
         OmgcFE+JVl1SBo1Hj5ityNGhPWh+68XZkLDsROSemtuYaszBOZQtGwToQsptuBL9Vytf
         z1AvLfYYPbvLuP118L44sm2uD3iasweQBDYqkV/ZFlm+9xn1nAt/SDVU37v/2a7D6Ptf
         oFEQ==
X-Gm-Message-State: AOAM533StAIV9zgpeqtzCCyeHzJ1beI5WYV94rW2R09WzyNxVEcQxLj8
        7jxPXyvqUtvEnUaEdVi6kYw=
X-Google-Smtp-Source: ABdhPJxX0AQATCNwY8eoPUgbi2+2Ojnis18eOEeKrXe62tsmFQ1QzsEebCNWAjyVAjfVrnz+VEJzYQ==
X-Received: by 2002:adf:b343:: with SMTP id k3mr5423195wrd.202.1611078735895;
        Tue, 19 Jan 2021 09:52:15 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id k131sm5817605wmb.37.2021.01.19.09.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 09:52:14 -0800 (PST)
Date:   Tue, 19 Jan 2021 18:52:13 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Saravana Kannan <saravanak@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Android Kernel Team <kernel-team@android.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] of: property: Add fw_devlink support for "gpio" and
 "gpios" binding
Message-ID: <YAccTde7got3jeXf@ulmo>
References: <20210115210159.3090203-1-saravanak@google.com>
 <CACRpkdYrzaFuWkbTe7Fmos4Bk4Ojt6wbqayDjyrS7sf98P-Rbg@mail.gmail.com>
 <CAGETcx9t3R-k0ttiaBUqcveqnXMX75xuTcKPSo9J6WJOfgSP8w@mail.gmail.com>
 <CAMuHMdUN7+O28Xz5rkPwR2RuSA+o_E2VcWsz_9+kzy4=0Jnb1g@mail.gmail.com>
 <CACRpkdZqSm-xfo8a8aFUe-Mbaw9tM+OmCAF3KWjOVDfC=oWj+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4S7UTJVfLVdubIqD"
Content-Disposition: inline
In-Reply-To: <CACRpkdZqSm-xfo8a8aFUe-Mbaw9tM+OmCAF3KWjOVDfC=oWj+Q@mail.gmail.com>
User-Agent: Mutt/2.0.4 (26f41dd1) (2020-12-30)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--4S7UTJVfLVdubIqD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 19, 2021 at 11:20:24AM +0100, Linus Walleij wrote:
> On Tue, Jan 19, 2021 at 9:50 AM Geert Uytterhoeven <geert@linux-m68k.org>=
 wrote:
>=20
> > > Can we pull this into driver-core-next please? It fixes issues on some
> > > boards with fw_devlink=3Don.
> >
> > On r8a77951-salvator-xs.dts, it introduces one more failure:
> >
> >     OF: /soc/i2c@e66d8000/gpio@20/pcie-sata-switch-hog: could not get
> > #gpio-cells for /cpus/cpu@102
> >
> > Seems like it doesn't parse gpios properties in GPIO hogs correctly.
>=20
> Could it be that the code assumes no self-referencing phandles?
> (Just guessing...)

Well, since this is scanning the DT and creating device links between
producers and consumers, there's really no point in handling self-
references, so I think that's fine.

However, what this probably should do is skip the node if it's marked
as a GPIO hog to avoid the error message.

Thierry

--4S7UTJVfLVdubIqD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmAHHE0ACgkQ3SOs138+
s6F+kA//YmrTT+fOYS55Tu/6/1d1bj/H3eNnWHUSmFjxSkxHGsrNo1kmo/M9CxWI
yVfJQnPzTyh1Jwa2Sf9eXhDGm7PxuPDAofQ+Gz3I2udCy21DOY5/5vHsJBS6LeTo
rGvrfDnTZd3XR20W9nhLu56s89u/d8qQxVfdn2vNCddnod1BLml4lvaEKY2BHWRY
6OQ6PPS4pVluDZT/QoI4p8gL9HUFdjtot9lOuIVxnFNmBDCHdwF4kIICMhRGOqOH
eBDfZZfOy9y4rc8lUXTbD90RHH/HDQfAuUZ8IDE98/dln21qIllgR6KzmNZ1x8F8
aUM27NW+4zz8Lmqb6uICeMYwHNIZm/V5xH0ZVHSUgbjvhSDH3iMm5C5LGJMLoYx3
VygOLrTzkReXOUqT2IpHQiHkt0qKki89VzfzFzvLppH8FAq2rlSKLtwEL5MPldpS
IMafATlayMSQfsdbxfaBUAd3g6MHsB3jbpXt6Q63aCRODWYWAyQSxJQMSftbnoHe
gDCrmEMARa+Ei3o+oRC3TUVwaLB/smx9Vp7GBtfUfME6azOBWbpBZjyaNoy6RzKq
aq25VhumEuRlWitkCDoF2/i6hhGCqoKNymV3YLUrpAMfeNHFL9kHEAWFxhCPvEm9
+l+nkM7CbSdZDqmA5tb6qcJeVTIE7dsi/BYAtIxr6YKlo2nONJk=
=uguw
-----END PGP SIGNATURE-----

--4S7UTJVfLVdubIqD--
