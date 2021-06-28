Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49587C49EAB
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Jun 2021 01:52:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C1486198D
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Jun 2021 01:52:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231966AbhF1BzW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 27 Jun 2021 21:55:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:45698 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231678AbhF1BzW (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 27 Jun 2021 21:55:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7991061A36;
        Mon, 28 Jun 2021 01:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624845177;
        bh=YpYR08RUmtU3O4t9HgUXI0T0FWV5Il28adXJQeOZYOo=;
        h=In-Reply-To:References:Subject:From:To:Date:From;
        b=dTdeiFBfjtn0ZmPPtAeczAHJIaVRHrN1cmnrVZSSwQM/64zCH8F9enDftxzWOjJL0
         B1x39j+sg0ehQ/8P32IRvFKw91lQ55HC3587ufZFleGcN4CrFIJyGFLkLjwfuTeZgs
         C47mUd/Dm8rr0FJ5nAYkvpQLZK6VD9w+simUAIgJuK4T76JssVDqxnTYOsCvudEG9q
         jtG1dQfv4BQ0SjKBrpAv+NuQI0CiVzP4qmZ7KjS1yk/o7QJw2moU2juqof/l9kbNz0
         1wa2qhExOoGwcSVL9LDLWl0PAKkFkI0oNb7pPpkQNiDovdQ05ly1LWMLzNcG62whWU
         yS7ebNlxs9tIw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <5eb50fd9-1de9-cc61-6443-d84999e22803@gmail.com>
References: <20210617082759.1008-1-thunder.leizhen@huawei.com> <162466387362.3259633.2364843071785127818@swboyd.mtv.corp.google.com> <a6f88419-2cb9-0717-7737-e4666cdcc211@huawei.com> <162483744494.3259633.12565750309559171999@swboyd.mtv.corp.google.com> <5eb50fd9-1de9-cc61-6443-d84999e22803@gmail.com>
Subject: Re: [PATCH 1/1] clk: tegra: tegra124-emc: Fix possible memory leak
From:   Stephen Boyd <sboyd@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Leizhen (ThunderTown) <thunder.leizhen@huawei.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
Date:   Sun, 27 Jun 2021 18:52:56 -0700
Message-ID: <162484517623.3259633.1405371294577745182@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Quoting Dmitry Osipenko (2021-06-27 17:29:20)
> 28.06.2021 02:44, Stephen Boyd =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > Quoting Leizhen (ThunderTown) (2021-06-25 18:32:46)
> >>
> >>
> >> On 2021/6/26 7:31, Stephen Boyd wrote:
> >>> Quoting Zhen Lei (2021-06-17 01:27:59)
> >>>> When krealloc() fails to expand the memory and returns NULL, the ori=
ginal
> >>>> memory is not released. In this case, the original "timings" scale s=
hould
> >>>> be maintained.
> >>>>
> >>>> Fixes: 888ca40e2843 ("clk: tegra: emc: Support multiple RAM codes")
>=20
> The memory is still not released on error and this is not the only one
> place in that code which doesn't release memory on error.
>=20
> All this code is executed only once during early kernel boot, perhaps
> not really worthwhile fixing it or at least this should be done properly.
>=20
> >>>> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> >>>> ---
> >>>
> >>> Looks correct, but when does krealloc() return NULL? My read of the
> >>> kerneldoc is that it would return the original memory if the new
> >>> allocation "failed".
> >>
> >> That must be the wrong description in the document. For example, the o=
riginal
> >=20
> > Can you fix the kernel doc then?
> >=20
>=20
> The doc is clearly saying that it returns NULL, am I missing something?
>=20
> * Return: pointer to the allocated memory or %NULL in case of error

See the paragraph

 * The contents of the object pointed to are preserved up to the
 * lesser of the new and old sizes (__GFP_ZERO flag is effectively ignored)=
.=20

which confused me into thinking the memory that is being reallocated is
guaranteed to be preserved so it would be returned if the larger size
failed. I suppose there's nothing to fix in the kernel-doc, just my
understanding of that paragraph. Maybe it should say

	The __GFP_ZERO flag is effectively ignored as the contents of
	the objected pointed to @p are preserved up to the lesser of the
	@new_size and old size.
