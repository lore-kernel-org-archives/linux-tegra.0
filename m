Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAC58C43381
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Feb 2021 11:18:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9EB1964F7C
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Feb 2021 11:18:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233968AbhBCLSU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 3 Feb 2021 06:18:20 -0500
Received: from mout02.posteo.de ([185.67.36.142]:33327 "EHLO mout02.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233972AbhBCLST (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 3 Feb 2021 06:18:19 -0500
X-Greylist: delayed 468 seconds by postgrey-1.27 at vger.kernel.org; Wed, 03 Feb 2021 06:18:18 EST
Received: from submission (posteo.de [89.146.220.130]) 
        by mout02.posteo.de (Postfix) with ESMTPS id BC96D240100
        for <linux-tegra@vger.kernel.org>; Wed,  3 Feb 2021 12:09:37 +0100 (CET)
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4DVzTr4tnqz6tm5;
        Wed,  3 Feb 2021 12:09:36 +0100 (CET)
Date:   Wed, 3 Feb 2021 12:09:34 +0100 (CET)
From:   Marc Dietrich <marvin24@gmx.de>
X-X-Sender: lucile@mbpdelurezlocal.fritz.box
To:     Kumar Kartikeya Dwivedi <memxor@gmail.com>
cc:     devel@driverdev.osuosl.org, gregkh@linuxfoundation.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 05/13] staging: nvec: Switch from strlcpy to strscpy
In-Reply-To: <20210131172838.146706-6-memxor@gmail.com>
Message-ID: <alpine.OSX.2.23.453.2102031207120.23814@mbpdelurezlocal.fritz.box>
References: <20210131172838.146706-1-memxor@gmail.com> <20210131172838.146706-6-memxor@gmail.com>
User-Agent: Alpine 2.23 (OSX 453 2020-06-18)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Kumar,

On Sun, 31 Jan 2021, Kumar Kartikeya Dwivedi wrote:

> strlcpy is marked as deprecated in Documentation/process/deprecated.rst,
> and there is no functional difference when the caller expects truncation
> (when not checking the return value). strscpy is relatively better as it
> also avoids scanning the whole source string.
>
> This silences the related checkpatch warnings from:
> 5dbdb2d87c29 ("checkpatch: prefer strscpy to strlcpy")
>
> Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
> ---
> drivers/staging/nvec/nvec_ps2.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/nvec/nvec_ps2.c b/drivers/staging/nvec/nvec_ps2.c
> index 45db29262..157009015 100644
> --- a/drivers/staging/nvec/nvec_ps2.c
> +++ b/drivers/staging/nvec/nvec_ps2.c
> @@ -112,8 +112,8 @@ static int nvec_mouse_probe(struct platform_device *pdev)
> 	ser_dev->start = ps2_startstreaming;
> 	ser_dev->stop = ps2_stopstreaming;
>
> -	strlcpy(ser_dev->name, "nvec mouse", sizeof(ser_dev->name));
> -	strlcpy(ser_dev->phys, "nvec", sizeof(ser_dev->phys));
> +	strscpy(ser_dev->name, "nvec mouse", sizeof(ser_dev->name));
> +	strscpy(ser_dev->phys, "nvec", sizeof(ser_dev->phys));

lgtm, so

Acked-by: Marc Dietrich <marvin24@gmx.de>

Thanks!

Marc
