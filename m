Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4E61C433F5
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Mar 2022 19:09:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352784AbiCXTKl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 24 Mar 2022 15:10:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242820AbiCXTKk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Mar 2022 15:10:40 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22B638FE74;
        Thu, 24 Mar 2022 12:09:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B185061B41;
        Thu, 24 Mar 2022 19:09:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08E28C340EE;
        Thu, 24 Mar 2022 19:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648148947;
        bh=9Zaw4QnaJObocBpW0+nZUqWqUxkYP++HlVIrKQzxWEU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=qTe1wJ1MlFK/aCHoeArbL74wovZbNPa7WMUUcq9v1Zeclg5Jsg69dBcVZ3m1b1w6k
         NuzdGSrVyXXAIQKu8Zqd1BcgjWVsz9qV5ctM4qnngyDZDtbHWVclSyodYFCQiTiauZ
         jaLyBXJEPn+Y+H9fIhLy1OJQhOkJ9OIBfl+cMJgPcjcSsh468HymuDm8ZeY+2t671j
         VspVYwvLFeVpWHJ4ybu/UF6mOQf9tCLL4nF/JHpi45vfwuSr0vCfO9SzdGJJ+6Y567
         q6pEJw+q9aftuAwfta0VIvnxJbF35QckWApSq51AOqZQFnl6LOBA35kiqvUPwfrZeQ
         fcNnpS67S1njA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220323085140.ifeclmttkrqo55ru@houat>
References: <20220225143534.405820-1-maxime@cerno.tech> <20220225143534.405820-7-maxime@cerno.tech> <7720158d-10a7-a17b-73a4-a8615c9c6d5c@collabora.com> <20220323085140.ifeclmttkrqo55ru@houat>
Subject: Re: [PATCH v7 06/12] clk: Always set the rate on clk_set_range_rate
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org
To:     Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Maxime Ripard <maxime@cerno.tech>
Date:   Thu, 24 Mar 2022 12:09:05 -0700
User-Agent: alot/0.10
Message-Id: <20220324190907.08E28C340EE@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Quoting Maxime Ripard (2022-03-23 01:51:40)
> Hi,
>=20
>=20
> The whole point of this patch is to give an opportunity to every driver
> to change the rate whenever the boundaries have changed, so we very much
> want to have the option to change it if clk_set_rate() has never been
> called.
>=20
> However, I think the issue is why req_rate would be 0 in the first
> place?
>=20
> req_rate is initialized to what recalc_rate returns:
> https://elixir.bootlin.com/linux/latest/source/drivers/clk/clk.c#L3607
>=20
> So the case where req_rate is 0 shouldn't occur unless you had an
> explicit clk_set_rate to 0, or if your clock was orphaned at some point.
>=20
> Judging from the code, it seems like the latter is the most plausible.
> Indeed, __clk_core_init() will set req_rate to 0 if the clock is
> orphaned (just like rate and accuracy), and
> clk_core_reparent_orphans_nolock will be in charge of updating them when
> the clock is no longer an orphan.
>=20
> However, clk_core_reparent_orphans_nolock() will update rate by calling
> __clk_recalc_rate and accuracy by calling __clk_recalc_accuracies, but
> it never sets req_rate.
>=20
> I'm not sure if this is the right patch, Stephen will tell, but could
> you test:

It looks correct to me. Would be helpful to have some comment of course
that we're setting a default req_rate because we want a
clk_set_rate_range() before clk_set_rate() to work properly when this
clk is initially an orphan. We should be able to code up a test case for
that too by registering an orphan and then registering the parent and
then calling clk_set_rate_range().
