Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5233C4332F
	for <linux-tegra@archiver.kernel.org>; Sat, 26 Nov 2022 07:31:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229551AbiKZHbs (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 26 Nov 2022 02:31:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbiKZHbr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 26 Nov 2022 02:31:47 -0500
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 346931BEA2
        for <linux-tegra@vger.kernel.org>; Fri, 25 Nov 2022 23:31:45 -0800 (PST)
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.57])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NK3Lh0trpzRpWM;
        Sat, 26 Nov 2022 15:31:08 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 26 Nov 2022 15:31:42 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 26 Nov 2022 15:31:41 +0800
Subject: Re: [PATCH v2 0/2] gpu: host1x: possible double free and memory leak
To:     <linux-tegra@vger.kernel.org>, <thierry.reding@gmail.com>,
        <airlied@gmail.com>, <daniel@ffwll.ch>, <mperttunen@nvidia.com>,
        <cyndis@kapsi.fi>, <yangyingliang@huawei.com>
References: <20221126044822.141269-1-yangyingliang@huawei.com>
From:   Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <745a7d39-9c39-71aa-ad63-82f396d2b5d0@huawei.com>
Date:   Sat, 26 Nov 2022 15:31:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20221126044822.141269-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Please ignore this patchset, I forget commit my latest code to my tree, 
and sent old version patches.

On 2022/11/26 12:48, Yang Yingliang wrote:
> This patchset fix two possible problems in the error path in
> host1x_memory_context_list_init().
>
> v1 -> v2:
>    patch #1 don't return error code, if IOMMU is disabled.
>    patch #2 make error handling code more clean.
>
>    Put the two patches in one patchset.
>    http://patchwork.ozlabs.org/project/linux-tegra/patch/20221028130300.1133520-1-yangyingliang@huawei.com/
>    http://patchwork.ozlabs.org/project/linux-tegra/patch/20221124080559.3592650-1-yangyingliang@huawei.com/
>
> Yang Yingliang (2):
>    gpu: host1x: fix potential double free if IOMMU is disabled
>    gpu: host1x: fix memory leak of device names
>
>   drivers/gpu/host1x/context.c | 24 ++++++++++++++++--------
>   1 file changed, 16 insertions(+), 8 deletions(-)
>
