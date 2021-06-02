Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5887EC4708F
	for <linux-tegra@archiver.kernel.org>; Wed,  2 Jun 2021 07:58:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A30E6138C
	for <linux-tegra@archiver.kernel.org>; Wed,  2 Jun 2021 07:58:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231485AbhFBH7v (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 2 Jun 2021 03:59:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:33776 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229810AbhFBH7v (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 2 Jun 2021 03:59:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BFE3E60FD8;
        Wed,  2 Jun 2021 07:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622620688;
        bh=DRqgDVHEI5XQuxNrJTei+XmsXziLJ9TYY3WEAhS6QXs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=l8gfvl7CeAVaq5wLzKKHaC+/Zi0wqTbeWs35J1jRWij9QOCwUDwYAAfdNbq5RiKrv
         hGPfh2z1Q3plSM8VarP74qyjtRM7uagHN7b5RLJUkpD5KAVO1Gc73l3cEXOWda6G8x
         shJbKKxWqbBIgNvHD6gn3VgmEWN3WQCKZvNNEgby37kbP+Hu1AEsxNVj+nZWCpHwkL
         y/Uqv4YDXwXaHa/UYQ9UYvs1M4GgGGe9eKqs+m7dFtWpx/8ufIY3nu3pTBNLQzPoJ+
         WOjNCCR0aDaBbwC1AT5xlcoK7rU4G+fyePOIANTLb/jGmmVdQI4Ij24Ll9h4mFSlFO
         ghPJ3x+RuoM4Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210518044247.605370-1-yangyingliang@huawei.com>
References: <20210518044247.605370-1-yangyingliang@huawei.com>
Subject: Re: [PATCH -next] clk: tegra: tegra124-emc: fix missing clk_disable_unprepare() on error in emc_set_timing()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     jonathanh@nvidia.com, thierry.reding@gmail.com
To:     Yang Yingliang <yangyingliang@huawei.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Date:   Wed, 02 Jun 2021 00:58:07 -0700
Message-ID: <162262068754.4130789.12258910664512101759@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Why does the subject have -next in it?

Quoting Yang Yingliang (2021-05-17 21:42:47)
> After calling clk_prepare_enable(), clk_disable_unprepare() need
> be called when prepare_timing_change() failed.
>=20
> Fixes: 2db04f16b589 ("clk: tegra: Add EMC clock driver")

And then the Fixes tag is for a patch that was merged in v4.10?

> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/clk/tegra/clk-tegra124-emc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/tegra/clk-tegra124-emc.c b/drivers/clk/tegra/clk=
-tegra124-emc.c
> index bdf6f4a51617..74c1d894cca8 100644
> --- a/drivers/clk/tegra/clk-tegra124-emc.c
> +++ b/drivers/clk/tegra/clk-tegra124-emc.c
> @@ -249,8 +249,10 @@ static int emc_set_timing(struct tegra_clk_emc *tegr=
a,
>         div =3D timing->parent_rate / (timing->rate / 2) - 2;
> =20
>         err =3D tegra->prepare_timing_change(emc, timing->rate);
> -       if (err)
> +       if (err) {
> +               clk_disable_unprepare(timing->parent);
>                 return err;
> +       }
> =20
>         spin_lock_irqsave(tegra->lock, flags);
> =20

Looks correct to me. I assume Thierry will pick it up for the next merge
window.
