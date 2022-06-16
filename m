Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE881C433EF
	for <linux-tegra@archiver.kernel.org>; Thu, 16 Jun 2022 06:00:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358654AbiFPGAj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 16 Jun 2022 02:00:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbiFPGAj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 16 Jun 2022 02:00:39 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A234A1CB12;
        Wed, 15 Jun 2022 23:00:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 02EB461947;
        Thu, 16 Jun 2022 06:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AEB8C34114;
        Thu, 16 Jun 2022 06:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655359237;
        bh=NNnILUBInXhE03zKMmprxCx+9V9Y5yxU7wfeUteCX0k=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=sChJCXGScaKUfNyG807me1PLVDKKuLPNI0xji9h2rVvkokzayL8rbsefMmSCKdXu2
         sKU0djUcd3ulPlzhSCScAXapZjFBDCnDZVpZV2CypISFMGxdgC0OmVLDfi7rpTq+me
         nrUPHXf3S5szbYWvEfW8JXeKduhg+fsz6SBQbCJX6t1fqpWAIMBYbBJzuqaMd6jcIK
         +R9Fs5X95pCneWrpWy5Ma3/n7vAjjzqGi/F5V1+NqxpgY6DCugkQWvlE1Rt4jBekro
         MzlhrCRYMUKg88FUlKyyAVBv7HeG6q0u+JFKlDSLPAIgOw9sxRLh+XFfT1x6S1rrn4
         m2ZdaDTBhHsaw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220616033622.3975621-1-windhl@126.com>
References: <20220616033622.3975621-1-windhl@126.com>
Subject: Re: [PATCH v2] clk: tegra: (clk-tegra30) Add missing of_node_put()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, windhl@126.com
To:     Liang He <windhl@126.com>, jonathanh@nvidia.com,
        mturquette@baylibre.com, pdeschrijver@nvidia.com,
        pgaikwad@nvidia.com, thierry.reding@gmail.com
Date:   Wed, 15 Jun 2022 23:00:35 -0700
User-Agent: alot/0.10
Message-Id: <20220616060037.5AEB8C34114@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The subject should match historical subjects

 $ git log --oneline -3 -- drivers/clk/tegra/clk-tegra30.c

shows mostly "clk: tegra: ". Can you also combine this with the other
tegra patch? Don't think we need two patches for essentially the same
thing.

Quoting Liang He (2022-06-15 20:36:22)
> In tegra30_clock_init, of_find_matching_node() will return a node
> pointer with refcount incremented. We should use of_node_put() when
> the node pointer is not used anymore.
>=20
> Signed-off-by: Liang He <windhl@126.com>
> ---
>  changelog:
>=20
>  v2: use real name for Sob

Thanks!

>  v1: fix missing bug
