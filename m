Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E7F1C11F64
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Jul 2021 12:52:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DAA6061400
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Jul 2021 12:52:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236490AbhGAMye (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 1 Jul 2021 08:54:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:57990 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236488AbhGAMyd (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 1 Jul 2021 08:54:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D2475613FE;
        Thu,  1 Jul 2021 12:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625143923;
        bh=7/B1O5SRCZQDIH9JnUtLeO06PzUiR1aaEtM7Xh38A3U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rymjU5e08NAPC41iGQ7oNJ01iDBURqmIomvMkTKIzMdhACduI1TLDPR90eQvkwt40
         mPD6U7gQh5JkbL5LEY0tq09tMilj1KaWmiRUPBfldfc/FKjcj1Cv+5MlglvHI+kCB1
         ywE6Xr8LQkI689pD649R1Wn2bvBYojvyostqE46cf6V20RgPxSk+E4hGxMm0e+uEqj
         Yba2npgPX9/JYOaPAirQqBo+wbIuCclxbhHCFvW1zIIME1colzKmkkKm/lCAsfCeWC
         yurn0fCtTH8kDP7iA/X3YtcVq8pGvUMmwu5L0Y5PtuwV1OTajWPhn6oZl9taO4jiOj
         jxkWUGPGJjgNA==
Date:   Thu, 1 Jul 2021 13:51:34 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: (subset) [PATCH 0/2] arm64: tegra: Enable audio IOMMU support on
 Tegra194
Message-ID: <20210701125134.GB4641@sirena.org.uk>
References: <20210628181118.2295007-1-thierry.reding@gmail.com>
 <162506854659.43525.4480397285287043164.b4-ty@kernel.org>
 <YNylGG9RaM72CY2i@orome.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="aM3YZ0Iwxop3KEKx"
Content-Disposition: inline
In-Reply-To: <YNylGG9RaM72CY2i@orome.fritz.box>
X-Cookie: Turn off engine while fueling.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--aM3YZ0Iwxop3KEKx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 30, 2021 at 07:08:40PM +0200, Thierry Reding wrote:

> Could you drop this patch from your queue at this time? I can send out
> the updated patch once I'm convinced it isn't going to regress further.

OK since it's the top commit, in general it's better to send reverts for
things like this though - like some other people I rarely rebase or
otherwise modify existing commits.

--aM3YZ0Iwxop3KEKx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDdulUACgkQJNaLcl1U
h9BeeQf/T+umKNdbt87xaPCht7wCPEszcEG0SV5z2Y9UFkIs6HfeU/f4HRiuMtIv
DzTs/T0UmrqyzxLH49YkXfgCRTrkPr5qmdm0iZL6ng4YzWlJmOqT/vLKKyunFyKH
feshTEJ9AtH0pLzyjYkOyAr4HeLEt1+wsgyTTXS+MAGMSZrL/Y3titN0kvjYnWVq
2ju+YlZDQyOxIxvpltiXzgyKG94CUsG5NPBUh7xtHfkhcoHuW9vPBUvA0tyrC8EQ
p+PD96ZfICydEWEsSeA/WBtTVqfSbJRlPomAsaXcai9iZc7RAv7wBJkhEcL+qZde
iNBRANBx4F87MBzZill+pkwUsMHECw==
=mdqc
-----END PGP SIGNATURE-----

--aM3YZ0Iwxop3KEKx--
