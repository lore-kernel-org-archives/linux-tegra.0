Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB0E1C433F5
	for <linux-tegra@archiver.kernel.org>; Tue, 17 May 2022 06:55:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232718AbiEQGzm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 17 May 2022 02:55:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231360AbiEQGzm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 17 May 2022 02:55:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EA786596;
        Mon, 16 May 2022 23:55:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id ED82F6156C;
        Tue, 17 May 2022 06:55:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ED8FC385B8;
        Tue, 17 May 2022 06:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652770539;
        bh=0qmFC8/qfpu0v7UXJr1CrxoL7qolRRJ0cjtndhAbha4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=eDPI0LvwlKXuqE6CE2FED/EXYMp1UzWOePHWJgH5NkRgi4jb2/K0+hsy4x/IJDJPw
         /iNfcuyt4IcfvdrgmW+MtsbXxlYAiL4YYUBmU8Xz9P+DPZEYu/GDPN75Q4B/weM+bR
         KAG0UKdQCTxZTk+hJR59uBtN7gf4Ve6j4bO8sUlh87PqAqjVhHlawsfrFuiOHg2JgF
         qSgTnu35ZdTiTvBxAAMVDS1lGLY9MJCM8yR0I7hrP2mBSozU5Gd/ZDGlgL0E0jwOmo
         V37C4nweqE+nrNzzAo8mvcY164N6PBKKSGRWqwfK94SJGeIdYPkPHAH+8zZMt3pAL1
         XNKXHEWhhVoAA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220506142446.3916142-1-thierry.reding@gmail.com>
References: <20220506142446.3916142-1-thierry.reding@gmail.com>
Subject: Re: [GIT PULL] clk: tegra: Changes for v5.19-rc1
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
To:     Michael Turquette <mturquette@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>
Date:   Mon, 16 May 2022 23:55:37 -0700
User-Agent: alot/0.10
Message-Id: <20220517065539.4ED8FC385B8@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Quoting Thierry Reding (2022-05-06 07:24:46)
> Hi Mike, Stephen,
>=20
> The following changes since commit 3123109284176b1532874591f7c81f3837bbdc=
17:
>=20
>   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/for-=
5.19-clk
>=20
> for you to fetch changes up to 6f6baf690c3b8c41083d7443ab6a5645b96ff91b:
>=20
>   clk: tegra: Update kerneldoc to match prototypes (2022-05-06 10:56:00 +=
0200)
>=20
> Thanks,
> Thierry
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
