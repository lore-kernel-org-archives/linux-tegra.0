Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75603C64E7D
	for <linux-tegra@archiver.kernel.org>; Fri, 20 Nov 2020 16:23:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B41722470
	for <linux-tegra@archiver.kernel.org>; Fri, 20 Nov 2020 16:23:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e2o07a2T"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729960AbgKTQXU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 20 Nov 2020 11:23:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729941AbgKTQXT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 20 Nov 2020 11:23:19 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4AA9C0613CF;
        Fri, 20 Nov 2020 08:23:18 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id r17so10666477wrw.1;
        Fri, 20 Nov 2020 08:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yHfeIxBJqcIQLqbSFekxP2bhgtIneNef2F2uGZEaThw=;
        b=e2o07a2T9OSAxDeX4I/1z6g9ibw9Gy0obCn8RRtJuzq4u2XrIuiNnV6hIhEgjJ9S4M
         JuHlfFrOAlqlL4zMWH983aWA13ktsrWDBpldk1v0TjRlzQp2X95CGMJzVNUbYpaSz4n1
         Xi6IrH72Gd7nLOqz3j7ph6cKGp8Rv55M6fK+fFDs1UntFOgBNSMuKKSmBi1grDDpszrq
         QN8j1LexweGr3RwMrGR8RKcMgl7FbtjQslHeqdald5ExV7JgzZ8R+yNmYsuL2smcvqJ4
         2oO1Ofh7eyi034AjBUGC3WylG86za0VrMblrHgDTUb/Nau2/d/4ZL1Npt7QGSz70Lnhd
         TQrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yHfeIxBJqcIQLqbSFekxP2bhgtIneNef2F2uGZEaThw=;
        b=E5qcjEBQb5oMTB53nNzylpGXfu+P8KmM8xHosz0a6ebdiPx9soC/80drZeTLLuU+7i
         md5Catuu/vYBk8itlCLN7Nm+lVbGIZQTtdhoD/IEptHr4jo+7MiD/mMPlvrCixxfqFib
         EAsNhdeumTnc+zzeddUxtCGRAfpGfYK1A2Lwb0nEzni3BWdV/PMM4TInVUzUnWgYvKzX
         M4Gpr+765MP9qEYnmn/GwXMq+9zOJzKjFKVdNQMlB6yUqfXTO5txL0rqe3dpjQfBHpWR
         qi5t/DoTTUXFa0HJ+bP+3EtpxLvthI94qVFrnT3Hi4yIR3osB/jN46JniG4sdJGxqm3B
         lYuw==
X-Gm-Message-State: AOAM530+JNfsxfLnRkEZFgNtaBplqZn3MjCU7HYAxfTWQb2xph89SUps
        Lk16jk702VFaaLM9LrJ86O0Ipy2ygWg=
X-Google-Smtp-Source: ABdhPJwqVFIZSU2xiJMP87lpzeIrFX5wbv+om0zrwEh/pjd29rWqubeEaNs9Dbyszc5cxdnJBQoOkg==
X-Received: by 2002:a5d:474f:: with SMTP id o15mr16314771wrs.377.1605889397585;
        Fri, 20 Nov 2020 08:23:17 -0800 (PST)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id r9sm6163644wrg.59.2020.11.20.08.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 08:23:16 -0800 (PST)
Date:   Fri, 20 Nov 2020 17:23:15 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     joro@8bytes.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
        jonathanh@nvidia.com, vdumpa@nvidia.com
Subject: Re: [PATCH RESEND 3/5] iommu/tegra-smmu: Use fwspec in
 tegra_smmu_(de)attach_dev
Message-ID: <20201120162315.GE3870099@ulmo>
References: <20201111222129.15736-1-nicoleotsuka@gmail.com>
 <20201111222129.15736-4-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ZRyEpB+iJ+qUx0kp"
Content-Disposition: inline
In-Reply-To: <20201111222129.15736-4-nicoleotsuka@gmail.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--ZRyEpB+iJ+qUx0kp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2020 at 02:21:27PM -0800, Nicolin Chen wrote:
> In tegra_smmu_(de)attach_dev() functions, we poll DTB for each
> client's iommus property to get swgroup ID in order to prepare
> "as" and enable smmu. Actually tegra_smmu_configure() prepared
> an fwspec for each client, and added to the fwspec all swgroup
> IDs of client DT node in DTB.
>=20
> So this patch uses fwspec in tegra_smmu_(de)attach_dev() so as
> to replace the redundant DT polling code.
>=20
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> Tested-by: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
>  drivers/iommu/tegra-smmu.c | 56 ++++++++++++++++----------------------
>  1 file changed, 23 insertions(+), 33 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--ZRyEpB+iJ+qUx0kp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+37XIACgkQ3SOs138+
s6HAkw/+PmjgJPEKxh6qnbdjpnubraymvfGZhEjp6Kv2WsQ2tWhzOjxjFf4jWFg8
Wi/o7uMwaKQuvuynTDiY8MrOBCuZCYaQVNGlJA9eEPxUbn+EF4VM2rM2LnDcy15s
jjlIQkXgaFoHZrOzUkzRCmZ+lwkCjHvtB+t4IFrUQd4lUxHxHU8uNcJOReTmYrd0
qajHrMgQDm2jyu+rnYz4LtGqy77ThyV6nvBs77wwz94lMbEZ6k5TlV21VeL4Wnbs
EQWADpM9rDO1MhMJbuKhq1wGDHqwzD4vLlMZ0/jJ1rBpvMH+0X112atPFiQQ5ccO
e0TJ48vP8maiq8h//J5wqOXJ17qUP7eDkrExl6jUUjMc0CKO/qsJqYsGAj770vn3
iD0Wq1ceQD17Dt7x5HUmjASmXEShaKVHZwsJh7YSvfx4tyZATcVgMvC4/DUm7SWI
sMvT02aHnRVEsFbM3CQv6ijmqJK7/2QLHZ2UE+YUpJTzySTQ/WyDe4qD6XgE94Gn
VgZfpAuoWd02z/Kj9qQYyFd3m+yHpwgoFpkTIgliJp9jVI93q4hNGjGaeUJsnemN
FMvWuZleGcxA21lVYcAsYstEvcjA6MtdL0J6N/Z+yfwgDo/Q051UmA4CSbw0kpT1
D+cZjGmt7tdVUaql85FHHTxW6hP3mRD+eQjQG8wf2Eci0ZahJBA=
=OvbI
-----END PGP SIGNATURE-----

--ZRyEpB+iJ+qUx0kp--
