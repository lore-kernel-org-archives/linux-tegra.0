Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED979C4338F
	for <linux-tegra@archiver.kernel.org>; Tue, 24 Aug 2021 18:39:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C919261212
	for <linux-tegra@archiver.kernel.org>; Tue, 24 Aug 2021 18:39:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230404AbhHXSkb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 24 Aug 2021 14:40:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:51652 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229521AbhHXSkb (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 24 Aug 2021 14:40:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BFA5260EBD;
        Tue, 24 Aug 2021 18:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629830386;
        bh=tJmmJSG2FwJub4DSA0JapIs8+reOH7ZCiliZXawKojw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=jPevxShqGrIoFQk+U2bq1quhseeNzVZkjSmuqKH36WX5cfZbrsKMMdJzyKC78XY2F
         fzz5EYyGHJFRFcu4C4IEpGsuXsKp4vX3rBSPh6aBcEAYVsjbwUS6VfW0mP33m/Zeyk
         B+d0yXvdFW4EInZ9aM3Rkg2TG0XUio0VRtqrHrWg7NH5tcNDKevD9wsPFE1FS1Pncq
         X5o0/XGBTlbIIb1VhKZOLlWVmO6Ajn6+ZKJ3KUDgkvJdOmeWhhe7sNZN080jyu1Wh0
         k/ZOE2xx49jYjsMsT6whKTRlad8SUs6fc76q1xXnVvmxtno/vg34Zn4u5phY1qRgLo
         peMh4JpdKFoHg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210813162014.2820473-1-thierry.reding@gmail.com>
References: <20210813162014.2820473-1-thierry.reding@gmail.com>
Subject: Re: [GIT PULL] clk/tegra: Changes for v5.15-rc1
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
To:     Michael Turquette <mturquette@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>
Date:   Tue, 24 Aug 2021 11:39:45 -0700
Message-ID: <162983038557.1317818.12608902611787279917@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Quoting Thierry Reding (2021-08-13 09:20:14)
> Hi Mike, Stephen,
>=20
> The following changes since commit 59c6fceb2ecc382c3d20508a235b539bf23af1=
f0:
>=20
>   soc/tegra: fuse: Enable fuse clock on suspend for Tegra124 (2021-08-11 =
11:55:56 +0200)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/for-=
5.15-clk
>=20
> for you to fetch changes up to faa8605f9f92e36c724ecaf03b466cfe31b04b06:
>=20
>   clk: tegra: Remove CLK_IS_CRITICAL flag from fuse clock (2021-08-11 11:=
57:01 +0200)
>=20
> Note that this pulls in a couple of changes from the ARM SoC tree, which
> I haven't explicitly included in the diffstat below. If you prefer I can
> also send this again after v5.15-rc1 which will then already include the
> dependency. It's not a critical patch, merely a clean-up, really.
>=20
> Thanks,
> Thierry
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
