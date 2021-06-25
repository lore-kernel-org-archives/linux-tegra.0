Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60A56C48BC2
	for <linux-tegra@archiver.kernel.org>; Fri, 25 Jun 2021 23:23:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 428F26195B
	for <linux-tegra@archiver.kernel.org>; Fri, 25 Jun 2021 23:23:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229929AbhFYXZo (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 25 Jun 2021 19:25:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:46562 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229826AbhFYXZo (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 25 Jun 2021 19:25:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8248261949;
        Fri, 25 Jun 2021 23:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624663402;
        bh=AjDRQs5MIIcedMMdECS/CdvchLXuzlzMyKZFaSAcvcE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=NomHh4tafrBF/py5lKSiIQB/MSFhJwidAHa9kEOy5dRBoBFA0L4zg5UwWl1rYlipo
         eAazffRBAPfYibw+Kka9RaaTSaMV2aB7gv83aU/rbyX/QDv6pBBHTMQFZfrry+kbFz
         zyS0mCHLdp2C1+xBS1uCpP/7vIULFaVUlC6Czdr/ZooZKUEYPbVCXyezSdxYbRaQwn
         TevaoEierZzgMCP5GmrY7dzDQdRce282NJElLKDumpu8aPXOPBKWS1/VL/m5FHgo5b
         Fn59m0aPXjnmPr/Hg/wTgS/JTkpLq8BClruaO0ANZS1OYyA+xhCjcV27EeqKe72wDU
         sREkYG7eMROWQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YNRzFOIKtUZfnsu7@orome.fritz.box>
References: <20210624084737.42336-1-aardelean@deviqon.com> <YNRzFOIKtUZfnsu7@orome.fritz.box>
Subject: Re: [PATCH] clk: tegra: clk-tegra124-dfll-fcpu: don't use devm functions for regulator
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, pdeschrijver@nvidia.com,
        pgaikwad@nvidia.com, jonathanh@nvidia.com
To:     Alexandru Ardelean <aardelean@deviqon.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        mturquette@baylibre.com
Date:   Fri, 25 Jun 2021 16:23:20 -0700
Message-ID: <162466340054.3259633.8766268265703754283@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Quoting Thierry Reding (2021-06-24 04:57:08)
> On Thu, Jun 24, 2021 at 11:47:37AM +0300, Alexandru Ardelean wrote:
> > The purpose of the device-managed functions is to bind the life-time of=
 an
> > object to that of a parent device object.
> >=20
> > This is not the case for the 'vdd-cpu' regulator in this driver. A
> > reference is obtained via devm_regulator_get() and immediately released
> > with devm_regulator_put().
> >=20
> > In this case, the usage of devm_ functions is slightly excessive, as the
> > un-managed versions of these functions is a little cleaner (and slightly
> > more economical in terms of allocation).
> >=20
> > This change converts the devm_regulator_{get,put}() to
> > regulator_{get,put}() in the get_alignment_from_regulator() function of
> > this driver.
> >=20
> > Signed-off-by: Alexandru Ardelean <aardelean@deviqon.com>
> > ---
> >  drivers/clk/tegra/clk-tegra124-dfll-fcpu.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> Indeed, this seems unnecessary:
>=20
> Reviewed-by: Thierry Reding <treding@nvidia.com>
>=20
> Mike, Stephen: do you want to pick this up directly or would you prefer
> if I collected this into a clk branch for the next cycle?
>=20

No worries. I got it.
