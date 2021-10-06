Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64978C433F5
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Oct 2021 18:09:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4826461039
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Oct 2021 18:09:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239019AbhJFSK4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 6 Oct 2021 14:10:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbhJFSK4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 6 Oct 2021 14:10:56 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A6E8C061746;
        Wed,  6 Oct 2021 11:09:04 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id t8so11504442wri.1;
        Wed, 06 Oct 2021 11:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=exwhG0nzdIAjIFVVMDdmFwiX7lQiq4OxdoroCkKUsS0=;
        b=HuBuqtsZ+euCw1ibUy7yAKa+Hak+XIku86FHIPqir12RLDyJ8vjP0N+s2u54z6Wwj0
         JcSLGsqpIQpakWP9eR4TEsirwOYl92zJAcZ9hK0euGCd53ljF53ndJ2UZ6CtlXCAC9WG
         w93UQnH9aU9Hstk3LgKXxIiP9NNw00rViiSe2tk/QVXTOx1eBKqQ6PvazYVP8aXjnh3/
         y21NxWOb9Mk04uvm6VqNJgqruoXtibq5lAWwIqADF5rIJS+n/LXfT03J1We+a6V8RJpK
         P/OHdiRKaQz/jX9wBPFY3YTgeQQwn0SlJwbRR2+PXfMWyLmdRDMfASiOn0+8xDczBlW1
         YInw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=exwhG0nzdIAjIFVVMDdmFwiX7lQiq4OxdoroCkKUsS0=;
        b=xpKO5mln89eD1ifXpMkrUA6jCbl4Gat8tpvS4O6e+Hy6FqNjxPb7BFt97W2FdWgKtT
         JyZ+IorzJSNSOcgQvpSL4KGcqG86U4bvbOUO3GhqyOA8w4bE5i4jbSLkNrQzMKJ986T1
         qiiLM1jg+Hed8fbaBo/FSjB6JhApDgd69hPGdMqkxnkdFJ0y2h8Dyyd2mP0iKWCFa2ni
         4bz/8vYQU9mv6HxRIN8NgJNQPayEy58RLXtmAEAG4zEXzCz2b87nskfmRZySWqSDp+52
         yR1R1tfG2wUCAK9ya6Nsh/bcol10jcTkedatUsVIyWK97R0FiRWJV2dgobvcHQ34+Myz
         1TZQ==
X-Gm-Message-State: AOAM530bBHsIzAHKyOSj3k65eomByfNG2QTE48p0PacCIDknlLPz7UOE
        8ar18l+aNCxsDSQfEQtTHH8=
X-Google-Smtp-Source: ABdhPJwuJVzlA2zZrzmKkCJqJ0rvYjsVMXs5bz21h9cCHXSbpi0DpBAwGG9MHqAc+lyYhyt5VrMNUQ==
X-Received: by 2002:a1c:f703:: with SMTP id v3mr11035782wmh.177.1633543742600;
        Wed, 06 Oct 2021 11:09:02 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id c9sm6115710wmb.41.2021.10.06.11.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 11:09:01 -0700 (PDT)
Date:   Wed, 6 Oct 2021 20:09:00 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Mikko Perttunen <mperttunen@nvidia.com>
Cc:     jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 3/3] drm/tegra: Add NVDEC driver
Message-ID: <YV3mPD8z47LmB4x8@orome.fritz.box>
References: <20210916145517.2047351-1-mperttunen@nvidia.com>
 <20210916145517.2047351-4-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7stmA90g+iXPADGV"
Content-Disposition: inline
In-Reply-To: <20210916145517.2047351-4-mperttunen@nvidia.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--7stmA90g+iXPADGV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 16, 2021 at 05:55:17PM +0300, Mikko Perttunen wrote:
> Add support for booting and using NVDEC on Tegra210, Tegra186
> and Tegra194 to the Host1x and TegraDRM drivers. Booting in
> secure mode is not currently supported.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
> v5:
> * Remove num_instances
> * Change from nvidia,instance to nvidia,host1x-class
> v3:
> * Change num_instances to unsigned int
> * Remove unnecessary '=3D 0' initializer
> * Populate num_instances data
> * Fix instance number check
> v2:
> * Use devm_platform_get_and_ioremap_resource
> * Remove reset handling, done by power domain code
> * Assume runtime PM is enabled
> ---
>  drivers/gpu/drm/tegra/Makefile |   3 +-
>  drivers/gpu/drm/tegra/drm.c    |   4 +
>  drivers/gpu/drm/tegra/drm.h    |   1 +
>  drivers/gpu/drm/tegra/nvdec.c  | 464 +++++++++++++++++++++++++++++++++
>  drivers/gpu/host1x/dev.c       |  18 ++
>  include/linux/host1x.h         |   2 +
>  6 files changed, 491 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/tegra/nvdec.c

Applied, thanks.

Thierry

--7stmA90g+iXPADGV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmFd5jwACgkQ3SOs138+
s6GcNRAAwJpwl7dN6LBRZAB+8sJ4ax0GeNoqf4WMs3ZyWrVQE2IuNuKjZhUi68jD
rpCc8XkK1m5x3loTMpXaA0HyUiAVb7rmTFtR0Kcqim+0qULcQALmix4M/Ax5dd56
PgyaOCMQm5ORBt5JA9yYswqFB22eRpZKhssN7BVO4SBYeR7J9lMmwFnH5w8SrIs3
XfW+V4/h4YiB1eEqsEKKUyqrb5IXYuAT5A6xqvZVmEB9YY7Mxut56Eu98Wdxb/yL
ceQ6IGnl4JTkMAZWCGnZIZRHdq192GmtxKO6ZLNPH/fLArxZipkMJ8YZfbUjbw4z
GTadAj5sPTAbuM1CdYmyehIX9gJOV+kUY5fAP2kxbDggmgdLapNCAd9YXY3N+JV6
yse6kXXugv+A87Moose05WX+oTw0NFer2DohEWOO+YoqSqDMOgkx/3efhiuhQvw+
Ze/NSrGkxsgyvHYM5YFTHfZInpgntRo0XudfkLeR3HqKQfg6DT6f49HuqCsZKQMc
QAbkXMlAmRcZE5nwiz69xaRQrvkjrb9T25vI3/MHfbFOo0PM8MYFe2Zgoqyr+Vsj
pp5+s9QQe3ycttvgjQEX/wQwDcXAeOw2yPFjKx6HKeAzt3Ybyi+xXM8DHhWs9Qg7
AbHHiE9j/60PiOPiOQdrD0mwvGuLIyrpUS6sfKhT6LY1ubD3uEw=
=qSJm
-----END PGP SIGNATURE-----

--7stmA90g+iXPADGV--
