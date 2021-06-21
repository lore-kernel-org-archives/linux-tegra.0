Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA4C4C48BC2
	for <linux-tegra@archiver.kernel.org>; Mon, 21 Jun 2021 23:39:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9828360FE7
	for <linux-tegra@archiver.kernel.org>; Mon, 21 Jun 2021 23:39:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231722AbhFUXlV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 21 Jun 2021 19:41:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:38600 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231268AbhFUXlV (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 21 Jun 2021 19:41:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C20AF60FE7;
        Mon, 21 Jun 2021 23:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624318746;
        bh=zNyYHhxGOJx5d/wsCld5lYfjFtG4ODEEPzj4WizHqms=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=RN85PB+fn+Y/D2UjjwjBBGXkona1J+JNuHQVZX9ayB5qcNwB8M8tUsgMqWGUrQOzV
         HX+luVIBT3vu1zp5HY2Q0Di/VDEnoG3Ef9U3PTPnRkcPCylxE68cI4VcXUq3CA1rGu
         hSaZdknXbNwwbeh4OW9z1Q47iNtZe2r48PN1a0dYhymt4Ieudh4aLPRwin445ZgqNX
         9E10R7t8rXKyjGL1B1VOcyrP9bntoqoxyLeAynK3ZFFfiy5QPKQmwcq0JxQgUgdO1b
         TTcaY0zQrCFUKGAiZiwwJlXQhUq1NhZw1VKrOAD99v3FM/SecjkPLgC4YZ8fs5CuIs
         PvamzsduJi22A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210611163124.3566027-1-thierry.reding@gmail.com>
References: <20210611163124.3566027-1-thierry.reding@gmail.com>
Subject: Re: [GIT PULL] clk: tegra: Changes for v5.14-rc1
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
To:     Michael Turquette <mturquette@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>
Date:   Mon, 21 Jun 2021 16:39:05 -0700
Message-ID: <162431874543.3552334.2396645089646938680@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Quoting Thierry Reding (2021-06-11 09:31:24)
> Hi Mike, Stephen,
>=20
> The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627=
b5:
>=20
>   Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/for-=
5.14-clk
>=20
> for you to fetch changes up to f13570e7e830ca4fbf4869015af8492b8918445e:
>=20
>   clk: tegra: tegra124-emc: Fix clock imbalance in emc_set_timing() (2021=
-06-02 11:08:00 +0200)
>=20
> Thanks,
> Thierry
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
