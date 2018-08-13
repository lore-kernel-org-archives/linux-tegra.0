From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [RFC PATCH] ASoC: core: Optimise suspend/resume of DAPM widgets
Date: Mon, 13 Aug 2018 19:19:16 +0100
Message-ID: <7ba86328-5bb6-5280-df6f-9937173fb2ab@nvidia.com>
References: <1533301025-19980-1-git-send-email-jonathanh@nvidia.com>
 <20180803163605.GD6591@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180803163605.GD6591@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 03/08/18 17:36, Mark Brown wrote:
> On Fri, Aug 03, 2018 at 01:57:05PM +0100, Jon Hunter wrote:
> 
>> For soundcards that have several DAI links and many DAPM widgets the
>> time taken for snd_soc_suspend to execute has been observed to be
>> several milliseconds. The time is largely spent executing
>> dapm_power_widgets() for each for the DAI links that need to be
>> suspended. Given that dapm_power_widgets() is called again after
>> suspending/resuming the DAI links, one way to optimise the
>> suspend/resume time is to avoid calling dapm_power_widgets() for
>> each DAI link and reduces the suspend time significantly.
> 
> It's a bit alarming that dapm_power_widgets() is taking substantial
> enough time to be worth worring about - it's *supposed* to be relatively
> well optimized so it's effectively free.  It'll never be quite free, but
> close enough.  The goal is that if nothing changes we end up testing a
> few nodes at most before we figure out that nothing changed state and
> stop.  Do you have any idea what it's spending its time on, we do call
> it a lot so if there's any optimization opportunties there we can
> probably get a lot of benefit out of them.

Sorry for the delay, I was out last week.

I had taken some ftrace graphs but there was not one thing that really
stood out. Looking again it seems that each call to
async_schedule_domain() can take tens of uS and so it there are a lot of
DAPM widgets (100+) this can take some time. I will dig into it a bit
further.

> One thing that it occurs to me might help is to start the suspend
> process by powering down all the input and output widgets that aren't
> ignoring suspend in one operation, that should hopefully have the effect
> of ensuring that most of the system that's going to get powered down
> does so on the first pass through.

If the async_schedule_domain() calls are the problem, then it may not
help as we call that for all dapms apart from the card->dapm.

>> Please note that this has been observed on the Tegra210 Jetson TX1
>> platform which is not currently supported in the mainline for audio
>> but has been tested with out-of-tree patches to enable I2S audio.
> 
> If someone could get the platform booting reliably in -next that'd be
> good but that's a separate issue...

Yes I plan to work on that in the next few months.

>> In the resume path, it is not clear if there could be any issues from
>> not sync'ing the DAPM power state until after unmuting and resuming
>> the CPU DAI drivers, because this will happen later with this change.
> 
> This is a definite problem, we want to have the audio path powered up
> before we start playing audio otherwise we loose the start of the audio
> which may be important.

I was thinking I could add another call to snd_soc_dapm_sync() after
resuming the streams to address that. However, maybe I need to dig into
this a bit more to understand exactly why dapm_power_widgets() takes so
long.

Cheers
Jon

-- 
nvpublic
