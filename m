Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78E01C433EF
	for <linux-tegra@archiver.kernel.org>; Wed,  8 Dec 2021 14:41:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235293AbhLHOor (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 8 Dec 2021 09:44:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235288AbhLHOor (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 8 Dec 2021 09:44:47 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48AF3C061746;
        Wed,  8 Dec 2021 06:41:15 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id c4so4428949wrd.9;
        Wed, 08 Dec 2021 06:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qU1Nu0uDwKbv0ASOHzlGRqdEWy8QYeodVW7QKE4d9jc=;
        b=e1sLGHX6mQCWpJirLRXjSEaGkieK0VAKI7A2fk3H8MHttiuvepmwLmO+st0hCPWgEF
         CvPaIbZZQwDUym08o43M5ojFZ14id+AvjHPWdcF63CgF9V5Q1RHbnP/cg9Ny1OU8qiAh
         bNXJEY0nwMHj5NqLb6Xon67Ah8OHuwJpfYwYBuDQHEEM7BSWPtrkHLs9NQmfYZD8wFCO
         JrYCVsPL8WKK2fSDATR/uvNvl6BJsmEvLw2kNKNXUBciiZ2rK+vY35rdZIkTXptd1p5Y
         LvxwQpEUKD2EOPikX92/5q9UOsGGBju5U3IjGcbSXRO3EzTPbMJ1n44/S3M3I8ESRXTM
         Z2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qU1Nu0uDwKbv0ASOHzlGRqdEWy8QYeodVW7QKE4d9jc=;
        b=3++YLLo2CUOamvHzQCe/tOxu0uLqZglHw0ys4mrum94RIvdZdglZkPMa1+xAVUFoER
         4tRk0ZY8qq/wPVdrwxHJTQd0WMZ55zthdoTZNKK3cubq5XAgpeA3kBTkX6r5otzCHawH
         MRfDN470dlALzltiLlJa6aEUpn/15GxjYScvLEBBrlWezE5S84N4SA/O0KH6k3dlQS65
         GCWhsaibtcUx+SrRF0Hl5W8ZHN20CHs6SaWCjlJvYAXJnm9Xs4qjy/q+z+9vzuD4xthN
         baqWbaYjPm0a3j5LxEX8KJgZalCQVnrAN9/rgyspD8WE5dsd0xyxxelotgXDbSZlzRXF
         WpFA==
X-Gm-Message-State: AOAM530RTjzRwiMOKnLkmRhZvTukJbckKEhi6mhmGQ0iSNWB56lq4FOv
        yNP/omz2gdf4v9FxC/qMUUSWAz/a4ZqUAw==
X-Google-Smtp-Source: ABdhPJy9BHQ5CRCgi7+6wu0Kn/3eNG2H9FWUXW9u1ZoHxzHaz8hcEZykhJyYzBLqVWZJeRs9Rr1+8g==
X-Received: by 2002:a05:6000:18a3:: with SMTP id b3mr59981274wri.343.1638974473830;
        Wed, 08 Dec 2021 06:41:13 -0800 (PST)
Received: from orome ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id e8sm2841189wrr.26.2021.12.08.06.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 06:41:12 -0800 (PST)
Date:   Wed, 8 Dec 2021 15:41:09 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: arm: pmu: Document Denver and Carmel
 PMUs
Message-ID: <YbDEBexUo8WYKVwd@orome>
References: <20211207150746.444478-1-thierry.reding@gmail.com>
 <1638971068.754546.3857733.nullmailer@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="KuCPuRyt1LA+wE+Y"
Content-Disposition: inline
In-Reply-To: <1638971068.754546.3857733.nullmailer@robh.at.kernel.org>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--KuCPuRyt1LA+wE+Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 08, 2021 at 07:44:28AM -0600, Rob Herring wrote:
> On Tue, 07 Dec 2021 16:07:44 +0100, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Add compatible strings for the NVIDIA Denver and Carmel PMUs.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  Documentation/devicetree/bindings/arm/pmu.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
>=20
> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.
>=20
> Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> This will change in the future.
>=20
> Full log is available here: https://patchwork.ozlabs.org/patch/1564747

Yikes, that's a lot of warnings. I've got local patches to fix up the
Tegra-specific ones, but I could look at fixing up the others as well,
provided that you or anyone else aren't looking at this yet.

On that note: do you know of a simple trick to get the dtbs_check target
to run on all DTB files? The only way I've found so far is to manually
select all Kconfig options that would enable a specific subset, but it'd
be great if we could just run the checks on all irrespective of .config.

Thierry

--KuCPuRyt1LA+wE+Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmGwxAUACgkQ3SOs138+
s6Hetg/+JJQtnLCDBwikRv38CHKdGaRq2lC4boCxd+kHMDh+LcYF6KX55dSLV8l2
gdqjETipx/c/azJV6aaoIPbQFZmfus90ENpzCx0+o61kacH3U1RIKPqrIPBFMWY2
H+33qyaswXhR32uUJS50fWLoufGse9c17fxZ+2pTM8qY+Bw97FHqyrmZNeubWWxu
P80ql6PXVuZsNH6hqRkPVmRaMKeajXpyIx6hjjgMOgUMP9GtsC0jC4Cgbc7sr5AG
hvXvcFQZ2BcSA/nr3QyaTJdmr6OQJW1Zph0GonwK6e7F6hdZ3lr7ijNP5fBgtD8j
9a2QnSueIUN8aawvZTbN1RznY9YEON+YixxhJTEbXcUjWeZkUVeVzrPN6GF7slq8
h4DqcgyNM+CQXFp5kf112Odq1vZ1oSWmnKuP5lNVq5Drmco4VVzsoLv+81PAzuSS
T/vUHP25U4gcCfJ67SHYtYvAK33a1YBBsfklPG12iuDNbWB9SNtwRzUg3Da5p2xW
Ck0akKmEnzA2iIapWpVTb3o17bFrbOLOA7NIXBD9z59v7oGADwnUfrdMr215X0tK
gD5sImDWT0t4QkepgUXxS0+RbFXRwBjYB7oIrZpGvwEzGShEZb8wfT/L+lJv9VqC
2en6ErjxdkjFSLuK5AStGxkjOgSkBb3Q7ugY1Ld13RXRmZv/Eic=
=jAaG
-----END PGP SIGNATURE-----

--KuCPuRyt1LA+wE+Y--
