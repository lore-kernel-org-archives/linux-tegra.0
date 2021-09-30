Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3D2BC433F5
	for <linux-tegra@archiver.kernel.org>; Thu, 30 Sep 2021 19:02:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 92298619E7
	for <linux-tegra@archiver.kernel.org>; Thu, 30 Sep 2021 19:02:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344973AbhI3TEN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 30 Sep 2021 15:04:13 -0400
Received: from mga14.intel.com ([192.55.52.115]:4234 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1345619AbhI3TDK (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 30 Sep 2021 15:03:10 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10123"; a="224919968"
X-IronPort-AV: E=Sophos;i="5.85,336,1624345200"; 
   d="scan'208";a="224919968"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2021 12:01:03 -0700
X-IronPort-AV: E=Sophos;i="5.85,336,1624345200"; 
   d="scan'208";a="521314581"
Received: from lcalx-mobl1.amr.corp.intel.com (HELO [10.212.88.180]) ([10.212.88.180])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2021 12:01:01 -0700
Subject: Re: [PATCH 01/13] ASoC: soc-pcm: Don't reconnect an already active BE
To:     Sameer Pujar <spujar@nvidia.com>, broonie@kernel.org,
        lgirdwood@gmail.com, robh+dt@kernel.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, catalin.marinas@arm.com, will@kernel.org,
        perex@perex.cz, tiwai@suse.com, kuninori.morimoto.gx@renesas.com
Cc:     devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org, sharadg@nvidia.com,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <1630056839-6562-1-git-send-email-spujar@nvidia.com>
 <1630056839-6562-2-git-send-email-spujar@nvidia.com>
 <be6290d1-0682-3d93-98a6-ad0be3ca42c1@linux.intel.com>
 <70422e52-89d2-d926-b3f9-be59780d464e@nvidia.com>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <40f098c8-b9e3-8da6-849a-eb9a39fefdb0@linux.intel.com>
Date:   Thu, 30 Sep 2021 14:00:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <70422e52-89d2-d926-b3f9-be59780d464e@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


> 1. The original issue at my end was not just a configuration redundancy.
> I realize now that with more stream addition following error print is seen.
>    "ASoC: too many users playback at open 4"
> 
>    This is because the max DPCM users is capped at 8. Increasing this
> may help (need to see what number is better), but does not address the
> redundancy problem.
Going back to this DPCM_MAX_BE_USERS definition, it seems rather
arbitrary and not so useful indeed.

	/* first time the dpcm is open ? */
	if (be->dpcm[stream].users == DPCM_MAX_BE_USERS) {
		dev_err(be->dev, "ASoC: too many users %s at open %d\n",
			stream ? "capture" : "playback",
			be->dpcm[stream].state);
		continue;
	}

The comment is no longer aligned with the code, wondering if this is a
feature or a bug. There's no reason to arbitrarily restrict the number
of users of a BE, or the check would need to use platform-specific
information such as the number of inputs/outputs supported by a mixer/demux.

Maybe Morimoto-san can comment since this was added in:

1db19c151819 ('ASoC: soc-pcm: fixup dpcm_be_dai_startup() user count')

We're not done with soc-pcm.c cleanups :-)
