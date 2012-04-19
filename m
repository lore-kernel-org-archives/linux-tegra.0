From: Andrey Smirnov <andrey.smirnov-MC3rjLPHZ0ivD/XHwUtZZ+TW4wlIGRCZ@public.gmane.org>
Subject: Re: [RFC] tegra_pcm DMA buffers allocation
Date: Thu, 19 Apr 2012 14:07:12 -0700
Message-ID: <1334869632.13681.59.camel@marvin>
References: <1334851253.13681.49.camel@marvin>
	 <4F90708F.8070504@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F90708F.8070504-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, 2012-04-19 at 16:07 -0400, Stephen Warren wrote:
> On 04/19/2012 10:00 AM, Andrey Smirnov wrote:
> > Hello,
> > 
> > I'm working with a Harmony-based custom Tegra2 board and I'm writing a
> > driver for a sound capturing I2S device. At this point, for all intents
> > and purposes the code I use is almost indistinguishable from the similar
> > code for WM8782(digital microphone) which means that the the structure
> > describing the DAI has only .capture data and .playback field is left
> > untouched. This set up, using the tegra-l4t-r15-alpha kernel* results in
> > the crash because of NULL pointer dereference in
> > tegra_pcm_preallocate_dma_buffer().
> 
> This mailing list is generally considered to be solely for discussing
> the mainline kernel, rather than NVIDIA's downstream/product kernels.
> I'm afraid we don't have a good story for external contributions to our
> downstream kernels through channels other than OEM product engagements
> though.
> 
> That said, I think if you replace the following code that you say is in
> our L4T kernels:
> 
> 	if (dai->driver->playback.channels_min) {
> 
> with the upstream variant:
> 
> 	if (pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream) {
> 
> I hope you'll find your problem is solved. If not, then there is
> probably a bug in the mainline code that we could continue to discuss here.

Oh, I apologize I think I mixed the two code bases, for some reason I
thought that was the way it was handled in upstream too, that's why I
brought the issue here. I saw the same code used in PXA pcm code(the one
example using capture only drivers I found). And it worked like a charm,
thank your for suggestion.

> 
> BTW, did you try running the mainline code on your board. If it's
> derived from Harmony, it should be easy to get it going.

Last time we did there was no support for Tegra's NAND and display
controllers(I was very excited to read about those DRM DC patches the
other day), but to switch to upstream code is definitely the plan.
