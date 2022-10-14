Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A1E5C4332F
	for <linux-tegra@archiver.kernel.org>; Fri, 14 Oct 2022 20:44:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231472AbiJNUoe (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 14 Oct 2022 16:44:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231210AbiJNUoc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 14 Oct 2022 16:44:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BCB710827F;
        Fri, 14 Oct 2022 13:44:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 35D9B61C2E;
        Fri, 14 Oct 2022 20:44:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EFF1C433D6;
        Fri, 14 Oct 2022 20:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665780269;
        bh=xTf2Ia3ScKB9nTggrC2iJlvFfsBE9mChXtAKxwt5HyQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=AQNJ6VNBsOyno7YgypSbGRUjRdV9CO4WesrSIs5Q566HF1ctr8ZayAUYQgFSBlSQJ
         Plspp8x16hZsxzIm25/RCJY4aydxhHCqFlQHreavI9AVJlA7QGiyDAoSD5o2fEj84h
         ZB/cqQ8d1DVwpjv6C2unvRhaADefGEh/X9R2owPpv0SXx+561OYNsZLQdHjM0+KuhN
         WY0W22p+iGtGxV9qXNWrnHZTHuR0yPYy9IqtVRlEPP8f+1K0ylWM69p8psIAMOUfIP
         6UXNAa7+vEoJUXo4undBgr4LZlm7JUphkqrWTy8RCMcTj7J7iSFrtfMOKC3FRfJB26
         KqvqU/jnmNkDg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221010100046.6477-1-jonathanh@nvidia.com>
References: <20221010100046.6477-1-jonathanh@nvidia.com>
Subject: Re: [PATCH V3] clk: tegra: Fix Tegra PWM parent clock
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
        Uwe =?utf-8?q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Robert Eckelmann <longnoserob@gmail.com>,
        Antoni Aloy Torrens <aaloytorrens@gmail.com>,
        Andreas Westman Dorcsak <hedmoo@yahoo.com>
To:     Jon Hunter <jonathanh@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>
Date:   Fri, 14 Oct 2022 13:44:27 -0700
User-Agent: alot/0.10
Message-Id: <20221014204429.7EFF1C433D6@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Quoting Jon Hunter (2022-10-10 03:00:46)
> Commit 8c193f4714df ("pwm: tegra: Optimize period calculation") updated
> the period calculation in the Tegra PWM driver and now returns an error
> if the period requested is less than minimum period supported. This is
> breaking PWM support on various Tegra platforms. For example, on the
> Tegra210 Jetson Nano platform this is breaking the PWM fan support and
> probing the PWM fan driver now fails ...
>=20
>  pwm-fan pwm-fan: Failed to configure PWM: -22
>  pwm-fan: probe of pwm-fan failed with error -22
>=20
> The problem is that the default parent clock for the PWM on Tegra210 is
> a 32kHz clock and is unable to support the requested PWM period.
>=20
> Fix PWM support on Tegra20, Tegra30, Tegra114, Tegra124 and Tegra210 by
> updating the parent clock for the PWM to be the PLL_P.
>=20
> Fixes: 8c193f4714df ("pwm: tegra: Optimize period calculation")
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> Tested-by: Robert Eckelmann <longnoserob@gmail.com> # TF101 T20
> Tested-by: Antoni Aloy Torrens <aaloytorrens@gmail.com> # TF101 T20
> Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # TF201 T30
> Tested-by: Andreas Westman Dorcsak <hedmoo@yahoo.com> # TF700T T3
> ---

Applied to clk-next
