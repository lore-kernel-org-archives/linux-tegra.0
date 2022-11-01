Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A580C4332F
	for <linux-tegra@archiver.kernel.org>; Tue,  1 Nov 2022 18:19:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230132AbiKASTN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 1 Nov 2022 14:19:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230129AbiKASTJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 1 Nov 2022 14:19:09 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BCC85592;
        Tue,  1 Nov 2022 11:19:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 30186B81ED0;
        Tue,  1 Nov 2022 18:19:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C556DC433D6;
        Tue,  1 Nov 2022 18:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667326744;
        bh=xizDznpXXhF2d9AzurmPdD3XOZdsBBF3OaD9Z6mYVeE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=FGgUa7A6mLCQjzCFnplzzMOzUrB3Bk7QJF+ZMjc0OmmJ34RCw9hhQt6prxAOwmpTB
         wiVtPVeo9uKE/lKsffU5vsQyzbfUItY+qlcCDyj96GmiFX9W7QrJAMxNSRJNth/NmO
         S8ZITABJBSc1c3spxhjkgSLBWlfqf+yQFEI8znVy+gqp9udH7fOz0HNRIq2TcfOO1y
         Nt677etFuNQd0YFYO07U8i/lcEHJvVVa0d8KyMezjJ+PsWv7sfE+MDHsFJwD3nlw9+
         Mr+VqILgRAY3hccUQ0BeqAsdrbpvGY1GutC9OtZNJXONKMAlZBWCp83wjQCjweySGg
         qtL7IYKrolxaA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Y1u51EiIc3LEGgV1@orome>
References: <20221027121354.1481945-1-pdeschrijver@nvidia.com> <Y1u51EiIc3LEGgV1@orome>
Subject: Re: [PATCH v4 1/2] firmware: tegra: Update BPMP ABI
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     treding@nvidia.com, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org
To:     Michael Turquette <mturquette@baylibre.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Date:   Tue, 01 Nov 2022 11:19:02 -0700
User-Agent: alot/0.10
Message-Id: <20221101181904.C556DC433D6@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Quoting Thierry Reding (2022-10-28 04:15:32)
> On Thu, Oct 27, 2022 at 03:13:53PM +0300, Peter De Schrijver wrote:
> > Update the BPMP ABI to align with the the latest version.
> >=20
> > Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> > ---
> >  include/soc/tegra/bpmp-abi.h | 1802 +++++++++++++++++++++++++---------
> >  1 file changed, 1357 insertions(+), 445 deletions(-)
>=20
> Looks good to me.
>=20
> Mike, Stephen, do you have any objections if I pick these two patches up
> into the Tegra tree to manage the dependencies? There's another patch
> that will need some of the BPMP ABI additions added here which we may
> get ready in time for v6.2, so it'd be good to have this in a shared
> branch.
>=20
> I don't think it'll be necessary for me to pick any other clock driver
> changes, though, as long as they don't conflict with these BPMP clock
> driver changes. But if you prefer, I can collect others as well and send
> them all your way later on in the release cycle.

It is fine to take them through your tree.

Acked-by: Stephen Boyd <sboyd@kernel.org>
