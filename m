Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBF78C433EF
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Oct 2021 01:15:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B8185610D0
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Oct 2021 01:15:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230355AbhJUBR6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 20 Oct 2021 21:17:58 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:11714 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230103AbhJUBR5 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 20 Oct 2021 21:17:57 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4HZV0Y2j4Xz6R;
        Thu, 21 Oct 2021 03:15:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1634778941; bh=zIBd1upGHKOn4EfC7/VthOsnJ4BoJpFDcgjMgUdSn44=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Z9/Ud0Hsm4VgYKxNnmXj2eD0SWZvtUffKbvls6dobJY4mOiuszS/6bQa0vcFTH/as
         YdoWlxADtmxLpqVBpbXdWnJhvqJXfr+DqemDNTHaMy+XaILh2NwkZ2SlmbXdRsxGE1
         EHlPBqGzwr8/Og4zADlzsjzYbht5laULDN4s0AANLVW1Rdq3UW8Q5rxPwRiXfQTI/3
         fnDOzGBsFMOIUwjhzx6coE6GJZNoh8cRgmYObwMCyfsk15JVsIwVloD2S9s1INSpTY
         tcaJRXBN6/KTEObsfIJJs3QPbk1rGzCg3wnp+Ldf5RCB5vjn+bVQMhyooLOQ2yVBKJ
         Hilt1n1waiisA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.3 at mail
Date:   Thu, 21 Oct 2021 03:15:37 +0200
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Qing Wang <wangqing@vivo.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: tegra: switch over to memdup_user()
Message-ID: <YXC/OesonB81PVmm@qmqm.qmqm.pl>
References: <1634543982-36727-1-git-send-email-wangqing@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1634543982-36727-1-git-send-email-wangqing@vivo.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Oct 18, 2021 at 12:59:40AM -0700, Qing Wang wrote:
[...]
> --- a/drivers/firmware/tegra/bpmp-debugfs.c
> +++ b/drivers/firmware/tegra/bpmp-debugfs.c
> @@ -376,18 +376,11 @@ static ssize_t bpmp_debug_store(struct file *file, const char __user *buf,
>  	if (!filename)
>  		return -ENOENT;
>  
> -	databuf = kmalloc(count, GFP_KERNEL);
> -	if (!databuf)
> -		return -ENOMEM;
> -
> -	if (copy_from_user(databuf, buf, count)) {
> -		err = -EFAULT;
> -		goto free_ret;
> -	}
> +	databuf = memdup_user(buf, count);
> +	if (IS_ERR(databuf))
> +		return ERR_PTR(PTR_ERR(databuf));

ERR_PTR() is too much here.

Best Regards
Micha³ Miros³aw
