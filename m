From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFC] tegra_pcm DMA buffers allocation
Date: Thu, 19 Apr 2012 14:07:43 -0600
Message-ID: <4F90708F.8070504@wwwdotorg.org>
References: <1334851253.13681.49.camel@marvin>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1334851253.13681.49.camel@marvin>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrey Smirnov <andrey.smirnov-MC3rjLPHZ0ivD/XHwUtZZ+TW4wlIGRCZ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/19/2012 10:00 AM, Andrey Smirnov wrote:
> Hello,
> 
> I'm working with a Harmony-based custom Tegra2 board and I'm writing a
> driver for a sound capturing I2S device. At this point, for all intents
> and purposes the code I use is almost indistinguishable from the similar
> code for WM8782(digital microphone) which means that the the structure
> describing the DAI has only .capture data and .playback field is left
> untouched. This set up, using the tegra-l4t-r15-alpha kernel* results in
> the crash because of NULL pointer dereference in
> tegra_pcm_preallocate_dma_buffer().

This mailing list is generally considered to be solely for discussing
the mainline kernel, rather than NVIDIA's downstream/product kernels.
I'm afraid we don't have a good story for external contributions to our
downstream kernels through channels other than OEM product engagements
though.

That said, I think if you replace the following code that you say is in
our L4T kernels:

	if (dai->driver->playback.channels_min) {

with the upstream variant:

	if (pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream) {

I hope you'll find your problem is solved. If not, then there is
probably a bug in the mainline code that we could continue to discuss here.

BTW, did you try running the mainline code on your board. If it's
derived from Harmony, it should be easy to get it going.
