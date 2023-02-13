Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16520C636CC
	for <linux-tegra@archiver.kernel.org>; Mon, 13 Feb 2023 13:16:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230163AbjBMNQq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 13 Feb 2023 08:16:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229599AbjBMNQo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 13 Feb 2023 08:16:44 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F5381B541;
        Mon, 13 Feb 2023 05:16:08 -0800 (PST)
Received: from [192.168.0.192] (unknown [194.146.248.75])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: andrzej.p)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id AC3A1660213F;
        Mon, 13 Feb 2023 13:16:06 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1676294166;
        bh=jMBOjH6pRCVn0ggo6g9jbKywsnY6hk/WSYnGy9qbmwQ=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=UZE+4xmu5A+2y9m2RMoBBvbndp1uHy8fEjhBiLTkx/wiyABuFOpoZbDosRr0eTm0k
         M8qPazOwELrfzP6MleMXQHirU7F0DVF9GtCdPMTmt/yWJ0O+U4PRbxXIqDveCE2Aox
         k9KDTno/iuLmiU0E/xbvdatGSUXZSwFeFiki1+ONON1oR6Z1k0k/GMrg6rOjJnmy+6
         BZ9FLZYr4vRWoR80EhWCCOnZbz9r/5UrHec5Vaj6tHo5Gj25HKOMrfz+mcARnYs14P
         IKUDSk36MbTZJkRzPBj1/yq3hW2orslavmHMWubbOnWbrAXu3R+VFgEYdAEHIpLXos
         9gdMY2eS5EgiA==
Message-ID: <3d1f6fb3-0fcf-7aff-3676-4dfb6aa60d2a@collabora.com>
Date:   Mon, 13 Feb 2023 14:16:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH V3 2/2] usb: gadget: u_ether: Don't warn in
 gether_setup_name_default()
To:     Jon Hunter <jonathanh@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20230209125319.18589-1-jonathanh@nvidia.com>
 <20230209125319.18589-2-jonathanh@nvidia.com>
Content-Language: en-US
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20230209125319.18589-2-jonathanh@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

W dniu 9.02.2023 o 13:53, Jon Hunter pisze:
> The function gether_setup_name_default() is called by various USB
> ethernet gadget drivers. Calling this function will select a random
> host and device MAC addresses. A properly working driver should be
> silent and not warn the user about default MAC addresses selection.
> Given that the MAC addresses are also printed when the function
> gether_register_netdev() is called, remove these unnecessary warnings.
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

> ---
> V3: Updated patch to remove the prints completely.
> V2: Changed print to debug instead of info.
> 
>   drivers/usb/gadget/function/u_ether.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/u_ether.c b/drivers/usb/gadget/function/u_ether.c
> index 740331882e8d..953d936fbae6 100644
> --- a/drivers/usb/gadget/function/u_ether.c
> +++ b/drivers/usb/gadget/function/u_ether.c
> @@ -811,13 +811,11 @@ struct net_device *gether_setup_name_default(const char *netname)
>   	snprintf(net->name, sizeof(net->name), "%s%%d", netname);
>   
>   	eth_random_addr(dev->dev_mac);
> -	pr_warn("using random %s ethernet address\n", "self");
>   
>   	/* by default we always have a random MAC address */
>   	net->addr_assign_type = NET_ADDR_RANDOM;
>   
>   	eth_random_addr(dev->host_mac);
> -	pr_warn("using random %s ethernet address\n", "host");
>   
>   	net->netdev_ops = &eth_netdev_ops;
>   

