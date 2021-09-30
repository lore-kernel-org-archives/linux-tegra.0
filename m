Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B878C433F5
	for <linux-tegra@archiver.kernel.org>; Thu, 30 Sep 2021 16:14:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 410BA613CD
	for <linux-tegra@archiver.kernel.org>; Thu, 30 Sep 2021 16:14:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349330AbhI3QPk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 30 Sep 2021 12:15:40 -0400
Received: from mga03.intel.com ([134.134.136.65]:53611 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1349136AbhI3QPd (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 30 Sep 2021 12:15:33 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10123"; a="225301309"
X-IronPort-AV: E=Sophos;i="5.85,336,1624345200"; 
   d="scan'208";a="225301309"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2021 09:13:50 -0700
X-IronPort-AV: E=Sophos;i="5.85,336,1624345200"; 
   d="scan'208";a="521260621"
Received: from lcalx-mobl1.amr.corp.intel.com (HELO [10.212.88.180]) ([10.212.88.180])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2021 09:13:48 -0700
Subject: Re: [PATCH 01/13] ASoC: soc-pcm: Don't reconnect an already active BE
To:     Sameer Pujar <spujar@nvidia.com>,
        =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
        broonie@kernel.org, lgirdwood@gmail.com, robh+dt@kernel.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        catalin.marinas@arm.com, will@kernel.org, perex@perex.cz,
        tiwai@suse.com, kuninori.morimoto.gx@renesas.com
Cc:     devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        sharadg@nvidia.com, linux-arm-kernel@lists.infradead.org
References: <1630056839-6562-1-git-send-email-spujar@nvidia.com>
 <1630056839-6562-2-git-send-email-spujar@nvidia.com>
 <be6290d1-0682-3d93-98a6-ad0be3ca42c1@linux.intel.com>
 <70422e52-89d2-d926-b3f9-be59780d464e@nvidia.com>
 <2f96f1aa-74f2-8ea8-3f43-e4da97400fde@linux.intel.com>
 <647b1d54-dbd7-ce91-291d-d677ce908398@linux.intel.com>
 <94861852-29ba-be9e-8c63-a70a01550b3a@nvidia.com>
 <b68d3c04-07b5-966c-5cd3-8cc715cc470e@linux.intel.com>
 <78e175f3-29cb-f059-427f-51210278c42a@nvidia.com>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <09bbf14a-a5a0-23c6-d557-66a3af1ac227@linux.intel.com>
Date:   Thu, 30 Sep 2021 11:13:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <78e175f3-29cb-f059-427f-51210278c42a@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


>>>> Can you describe the sequence that you used to start them? That may be
>>>> useful to understand the criteria you used?
>>> I have something like this:
>>>
>>> FE1  --> Crossbar -> Mixer Input1    |
>>> FE2  --> Crossbar -> Mixer Input2    |
>>> ...                                  | --> Mixer Output -->
>>> ... |
>>> FE10 --> Crossbar -> Mixer Input10   |
>>>
>>> All these FEs are started one after the other. This is an example of
>>> 10x1. Similarly we can have 2x1, 3x1 etc.,
>>> In our system, the crossbar [0] and mixer [1] are separate ASoC
>>> components. Basically audio paths consist of a group of ASoC components
>>> which are connected back to back.
>> Not following. Can you explain how starting FE1 does not change the
>> state of the mixer output then?
>>
>> Or is each 'Crossbar' instance a full-blown BE? In that case you have a
>> 1:1 mapping between FE and BE, a *really* simple topology...
> 
> Yes 'Crossbar' exposes multiple ports and it is 1:1 mapping with FE.
> Starting FE1 does configure mixer output.

Ah ok, now I get the difference with the N:1 topology we used.
Thanks for explaining this.

>>> In the interim, may be we can have following patch to keep both systems
>>> working and keep the discussion going to address the oustanding
>>> requirements/issues?
>>>
>>> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
>>> index ab25f99..0fbab50 100644
>>> --- a/sound/soc/soc-pcm.c
>>> +++ b/sound/soc/soc-pcm.c
>>> @@ -1395,7 +1395,13 @@ static int dpcm_add_paths(struct
>>> snd_soc_pcm_runtime *fe, int stream,
>>>                  if (!fe->dpcm[stream].runtime && !fe->fe_compr)
>>>                          continue;
>>>
>>> -               if ((be->dpcm[stream].state !=
>>> SND_SOC_DPCM_STATE_NEW) &&
>>> +               /*
>>> +                * Filter for systems with 'component_chaining' enabled.
>>> +                * This helps to avoid unnecessary re-configuration
>>> of an
>>> +                * already active BE on such systems.
>>> +                */
>>> +               if (fe->card->component_chaining &&
>>> +                   (be->dpcm[stream].state !=
>>> SND_SOC_DPCM_STATE_NEW) &&
>>>                      (be->dpcm[stream].state !=
>>> SND_SOC_DPCM_STATE_CLOSE))
>>>                          continue;
>> that wouldn't work. We need to support the STOP and START cases as well.
>>
> 
> I meant with flag 'fe->card->component_chaining', which is currently
> used by Tegra audio only.

Ah yes, this may be a temporary solution that gets us both back to a
'working solution'. Let me give it a try.
Good discussion, thanks!
-Pierre
