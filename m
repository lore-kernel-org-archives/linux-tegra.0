Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 432DFC433DB
	for <linux-tegra@archiver.kernel.org>; Sat,  6 Feb 2021 13:41:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 11B3C64D9D
	for <linux-tegra@archiver.kernel.org>; Sat,  6 Feb 2021 13:41:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbhBFNlA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 6 Feb 2021 08:41:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbhBFNlA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 6 Feb 2021 08:41:00 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42AABC06174A;
        Sat,  6 Feb 2021 05:40:19 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: gtucker)
        with ESMTPSA id BC0CA1F41177
Subject: Re: [PATCH RESEND v2 4/5] iommu/tegra-smmu: Rework
 tegra_smmu_probe_device()
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     will@kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
        jonathanh@nvidia.com, vdumpa@nvidia.com, thierry.reding@gmail.com,
        joro@8bytes.org, kernel@collabora.com,
        Dmitry Osipenko <digetx@gmail.com>,
        "kernelci-results@groups.io" <kernelci-results@groups.io>
References: <20201125101013.14953-1-nicoleotsuka@gmail.com>
 <20201125101013.14953-5-nicoleotsuka@gmail.com>
 <46a96cf9-91cc-2ad4-702a-e95ba7200375@collabora.com>
 <20210205052422.GA11329@Asurada-Nvidia>
 <20210205094556.GA32677@Asurada-Nvidia>
From:   Guillaume Tucker <guillaume.tucker@collabora.com>
Message-ID: <f45c94b4-2949-4eac-5944-85d43a8afef5@collabora.com>
Date:   Sat, 6 Feb 2021 13:40:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210205094556.GA32677@Asurada-Nvidia>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 05/02/2021 09:45, Nicolin Chen wrote:
> Hi Guillaume,
> 
> On Thu, Feb 04, 2021 at 09:24:23PM -0800, Nicolin Chen wrote:
>>> Please let us know if you need any help debugging this issue or
>>> to try a fix on this platform.
>>
>> Yes, I don't have any Tegra124 platform to run. It'd be very nice
>> if you can run some debugging patch (I can provide you) and a fix
>> after I root cause the issue.
> 
> Would it be possible for you to run with the given debugging patch?
> 
> It'd be nicer if I can get both logs of the vanilla kernel (failing)
> and the commit-reverted version (passing), each applying this patch.

Sure, I've run 3 jobs:

* v5.11-rc6 as a reference, to see the original issue:
  https://lava.collabora.co.uk/scheduler/job/3187848

* + your debug patch:
  https://lava.collabora.co.uk/scheduler/job/3187849

* + the "breaking" commit reverted, passing the tests:
  https://lava.collabora.co.uk/scheduler/job/3187851


You can see the history of the test branch I'm using here, with
the 3 revisions mentioned above:

  https://gitlab.collabora.com/gtucker/linux/-/commits/linux-5.11-rc6-nyan-big-drm-read/


Hope that helps,
Guillaume
