Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12494C433E0
	for <linux-tegra@archiver.kernel.org>; Wed, 13 Jan 2021 18:56:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CA49122248
	for <linux-tegra@archiver.kernel.org>; Wed, 13 Jan 2021 18:56:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728693AbhAMS4w (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 13 Jan 2021 13:56:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728692AbhAMS4w (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 13 Jan 2021 13:56:52 -0500
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC6A4C061575
        for <linux-tegra@vger.kernel.org>; Wed, 13 Jan 2021 10:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=EkbPFiDWmzFHAIu8oihwICgsB4QuGqf1Zx3RAWAzrXQ=; b=TF2b9SO/CNHdAHE8FNtIW7s7Yg
        gaW+HHtFfXbuU1jTpOVUi+sjSZCXXioJj1DPfER0Y/SbMEzTeRC6uKRLKbAr8PGrDySVBfFr5f1bv
        1LPjkAIsRVHknYpefeTUFf10UFPE3p5NS0Gmpa7OQ77PUIYIuYHbdc+p9dcHQdDTfjGeRkBuA3YLR
        Ll4O0OjA1xAcIazaqHdnkK5M6oe41HbYwn+7mUGI7z67M+9nxpWV5FqT0V/rRMvfLN/cYH6vilfe+
        SnTZ1hACX1PC8CV2c63A0aEmDjWg5fLBYq7n1yD/ZHvXs7WNKmJnzTsA1V8Jx+gdr6ZNNgIk2RfMj
        27luJC9A==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1kzlJO-0006cz-Vu; Wed, 13 Jan 2021 20:56:07 +0200
Subject: Re: [PATCH v5 15/21] drm/tegra: Add new UAPI to header
To:     Dmitry Osipenko <digetx@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-16-mperttunen@nvidia.com>
 <a0fdac0d-88cf-6eda-6611-fca951253060@gmail.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <cc746d91-e6b2-53d8-17ff-59cbc8bb522f@kapsi.fi>
Date:   Wed, 13 Jan 2021 20:56:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <a0fdac0d-88cf-6eda-6611-fca951253060@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 1/13/21 8:14 PM, Dmitry Osipenko wrote:
> 11.01.2021 16:00, Mikko Perttunen пишет:
>> +struct drm_tegra_submit_buf {
>> +	/**
>> +	 * @mapping_id: [in]
>> +	 *
>> +	 * Identifier of the mapping to use in the submission.
>> +	 */
>> +	__u32 mapping_id;
> 
> I'm now in process of trying out the UAPI using grate drivers and this
> becomes the first obstacle.
> 
> Looks like this is not going to work well for older Tegra SoCs, in
> particular for T20, which has a small GART.
> 
> Given that the usefulness of the partial mapping feature is very
> questionable until it will be proven with a real userspace, we should
> start with a dynamic mappings that are done at a time of job submission.
> 
> DRM already should have everything necessary for creating and managing
> caches of mappings, grate kernel driver has been using drm_mm_scan for a
> long time now for that.
> 
> It should be fine to support the static mapping feature, but it should
> be done separately with the drm_mm integration, IMO.
> 
> What do think?
> 

Can you elaborate on the requirements to be able to use GART? Are there 
any other reasons this would not work on older chips?

I think we should keep CHANNEL_MAP and mapping_ids, but if e.g. for GART 
we cannot do mapping immediately at CHANNEL_MAP time, we can just treat 
it as a "registration" call for the GEM object - potentially no-op like 
direct physical addressing is. We can then do whatever is needed at 
submit time. This way we can have the best of both worlds.

Note that partial mappings are already not present in this version of 
the UAPI.

Mikko
