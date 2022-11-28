Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABB93C43217
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Nov 2022 09:47:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229883AbiK1Jr0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 28 Nov 2022 04:47:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229880AbiK1JrY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Nov 2022 04:47:24 -0500
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72E1E19034
        for <linux-tegra@vger.kernel.org>; Mon, 28 Nov 2022 01:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
        s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=EAk2EVd/lLPMycNtvKh59RkdnThOMLGnRSGD6vVdulQ=; b=1W5HiapUqcO0KMMSRil/rzKoPA
        3b0z3ld08u77wn1VOemFPvUuimbMPMAL0TyeDG47lRAkpWQkq0vjO77N87wC0crGFNAynCgo0ahFU
        ofszNFbXVYcJB+KyJE+5hzV6gRHZ/Uy/ptqopwIOQGS+PK0+GE9sELM+YjgWkohoZM2VRaMkVoBNj
        5ZJnd43I1kKjZ8xLjyOkbTk1f7F6ljbYZEQjEa25mcFzxlqT5bxx0RT07/kUYqmOZ3id3FNXgktjZ
        v4cgGADkSaKwuwgy/ZEDrnaiLn20p/zqx+HtfJ+VmrmSF3wDxu+vzDGPRpGeweWIXDxm6gZe4kwSj
        4un725kA==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <cyndis@kapsi.fi>)
        id 1ozajO-0078lK-Dy; Mon, 28 Nov 2022 11:47:18 +0200
Message-ID: <fcad7a5f-f2f7-1fa4-9f44-cae692e38764@kapsi.fi>
Date:   Mon, 28 Nov 2022 11:47:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v2 resend 1/2] gpu: host1x: fix potential double free if
 IOMMU is disabled
Content-Language: en-US
To:     Yang Yingliang <yangyingliang@huawei.com>,
        linux-tegra@vger.kernel.org, thierry.reding@gmail.com,
        airlied@gmail.com, daniel@ffwll.ch, mperttunen@nvidia.com
References: <20221126073315.365567-1-yangyingliang@huawei.com>
 <20221126073315.365567-2-yangyingliang@huawei.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
In-Reply-To: <20221126073315.365567-2-yangyingliang@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 11/26/22 09:33, Yang Yingliang wrote:
> If context device has no IOMMU, the 'cdl->devs' is freed in
> error path, but host1x_memory_context_list_init() doesn't
> return an error code, so the module can be loaded successfully,
> when it's unloading, the host1x_memory_context_list_free() is
> called in host1x_remove(), it will cause double free. Set the
> 'cdl->devs' to NULL after freeing it to avoid double free.
> 
> Fixes: 8aa5bcb61612 ("gpu: host1x: Add context device management code")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>   drivers/gpu/host1x/context.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/host1x/context.c b/drivers/gpu/host1x/context.c
> index b08cf11f9a66..291f34562e2e 100644
> --- a/drivers/gpu/host1x/context.c
> +++ b/drivers/gpu/host1x/context.c
> @@ -87,6 +87,7 @@ int host1x_memory_context_list_init(struct host1x *host1x)
>   		device_del(&cdl->devs[i].dev);
>   
>   	kfree(cdl->devs);
> +	cdl->devs = NULL;
>   	cdl->len = 0;
>   
>   	return err;

Thanks!

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
