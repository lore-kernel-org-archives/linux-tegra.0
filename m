Return-Path: <SRS0=dOwp=CS=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E783EC43461
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Sep 2020 08:27:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AB02221532
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Sep 2020 08:27:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="yyEttu/u"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725984AbgIII1C (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 9 Sep 2020 04:27:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725863AbgIII1B (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 9 Sep 2020 04:27:01 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73DA8C061573
        for <linux-tegra@vger.kernel.org>; Wed,  9 Sep 2020 01:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ahGisM3uLbI4xc5gHDD0bpaFeXKzpMxMMpbEoXOWZXw=; b=yyEttu/uiry6brGC8WGbjMxRgN
        Mrm4gkc4+9YCQW+WWjZfvVn40vFE7xAHgdcVcqZqxhbdzPrB8vTUSjXMGAqoAHccbTgh1L7bw0UDy
        ImcsRG4ebSFtLMUg29Boysq/K4ZbANxxsU/73VIOFqjVc1AqAo4AdwShBqcJ4z/Xzpu96CE96VMtT
        XlzTHg8Hexde0sAIuVVcyCCSwySaApXWJ35+1RxoPhXIdhUNvnkh2gDUjlaMweTNUz9jrLjcX7hn/
        +CB1oCIiW2CGoVHN3Xca4Dub4inWV7vJ9h4llp8XZmKA9l6EBz6S9i0G+sXZMe9IcfQOXEerK2G8p
        8rzy0q/g==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1kFvRS-00025A-4q; Wed, 09 Sep 2020 11:26:58 +0300
Subject: Re: [RFC PATCH v2 17/17] WIP: drm/tegra: Implement new UAPI
To:     Dmitry Osipenko <digetx@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-18-mperttunen@nvidia.com>
 <172f940f-af60-8f8a-6c76-4ff89accd8c5@gmail.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <a2606037-74fb-21e7-3318-9403da1729c6@kapsi.fi>
Date:   Wed, 9 Sep 2020 11:26:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <172f940f-af60-8f8a-6c76-4ff89accd8c5@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.250.171.65
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 9/9/20 5:06 AM, Dmitry Osipenko wrote:
> 05.09.2020 13:34, Mikko Perttunen пишет:
>> +int tegra_drm_ioctl_channel_open(struct drm_device *drm, void *data,
>> +				 struct drm_file *file)
>> +{
>> +	struct tegra_drm_file *fpriv = file->driver_priv;
>> +	struct tegra_drm *tegra = drm->dev_private;
>> +	struct drm_tegra_channel_open *args = data;
>> +	struct tegra_drm_client *client = NULL;
>> +	struct tegra_drm_channel_ctx *ctx;
>> +	int err;
>> +
>> +	if (args->flags || args->reserved[0] || args->reserved[1])
>> +		return -EINVAL;
>> +
>> +	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
>> +	if (!ctx)
>> +		return -ENOMEM;
>> +
>> +	err = -ENODEV;
>> +	list_for_each_entry(client, &tegra->clients, list) {
>> +		if (client->base.class == args->host1x_class) {
>> +			err = 0;
>> +			break;
>> +		}
>> +	}
>> +	if (err)
>> +		goto free_ctx;
>> +
>> +	if (client->shared_channel) {
>> +		ctx->channel = host1x_channel_get(client->shared_channel);
>> +	} else {
>> +		ctx->channel = host1x_channel_request(&client->base);
>> +		if (!ctx->channel) {
>> +			err = -EBUSY;
>> +			goto free_ctx;
>> +		}
>> +	}
>> +
>> +	err = xa_alloc(&fpriv->contexts, &args->channel_ctx, ctx,
>> +		       XA_LIMIT(1, U32_MAX), GFP_KERNEL);
>> +	if (err < 0) {
>> +		mutex_unlock(&fpriv->lock);
> 
> Looks like the lock was never taken.

Thanks, will fix.

> 
>> +		goto put_channel;
>> +	}
>> +
>> +	ctx->client = client;
>> +	xa_init_flags(&ctx->mappings, XA_FLAGS_ALLOC);
> 
> Why not XA_FLAGS_ALLOC1?
> 

Will fix as well.

Mikko
