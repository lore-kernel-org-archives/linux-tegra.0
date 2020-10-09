Return-Path: <SRS0=2JVP=DQ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CA21C433DF
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Oct 2020 12:14:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C09C220709
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Oct 2020 12:14:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g/mqvwPj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732479AbgJIMOi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Oct 2020 08:14:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730726AbgJIMOi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Oct 2020 08:14:38 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDA7BC0613D2;
        Fri,  9 Oct 2020 05:14:37 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id ce10so12751739ejc.5;
        Fri, 09 Oct 2020 05:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Cue3h+d2r54WmJHGHLdlVpBbHTAcBo9+6eJx0erzBJc=;
        b=g/mqvwPjB/xgvzXn8cS8zt9pJyrroWQtccwbyhRJJoaA1C7Q1S0xOA/FuXd0Vt9+Vy
         sxBsSYMN0/MlGWwycKjniWvq3to4VIS5hRXjatUnloVpdkRmZk5jY3BTGTy9D650mnbo
         2WrkzSlMJ6X55f1SIgOkIbi2HDc3VmjJEORRUCJRs5u0AzYG3cMkfN5rMqcnWjCv0YG5
         UyhoBFWWHpk7GtY6CDbeB0kSlG+uXa8twSBW3QxwYS8/ldi7MOKYpHD79SxARlWuR66U
         M0rC6SkoeJWY02eJilsxUYHrgI3UKWBE1gIG5zIFy9GI2s82xm3eraeUXMRumOs8XkUG
         a4Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Cue3h+d2r54WmJHGHLdlVpBbHTAcBo9+6eJx0erzBJc=;
        b=r77HRtn/1Kk9PSnULTn8cD7Fj6JPdj6hFHwdbiLDPNfbqU/lh+nryyVUFNS27UiLry
         sxcivA1k3XeYN4tcgYLAAUgp9NzGG8tSML7sHksYAqn49W0m9UZUs0DLNv1vFtDXDlgF
         pAr2LzWPukacq1vlNoun6Uirtw61EfdqNUKpuyNOlX82jYb2txbW8A+xBJnwrDu7OhBW
         MRTOksYypNqQUk+6op9C1xIpjGP1Fr7hP96Xq/98LIGm5FfWLkIqf6ctg5KagHcrp/QI
         RR/zmA95R3kkSJvCvH/kWkGpiVaNNxGhIdoTxerE/Q9htfI2h4JOyHObILV779IaJmw6
         NeYA==
X-Gm-Message-State: AOAM5317CRhfBTSmAtLcz7U5LeF1+djeVblm84zj6WoLDv4c7m8yWSWd
        vdkzcoGYqpTqK5W5G55wIDQ=
X-Google-Smtp-Source: ABdhPJxkLmSMY6wbOmZmUUSOdDFIlbb4fIh5JaFnZzUKAOhmSQb4qUA219hgXl1Rh6Y1YEUUCyqnGQ==
X-Received: by 2002:a17:906:c007:: with SMTP id e7mr14012833ejz.55.1602245676475;
        Fri, 09 Oct 2020 05:14:36 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id b6sm6593220edu.21.2020.10.09.05.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 05:14:34 -0700 (PDT)
Date:   Fri, 9 Oct 2020 14:14:33 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     krzk@kernel.org, robh+dt@kernel.org, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] memory: tegra: Correct tegra210_mc_clients def values
Message-ID: <20201009121433.GB458338@ulmo>
References: <20201008003746.25659-1-nicoleotsuka@gmail.com>
 <20201008003746.25659-3-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="MW5yreqqjyrRcusr"
Content-Disposition: inline
In-Reply-To: <20201008003746.25659-3-nicoleotsuka@gmail.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--MW5yreqqjyrRcusr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 07, 2020 at 05:37:43PM -0700, Nicolin Chen wrote:
> Some def values are mismatched with Tegra X1 TRM, probably because
> being copied from tegra124.c file. So this patch fixes them.
>=20
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
>  drivers/memory/tegra/tegra210.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)

Looks good:

Acked-by: Thierry Reding <treding@nvidia.com>

--MW5yreqqjyrRcusr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+AVCkACgkQ3SOs138+
s6EuTxAAu5FFIhbWSdbBx61NVWHT5gYSbq8qN6YaQ6QsRZuJpyN4i3df4q4PO2ML
tPcsebM2rUMR4MPveMIpUUfqtxvPRv6dP96LHVpgaj8k0HjPJOFJdX+jFh8uKhYg
g3q4ck7lxiz3aPBUFr6Z3k2Yb3QqgVAUn6yscq2lromeUY94Cy7cAp1+lioGVzPX
IfhqxDJ8kTMxqDoTvNDb02Wq9XPHbEl+UEVj3zIsLgBU/gMY5HUSjFTY4bRmoWgN
rsOYGuJCdmf/nkTvzphMGJvvx2QaQAk40AEycj53loG5LYYQ6Xyoa9SgIrfLEDAW
vziiA8mKzTAfXcyhGqkiVIWlSZpSO96kpCy9fK/87COExJnuhtAbRPhzM+PlbLBX
18j5A9ZMBoDqFuNDLEmTZSCAMarrLh6mgLJffvuYHdV0fhG2RZMAUuHpm1yIrhAD
bWdUCKGNmK4arvx7qOhXyBK0dhwBmkHBfPDnbl3RCLYqJrV9LKFLVpcWnjdzxq+T
8b9Zwk34l0OvHBvBnHW0eoVq9Ld/ICNK/JnLRrtHRtfZfWlwzZ5WKs7AKilDMx3Y
E0Bb8L2jZ7Y8Kl5RwHBozAB8MDSjzPEzw5F00zGr7VMlCCb9dPcaCop7a6U4afGJ
hYGSR5AI2IycyvSbn17zqDJf7A2NcU/dA0ZxwILlykODquE2D+o=
=2U91
-----END PGP SIGNATURE-----

--MW5yreqqjyrRcusr--
