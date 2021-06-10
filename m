Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A380BC47094
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Jun 2021 08:57:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 77749613C0
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Jun 2021 08:57:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230080AbhFJI7a (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 10 Jun 2021 04:59:30 -0400
Received: from mail-wm1-f41.google.com ([209.85.128.41]:54857 "EHLO
        mail-wm1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230051AbhFJI7a (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 10 Jun 2021 04:59:30 -0400
Received: by mail-wm1-f41.google.com with SMTP id m3so459486wms.4
        for <linux-tegra@vger.kernel.org>; Thu, 10 Jun 2021 01:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=W1G4CqCNStWEWhk/Vyz5SeOif1UfAMFjFQWFAuyKoyM=;
        b=J5H8i+u2GPu/Nn5n0u3gjxJ3Sb/GPN+KKh+tQbROYZlP2lcCSZT5ICezaRxnneRnbl
         8KlL4sPti4uH6aYSSAFiR/rWjw/TE7zYKZVTWtPm9AVljBmGgAbS3WrafnZbYljtw+9z
         QKv+GEHgONidqj8tdy9UOybEEb4ifEdCmMLHrlNbPWWptmUrIEH9QvJ/CWTzzZnp0WLZ
         kAtJPRyDjrJ7B6+CpUkbUY8UHsl5JYB78zy9oSkGKDnSkyS3NXbZdhAdkffVlbyhreIO
         1DJgT+wkvxjGxa8XYx/38RBOwWfqLaHywDvv188KvrAeuMsvduAbO813J3i3myU/JVOy
         6KLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=W1G4CqCNStWEWhk/Vyz5SeOif1UfAMFjFQWFAuyKoyM=;
        b=QThQuLR3IeEwqlqY7anaPl/bp9K3ZJhtedkPJVsMmURmVbywLd11OFajiuTUJ9BAYX
         2CqV6adSA1K6PDs+2pfiXOKMxiLeWcioXg0/2jnzoyC4tKqFYGXm9HYmVSwlxbJa+NhS
         B1ygt/SewxoHqCqXP+cYrD4eIe+rRcA5IBvn9EpbmSuvR0rEfZpHMk51DSsa6C4TOE7z
         fA7PU9bE3eUcqOjLcaLyHThVpHTl/fGMA/hnrC++bMyL//aCCzns8XLNWhBk98QMIZJq
         xRPQiaEono8Z1rMKHNPtMZsycfKLmiBQD9gvyPnMbN9wQZPpogdfy3rb/FOjX008c61e
         GHzg==
X-Gm-Message-State: AOAM533fKn8X8YgL4z6VHEz7KFv9nP9vYE080t5Z1B3GEY9eSuXAWpgo
        eSSdecZuXv9zyVGMALs2Nxc=
X-Google-Smtp-Source: ABdhPJxt/2uIC/FjJ5n2uovK1nqmF14UWRIj4LzsJXTSck2vnsZp/zvrPbQZ2hE8NdoaQKadHUz9wQ==
X-Received: by 2002:a05:600c:3514:: with SMTP id h20mr1601651wmq.70.1623315382650;
        Thu, 10 Jun 2021 01:56:22 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id n42sm8470670wms.29.2021.06.10.01.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 01:56:21 -0700 (PDT)
Date:   Thu, 10 Jun 2021 10:58:04 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Daniel Stone <daniel@fooishbar.org>
Cc:     Simon Ser <contact@emersion.fr>, David Airlie <airlied@linux.ie>,
        James Jones <jajones@nvidia.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 01/10] drm/fourcc: Add macros to determine the
 modifier vendor
Message-ID: <YMHUHGS94zXLshU5@orome.fritz.box>
References: <20210326145139.467072-1-thierry.reding@gmail.com>
 <20210326145139.467072-2-thierry.reding@gmail.com>
 <P6bikxumymMi9GOcPaj_n8vMt5caPR3rWO4Kga8Ud_FNIgytl3ljvnkU6nsyxIwN4VKNmfOfsC4KryzFTObEXjtFDiywRWDtO_ed71g9aj0=@emersion.fr>
 <YF4L3kq9UN6PWh/h@orome.fritz.box>
 <CAPj87rO_RsEPpuC9-DyVEJ=K6OLeknHhOnjvbQ2EEnPPPrq+dg@mail.gmail.com>
 <CAPj87rOB8p+WSgVDwRbbLgW-di5qpSTY5Q6cmQYwbwD2Y3wKVA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="w3UoTUzJreA15LR5"
Content-Disposition: inline
In-Reply-To: <CAPj87rOB8p+WSgVDwRbbLgW-di5qpSTY5Q6cmQYwbwD2Y3wKVA@mail.gmail.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--w3UoTUzJreA15LR5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 09, 2021 at 05:28:50PM +0100, Daniel Stone wrote:
> Hi Thierry,
>=20
> On Tue, 27 Apr 2021 at 19:40, Daniel Stone <daniel@fooishbar.org> wrote:
> > On Fri, 26 Mar 2021 at 16:29, Thierry Reding <thierry.reding@gmail.com>=
 wrote:
> >> On Fri, Mar 26, 2021 at 02:54:22PM +0000, Simon Ser wrote:
> >> > LGTM, thanks!
> >> >
> >> > Reviewed-by: Simon Ser <contact@emersion.fr>
> >> >
> >> > Let me know if you need me to push this to drm-misc-next.
> >>
> >> I do have commit access for drm-misc-next, but I was thinking that I
> >> could take this through the drm/tegra tree along with the subsequent
> >> patches because of the dependency.
> >>
> >> Anyone willing to provide an Acked-by for that?
> >
> > Yep, no harm if that makes your life easier, so for both the patch itse=
lf and merging through tegra:
> > Acked-by: Daniel Stone <daniels@collabora.com>
>=20
> Is this still in your queue somewhere?

I reverted to an open-coded version at the time because the -rc6 cut-off
was coming up quickly and I wasn't getting a response. But I do have a
set of follow-up patches in a branch somewhere that convert the existing
users to the new helpers.

Let me dig those out and send them out again.

Thierry

--w3UoTUzJreA15LR5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmDB1BkACgkQ3SOs138+
s6Gzzw//TFERJ2BwbZ1fNz8AG003O2xhche0U3nVDc0+ojkvZfsKHBhRvyuexPL+
UwkvBeXVBa/NK7LPKy2Q/HaXhTH4iAZ8pBB0zpfiYBvHvUE/7NQKrNIKgl3zwcjN
1SzRNPj1fTGW5JlOeCJubpRSIfesmYjbTpxzYpomB1XzcBtaeyNelNAvnGPQm2vK
9w76ht908w7B+UrpNaFqdsHwY1s2xG0uOTNrdbJp0YpvFGyQKOeghJ617M95xqVi
uLGi/t/c9rlaqxL6bStlQEBVi0Xi34IjkCD5PEri/VQKL3ALPqXZajx/m/LphLbD
ISGfT9gofVJcaV5UVQ68uFI7BnSYSa2Gwj/cdo25tIELCwiyGcjdf1LGoj2HrCE7
mD1wYjW03DtXZl+9XlpRXdJo5eXXFZx7DnLMEUi+2TxfSylxOW6lTW+hbsE47hHZ
5qeINgsRFP/Rb/DzeoSn4sh4JmpbSDH4XwrRWuEcvovhKUuFSCpVMvNx93ma51hd
a2WOpF5hw0aRadVc8+j0ahR4QmqPGGvUgGJp1MR44h6uiRgxQKA1sjwUBZXV3XST
J25+VEvBGBzgE/4Cp1G6mYy3VrfT2hLRCzqU8lpFreeuNkK8zhjmYyxaGz7U3V4e
varppfO3SGcgm0Os0DZdyzmSPFqnuxfhIZZw4qFt6qshZ51F15o=
=I4ct
-----END PGP SIGNATURE-----

--w3UoTUzJreA15LR5--
