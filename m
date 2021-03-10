Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 858E1C433DB
	for <linux-tegra@archiver.kernel.org>; Wed, 10 Mar 2021 15:45:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 58F3864F8B
	for <linux-tegra@archiver.kernel.org>; Wed, 10 Mar 2021 15:45:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231718AbhCJPod (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 10 Mar 2021 10:44:33 -0500
Received: from mga09.intel.com ([134.134.136.24]:25407 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230270AbhCJPoK (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 10 Mar 2021 10:44:10 -0500
IronPort-SDR: oSoGSbA+W96+8s8B542pLSOlE7VsY2I1zz73HV7b2M+Q8iY/5j6umpvW+pI+ioUoGMKJk/aoQO
 7dZkqo+4mxjg==
X-IronPort-AV: E=McAfee;i="6000,8403,9919"; a="188589386"
X-IronPort-AV: E=Sophos;i="5.81,237,1610438400"; 
   d="scan'208";a="188589386"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2021 07:44:10 -0800
IronPort-SDR: qQdbsx34tWrJf+GmQW+EKuGyeK/eQQYhdUGeCwXB+UxTZeY7fC0J3xMO6Ff8cfkpnszZbGYf04
 TQ4s6vwjFdAw==
X-IronPort-AV: E=Sophos;i="5.81,237,1610438400"; 
   d="scan'208";a="403721850"
Received: from huiyingw-mobl.amr.corp.intel.com (HELO [10.212.214.84]) ([10.212.214.84])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2021 07:44:08 -0800
Subject: Re: [PATCH V2] ASoC: soc-core: Prevent warning if no DMI table is
 present
To:     Mark Brown <broonie@kernel.org>
Cc:     alsa-devel@alsa-project.org,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
        linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>,
        Bard liao <yung-chuan.liao@linux.intel.com>
References: <20210303115526.419458-1-jonathanh@nvidia.com>
 <91480f92-a3f5-e71f-acdc-ea74488ab0a1@linux.intel.com>
 <20210310133534.GD4746@sirena.org.uk>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <6a2352e6-f2b7-def1-de58-52fbeb7846e5@linux.intel.com>
Date:   Wed, 10 Mar 2021 09:44:07 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210310133534.GD4746@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 3/10/21 7:35 AM, Mark Brown wrote:
> On Tue, Mar 09, 2021 at 01:41:45PM -0600, Pierre-Louis Bossart wrote:
> 
>> The problem is that the cards are platform devices created by the parent
>> (which itself may be a PCI or ACPI device) and have nothing to do with ACPI.
> 
>> Could we flip the logic and instead explicitly detect OF devices? That
>> restores functionality for us.
> 
> Just change it to a system level check for ACPI, checking for OF would
> leave problems for board files or any other alternative firmware
> interfaces.

did you mean if (!IS_ENABLED(CONFIG_ACPI)) ?
