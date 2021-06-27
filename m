Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0286EC49EA6
	for <linux-tegra@archiver.kernel.org>; Sun, 27 Jun 2021 23:44:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E0FBE61C3D
	for <linux-tegra@archiver.kernel.org>; Sun, 27 Jun 2021 23:44:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231679AbhF0Xqb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 27 Jun 2021 19:46:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:54186 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231508AbhF0Xqa (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 27 Jun 2021 19:46:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1950E619BE;
        Sun, 27 Jun 2021 23:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624837446;
        bh=5VsR+0w8pl5LW2dTD4q+zkdKeWHhj2NNR2zU1t1Sq40=;
        h=In-Reply-To:References:Subject:From:To:Date:From;
        b=c+K4wAO5W/AOWCAGdDJbk1Eah4xXrDKoM8Y/VoJgWEPL6u/UPLgqGcTwsKdbeqOrj
         d0uOpVEGKGHoAYWTuWYjxh262DXItr/mDNWvDBpkSZ7uqZTkTlLLH/ztk1R4oL/aq7
         khU1/H7fRjBM2sSU0ezTdZ7eHaprd+d1dZ3AMcBriB0Bv99CafCwRVqXeUpDBmYvzM
         69koO2Af1TsgwUrTeJTR+yBVkQbnz/k6IcT+LDYceMAsc5u1p3b8OIEgUEAr28WU4Y
         WKSxmVph/eiIAgXsGYYMg2A2HPmlMf/aOGFp0/mbb5/gqDCnkhFhqX4ovncLYbGWJN
         FHoKlSQRGnoAQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <a6f88419-2cb9-0717-7737-e4666cdcc211@huawei.com>
References: <20210617082759.1008-1-thunder.leizhen@huawei.com> <162466387362.3259633.2364843071785127818@swboyd.mtv.corp.google.com> <a6f88419-2cb9-0717-7737-e4666cdcc211@huawei.com>
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
Date:   Sun, 27 Jun 2021 16:44:04 -0700
Message-ID: <162483744494.3259633.12565750309559171999@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Quoting Leizhen (ThunderTown) (2021-06-25 18:32:46)
>=20
>=20
> On 2021/6/26 7:31, Stephen Boyd wrote:
> > Quoting Zhen Lei (2021-06-17 01:27:59)
> >> When krealloc() fails to expand the memory and returns NULL, the origi=
nal
> >> memory is not released. In this case, the original "timings" scale sho=
uld
> >> be maintained.
> >>
> >> Fixes: 888ca40e2843 ("clk: tegra: emc: Support multiple RAM codes")
> >> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> >> ---
> >=20
> > Looks correct, but when does krealloc() return NULL? My read of the
> > kerneldoc is that it would return the original memory if the new
> > allocation "failed".
>=20
> That must be the wrong description in the document. For example, the orig=
inal

Can you fix the kernel doc then?
