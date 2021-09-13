Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E862C433EF
	for <linux-tegra@archiver.kernel.org>; Mon, 13 Sep 2021 14:50:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 04A4360698
	for <linux-tegra@archiver.kernel.org>; Mon, 13 Sep 2021 14:50:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345731AbhIMOv5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 13 Sep 2021 10:51:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:34776 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1346721AbhIMOrm (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 13 Sep 2021 10:47:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3BF8960C51;
        Mon, 13 Sep 2021 14:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631543026;
        bh=Z6j0LTCb/0Fx5pxLfWQP2iaIBaU+rx32o1y6TgwxBf8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MU3y9lQuvncRuxjepqLqkpJUzPPrYF1sGflnKzj/heuTwTgCN2oNNAs23fggxVkTI
         SAJJTyaiBjgQRaDV37IIVo3TBX6/pRgLJBSRVK+p6AZE8/p0AZ0ClN/l2wERwsr08e
         ZK+t0tQObmMvi3NvViHiwLgD/7Hn6EBQdRpGn+P+w2fQyfNrVuAsSDhjSpJhHlKvEh
         VRnEwO+o3S7UB09yT9HlUXq94DNsRj+WtZyJ6fdb9gHLV2FBqziv4gzSvKSwLGoGed
         XR4Lx9PEzHDqaq7/WoM+A7Oqtzy39yurrcScsemlk7ouYCJQqPgTcuvTy2Agqiu4eG
         IIVYWobHBYlIA==
Date:   Mon, 13 Sep 2021 15:23:07 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Sameer Pujar <spujar@nvidia.com>
Cc:     lgirdwood@gmail.com, robh+dt@kernel.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, catalin.marinas@arm.com, will@kernel.org,
        perex@perex.cz, tiwai@suse.com, kuninori.morimoto.gx@renesas.com,
        sharadg@nvidia.com, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 06/13] ASoC: tegra: Add Tegra210 based MVC driver
Message-ID: <20210913142307.GF4283@sirena.org.uk>
References: <1630056839-6562-1-git-send-email-spujar@nvidia.com>
 <1630056839-6562-7-git-send-email-spujar@nvidia.com>
 <20210903181326.GP4932@sirena.org.uk>
 <29c785d0-cc70-7cce-c205-77059c11e0e1@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="i3lJ51RuaGWuFYNw"
Content-Disposition: inline
In-Reply-To: <29c785d0-cc70-7cce-c205-77059c11e0e1@nvidia.com>
X-Cookie: Above all else -- sky.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--i3lJ51RuaGWuFYNw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 13, 2021 at 10:32:32AM +0530, Sameer Pujar wrote:
> On 9/3/2021 11:43 PM, Mark Brown wrote:

> > > +	err |= regmap_update_bits(mvc->regmap, TEGRA210_MVC_SWITCH,
> > > +			TEGRA210_MVC_VOLUME_SWITCH_MASK,
> > > +			TEGRA210_MVC_VOLUME_SWITCH_TRIGGER);
> > > +
> > > +end:
> > > +	pm_runtime_put(cmpnt->dev);
> > > +	return err;
> > > +}

> > _put() should return 0 if there's no change or 1 for a change.

> So this means, no need to return any error value and just return 0 in such
> cases?

If there's an error you should return that instead.

--i3lJ51RuaGWuFYNw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmE/XsoACgkQJNaLcl1U
h9Aeywf+L19DUp0pquR8XpAdjcB8vCJFQ8bpY19O2MoHi1ytdVvLaesU9Hd+lPBc
hvbcsNlfBqDuH2EGjUqPFkRKDevu6YiF+UsAYldN6011XNMjbyo5GtPnLSQbtFY0
55lL43iJ4KqIZDIYwgdoz5f/kEDfuhAFP1GUvo31JnSRRqcsooD/0YWnKx3rOmvF
EA3QmaFxjp46zpSp+U92iKEMDi3rkJNpqgBiL/vpQRgLQ4xov5nBxzMHx+AmH/hl
89lvssVBxEV6+waoi1STpaAdHR5ynuhBctdoBh0UgEGg1T+l477TFZ/dCHFQd5OF
zHcyS9EQ2akuFsPlpZA9FqtaxNTN+w==
=rm21
-----END PGP SIGNATURE-----

--i3lJ51RuaGWuFYNw--
