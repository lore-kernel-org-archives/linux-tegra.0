Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFF5BC433ED
	for <linux-tegra@archiver.kernel.org>; Wed, 31 Mar 2021 12:42:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 783526191D
	for <linux-tegra@archiver.kernel.org>; Wed, 31 Mar 2021 12:42:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235663AbhCaMmO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 31 Mar 2021 08:42:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:41090 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235599AbhCaMlm (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 31 Mar 2021 08:41:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BC97F61994;
        Wed, 31 Mar 2021 12:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617194502;
        bh=zm1U2asdNanF5cpISHi4RXdhMiKXWLQuzRX4ihBNozA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bIx7on3VSej6fZif3gPY4S0BCciwmdqBi8evHbPC6eFjv7eNNEIXKj57a0wQC7vmS
         W1pEUMMEI9csOts1YH8DRwZ54hSS0A0Qe1Yka8uLQcTyJs36PfnQx/pgrQBcof/jil
         xfOLo+IbUE6WEL/hxYFNxbktjwYA0Vnr55rFu/11pj9o0aBWoTmMWIS0vtJW1ixzAh
         +mIF6tlZgPrbwRqFY88z1HKBkKz3WRmK3WXp8/zZhdfwH5NKDDnyMeJpddRy9n1s9+
         ggHTGdBuOCw5PwcBnxRhjTMGvchd4S+qKAzbNzZ8ljFkEZmiTNFG3aAmtH5GJ62eFK
         /HeDVj2SKWqVQ==
Date:   Wed, 31 Mar 2021 13:41:29 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Sameer Pujar <spujar@nvidia.com>, linux-kernel@vger.kernel.org,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: Move port/ports properties out of
 audio-graph-port.yaml
Message-ID: <20210331124129.GA12190@sirena.org.uk>
References: <20210323163634.877511-1-robh@kernel.org>
 <20210323163634.877511-2-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Q68bSM7Ycu6FN28Q"
Content-Disposition: inline
In-Reply-To: <20210323163634.877511-2-robh@kernel.org>
X-Cookie: Slow day.  Practice crawling.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--Q68bSM7Ycu6FN28Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 23, 2021 at 10:36:32AM -0600, Rob Herring wrote:
> Users of the audio-graph-port schema need to define how many ports
> and what each port is, so they need to define 'ports' and/or 'port'
> anyways. Let's drop 'ports' and 'port' from the schema and adjust users
> to reference audio-graph-port.yaml from a port property.

This doesn't apply against current code, please check and resend:

Applying: ASoC: dt-bindings: Move port/ports properties out of audio-graph-port.yaml
Using index info to reconstruct a base tree...
M	Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
Falling back to patching base and 3-way merge...
Auto-merging Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
error: Failed to merge in the changes.

--Q68bSM7Ycu6FN28Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBkbfgACgkQJNaLcl1U
h9DCTQf/VXrFjEDBwqi/S16woGqbw7uTfUGNiWntINuFSTdoWm5MZlK+x4xsuzsn
twkOz7U17Di3KsZeCBBp2gc9V5st50Xstb4CwseS12fVuxi/Y32IsvTEWt6/1kDT
6g8nkF9vQjlnxTrChB0XxoUgJxRp/tmE1PMmC9gUdRvfRZ6Qz5OVD2JWhSbDNVY7
AZAcSqYWJGExtd7thkF5yn8bqlffzSspOLc2AyNQKbzoiht+EkungbwoXUDItn+i
iM01+wByIhZq0xgWtdGPzq64jmni6MVb77dTOdX08eopkRsoc70YF8UX2VXpzhy2
pecOljG+BTXB/OkkhdzH2ARE+jfF6Q==
=5C9M
-----END PGP SIGNATURE-----

--Q68bSM7Ycu6FN28Q--
