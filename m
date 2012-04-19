From: Andrey Smirnov <andrey.smirnov-MC3rjLPHZ0ivD/XHwUtZZ+TW4wlIGRCZ@public.gmane.org>
Subject: [RFC] tegra_pcm DMA buffers allocation
Date: Thu, 19 Apr 2012 09:00:53 -0700
Message-ID: <1334851253.13681.49.camel@marvin>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hello,

I'm working with a Harmony-based custom Tegra2 board and I'm writing a
driver for a sound capturing I2S device. At this point, for all intents
and purposes the code I use is almost indistinguishable from the similar
code for WM8782(digital microphone) which means that the the structure
describing the DAI has only .capture data and .playback field is left
untouched. This set up, using the tegra-l4t-r15-alpha kernel* results in
the crash because of NULL pointer dereference in
tegra_pcm_preallocate_dma_buffer().

My humble investigation leads me to the following conclusions:
The way I see this code works(correct me if I missed something) is the
following:

soc_probe_dai_link() -> soc_new_pcm() -> snd_pcm_new() ->
snd_pcm_new_stream()

And the decision to allocate a stream is based on the codec_dai's
playback/capture channel count by this piece of code from soc_new_pcm:  

if (codec_dai->driver->playback.channels_min)
	playback = 1;
if (codec_dai->driver->capture.channels_min)
	capture = 1;

Tegra's DMA buffers allocation on the other hand is guided by the amount
of playback capture channels on the cpu_dai as the following excerpt
from tegrap_pcm_new() shows:

struct snd_soc_dai *dai = rtd->cpu_dai;
.
.
.
if (dai->driver->playback.channels_min) {
	ret = tegra_pcm_preallocate_dma_buffer(pcm,
					SNDRV_PCM_STREAM_PLAYBACK);
	if (ret)
		goto err;
}

if (dai->driver->capture.channels_min) {
	ret = tegra_pcm_preallocate_dma_buffer(pcm,
					SNDRV_PCM_STREAM_CAPTURE);
	if (ret)
		goto err_free_play;
}

And wile not positive(unfortunately I didn't have the tenacity required
to actually trace the exact cause of the crash) I'm rather confident
that this is the reason I experience the problem described above, since 
working it around the following way:

if (rtd->codec_dai->driver->playback.channels_min &&
dai->driver->playback.channels_min) {
	ret = tegra_pcm_preallocate_dma_buffer(pcm,
					SNDRV_PCM_STREAM_PLAYBACK);
	if (ret)
		goto err;
}

if (rtd->codec_dai->driver->playback.channels_min &&
dai->driver->capture.channels_min) {
	ret = tegra_pcm_preallocate_dma_buffer(pcm,
					SNDRV_PCM_STREAM_CAPTURE);
	if (ret)
		goto err_free_play;
}

at least allowed the machine to start. Do I miss some additional setup
bit required for this use-case? If not then, what would be the best way
to solve this problem? Declare a fake playback stream in the driver and
ignore it, since there is no physical connection to the corresponding
pins of the T20?


Thank you for you answers, and I apologize if any of my conclusions are
based on faulty premises an therefore are just noise.

Andrey Smirnov

______________
* I know that the code base is different from
git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git
for-next but from what I can tell the code corresponding to the issue at
ahnd is pretty similar.
