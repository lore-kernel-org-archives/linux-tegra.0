Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48A84C32771
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Aug 2022 21:30:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352663AbiHSVan (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 19 Aug 2022 17:30:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352549AbiHSVaf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 19 Aug 2022 17:30:35 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ED21104B3A;
        Fri, 19 Aug 2022 14:30:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EA4886177A;
        Fri, 19 Aug 2022 21:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48043C433D6;
        Fri, 19 Aug 2022 21:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660944633;
        bh=zuQt7eqDvsntQ/8YXgDw5rD2s2ab9FwK47l0JAQKUfo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=QX5OEkh1zdniq1YYkZUiyxxPty76UI8bf4JoWuobRgL8sJ73xz/GChEpmSt9nVvJ4
         daAMOtKqwZl8N9sjkGolDZa4zy3vPr+e2x3XygvcW7ua3CLErc9sAxSO/HS1FmiVXH
         RYWuXfQ90jE0HGHVsGHX47iBPQs9nU80j1khp3UBlGk2yLrWEpdbImZw0p0mYbJOux
         gzGU/XZQdpqGyLo4uZuYQr8HHwK9Mkch8Jb4kO/KJOvRDAyIhZUMEFsNZtLhY6U9MN
         ppUNf7eBPWPeAcnGXZTjjtcMBwFpZ0KHAA6Z2sOZ+3FQFI0hc17kw7tUSzwjBPSo8v
         B7A/QXpeJ2vig==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220617015918.4001865-1-windhl@126.com>
References: <20220617015918.4001865-1-windhl@126.com>
Subject: Re: [PATCH v4] clk: tegra: Add missing of_node_put()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, Liang He <windhl@126.com>
To:     Liang He <windhl@126.com>, jonathanh@nvidia.com,
        mturquette@baylibre.com, pdeschrijver@nvidia.com,
        pgaikwad@nvidia.com, thierry.reding@gmail.com
Date:   Fri, 19 Aug 2022 14:30:31 -0700
User-Agent: alot/0.10
Message-Id: <20220819213033.48043C433D6@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Quoting Liang He (2022-06-16 18:59:18)
> In tegra124_132_clock_init_pre() and tegra30_clock_init(),
> of_find_matching_node() will return a node pointer with
> refcount incremented. We should use of_node_put() when it
> is not used anymore.
>=20
> Signed-off-by: Liang He <windhl@126.com>
> ---

Applied to clk-next
