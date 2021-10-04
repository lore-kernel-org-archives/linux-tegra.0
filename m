Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A88EC433EF
	for <linux-tegra@archiver.kernel.org>; Mon,  4 Oct 2021 21:05:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 18E48613DB
	for <linux-tegra@archiver.kernel.org>; Mon,  4 Oct 2021 21:05:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234219AbhJDVHV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 4 Oct 2021 17:07:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233373AbhJDVHT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 4 Oct 2021 17:07:19 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D50FC061745;
        Mon,  4 Oct 2021 14:05:30 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id z2so14505923wmc.3;
        Mon, 04 Oct 2021 14:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1LNvuqaTqf1he+ZSpJwuB6W6zpGSi2WK3l3LXveSaoM=;
        b=Gibq9uh1BSoup1XFTuvf2C5QjA7nLHeIssprX8h01fv1/Yt51ISxQPd0IEsUFzOywa
         ROsz17D809VPA32kgZLX6AFYI3S64/5FegvuLicE+FwxRXPLtDdCeef4uygewBmXG47+
         WyM6rsPIbEYJG2TCVHFZKyrNWkcKBGU6k7DDg0Cok1aySUPVAhPpAQ29/niGcNNyCEPw
         nBJVqnO/cZk5Pken8nDtiaqj6+VOqzx6+Gz+1T/jcQIk6/7Krf6xLJkHCWGTenr4QOqB
         jMTARbMUVFpNTDY9WSf2P9oQIpNR/ag09HwWggr5dW1puvbDLw7EIBrtrG+E8MTKk6h7
         lCYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1LNvuqaTqf1he+ZSpJwuB6W6zpGSi2WK3l3LXveSaoM=;
        b=KgHsdOQB6uZU72CTD9Cji5Ik4kmaqE+bFNBle+p7xJYvP1QeWrO30fdqyqKiIrdbgn
         awdDDe38oyZXHXTc4WErecXHAqlr9X8KMFX7c3T0v9nu06fCZcweVr7BfwSSps7yXHAF
         UGOASdQ0rjHf8e8HJ08MTorMyhOU4dNlH8OlMITRQzQTeVwcfcexJVntZRboQ3NxC8Yq
         +yfw47mjE3t1eNELaXp1jxBhDKw1tAndBjsBkplTquVSGrfe5fJBX4Vw5kDIKxhDNb9Y
         kmC7xJTSeiKIUHAVbOOti0nysybbeW+91+IydXUeTp88q4ZbAFGLzuC6cVWnhwivfxMt
         hz3w==
X-Gm-Message-State: AOAM533Gw2wqMcSAVHUI+8PK5o0xeo7+yh+3STX/Z6j1Xc1iZ0Yw14oZ
        SvKWFZGVNkG8jXKJHWsTl6o=
X-Google-Smtp-Source: ABdhPJz3IU9GVw3p2H/QS30wYJ+fOgVwCWkhLB39pEHXjwDeYQJK5a0vI7TTvofhGtjK0YZPdm1KEg==
X-Received: by 2002:a1c:21c3:: with SMTP id h186mr17033968wmh.107.1633381528713;
        Mon, 04 Oct 2021 14:05:28 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id e11sm3653175wro.4.2021.10.04.14.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 14:05:27 -0700 (PDT)
Date:   Mon, 4 Oct 2021 23:05:26 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, Peter Chen <peter.chen@kernel.org>,
        David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH v7 4/7] usb: phy: tegra: Support OTG mode programming
Message-ID: <YVtslrGXStvdO2IS@orome.fritz.box>
References: <20210912181718.1328-1-digetx@gmail.com>
 <20210912181718.1328-5-digetx@gmail.com>
 <29ae631d-cc8d-663e-3ce2-db00f3470365@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="WX3qGWtIkQM7b37F"
Content-Disposition: inline
In-Reply-To: <29ae631d-cc8d-663e-3ce2-db00f3470365@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--WX3qGWtIkQM7b37F
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 27, 2021 at 07:36:52PM +0300, Dmitry Osipenko wrote:
> 12.09.2021 21:17, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > Support programming USB PHY into OTG mode.
> >=20
> > Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> > ---
> >  drivers/usb/phy/phy-tegra-usb.c   | 198 +++++++++++++++++++++++++++++-
> >  include/linux/usb/tegra_usb_phy.h |   5 +
> >  2 files changed, 198 insertions(+), 5 deletions(-)
>=20
> Greg / Felipe, could you please ack this patch to allow Thierry to take
> this series via the Tegra tree? It depends on the soc/tegra patch of
> this patchset.

Looking at the series, I don't think this necessarily needs to go
through the Tegra tree. Given that you have backwards-compatibility with
older device trees, applying this separately to the USB tree should work
fine. Once the soc/tegra and DT bits and the USB bits get combined they
should enable the new functionality, but nothing should break if things
are applied separately.

If so, I can just pick up the rest and let Felipe or Greg pick this one
up.

Dmitry, can you confirm that this patch should be applicable separately?
If so:

Acked-by: Thierry Reding <treding@nvidia.com>

--WX3qGWtIkQM7b37F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmFbbJYACgkQ3SOs138+
s6Hujg//cgkH3qGoTXHFhGVLDBwdBjnku1VXcY51hJOE+7XgZhQG5INrlLZ53M8W
J7xmJpYSb2fjVcuensnI/HeZ8PldLdZl0wQvo7qTbmsKzlcgwiI7S6xtSU1nVZI2
ic/Dse/LCXrs8bTMOweGc7GnIdu6FpRghZVeMuvQkn2z5uyKYTGjUOU616YVW+eU
BARFJJ3C8n7vJnzGlXhCez76GcxBQe48aOXpnJQ8Tvuep7K5RZFhqz6wEi4PCcaX
6CUS+49CFQaJD0CgUXxkc3Uva7Teprw0G9guiLs7NvtUoRLlNdM4nE3LIZNIvD5L
XldmLCk8qgZ3nG5eXCgSMm1JO3c9To4iNIqsbtCjrAld0Te1JyT2ak3zcFCViCV+
2D+6aFPnpj4eV2owaqoDrotyjKRtLNSTMLM7F129rPxrg6rRcfE1lOoE04mT/Ooy
g/3qKIodHpNuB1QolnV965JNgLO03ITXRMbZNCDoGMhC81zlJMTA2YuzJLzIXw0y
3JtD51Qm0AEgpjMCQzBXnX4aEtz/onrwtU0uy7j9iCXm5/p0CbvkCAQZNcd5Qo0k
dhjvFj+3Ss6uv3cIWe8ZJp0g8t0X10lbckLX/MVOQyHwhoAeKfjrOY0l1CYAqj5e
otDIWujq9fMWgWYKfjmGHQef58Xx1OltO8LOUQrJA7uFHWHzE4A=
=Cmwj
-----END PGP SIGNATURE-----

--WX3qGWtIkQM7b37F--
