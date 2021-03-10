Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D3FEC433E0
	for <linux-tegra@archiver.kernel.org>; Wed, 10 Mar 2021 18:37:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F5F964F3C
	for <linux-tegra@archiver.kernel.org>; Wed, 10 Mar 2021 18:37:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231138AbhCJShX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 10 Mar 2021 13:37:23 -0500
Received: from mga12.intel.com ([192.55.52.136]:47310 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233337AbhCJShO (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 10 Mar 2021 13:37:14 -0500
IronPort-SDR: bevrzVm48kfPV2u9sQLfAdC6FQy3HHfiUvy5AOgEZjtSp3al6A6CE89K+gO8T9Ns5jldx2uzCA
 nEvN8P6RA9Sw==
X-IronPort-AV: E=McAfee;i="6000,8403,9919"; a="167811307"
X-IronPort-AV: E=Sophos;i="5.81,237,1610438400"; 
   d="scan'208";a="167811307"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2021 10:37:13 -0800
IronPort-SDR: 5o943c0kgvAX14ZxTFPwFhrVTX6enozmWA1CgGJ9MKwP5hy7hKsjslEcTQ81XP0hH3/H2ZwmeD
 kNVtaLeIv6wA==
X-IronPort-AV: E=Sophos;i="5.81,237,1610438400"; 
   d="scan'208";a="447996950"
Received: from jsglenn-mobl1.amr.corp.intel.com (HELO [10.251.2.203]) ([10.251.2.203])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2021 10:37:11 -0800
Subject: Re: [PATCH V2] ASoC: soc-core: Prevent warning if no DMI table is
 present
To:     Mark Brown <broonie@kernel.org>
Cc:     alsa-devel@alsa-project.org,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Takashi Iwai <tiwai@suse.de>, Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org,
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
 <cf03ce61-1501-e0e7-6887-d921c7d1af62@linux.intel.com>
 <20210310181611.GE28564@sirena.org.uk>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <9e1075c6-da49-d614-e7af-30242dd3d3fe@linux.intel.com>
Date:   Wed, 10 Mar 2021 12:37:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210310181611.GE28564@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


>>> Build time dependencies aren't going to help anything, arm64 (and to my
>>> understanding some future x86 systems, LynxPoint IIRC) supports both DT
>>> and ACPI and so you have kernels built with support for both.
> 
>> well, that's what I suggested initially:
>>         if (is_of_node(card->dev->fwnode))
> 
>> I used the of_node test as a proxy for 'no DMI' since I am not aware of any
>> means to detect if DMI is enabled at run-time.
> 
> Can we not fix the DMI code so it lets us check dmi_available either
> directly or with an accessor?  I don't understand why all the proposals
> are dancing around local bodges here.

something like this then (compile-tested only)?

diff --git a/drivers/firmware/dmi_scan.c b/drivers/firmware/dmi_scan.c
index d51ca0428bb8..f191a1f901ac 100644
--- a/drivers/firmware/dmi_scan.c
+++ b/drivers/firmware/dmi_scan.c
@@ -166,6 +166,7 @@ static int __init dmi_checksum(const u8 *buf, u8 len)
  static const char *dmi_ident[DMI_STRING_MAX];
  static LIST_HEAD(dmi_devices);
  int dmi_available;
+EXPORT_SYMBOL_GPL(dmi_available);

  /*
   *     Save a DMI string
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 16ba54eb8164..c7e4600b2dd4 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1574,7 +1574,7 @@ int snd_soc_set_dmi_name(struct snd_soc_card 
*card, const char *flavour)
         if (card->long_name)
                 return 0; /* long name already set by driver or from DMI */

-       if (!is_acpi_device_node(card->dev->fwnode))
+       if (!dmi_available)
                 return 0;

         /* make up dmi long name as: vendor-product-version-board */



