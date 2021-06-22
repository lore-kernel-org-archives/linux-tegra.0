Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FE7DC48BE5
	for <linux-tegra@archiver.kernel.org>; Tue, 22 Jun 2021 20:53:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0A20A6128C
	for <linux-tegra@archiver.kernel.org>; Tue, 22 Jun 2021 20:53:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229775AbhFVU4F (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 22 Jun 2021 16:56:05 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:61224 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229625AbhFVU4F (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 22 Jun 2021 16:56:05 -0400
X-Greylist: delayed 414 seconds by postgrey-1.27 at vger.kernel.org; Tue, 22 Jun 2021 16:56:05 EDT
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4G8djn0Lppz4x;
        Tue, 22 Jun 2021 22:46:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1624394813; bh=t5I5NssExGW0t61jdwywzsW2KnoEPodiNLvtIofa+uU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=k2FnXCwX5LNQyLZDC33cGdda5mtRxmusRX4pJRjyui8vY/DyAktmS8bBTi3fdPXA1
         dCol4H0ekQ+U4+1I/UxMkM4vpQe5EvlYrD0s+kDnFBCANaRRNYp/ZfNE+rhN9p9c5p
         MeSRxcaP+LQXUIyALO1Z25/BdcfLEwHysFubML6dmNcEsZLOwTNxIil5SwLS654iHB
         I60Gw/+NtlEIe+f9SjKCGewDyi+g64HHMZ/PZ95WsJT858ZxBLUyLjqTvBiWaVBfHC
         uGDDWho+GTa2R+sb82z2oSyEvom2afeMnnVPFF1NjTH87zzRKcqfW2lgs+SHrhtFeL
         Vb+up9ZCCG+gQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.2 at mail
Date:   Tue, 22 Jun 2021 22:46:51 +0200
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Mikko Perttunen <mperttunen@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
        airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v7 05/15] gpu: host1x: Add option to skip firewall for a
 job
Message-ID: <YNJMN6CxlndhXqf5@qmqm.qmqm.pl>
References: <20210610110456.3692391-1-mperttunen@nvidia.com>
 <20210610110456.3692391-6-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210610110456.3692391-6-mperttunen@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Jun 10, 2021 at 02:04:46PM +0300, Mikko Perttunen wrote:
> The new UAPI will have its own firewall, and we don't want to run
> the firewall in the Host1x driver for those jobs. As such, add a
> parameter to host1x_job_alloc to specify if we want to skip the
> firewall in the Host1x driver.
[...]
>  struct host1x_job *host1x_job_alloc(struct host1x_channel *ch,
> -				    u32 num_cmdbufs, u32 num_relocs)
> +				    u32 num_cmdbufs, u32 num_relocs,
> +				    bool skip_firewall)
>  {
>  	struct host1x_job *job = NULL;
>  	unsigned int num_unpins = num_relocs;
> +	bool enable_firewall;
>  	u64 total;
>  	void *mem;
>  
> -	if (!IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL))
> +	enable_firewall = IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL) && !skip_firewall;
[...]

Why negatively name a parameter just to invert it right away?

Best Regards
Micha³ Miros³aw
