Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 398E2C433C1
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 11:16:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0FF2F619A5
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 11:16:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230414AbhCWLQX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 23 Mar 2021 07:16:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230438AbhCWLPx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Mar 2021 07:15:53 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA9C6C061574
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 04:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=SESQw2FFXcXHdvW5M5RIfPi+u8HcduNXgvEnwd2qp48=; b=cemSi1F2QHaTXkqPP6Ixx+tv5n
        Qr4jtssLZ2eQ5AAPo7CI71kkObe7Iri9G9BageYIrg3qhbmzzt8AeHuZfGhNnIOZksanje+9cIJvp
        myHLN4KCogWblEyaNJABXR1DWuKtPq59rFwCZiQHXM6TZPYesGBF+pTMtANicfRch8OxIVyZqNZzy
        ZRdQzdjw2ZqI9lGVlCk6V8DpsUjSSic+5fTlLTUQQ4R/08S+FbaXGKrQ22tsekH5VIHONLT0VTR22
        myz1OzGAvuM8o3lwf1f3etgWJutJ/Bva2/ZK6Ho/5+Xun3lHd2t9Z27LUjN3fG4O2Nu2ZuuE1UGHf
        +WrpkdEg==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1lOf0n-0007zj-Ib; Tue, 23 Mar 2021 13:15:49 +0200
Subject: Re: [PATCH v5 08/21] gpu: host1x: Implement /dev/host1x device node
To:     Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>
Cc:     jonathanh@nvidia.com, digetx@gmail.com, airlied@linux.ie,
        daniel@ffwll.ch, linux-tegra@vger.kernel.org,
        dri-devel@lists.freedesktop.org, talho@nvidia.com,
        bhuntsman@nvidia.com
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-9-mperttunen@nvidia.com>
 <YFnKz9eCndMnOB61@orome.fritz.box>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <5633656a-b93a-fb5e-a5cb-6ff2f7d2ddfb@kapsi.fi>
Date:   Tue, 23 Mar 2021 13:15:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YFnKz9eCndMnOB61@orome.fritz.box>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 3/23/21 1:02 PM, Thierry Reding wrote:
> On Mon, Jan 11, 2021 at 03:00:06PM +0200, Mikko Perttunen wrote:
>> Add the /dev/host1x device node, implementing the following
>> functionality:
>>
>> - Reading syncpoint values
>> - Allocating syncpoints (providing syncpoint FDs)
>> - Incrementing syncpoints (based on syncpoint FD)
>>
>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>> ---
>> v4:
>> * Put UAPI under CONFIG_DRM_TEGRA_STAGING
>> v3:
>> * Pass process name as syncpoint name when allocating
>>    syncpoint.
>> ---
>>   drivers/gpu/host1x/Makefile |   1 +
>>   drivers/gpu/host1x/dev.c    |   9 ++
>>   drivers/gpu/host1x/dev.h    |   3 +
>>   drivers/gpu/host1x/uapi.c   | 282 ++++++++++++++++++++++++++++++++++++
>>   drivers/gpu/host1x/uapi.h   |  22 +++
>>   include/linux/host1x.h      |   2 +
>>   6 files changed, 319 insertions(+)
>>   create mode 100644 drivers/gpu/host1x/uapi.c
>>   create mode 100644 drivers/gpu/host1x/uapi.h
>>
>> diff --git a/drivers/gpu/host1x/Makefile b/drivers/gpu/host1x/Makefile
>> index 096017b8789d..882f928d75e1 100644
>> --- a/drivers/gpu/host1x/Makefile
>> +++ b/drivers/gpu/host1x/Makefile
>> @@ -9,6 +9,7 @@ host1x-y = \
>>   	job.o \
>>   	debug.o \
>>   	mipi.o \
>> +	uapi.o \
>>   	hw/host1x01.o \
>>   	hw/host1x02.o \
>>   	hw/host1x04.o \
>> diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
>> index d0ebb70e2fdd..641317d23828 100644
>> --- a/drivers/gpu/host1x/dev.c
>> +++ b/drivers/gpu/host1x/dev.c
>> @@ -461,6 +461,12 @@ static int host1x_probe(struct platform_device *pdev)
>>   		goto deinit_syncpt;
>>   	}
>>   
>> +	err = host1x_uapi_init(&host->uapi, host);
> 
> It's a bit pointless to pass &host->uapi and host to the function since
> you can access the former through the latter.

Yeah. I originally did it to separate the uapi module from the rest of 
the code interface-wise as much as possible, but I don't think I have 
done that consistently so it just looks weird.

> 
>> +	if (err) {
>> +		dev_err(&pdev->dev, "failed to initialize uapi\n");
> 
> s/uapi/UAPI/, and perhaps include the error code to give a better hint
> as to why things failed.

Sure (if this code is kept.)

> 
>> +		goto deinit_intr;
>> +	}
>> +
>>   	host1x_debug_init(host);
>>   
>>   	if (host->info->has_hypervisor)
>> @@ -480,6 +486,8 @@ static int host1x_probe(struct platform_device *pdev)
>>   	host1x_unregister(host);
>>   deinit_debugfs:
>>   	host1x_debug_deinit(host);
>> +	host1x_uapi_deinit(&host->uapi);
>> +deinit_intr:
>>   	host1x_intr_deinit(host);
>>   deinit_syncpt:
>>   	host1x_syncpt_deinit(host);
>> @@ -501,6 +509,7 @@ static int host1x_remove(struct platform_device *pdev)
>>   
>>   	host1x_unregister(host);
>>   	host1x_debug_deinit(host);
>> +	host1x_uapi_deinit(&host->uapi);
>>   	host1x_intr_deinit(host);
>>   	host1x_syncpt_deinit(host);
>>   	reset_control_assert(host->rst);
>> diff --git a/drivers/gpu/host1x/dev.h b/drivers/gpu/host1x/dev.h
>> index 63010ae37a97..7b8b7e20e32b 100644
>> --- a/drivers/gpu/host1x/dev.h
>> +++ b/drivers/gpu/host1x/dev.h
>> @@ -17,6 +17,7 @@
>>   #include "intr.h"
>>   #include "job.h"
>>   #include "syncpt.h"
>> +#include "uapi.h"
>>   
>>   struct host1x_syncpt;
>>   struct host1x_syncpt_base;
>> @@ -143,6 +144,8 @@ struct host1x {
>>   	struct list_head list;
>>   
>>   	struct device_dma_parameters dma_parms;
>> +
>> +	struct host1x_uapi uapi;
>>   };
>>   
>>   void host1x_hypervisor_writel(struct host1x *host1x, u32 r, u32 v);
>> diff --git a/drivers/gpu/host1x/uapi.c b/drivers/gpu/host1x/uapi.c
>> new file mode 100644
>> index 000000000000..27b8761c3f35
>> --- /dev/null
>> +++ b/drivers/gpu/host1x/uapi.c
>> @@ -0,0 +1,282 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * /dev/host1x syncpoint interface
>> + *
>> + * Copyright (c) 2020, NVIDIA Corporation.
>> + */
>> +
>> +#include <linux/anon_inodes.h>
>> +#include <linux/cdev.h>
>> +#include <linux/file.h>
>> +#include <linux/fs.h>
>> +#include <linux/host1x.h>
>> +#include <linux/nospec.h>
>> +
>> +#include "dev.h"
>> +#include "syncpt.h"
>> +#include "uapi.h"
>> +
>> +#include <uapi/linux/host1x.h>
>> +
>> +static int syncpt_file_release(struct inode *inode, struct file *file)
>> +{
>> +	struct host1x_syncpt *sp = file->private_data;
>> +
>> +	host1x_syncpt_put(sp);
>> +
>> +	return 0;
>> +}
>> +
>> +static int syncpt_file_ioctl_info(struct host1x_syncpt *sp, void __user *data)
>> +{
>> +	struct host1x_syncpoint_info args;
>> +	unsigned long copy_err;
>> +
>> +	copy_err = copy_from_user(&args, data, sizeof(args));
>> +	if (copy_err)
>> +		return -EFAULT;
>> +
>> +	if (args.reserved[0] || args.reserved[1] || args.reserved[2])
>> +		return -EINVAL;
> 
> Yes! \o/
> 
>> +
>> +	args.id = sp->id;
>> +
>> +	copy_err = copy_to_user(data, &args, sizeof(args));
>> +	if (copy_err)
>> +		return -EFAULT;
>> +
>> +	return 0;
>> +}
>> +
>> +static int syncpt_file_ioctl_incr(struct host1x_syncpt *sp, void __user *data)
>> +{
>> +	struct host1x_syncpoint_increment args;
>> +	unsigned long copy_err;
>> +	u32 i;
>> +
>> +	copy_err = copy_from_user(&args, data, sizeof(args));
>> +	if (copy_err)
>> +		return -EFAULT;
>> +
>> +	for (i = 0; i < args.count; i++) {
>> +		host1x_syncpt_incr(sp);
>> +		if (signal_pending(current))
>> +			return -EINTR;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static long syncpt_file_ioctl(struct file *file, unsigned int cmd,
>> +			      unsigned long arg)
>> +{
>> +	void __user *data = (void __user *)arg;
>> +	long err;
>> +
>> +	switch (cmd) {
>> +	case HOST1X_IOCTL_SYNCPOINT_INFO:
>> +		err = syncpt_file_ioctl_info(file->private_data, data);
>> +		break;
>> +
>> +	case HOST1X_IOCTL_SYNCPOINT_INCREMENT:
>> +		err = syncpt_file_ioctl_incr(file->private_data, data);
>> +		break;
>> +
>> +	default:
>> +		err = -ENOTTY;
>> +	}
>> +
>> +	return err;
>> +}
> 
> I wonder if it's worth adding some more logic to this demuxing. I'm
> thinking along the lines of what the DRM IOCTL demuxer does, which
> ultimately allows the IOCTLs to be extended. It does this by doing a
> bit of sanitizing and removing the parameter size field from the cmd
> argument so that the same IOCTL may handle different parameter sizes.

Yep, seems like a good idea (if we keep this).

> 
>> +static const struct file_operations syncpt_file_fops = {
>> +	.owner = THIS_MODULE,
>> +	.release = syncpt_file_release,
>> +	.unlocked_ioctl = syncpt_file_ioctl,
>> +	.compat_ioctl = syncpt_file_ioctl,
>> +};
>> +
>> +struct host1x_syncpt *host1x_syncpt_fd_get(int fd)
>> +{
>> +	struct host1x_syncpt *sp;
>> +	struct file *file = fget(fd);
>> +
>> +	if (!file)
>> +		return ERR_PTR(-EINVAL);
>> +
>> +	if (file->f_op != &syncpt_file_fops) {
>> +		fput(file);
>> +		return ERR_PTR(-EINVAL);
>> +	}
>> +
>> +	sp = file->private_data;
>> +
>> +	host1x_syncpt_get(sp);
>> +
>> +	fput(file);
>> +
>> +	return sp;
>> +}
>> +EXPORT_SYMBOL(host1x_syncpt_fd_get);
>> +
>> +static int dev_file_open(struct inode *inode, struct file *file)
> 
> Maybe use the more specific host1x_ as prefix instead of the generic
> dev_? That might make things like stack traces more readable.

Yep.

> 
> Otherwise looks good.
> 
> Thierry
> 

thanks,
Mikko
