Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CAE5C433E1
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 12:13:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2BF3E61999
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 12:13:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231803AbhC3MMm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 30 Mar 2021 08:12:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:37156 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231902AbhC3MM1 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 30 Mar 2021 08:12:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0679661927;
        Tue, 30 Mar 2021 12:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617106347;
        bh=wV83M5loS9/1IR+EtJxcBtPYe9NMNPihyogQRcVXKmY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kIoHAr0cNaCPqQ+dnxe+RcHK+5MUmicutbewS9RlxqeEzfxTVji5PYube1FkbEbMd
         vod6jvdSLRZfbYIzFGx1Z3Sif4yA/jKN1IbRvd656/YMgTlDdZ2K7uhx3mYu0jCBxw
         xzdhe5x967PybxqscxEvRIOvKfn1WPotlhhI4w3iSuWJTDhpJP3caVobLuk/BkeARd
         AzK2W6kSG/g7kOJK4jPraP/bayeLpDuByPlrsS23FabPFYrDL0X43wWdfbnHhNOgpe
         ulZomk7rHUPgQ89H5gt/LhTrmT5fGweWyrvrxazwfvAgIJLvtf3Db2E8CHjghVtr5h
         sOgW8yE6XUmpg==
Date:   Tue, 30 Mar 2021 13:12:16 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        Sameer Pujar <spujar@nvidia.com>, linux-kernel@vger.kernel.org,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: dt-bindings: nvidia, tegra210-ahub: Add missing
 child nodes
Message-ID: <20210330121216.GA12507@sirena.org.uk>
References: <20210326195003.3756394-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="M9NhX3UHpAaciwkO"
Content-Disposition: inline
In-Reply-To: <20210326195003.3756394-1-robh@kernel.org>
X-Cookie: Earth is a beta site.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 26, 2021 at 01:50:03PM -0600, Rob Herring wrote:
> The nvidia,tegra210-ahub binding is missing schema for child nodes. This
> results in warnings if 'additionalProperties: false' is set (or when the
> tools implement 'unevaluatedProperties' support). Add the child nodes
> and reference their schema if one exists.

This doesn't apply against current code, please check and resend:

Applying: ASoC: dt-bindings: nvidia, tegra210-ahub: Add missing child nodes
error: sha1 information is lacking or useless (Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml).
error: could not build fake ancestor
Patch failed at 0001 ASoC: dt-bindings: nvidia, tegra210-ahub: Add missing child nodes

--M9NhX3UHpAaciwkO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBjFZ8ACgkQJNaLcl1U
h9CHXwf/ePgayQNqRPYIM4d70daAEQGySAe4jmtllPLltZCPeroFEZ5Bme47h9/o
x7ur5JZ7sAEwCclcmMY4ff7LZh5AZP2ucFjqzaBjm8dp+rWq3v4WEtqDYwlYXj2F
Oppx9trwsMqm3RPODTpUoou21oL+ghI5AWA7qqhEQNKQ0ssbEALoKPyroimfCE3s
i3qKiZ/VXZzQbhj+j1k4E/BvlveIvGKeEGlEKl8xWhi9D81RQKvrZGv+G7ExotVH
k7xnHKnYfd1HSVJTIuOiESYXdyTaIDgWUUs/RUo0nLj7dreAWQRSPcF24v8knzR2
4W5kclkcDhA6mujioXtCq/F4NFzGwA==
=BEx1
-----END PGP SIGNATURE-----

--M9NhX3UHpAaciwkO--
