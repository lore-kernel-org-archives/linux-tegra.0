Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 373A8C433DB
	for <linux-tegra@archiver.kernel.org>; Wed, 10 Mar 2021 17:51:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F262364F88
	for <linux-tegra@archiver.kernel.org>; Wed, 10 Mar 2021 17:51:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230477AbhCJRup (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 10 Mar 2021 12:50:45 -0500
Received: from mga18.intel.com ([134.134.136.126]:6363 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233103AbhCJRuS (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 10 Mar 2021 12:50:18 -0500
IronPort-SDR: 5Qcxn6PBwK2fhNb15xo3SK4pCxcdHsyOYWt0KiCjX1d/B1vt1+uCbtcz/BLdBQON3fRUbXVE5W
 r+xfMaePNIVw==
X-IronPort-AV: E=McAfee;i="6000,8403,9919"; a="176120633"
X-IronPort-AV: E=Sophos;i="5.81,237,1610438400"; 
   d="scan'208";a="176120633"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2021 09:50:17 -0800
IronPort-SDR: b2evOkNO/0UV6Pdj15EO+j1vjXvRxRE4shFbKJsY9eS2FoRoq5gKfFz4l6WnU3f+scbmfAzhk1
 loVURsv0Rv6w==
X-IronPort-AV: E=Sophos;i="5.81,237,1610438400"; 
   d="scan'208";a="403766454"
Received: from huiyingw-mobl.amr.corp.intel.com (HELO [10.212.214.84]) ([10.212.214.84])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2021 09:50:15 -0800
Subject: Re: [PATCH V2] ASoC: soc-core: Prevent warning if no DMI table is
 present
To:     Mark Brown <broonie@kernel.org>
Cc:     alsa-devel@alsa-project.org,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Takashi Iwai <tiwai@suse.de>, linux-kernel@vger.kernel.org,
        Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
        linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>,
        Bard liao <yung-chuan.liao@linux.intel.com>
References: <20210303115526.419458-1-jonathanh@nvidia.com>
 <91480f92-a3f5-e71f-acdc-ea74488ab0a1@linux.intel.com>
 <20210310133534.GD4746@sirena.org.uk>
 <6a2352e6-f2b7-def1-de58-52fbeb7846e5@linux.intel.com>
 <20210310161814.GA28564@sirena.org.uk> <s5hzgzbvube.wl-tiwai@suse.de>
 <9b073d01-f2fe-a99b-e53c-4a0b3f95ca05@linux.intel.com>
 <20210310165235.GD28564@sirena.org.uk>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <cf03ce61-1501-e0e7-6887-d921c7d1af62@linux.intel.com>
Date:   Wed, 10 Mar 2021 11:50:13 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210310165235.GD28564@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 3/10/21 10:52 AM, Mark Brown wrote:
> On Wed, Mar 10, 2021 at 10:41:18AM -0600, Pierre-Louis Bossart wrote:
> 
>> would this work?
> 
>> if (!IS_ENABLED(CONFIG_DMI))
>>      return 0;
> 
> Build time dependencies aren't going to help anything, arm64 (and to my
> understanding some future x86 systems, LynxPoint IIRC) supports both DT
> and ACPI and so you have kernels built with support for both.

well, that's what I suggested initially:
        if (is_of_node(card->dev->fwnode))

I used the of_node test as a proxy for 'no DMI' since I am not aware of 
any means to detect if DMI is enabled at run-time.

