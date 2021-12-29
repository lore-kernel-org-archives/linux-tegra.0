Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C258AC433FE
	for <linux-tegra@archiver.kernel.org>; Wed, 29 Dec 2021 05:48:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234542AbhL2FsW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 29 Dec 2021 00:48:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234367AbhL2FsV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 29 Dec 2021 00:48:21 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99F33C061574;
        Tue, 28 Dec 2021 21:48:21 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 67062CE16F6;
        Wed, 29 Dec 2021 05:48:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66E38C36AEA;
        Wed, 29 Dec 2021 05:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1640756897;
        bh=TtBgLq6hDWFPnsf4+2MurwdAWMiOw+TH5Y9QBT1S8o0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=XOVdMdPmFqzlEDgaDifLXIPBL3AppjMPQdNvjrrLOEp/xfbqwaiefIxpOvkSmSUkn
         0Gtg9H1awRhhM5zw9JtcSEsKyUMolYd4nphOYIctAuXrTizNNTu0Ha2jJ8xGrqF+yH
         0hrtlwUSrEtIuo7aJ/iTALOYMfeRG/C8d/olAtcXjRp7kFWY/1Fe1SMcUhaGhCWexA
         +/RhI3I16P8iNl0KWellhT2h3icctalAKLZZWTf3WdMtqFwbzoT3vd5KgSfgjBBAAY
         kndrlvHYa2HNYNyfcLgGEkdi1tpUDuDRyRlANceh6TqSREDnEkg6Gs6skWDA5nWXUu
         /JllV1uP0Z0Jw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211217160322.1157799-1-thierry.reding@gmail.com>
References: <20211217160322.1157799-1-thierry.reding@gmail.com>
Subject: Re: [GIT PULL] clk: tegra: Changes for v5.17-rc1
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
To:     Michael Turquette <mturquette@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>
Date:   Tue, 28 Dec 2021 21:48:16 -0800
User-Agent: alot/0.9.1
Message-Id: <20211229054817.66E38C36AEA@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Quoting Thierry Reding (2021-12-17 08:03:22)
> Hi Mike, Stephen,
>=20
> The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0d=
bf:
>=20
>   Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/for-=
5.17-clk
>=20
> for you to fetch changes up to b1bc04a2ac5b15e0b681228376664671fc2f2017:
>=20
>   clk: tegra: Support runtime PM and power domain (2021-12-15 18:55:21 +0=
100)
>=20
> Thanks,
> Thierry
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
