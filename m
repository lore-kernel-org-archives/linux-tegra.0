Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73421C433FE
	for <linux-tegra@archiver.kernel.org>; Wed, 29 Sep 2021 15:30:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 56BB06147F
	for <linux-tegra@archiver.kernel.org>; Wed, 29 Sep 2021 15:30:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345323AbhI2PcD (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 29 Sep 2021 11:32:03 -0400
Received: from mga02.intel.com ([134.134.136.20]:42002 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1345362AbhI2Pb5 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 29 Sep 2021 11:31:57 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10122"; a="212221484"
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200"; 
   d="scan'208";a="212221484"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2021 08:30:11 -0700
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200"; 
   d="scan'208";a="588091592"
Received: from ibarchen-mobl.amr.corp.intel.com (HELO [10.209.150.234]) ([10.209.150.234])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2021 08:30:09 -0700
Subject: Re: [PATCH 01/13] ASoC: soc-pcm: Don't reconnect an already active BE
To:     =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
        Sameer Pujar <spujar@nvidia.com>, broonie@kernel.org,
        lgirdwood@gmail.com, robh+dt@kernel.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, catalin.marinas@arm.com, will@kernel.org,
        perex@perex.cz, tiwai@suse.com, kuninori.morimoto.gx@renesas.com
Cc:     devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        sharadg@nvidia.com, linux-arm-kernel@lists.infradead.org
References: <1630056839-6562-1-git-send-email-spujar@nvidia.com>
 <1630056839-6562-2-git-send-email-spujar@nvidia.com>
 <be6290d1-0682-3d93-98a6-ad0be3ca42c1@linux.intel.com>
 <70422e52-89d2-d926-b3f9-be59780d464e@nvidia.com>
 <2f96f1aa-74f2-8ea8-3f43-e4da97400fde@linux.intel.com>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <647b1d54-dbd7-ce91-291d-d677ce908398@linux.intel.com>
Date:   Wed, 29 Sep 2021 09:52:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <2f96f1aa-74f2-8ea8-3f43-e4da97400fde@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org




>>> But in addition we'd need to agree on what an 'active BE' is. Why can't
>>> we connect a second stream while the first one is already in HW_PARAMS
>>> or PAUSED or STOP? It's perfectly legal in ALSA/ASoC to have multiple
>>> HW_PARAMS calls, and when we reach STOP we have to do a prepare again.
>>>
>>> And more fundamentally, the ability to add a second FE on a 'active' BE
>>> in START state is a basic requirement for a mixer, e.g. to play a
>>> notification on one FE while listening to music on another. What needs
>>> to happen is only to make sure that the FE and BE are compatible in
>>> terms of HW_PARAMS and not sending a second TRIGGER_STOP, only checking
>>> the BE NEW or CLOSE state is way too restrictive.
>>
>> Sorry for the trouble to your system.
>>
>> Idea was to avoid reconfiguration of the same BE DAI again, but not to
>> stop the provision to add a subsequent FE. In fact I had tested mixing
>> of streams coming from 10 different FEs.

Can you describe the sequence that you used to start them? That may be
useful to understand the criteria you used?

>> In your case, because of this patch, looks like the subsequent FE is not
>> finding a BE DAI since it is already active due to a prior FE. The
>> reason it works at my end is because the mixer input and output DAIs are
>> separated. Any new FE would just configure the mixer input DAI to which
>> it is attached and skip already running/configured output DAI. 

If you want to visualize the topology we're using in our 'nocodec'
tests, see

https://sof-ci.01.org/linuxpr/PR3177/build6440/devicetest/?model=ADLP_RVP_NOCODEC&testcase=verify-kernel-boot-log

and use the sof-adl-nocodec.

it's a bog-standard topology with processing entities connected by buffers.

I don't fully understand the notion of mixer input DAI, in our case we
have a bunch of PCM devices connected to a mixer. The mixer is not
directly connected to a DAI.

> The problem as I see is that with this patch one can not connect a new
> FE to a BE which is _not_ in NEW or CLOSE state.
> 
> The FE and BE needs to be connected to have DPCM working and this patch
> makes the code to skip the dpcm_be_connect().
> 
> Consider this simple setup:
> 
> FE1 -->|
>        | --> BE -->
> FE2- ->|
> 
> First we start FE1, dpcm_be_connect(FE1, BE, stream) is made.
> 
> Later FE2 is started but dpcm_be_connect(FE2, BE, stream) would be not
> made because BE is no longer in NEW/CLOSE state.

I share Peter's analysis, there cannot be any restrictions on
connections - at any time. A mixer input might become active and be
added to the mix. We might have a temporary lock to delay new
connections but cannot not reject them outright based on BE state.

>> I am just
>> curious to know, if originally you were reconfiguring the BE DAI again
>> with same parameters (for a second FE) or some additional configuration
>> is done?

That's a different question - and a good one.

In the case of a mixer, the propagation of hw_params is a broken
concept. It leads to the first FE configuring the BE to define its
preferred parameters, e.g. S16_LE format. If later on a second FE is
started which could play S24_LE, the mixer and BE are already configured
to a lower resolution. A mixer should really have its own parameters and
be the start of a new 'domain' - as Lars described it several years ago
at the audio miniconference.

For now, the only restriction that we could enforce is that the BE
cannot be reconfigured after the prepare step.

Note that our DAIs tolerate multiple calls to hw_params. If you have a
case where the hw_params allocates resources, maybe you should consider
moving that allocation to the prepare step, or free them if you detect a
reconfiguration. That would be something needed even outside of the DPCM
scope. Similarly you need to support the case where the DAI hw_free is
called without hw_params ever being called, it's a known sequence that
can happen if the FE hw-params fails.

>>> I can send a revert with the explanations in the commit message if there
>>> is a consensus that this patch needs to be revisited.
>>
>> May be this can be revisited since it appears to be a critical problem
>> for your system. But I hope this discussion can be alive on following
>> points for a better fix.
>>
>> 1. The original issue at my end was not just a configuration redundancy.
>> I realize now that with more stream addition following error print is seen.
>>    "ASoC: too many users playback at open 4"
>>
>>    This is because the max DPCM users is capped at 8. Increasing this
>> may help (need to see what number is better), but does not address the
>> redundancy problem.

we haven't used more than 2 users, but it's already broken at 2 with
race conditions left and right. I am really surprised you managed to
have more than 2 without hitting inconsistent states - our automated
play/stop/pause monkey tests reliably break DPCM in less than 20s.

>> 2. If reconfiguration of the same BE is not necessary for a subsequent
>> FE run, shouldn't we avoid the reconfig itself and somehow avoid FE
>> failure?
> 
> I'm not sure, but it might be possible to just skip the
> dpcm_set_be_update_state(be, stream, SND_SOC_DPCM_UPDATE_BE);
> call at the end of the loop, but the question is under which condition?
> Can a BE asked to be reconfigured when STOP/OPEN/HW_PARAMS?
> 
> Skipping the connect does not sound right for a new FE-BE connection.

The reconfiguration is one problem, but what also happens is that the BE
dailink will see multiple triggers. I've been playing with refcounts to
force consistency and make sure there is only one TRIGGER_START send to
the dailink, and conversely there are cases where the TRIGGER_STOP is
never sent...
