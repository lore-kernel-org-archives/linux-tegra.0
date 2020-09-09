Return-Path: <SRS0=dOwp=CS=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5D20C10DAA
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Sep 2020 08:20:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6C257218AC
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Sep 2020 08:20:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="YAAEtacX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728647AbgIIIUJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 9 Sep 2020 04:20:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726111AbgIIIUH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 9 Sep 2020 04:20:07 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35E9BC061573
        for <linux-tegra@vger.kernel.org>; Wed,  9 Sep 2020 01:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ty/OmNW1kqQFrBsxIIO001Crp8XTtE42WcOCYQvJ3xc=; b=YAAEtacXdcDYmk9HWzZHQBLesn
        mZgqfpXtZmT0e7bVuE+Fhe2COdJnDRmbhSu41lEzx4AKCJFhcM94cNAERnSDuPNNeBFOIFUYHSIfb
        g8NEEzD1kZn/OSEmDycfJS6e/QPWig7O8nOC3zLqpZ7vhhvwFGUYYsvVE2ApMuHLNmayzilkO6Amj
        v8uoVetyK/noJFsn9ECLLH3XcNZQszH3yzSufcLNzNZqMxccuXMwTYrsrGMuOuSVi6/G8xSYe/iSj
        +vZBhQ9VaTpBReF6Eo6orulphFW47r2+4qAqIO4MD5WPdSDNJTvTd5GEH1Gt/uGdT1XtuIhPL36EQ
        F3Zz09Eg==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1kFvKl-0007GW-33; Wed, 09 Sep 2020 11:20:03 +0300
Subject: Re: [RFC PATCH v2 17/17] WIP: drm/tegra: Implement new UAPI
To:     Dmitry Osipenko <digetx@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-18-mperttunen@nvidia.com>
 <a238707e-942b-2996-5644-71811d4cee72@gmail.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <80bfc415-a7b1-829f-3ce0-c81111ed1f19@kapsi.fi>
Date:   Wed, 9 Sep 2020 11:19:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <a238707e-942b-2996-5644-71811d4cee72@gmail.com>
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

On 9/9/20 3:47 AM, Dmitry Osipenko wrote:
> 05.09.2020 13:34, Mikko Perttunen пишет:
>> +static int submit_process_bufs(struct drm_device *drm, struct gather_bo *bo,
>> +			       struct tegra_drm_job_data *job_data,
>> +			       struct tegra_drm_channel_ctx *ctx,
>> +			       struct drm_tegra_channel_submit *args,
>> +			       struct ww_acquire_ctx *acquire_ctx)
>> +{
>> +	struct drm_tegra_submit_buf __user *user_bufs_ptr =
>> +		u64_to_user_ptr(args->bufs_ptr);
> 
> If assignment makes line too long, then factor it out.
> 
>    struct drm_tegra_submit_buf __user *user_bufs_ptr;
> 
>    user_bufs_ptr = u64_to_user_ptr(args->bufs_ptr);
> 
>> +	struct tegra_drm_mapping *mapping;
>> +	struct drm_tegra_submit_buf buf;
>> +	unsigned long copy_err;
>> +	int err;
>> +	u32 i;
>> +
>> +	job_data->used_mappings =
>> +		kcalloc(args->num_bufs, sizeof(*job_data->used_mappings), GFP_KERNEL);
> 
> The checkpatch should disallow this coding style. I'd write it as:
> 
> size_t size;
> 
> size = sizeof(*job_data->used_mappings);
> job_data->used_mappings = kcalloc(args->num_bufs, size..);

I'll make these cleaner for next version.

> 
>> +	if (!job_data->used_mappings)
>> +		return -ENOMEM;
>> +
>> +	for (i = 0; i < args->num_bufs; i++) {
>> +		copy_err = copy_from_user(&buf, user_bufs_ptr+i, sizeof(buf));
> 
> Whole array always should be copied at once. Please keep in mind that
> each copy_from_user() has a cpu-time cost, there should maximum up to 2
> copyings per job.
> 

OK. BTW, do you have some reference/numbers for this or is it based on 
grate-driver experience?

Mikko
