Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF7BEC433F5
	for <linux-tegra@archiver.kernel.org>; Sun, 17 Apr 2022 17:45:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234639AbiDQRsK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 17 Apr 2022 13:48:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234636AbiDQRsJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 17 Apr 2022 13:48:09 -0400
Received: from mxout04.lancloud.ru (mxout04.lancloud.ru [45.84.86.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 891241902D;
        Sun, 17 Apr 2022 10:45:29 -0700 (PDT)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru 4994C20A0463
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH] usb: gadget: tegra-xudc: clean up comments
To:     Tom Rix <trix@redhat.com>, <balbi@kernel.org>,
        <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <waynec@nvidia.com>,
        <rikard.falkeborn@gmail.com>, <zhangqilong3@huawei.com>,
        <jakobkoschel@gmail.com>
CC:     <linux-usb@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20220416223921.2881719-1-trix@redhat.com>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <00d48c81-f289-16db-2e67-8f67468232cb@omp.ru>
Date:   Sun, 17 Apr 2022 20:45:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220416223921.2881719-1-trix@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hello!

On 4/17/22 1:39 AM, Tom Rix wrote:

> Spelling replacements
> cancelled to canceled

  This one was actually correct! :-)

> endpiont to endpoint
> Compliance to Compliance

  You meant "Compliacne to Compliance"?

> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/usb/gadget/udc/tegra-xudc.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
> index d9c406bdb680..0aaf01e1551f 100644
> --- a/drivers/usb/gadget/udc/tegra-xudc.c
> +++ b/drivers/usb/gadget/udc/tegra-xudc.c
[...]
> @@ -3423,7 +3423,7 @@ static void tegra_xudc_device_params_init(struct tegra_xudc *xudc)
>  	}
>  
>  	/*
> -	 * Compliacne suite appears to be violating polling LFPS tBurst max
> +	 * Compliance suite appears to be violating polling LFPS tBurst max
>  	 * of 1.4us.  Send 1.45us instead.
>  	 */
>  	val = xudc_readl(xudc, SSPX_CORE_CNT32);
> 

MBR, Sergey
