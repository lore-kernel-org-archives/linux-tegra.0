Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4D0BC433C1
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 10:36:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 720AC619BB
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 10:36:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230280AbhCWKgU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 23 Mar 2021 06:36:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230367AbhCWKgI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Mar 2021 06:36:08 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C820FC061574
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 03:36:07 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id j3so22806987edp.11
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 03:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LxVISw9WuaGnz3TVyh1oZPKm44jMW5aQFu5NmHiwgWg=;
        b=StEXh4W6MvPsxN8bCn1dtJ77vNyHCC8/gc86kI0zHZwqNYnxYb2d5HQqUIicWoEyrH
         xxE5Onmpkj02LdFyevrwdGP6BX2GAg+93KFQ5WdBzCJy4Ru+AaY5BW1H1DMzybIxeUUI
         lu0kr3BxnjcyzLBvRQVKEKfbQtarxx0Y74i7BE2AwOghr/BAS0cSFHYKX5WSzBNsitTz
         1Fzq9NdUdVl4y/YdQtcfD0lZQFN+G5tQFXfd9Xeq1OffDIhup6dJuDUx6J06ixOLif/x
         ivBmokibQTCZn3vR5n2nFPhIi1pAQ+WNL4MEE/bfcidNzL00+A8//0HKA+i/xZh8tKax
         c5sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LxVISw9WuaGnz3TVyh1oZPKm44jMW5aQFu5NmHiwgWg=;
        b=TxIU2L7jC6sZkSH3GAzJFAOegK+1J0f5spNr9LYnTLOhhUchfd7Gr4N4P3LwKPygql
         MpOs2Fw44g7OxJ20IRHQOuokZ8+lvvW3j4OGkqpH3TqwLIITRrxqvSYDvr95t0QzYJJO
         ovaD3qStLKKPwJmk5pwci+bLGWFOoMpAT62aJ9f5G3Rc/HqvWLpd1XiqXOldCjzcucPH
         c2ovbk2xlW2/ei9S/0nIGq/YO6hAv0bM+xIL5i0cXT6KR4jpcjEMsZY4giM6F/cRiPvN
         XuV2iG7K19tk6o7f/ju8XSXAQbA5dcTPPy2ymZGDOup7Lr1cxu3+ATABft0u0JTpfnEG
         6ZAw==
X-Gm-Message-State: AOAM532LsPkkBDMDeS/DHMxRMZDVQkhZcldeyuqCJQ328QKSSU8qMSO8
        pEpveZEFY0goC/OM8QEURdg=
X-Google-Smtp-Source: ABdhPJxbgsNIHRHGPWBxYMBa3I7JPwOEgcxudWDw2frA8nFUo3PDbT/X6KEadd1u/6x1ZFOeiDdlkw==
X-Received: by 2002:a05:6402:30a2:: with SMTP id df2mr3863102edb.29.1616495766538;
        Tue, 23 Mar 2021 03:36:06 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id r10sm10986098eju.66.2021.03.23.03.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 03:36:00 -0700 (PDT)
Date:   Tue, 23 Mar 2021 11:36:21 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Mikko Perttunen <mperttunen@nvidia.com>
Cc:     jonathanh@nvidia.com, digetx@gmail.com, airlied@linux.ie,
        daniel@ffwll.ch, linux-tegra@vger.kernel.org, talho@nvidia.com,
        bhuntsman@nvidia.com, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 06/21] gpu: host1x: Cleanup and refcounting for
 syncpoints
Message-ID: <YFnEpcHRDqhQPPom@orome.fritz.box>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-7-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Iw0YeihonX9ctDaX"
Content-Disposition: inline
In-Reply-To: <20210111130019.3515669-7-mperttunen@nvidia.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--Iw0YeihonX9ctDaX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 11, 2021 at 03:00:04PM +0200, Mikko Perttunen wrote:
> Add reference counting for allocated syncpoints to allow keeping
> them allocated while jobs are referencing them. Additionally,
> clean up various places using syncpoint IDs to use host1x_syncpt
> pointers instead.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
> v5:
> - Remove host1x_syncpt_put in submit code, as job_put already
>   puts the syncpoint.
> - Changes due to rebase in VI driver.
> v4:
> - Update from _free to _put in VI driver as well
> ---
>  drivers/gpu/drm/tegra/dc.c             |  4 +-
>  drivers/gpu/drm/tegra/drm.c            | 14 ++---
>  drivers/gpu/drm/tegra/gr2d.c           |  4 +-
>  drivers/gpu/drm/tegra/gr3d.c           |  4 +-
>  drivers/gpu/drm/tegra/vic.c            |  4 +-
>  drivers/gpu/host1x/cdma.c              | 11 ++--
>  drivers/gpu/host1x/dev.h               |  7 ++-
>  drivers/gpu/host1x/hw/cdma_hw.c        |  2 +-
>  drivers/gpu/host1x/hw/channel_hw.c     | 10 ++--
>  drivers/gpu/host1x/hw/debug_hw.c       |  2 +-
>  drivers/gpu/host1x/job.c               |  5 +-
>  drivers/gpu/host1x/syncpt.c            | 75 +++++++++++++++++++-------
>  drivers/gpu/host1x/syncpt.h            |  3 ++
>  drivers/staging/media/tegra-video/vi.c |  4 +-
>  include/linux/host1x.h                 |  8 +--
>  15 files changed, 98 insertions(+), 59 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> index 85dd7131553a..033032dfc4b9 100644
> --- a/drivers/gpu/drm/tegra/dc.c
> +++ b/drivers/gpu/drm/tegra/dc.c
> @@ -2129,7 +2129,7 @@ static int tegra_dc_init(struct host1x_client *clie=
nt)
>  		drm_plane_cleanup(primary);
> =20
>  	host1x_client_iommu_detach(client);
> -	host1x_syncpt_free(dc->syncpt);
> +	host1x_syncpt_put(dc->syncpt);
> =20
>  	return err;
>  }
> @@ -2154,7 +2154,7 @@ static int tegra_dc_exit(struct host1x_client *clie=
nt)
>  	}
> =20
>  	host1x_client_iommu_detach(client);
> -	host1x_syncpt_free(dc->syncpt);
> +	host1x_syncpt_put(dc->syncpt);
> =20
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> index e45c8414e2a3..5a6037eff37f 100644
> --- a/drivers/gpu/drm/tegra/drm.c
> +++ b/drivers/gpu/drm/tegra/drm.c
> @@ -171,7 +171,7 @@ int tegra_drm_submit(struct tegra_drm_context *contex=
t,
>  	struct drm_tegra_syncpt syncpt;
>  	struct host1x *host1x =3D dev_get_drvdata(drm->dev->parent);
>  	struct drm_gem_object **refs;
> -	struct host1x_syncpt *sp;
> +	struct host1x_syncpt *sp =3D NULL;
>  	struct host1x_job *job;
>  	unsigned int num_refs;
>  	int err;
> @@ -298,8 +298,8 @@ int tegra_drm_submit(struct tegra_drm_context *contex=
t,
>  		goto fail;
>  	}
> =20
> -	/* check whether syncpoint ID is valid */
> -	sp =3D host1x_syncpt_get(host1x, syncpt.id);
> +	/* Syncpoint ref will be dropped on job release. */
> +	sp =3D host1x_syncpt_get_by_id(host1x, syncpt.id);

It's a bit odd to replace the comment like that. Perhaps instead of
replacing it, just extend it with the note about the lifetime?

>  	if (!sp) {
>  		err =3D -ENOENT;
>  		goto fail;
> @@ -308,7 +308,7 @@ int tegra_drm_submit(struct tegra_drm_context *contex=
t,
>  	job->is_addr_reg =3D context->client->ops->is_addr_reg;
>  	job->is_valid_class =3D context->client->ops->is_valid_class;
>  	job->syncpt_incrs =3D syncpt.incrs;
> -	job->syncpt_id =3D syncpt.id;
> +	job->syncpt =3D sp;
>  	job->timeout =3D 10000;
> =20
>  	if (args->timeout && args->timeout < 10000)
> @@ -380,7 +380,7 @@ static int tegra_syncpt_read(struct drm_device *drm, =
void *data,
>  	struct drm_tegra_syncpt_read *args =3D data;
>  	struct host1x_syncpt *sp;
> =20
> -	sp =3D host1x_syncpt_get(host, args->id);
> +	sp =3D host1x_syncpt_get_by_id_noref(host, args->id);

Why don't we need a reference here? It's perhaps unlikely, because this
function is short-lived, but the otherwise last reference to this could
go away at any point after this line and cause sp to become invalid.

In general it's very rare to not have to keep a reference to a reference
counted object.

>  	if (!sp)
>  		return -EINVAL;
> =20
> @@ -395,7 +395,7 @@ static int tegra_syncpt_incr(struct drm_device *drm, =
void *data,
>  	struct drm_tegra_syncpt_incr *args =3D data;
>  	struct host1x_syncpt *sp;
> =20
> -	sp =3D host1x_syncpt_get(host1x, args->id);
> +	sp =3D host1x_syncpt_get_by_id_noref(host1x, args->id);

Same here. Or am I missing some other way by which it is ensured that
the reference stays around?

Generally I like this because it makes the handling of syncpoints much
more consistent.

Thierry

--Iw0YeihonX9ctDaX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBZxKUACgkQ3SOs138+
s6HZ4A/+NthI5WkYlkgLHhg40ASvrpezLQ79KlQk8+R2eyDp2P1bF0FibGcRPQYn
+QbkviyaeJ6bigWzYQDOaCWlo+7g4F/6Z73g2FBn0rnAvdoD5aQHagLjaZ7Tivah
SLsXWKx7zEHvGFnC9DZiU7ROE9vV5riv8B7TIe9UkTf3M0C7PbFHmsKDPqygW/fb
NNIqNSyzjxnsNn4TkjvtmFscY5DIXgteXd6Ea3GRmlhzc0l3dDfDivTh3Q+G9vj1
+sT+fRVbXpvj0AGWrKoWh4AXGewAkubbCA8UE2pJsyFki2TrCHvc/wsdEo58D3T3
Y/J/SpAfw7HCVNaCIIweRdToPybf8utVXAva4rM6jzGoDA2kpe9fiBi+o+rcI0BU
otBgHejcxhM+cU8VXWDV1fQM9FsG60ekT18AV7f1cxpJcNLRSgXm6wq7+UIIRSmY
yH4wA8dbG+ARN9bKyQ21jJfVX8IJ82CnOuVQLp674/KA4lIGM5EOv1M8k6RUF6m+
gQeDRxh4H2Hq1RxWsanGS4dnfUDlEdlge92/2pc8SU1rXdtzvi6G/3RFeIXqS17E
mxnrlpkPmOs6ZegmkW4hn9IPVx1YnwvuGGLqU1IvGGBXaGFrSpLPcDalDvnNmiZM
7OpgPAnigi7JZtnEOE/xz02Ogus8aDg7bh8o47vAQLewzDa5G5I=
=0124
-----END PGP SIGNATURE-----

--Iw0YeihonX9ctDaX--
