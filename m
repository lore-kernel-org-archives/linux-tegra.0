Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E665C433FE
	for <linux-tegra@archiver.kernel.org>; Tue, 28 Sep 2021 21:25:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F39456138B
	for <linux-tegra@archiver.kernel.org>; Tue, 28 Sep 2021 21:25:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242875AbhI1V10 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 28 Sep 2021 17:27:26 -0400
Received: from mga03.intel.com ([134.134.136.65]:25179 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242846AbhI1V1Z (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 28 Sep 2021 17:27:25 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10121"; a="224877767"
X-IronPort-AV: E=Sophos;i="5.85,330,1624345200"; 
   d="scan'208";a="224877767"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2021 14:25:44 -0700
X-IronPort-AV: E=Sophos;i="5.85,330,1624345200"; 
   d="scan'208";a="438223466"
Received: from ppahwa-mobl1.amr.corp.intel.com (HELO [10.212.48.236]) ([10.212.48.236])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2021 14:25:43 -0700
Subject: Re: [PATCH 01/13] ASoC: soc-pcm: Don't reconnect an already active BE
To:     Sameer Pujar <spujar@nvidia.com>, broonie@kernel.org,
        lgirdwood@gmail.com, robh+dt@kernel.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, catalin.marinas@arm.com, will@kernel.org,
        perex@perex.cz, tiwai@suse.com, kuninori.morimoto.gx@renesas.com
Cc:     devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        sharadg@nvidia.com, linux-arm-kernel@lists.infradead.org
References: <1630056839-6562-1-git-send-email-spujar@nvidia.com>
 <1630056839-6562-2-git-send-email-spujar@nvidia.com>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <be6290d1-0682-3d93-98a6-ad0be3ca42c1@linux.intel.com>
Date:   Tue, 28 Sep 2021 16:25:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1630056839-6562-2-git-send-email-spujar@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 8/27/21 4:33 AM, Sameer Pujar wrote:
> In some cases, multiple FE components have the same BE component in their
> respective DPCM paths. One such example would be a mixer component, which
> can receive two or more inputs and sends a mixed output. In such cases,
> to avoid reconfiguration of already active DAI (mixer output DAI in this
> case), check the BE stream state to filter out the redundancy.
> 
> In summary, allow connection of BE if the respective current stream state
> is either NEW or CLOSED.

This patch breaks our SOF CI tests, ironically in all cases where we
have a mixer with a 'Deep buffer' port! The tests with multiple streams
all fail with this error:

[  124.366400]  Port0 Deep Buffer: ASoC: no backend DAIs enabled for
Port0 Deep Buffer
[  124.366406]  Port0 Deep Buffer: ASoC: dpcm_fe_dai_prepare() failed (-22)

Reverting this patch restore the mixer functionality.

I see multiple problems with this patch:

At a high-level, there's at least a race condition where this BE state
is checked without any protection. That was already a problem that I
highlighted in a recent RFC and still working on, when we have multiple
FEs we can have START/STOP triggers happening concurrently and it's
necessary to serialize these triggers when checking the state, and this
patch increases the 'surface' for this race condition.

But in addition we'd need to agree on what an 'active BE' is. Why can't
we connect a second stream while the first one is already in HW_PARAMS
or PAUSED or STOP? It's perfectly legal in ALSA/ASoC to have multiple
HW_PARAMS calls, and when we reach STOP we have to do a prepare again.

And more fundamentally, the ability to add a second FE on a 'active' BE
in START state is a basic requirement for a mixer, e.g. to play a
notification on one FE while listening to music on another. What needs
to happen is only to make sure that the FE and BE are compatible in
terms of HW_PARAMS and not sending a second TRIGGER_STOP, only checking
the BE NEW or CLOSE state is way too restrictive.

I will agree this sort of mixer use cases is not well supported in
soc-pcm.c, but let's not make it worse than it was before this patch,
shall we?

I can send a revert with the explanations in the commit message if there
is a consensus that this patch needs to be revisited.

[1] https://github.com/thesofproject/linux/pull/3177
[2] https://sof-ci.01.org/linuxpr/PR3177/build6440/devicetest/

> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>  sound/soc/soc-pcm.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index 48f71bb..e30cb5a 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -1395,6 +1395,10 @@ static int dpcm_add_paths(struct snd_soc_pcm_runtime *fe, int stream,
>  		if (!fe->dpcm[stream].runtime && !fe->fe_compr)
>  			continue;
>  
> +		if ((be->dpcm[stream].state != SND_SOC_DPCM_STATE_NEW) &&
> +		    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_CLOSE))
> +			continue;
> +
>  		/* newly connected FE and BE */
>  		err = dpcm_be_connect(fe, be, stream);
>  		if (err < 0) {
> 
