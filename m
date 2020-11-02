Return-Path: <SRS0=G4SC=EI=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E430DC2D0A3
	for <linux-tegra@archiver.kernel.org>; Mon,  2 Nov 2020 18:52:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9104E21D40
	for <linux-tegra@archiver.kernel.org>; Mon,  2 Nov 2020 18:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604343142;
	bh=5eZFEfWGJoeuMXmR8PONQKYDREFKHMFL6T5saYvPVcE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=QXhJt+bqnHYTkvDaeLhFi+2JF3CZZA9xnIRoVaPLy6WBlyH5RrJrbRoEsHiB7/kZD
	 FKgeG8fG2orps6FugchK06plajd60huBfh+Q9xOK9SgZw+72153dTkaUyK27Mb1Q7P
	 t2/hX9+DFWI295t0/Ybala4UbwvDDGwyyRm9alE8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726088AbgKBSwW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 2 Nov 2020 13:52:22 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:36028 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726070AbgKBSwW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 2 Nov 2020 13:52:22 -0500
Received: by mail-wr1-f67.google.com with SMTP id x7so15858536wrl.3;
        Mon, 02 Nov 2020 10:52:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ihmv0j/kb5HdVveoEdxCZPkSvwNmiGs5bHQUm70yNPE=;
        b=DkdDtVRMjg1Mv1kBooWqnZaQ95yX+C8HZwjsE091iXCAT2ajWBoTNoOnN3d2FS6NKs
         CDZwk1L55umk2FRAbadYpCzUpKD8HyKFBT5SeGzw363SObNKHEowV+s8BTqY4nfvTW7P
         tRDBbIxfI2NMaM5mVA8T/3ZdMvYgCAUOc8OOSZt/fv4RurW/xewL7vgEbXJG9o8k5aWv
         lKPZe3hmhNk5aMZwFuIsUQR05K1oZlJCpYM/H+qKredUE59aJjN+JL7CB0DkpHiOSM+r
         SiG7atX4oZx14MVv6ChDv/BqK+vXJP5WGZgrJLDdaCEAwn12slN1oknMgP6DmkShtmvz
         kAZQ==
X-Gm-Message-State: AOAM530bFVqotcEb6XnfaXvkDLelokw9G96ph/Db381Z7l6wUH1lS+fo
        8ZDcFZjVnE/HxrtyiKbsreBdQI+PtWd+gg==
X-Google-Smtp-Source: ABdhPJw3qjivmIfHTjw1ZvIj072jpI42j+8Ad+n/DMLoD/eJS3FTUfrGsX0ygQzM7EZS32VVR863ZA==
X-Received: by 2002:a5d:490a:: with SMTP id x10mr21364337wrq.289.1604343139789;
        Mon, 02 Nov 2020 10:52:19 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id b8sm353249wmj.9.2020.11.02.10.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 10:52:18 -0800 (PST)
Date:   Mon, 2 Nov 2020 19:52:16 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Yu Kuai <yukuai3@huawei.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        mperttunen@nvidia.com, tomeu.vizoso@collabora.com,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        yi.zhang@huawei.com
Subject: Re: [PATCH] memory: tegra: add missing put_devcie() call in
 tegra_emc_probe()
Message-ID: <20201102185216.GB13405@kozik-lap>
References: <20201031105355.2303794-1-yukuai3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201031105355.2303794-1-yukuai3@huawei.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sat, Oct 31, 2020 at 06:53:55PM +0800, Yu Kuai wrote:
> if of_find_device_by_node() succeed, tegra_emc_probe() doesn't have a
> corresponding put_device(). Thus add jump target to fix the exception
> handling for this function implementation.

Please fix the title in subject and reword, it's not possible to
understand it. You are fixing here error paths, so for example:

"The reference to device obtained with of_find_device_by_node() should
be dropped. Add missing put_device() calls in probe error paths.

> 
> Fixes: 73a7f0a90641("memory: tegra: Add EMC (external memory controller) driver")
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> ---
>  drivers/memory/tegra/tegra124-emc.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/memory/tegra/tegra124-emc.c b/drivers/memory/tegra/tegra124-emc.c
> index 76ace42a688a..831dfca0804c 100644
> --- a/drivers/memory/tegra/tegra124-emc.c
> +++ b/drivers/memory/tegra/tegra124-emc.c
> @@ -1207,8 +1207,10 @@ static int tegra_emc_probe(struct platform_device *pdev)
>  		return -ENOENT;
>  
>  	emc->mc = platform_get_drvdata(mc);
> -	if (!emc->mc)
> -		return -EPROBE_DEFER;
> +	if (!emc->mc) {
> +		err = -EPROBE_DEFER;
> +		goto put_device;
> +	}
>  
>  	ram_code = tegra_read_ram_code();
>  
> @@ -1217,25 +1219,27 @@ static int tegra_emc_probe(struct platform_device *pdev)
>  		dev_err(&pdev->dev,
>  			"no memory timings for RAM code %u found in DT\n",
>  			ram_code);
> -		return -ENOENT;
> +		err = -ENOENT;
> +		goto put_device;
>  	}
>  
>  	err = tegra_emc_load_timings_from_dt(emc, np);
>  	of_node_put(np);
>  	if (err)
> -		return err;
> +		goto put_device;
>  
>  	if (emc->num_timings == 0) {
>  		dev_err(&pdev->dev,
>  			"no memory timings for RAM code %u registered\n",
>  			ram_code);
> -		return -ENOENT;
> +		err = -ENOENT;
> +		goto put_device;
>  	}
>  
>  	err = emc_init(emc);
>  	if (err) {
>  		dev_err(&pdev->dev, "EMC initialization failed: %d\n", err);
> -		return err;
> +		goto put_device;
>  	}
>  
>  	platform_set_drvdata(pdev, emc);
> @@ -1244,6 +1248,9 @@ static int tegra_emc_probe(struct platform_device *pdev)
>  		emc_debugfs_init(&pdev->dev, emc);
>  
>  	return 0;

Line break

> +put_device:
> +	put_device(&mc->dev);

Line break

Best regards,
Krzysztof
