From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [RFC PATCH] ASoC: core: Optimise suspend/resume of DAPM widgets
Date: Wed, 15 Aug 2018 19:48:47 +0100
Message-ID: <e1bc40ec-de7e-2b77-d7f6-ec6b3066aeec@nvidia.com>
References: <1533301025-19980-1-git-send-email-jonathanh@nvidia.com>
 <20180803163605.GD6591@sirena.org.uk>
 <7ba86328-5bb6-5280-df6f-9937173fb2ab@nvidia.com>
 <20180814144004.GD5810@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180814144004.GD5810@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 14/08/18 15:40, Mark Brown wrote:
> On Mon, Aug 13, 2018 at 07:19:16PM +0100, Jon Hunter wrote:
>>
>> I had taken some ftrace graphs but there was not one thing that really
>> stood out. Looking again it seems that each call to
>> async_schedule_domain() can take tens of uS and so it there are a lot of
>> DAPM widgets (100+) this can take some time. I will dig into it a bit
>> further.
> 
> We don't call that per widget, we call that per context.  We might have
> a lot of contexts but it's definitely not number of widgets level.
> Perhaps what we need there is something which remembers if we actually
> changed anything in each context and/or there's relevant operations and
> then doesn't do this if not, we're working on the basis that these
> operations are fairly cheap.

Yes I see that now. 
 
>>> One thing that it occurs to me might help is to start the suspend
>>> process by powering down all the input and output widgets that aren't
>>> ignoring suspend in one operation, that should hopefully have the effect
>>> of ensuring that most of the system that's going to get powered down
>>> does so on the first pass through.
> 
>> If the async_schedule_domain() calls are the problem, then it may not
>> help as we call that for all dapms apart from the card->dapm.
> 
> No, we actually need to run the operations on all contexts - they can
> all do things if they want to.  We just want them all to run in parallel
> so if we are doing things like waiting for capacitors to charge we don't
> do it in series.

So I did a bit more digging and this time on Tegra124 Jetson-TK1 (which
is supported in the mainline). On Jetson-TK1 I see that
dapm_power_widgets is called 4 times on entering suspend and each call
then calls the dapm_pre/post_sequence_async() functions 3 times.
Interestingly, at least for Jetson-TK1, it appears that the calls to
dapm_pre/post_sequence_async() do not actually change the bias state
because the dapm contexts are already in the desired state. Please
note that at this time audio is not active and so that is probably why.

Anyway, I was interested in the overhead added of calling
async_schedule_domain() to schedule the dapm_pre/post_sequence_async()
function calls if there is nothing to be done. This is what I see ...

Times for function dapm_power_widgets() are (us):
	Min 23, Ave 190, Max 434, Count 39

Where 'Count' is the number of times that dapm_power_widgets() has
been called (both during boot and through a few suspend iterations).

So then I made the following change to avoid scheduling the function
calls unnecessarily (which I think should be fine) ...

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 5ed90ea69a24..ff66a6834531 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -1955,7 +1955,7 @@ static int dapm_power_widgets(struct snd_soc_card *card, int event)
        dapm_pre_sequence_async(&card->dapm, 0);
        /* Run other bias changes in parallel */
        list_for_each_entry(d, &card->dapm_list, list) {
-               if (d != &card->dapm)
+               if (d != &card->dapm && d->bias_level != d->target_bias_level)
                        async_schedule_domain(dapm_pre_sequence_async, d,
                                                &async_domain);
        }
@@ -1979,7 +1979,7 @@ static int dapm_power_widgets(struct snd_soc_card *card, int event)
 
        /* Run all the bias changes in parallel */
        list_for_each_entry(d, &card->dapm_list, list) {
-               if (d != &card->dapm)
+               if (d != &card->dapm && d->bias_level != d->target_bias_level)
                        async_schedule_domain(dapm_post_sequence_async, d,
                                                &async_domain);
        }

And with the above change I now see ...

Times for function dapm_power_widgets() are (us):
	Min 4, Ave 16, Max 82, Count 39

Please note that I am just using ktime_get() to log the time on entry
and exit from dapm_power_widgets() and so yes the time may not be
purely the time take to execute this function if we are preempted,
but I am measuring in the same way in both cases and so it does seem
to show some improvement.

Let me know your thoughts.

Cheers
Jon

-- 
nvpublic
