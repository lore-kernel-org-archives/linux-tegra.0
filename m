Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DEB9C5519F
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Nov 2020 20:23:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD843206F7
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Nov 2020 20:22:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="1tKXYBiS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730459AbgK0UW1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 27 Nov 2020 15:22:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:41278 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729845AbgK0UWQ (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 27 Nov 2020 15:22:16 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 15929206F7;
        Fri, 27 Nov 2020 20:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606508534;
        bh=ocs0K9GhHcRXTT2o9qpeWQBtOAS1xI1U0fC2LN0HaLA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=1tKXYBiSO8rkM/Trt8RPLXz7xQIspOzckRBinPnTIeI98iXdvRbSH0e65rA1Nhcx9
         UJqIxUdhtzG5ps90Qo29fMmvDm/v9udlZ9++uGjr82WYyTftKO+SLtHS7459pJOJet
         Ti1oSdva3rtOZ1uDWGVnGOtKE4+qzEBM87S2UC8A=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201127144545.125335-1-thierry.reding@gmail.com>
References: <20201127144545.125335-1-thierry.reding@gmail.com>
Subject: Re: [GIT PULL] clk: tegra: Changes for v5.11-rc1
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
To:     Michael Turquette <mturquette@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>
Date:   Fri, 27 Nov 2020 12:22:12 -0800
Message-ID: <160650853267.2717324.12327283989442506759@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Quoting Thierry Reding (2020-11-27 06:45:45)
> Hi Mike, Stephen,
>=20
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9=
ec:
>=20
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/for-=
5.11-clk
>=20
> for you to fetch changes up to a886c310d9fcb0e66253d4af225cba13f9bdf5d2:
>=20
>   clk: tegra: bpmp: Clamp clock rates on requests (2020-11-26 16:28:07 +0=
100)
>=20
> Turns out there were fewer patches than I thought. Some of the patches
> I was planning to pick up will be going in through the memory controller
> tree as dependencies, so here's the rest that are independent.
>=20
> Thanks,
> Thierry
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
