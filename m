Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A946C2B9F4
	for <linux-tegra@archiver.kernel.org>; Fri, 25 Jun 2021 23:23:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E632961954
	for <linux-tegra@archiver.kernel.org>; Fri, 25 Jun 2021 23:23:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229975AbhFYX0K (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 25 Jun 2021 19:26:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:46862 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229948AbhFYX0K (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 25 Jun 2021 19:26:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B7C4461949;
        Fri, 25 Jun 2021 23:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624663428;
        bh=mQonIn9Qw3twlW/qLBFdWqCM5XghMvbXhD8NlsWqsag=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=uQN+cWOy8JWXA7KBS3viSA5z48M+/YWZmMcYsnf71Rd7KXwC5LD8JgabgPgBTSKYW
         vZCLB+lea7pgMWPQovkgFqLXCB8mudQUuBEMvyE1Pd3yN5C0Q4RnMCZHPO0tq1z3ji
         UMgW2UbsQD04bOSeoVEPjKXD4jj7+nfZCBIfeQCeytzMBwKrXFuY2A/mxHsvyn4JxE
         vNGVdMWBHbkBbQ4H0KWPn0MCpezkZjRxcF3uO45JCXvW0FqUBupJIo0vm8GeRnA57j
         RYZHnuHCumHtDhuf6gCQhvrT7Nd6aS5zawAmPVCW5CRos6UEqYk5p2FT3qiIjnjRc1
         Lgi2kDHbZneBg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210624084737.42336-1-aardelean@deviqon.com>
References: <20210624084737.42336-1-aardelean@deviqon.com>
Subject: Re: [PATCH] clk: tegra: clk-tegra124-dfll-fcpu: don't use devm functions for regulator
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     pdeschrijver@nvidia.com, pgaikwad@nvidia.com,
        mturquette@baylibre.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, Alexandru Ardelean <aardelean@deviqon.com>
To:     Alexandru Ardelean <aardelean@deviqon.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Date:   Fri, 25 Jun 2021 16:23:46 -0700
Message-ID: <162466342649.3259633.211016165907683345@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Quoting Alexandru Ardelean (2021-06-24 01:47:37)
> The purpose of the device-managed functions is to bind the life-time of an
> object to that of a parent device object.
>=20
> This is not the case for the 'vdd-cpu' regulator in this driver. A
> reference is obtained via devm_regulator_get() and immediately released
> with devm_regulator_put().
>=20
> In this case, the usage of devm_ functions is slightly excessive, as the
> un-managed versions of these functions is a little cleaner (and slightly
> more economical in terms of allocation).
>=20
> This change converts the devm_regulator_{get,put}() to
> regulator_{get,put}() in the get_alignment_from_regulator() function of
> this driver.
>=20
> Signed-off-by: Alexandru Ardelean <aardelean@deviqon.com>
> ---

Applied to clk-next
