Return-Path: <SRS0=dOwp=CS=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2080C433E2
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Sep 2020 08:10:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A7A732087C
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Sep 2020 08:10:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="Zjb5NFyQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728970AbgIIIKi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 9 Sep 2020 04:10:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725917AbgIIIKd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 9 Sep 2020 04:10:33 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80582C061573
        for <linux-tegra@vger.kernel.org>; Wed,  9 Sep 2020 01:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=h7unpVE96s+T4Tu7Q2uq/miX9ewFXX7Oiot3T3hNf2Q=; b=Zjb5NFyQPFB0hw8s8I0pkAxd0/
        Io7h6hijX8fYtlSP0YDBsAOhNJvZQgo4f/bEIm2qKgE9URt3tmFA3oOe5/BqIGeOAS0zczhmKudxN
        GCOtAG8K8Sowljmq8JJECScYm6SFO5gSYtbgt755L8vvFATXUIfxKZ/VhQ/vPfCBojceFtMPWn++r
        UNcDexf1O0j+D4sDDynLxmaULuPCr3sHC3NM7vPhGLYNswseAnr4PhgVvjyE2t7CfxSYm/GVKGYOD
        ITd8lajLEUxJwF1lQSaFy1v/HzZbkzfoN8AhyjuZrDm3lQ7Z8rrBPTeh7nRmt+5pD/fDUtbcXtLm9
        yV7MM1gw==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1kFvBV-0002Lq-0i; Wed, 09 Sep 2020 11:10:29 +0300
Subject: Re: DRM_TEGRA_SUBMIT_BUF_WRITE_RELOC
To:     Dmitry Osipenko <digetx@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-15-mperttunen@nvidia.com>
 <54aff7f1-86b2-6bd7-1e47-2078edcf94b3@gmail.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <a734a45f-2366-8a9f-1029-c052bd03bf78@kapsi.fi>
Date:   Wed, 9 Sep 2020 11:10:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <54aff7f1-86b2-6bd7-1e47-2078edcf94b3@gmail.com>
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

On 9/9/20 2:45 AM, Dmitry Osipenko wrote:
> 05.09.2020 13:34, Mikko Perttunen пишет:
> ...
>> +/* Submission */
>> +
>> +/** Patch address of the specified mapping in the submitted gather. */
>> +#define DRM_TEGRA_SUBMIT_BUF_WRITE_RELOC		(1<<0)
> 
> Shouldn't the kernel driver be aware about what relocations need to be
> patched? Could you please explain the purpose of this flag?
> 

Sure, the kernel knows if it returned the IOVA to the user or not, so we 
could remove this flag and determine it implicitly. I don't think there 
is much harm in it though; if we have the flag an application can decide 
to ignore the iova field and just pass WRITE_RELOC always, and it's not 
really any extra code on kernel side.

Mikko
