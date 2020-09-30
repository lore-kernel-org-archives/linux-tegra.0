Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA704C4727C
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 16:04:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B970207C3
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 16:04:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PA0vKez2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727749AbgI3QEA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 12:04:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgI3QD7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 12:03:59 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3640C061755;
        Wed, 30 Sep 2020 09:03:59 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id qp15so2685999ejb.3;
        Wed, 30 Sep 2020 09:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HkhKHMINiSKqraOzIt5AxpBzpOhikgq//AotPkRaIHM=;
        b=PA0vKez2xLCTX95LNGOxIfgXhECvVxQWPz9lTjS8LRwfyNeNFGu2aC9k+fWUANP5i+
         CyfIiWv03oxjhmcTPAvXyWnDS1ElIY5rdfxye5KC89MQ2zgRxyuXu2nlJwv7J9YjH5KO
         TVSjIndlsxvUCj0CIhqDSsK/ymQ0sy4WZE7/cqs9VS42PGAOSeWCv0GzGC+ZxOYdwhFr
         /NpIG/X/n3SxrRiz6H4rVNLiBgv51Kzg19FK4QMlz0KWA7I0pbBrGUUw80Kzo/VV6bSq
         TPtGtqRRdSY5Hfeuo1f+8eqd3CT95PUoXBvKNv/z+qsFzgIocPu8CTQvcnhKUkz0Jy+E
         YDOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HkhKHMINiSKqraOzIt5AxpBzpOhikgq//AotPkRaIHM=;
        b=H2DHzzIEiQ66DdltnlTqDBdSox2/9dSFaqLWfVZlcMfhxO6oJF1dKl/dGV+1DeY8Og
         iVw52Vq02VIrvDzRsOtEtLfpJJJdYI/sFjwZobva58RIcY6sECGd6us4Hes5GFVG9O0+
         xvOr/ZdyX9sLLbpohV2uvDOoCgI8Rj3uzhwTCNN86YW5g3dYlcQvdEwU/js7uO+43Ujn
         Lty6bQjJAsh8h3cRFESEIiT/XmA9x4ralBx8a3+57VI5dFadEnhxqufthnVK5jLcztUw
         C7Dyjo5wkcnyCysyt/3mbpAQqXtLdoT36eLjmbYDxBwB6IWmtpPFCeATmbyPyNrHf9qO
         iM0Q==
X-Gm-Message-State: AOAM532V3iDwPebvJXF2ZO4ngrxwB4LrjHBm8c6cVWu5HWJZDKEiB/JX
        NIk4Y1Pk60Jd68YckEg1Nw0=
X-Google-Smtp-Source: ABdhPJztk+9riNAmQmBHmoVtNpIQJe2sCTHfApl0Io1rReAg/lC07AvYf4F+aedZqiTec8nxyuiHAQ==
X-Received: by 2002:a17:906:c10c:: with SMTP id do12mr3442838ejc.527.1601481838354;
        Wed, 30 Sep 2020 09:03:58 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id va25sm1535615ejb.72.2020.09.30.09.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 09:03:56 -0700 (PDT)
Date:   Wed, 30 Sep 2020 18:03:55 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Nicolin Chen <nicoleotsuka@gmail.com>, joro@8bytes.org,
        krzk@kernel.org, vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] memory: tegra: Add
 devm_tegra_get_memory_controller()
Message-ID: <20200930160355.GC3833404@ulmo>
References: <20200930084258.25493-1-nicoleotsuka@gmail.com>
 <20200930084258.25493-2-nicoleotsuka@gmail.com>
 <20200930152320.GA3833404@ulmo>
 <ed7b4375-d06e-2750-e6fa-603ef2b60d36@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Md/poaVZ8hnGTzuv"
Content-Disposition: inline
In-Reply-To: <ed7b4375-d06e-2750-e6fa-603ef2b60d36@gmail.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--Md/poaVZ8hnGTzuv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2020 at 06:53:06PM +0300, Dmitry Osipenko wrote:
> 30.09.2020 18:23, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Wed, Sep 30, 2020 at 01:42:56AM -0700, Nicolin Chen wrote:
> >> From: Dmitry Osipenko <digetx@gmail.com>
> >>
> >> Multiple Tegra drivers need to retrieve Memory Controller and hence th=
ere
> >> is quite some duplication of the retrieval code among the drivers. Let=
's
> >> add a new common helper for the retrieval of the MC.
> >>
> >> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> >> ---
> >>
> >> Changelog
> >> v2->v3:
> >>  * Replaced with Dimtry's devm_tegra_get_memory_controller()
> >> v1->v2:
> >>  * N/A
> >>
> >>  drivers/memory/tegra/mc.c | 39 +++++++++++++++++++++++++++++++++++++++
> >>  include/soc/tegra/mc.h    | 17 +++++++++++++++++
> >>  2 files changed, 56 insertions(+)
> >=20
> > Let's not add this helper, please. If a device needs a reference to the
> > memory controller, it should have a phandle to the memory controller in
> > device tree so that it can be looked up explicitly.
> >=20
> > Adding this helper is officially sanctioning that it's okay not to have
> > that reference and that's a bad idea.
>=20
> And please explain why it's a bad idea, I don't see anything bad here at
> all.

Well, you said yourself in a recent comment that we should avoid global
variables. devm_tegra_get_memory_controller() is nothing but a glorified
global variable.

Thierry

--Md/poaVZ8hnGTzuv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl90rGgACgkQ3SOs138+
s6GNCA//RmVL3YPvq5/wzuzC1PrFzor/z7ya4L8jXrY6RgwgFYvK0hZnd6ahOBf9
DZIzr/0k5igUwAL7vrDTk3tJKvQDLf1Eqwg7QtEuEC4KXJcZbjynCcZsUepoaQFz
S2EQK7GfB21xSjCwhbIzOPgiqY2XajMbsjlDheK5qey7L2HASK1YxdIRyxPoHOHB
ixLUH1IAi+LQjnv8j8HZqiEaod0X2r28NvUdFPH1Ch2UbCqR8peyfScJIfM4ZoKo
u4s0G2Yi8znwKlU8YQ5aNjHc0LBlgH3kDvhB6p2ShK5o9w8oq7XiY5NMIHWrH7yI
HNGOhsppRt/qQXh1aoqOyKv1VVqFwqTfq/meCETwIuOpeV0OQPcDFHS6alg+unvS
E3jQPojcULvadHcWqStW5GnkomQC47VCB+1h71vfUQIPZkdd1XfaxohfsXMleSrN
6hKlnsTl6Y1cDDx6BMfHpgGGEOfv3GGUX9gq5eD9FoSzRTs497eazwClGHxSiHTp
fixSVclWwdwLDt0RtpMw9KE2T69sUrhwhxihjXzZ6RawvJNfRLE1GvHgJJnaZo+Y
0p+o5WVy+Rzsyg5CvFkYE8XMr/dwtyociFCSZmSYj9L+QywvKot5eFB0MCZJinwd
aKoG26J4OB3vJbtiYZDiNOlnjxRRG45ha6wivOJML11+viSNyII=
=Bu7G
-----END PGP SIGNATURE-----

--Md/poaVZ8hnGTzuv--
