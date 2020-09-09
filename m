Return-Path: <SRS0=dOwp=CS=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF460C43461
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Sep 2020 08:11:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 92DB120757
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Sep 2020 08:11:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="bApV+Th1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729135AbgIIILh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 9 Sep 2020 04:11:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728971AbgIIILf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 9 Sep 2020 04:11:35 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40FDBC061573
        for <linux-tegra@vger.kernel.org>; Wed,  9 Sep 2020 01:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=vUmzQQRqobyqrwRy6tA9315+Sg0mrSxJ+NZ1ELHv0yw=; b=bApV+Th1hY1NtsLvxwyxdqL/6P
        ynSUl0SGVwP0UMbQjlZCs6BOzPSWH7BxKjynlDJZZ/qqrLIsOs0autVqBzwco5JeBWN2/W2lVeu15
        5OiDTK14y5KuBp+vD1O7dJNcUTj3AqHvbndOAPQhstn8Deu3R4A+KlgaPeFDU8v80/3DuwJP5S9+Y
        zGjWCplxS1fGUPFLh+dhC9/450rOv/azlVZDI2IEQHeYRJV+y98RoDQR3qZzWLFIVOJ25Ec1NdyHx
        56EcSLOHpaakBmAOI1juGBNElt3rmvszpX/GpdbBZ1StMANTFZpV0vAsB9OIzGXlM1I3sSp1LD6nh
        K873YhyA==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1kFvCW-0002rO-3c; Wed, 09 Sep 2020 11:11:32 +0300
Subject: Re: [RFC PATCH v2 15/17] drm/tegra: Add power_on/power_off engine
 callbacks
To:     Dmitry Osipenko <digetx@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-16-mperttunen@nvidia.com>
 <2ddaf2ef-e232-7d44-0b08-e190f20297b2@gmail.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <1b6676a2-0de9-e2ef-61ce-ce8e5ad83e1a@kapsi.fi>
Date:   Wed, 9 Sep 2020 11:11:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <2ddaf2ef-e232-7d44-0b08-e190f20297b2@gmail.com>
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

On 9/9/20 3:16 AM, Dmitry Osipenko wrote:
> 05.09.2020 13:34, Mikko Perttunen пишет:
> ...
>> +static int vic_power_on(struct tegra_drm_client *client)
>> +{
>> +	struct vic *vic = to_vic(client);
>> +
>> +	return pm_runtime_get_sync(vic->dev);
> 
> Please keep in mind that RPM needs to be put in a case of error.
> 
> Maybe it would be better if driver-core could take care of
> resuming/suspending client's RPM instead of putting that burden on each
> client individually?
> 

Good point, we should be able to just make RPM calls from the core code. 
I'll change it so (and fix the refcounting).

Mikko
