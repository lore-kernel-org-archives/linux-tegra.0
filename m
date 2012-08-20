From: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: Binding together tegradrm & nvhost
Date: Mon, 20 Aug 2012 16:33:35 +0300
Message-ID: <50323CAF.4080407@nvidia.com>
References: <50323513.3090606@nvidia.com> <20120820131800.GA13785@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120820131800.GA13785-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 20.08.2012 16:18, Thierry Reding wrote:
> I have a new patch series that takes care of these two steps. Mark sent
> some patches for Tegra30 and HDMI on top of the older series that I need
> to merge with what I have. Maybe I'll decide to send the series out
> without the patches merged, depending on how much time I'll get or how
> much effort it requires. I had hoped the next series would have working
> HDMI support, which is why I waited.

Ok. I have done my testing on top of Mark's changes, but I don't have
your latest code. Looks like you have already solved some of the quirks
I found while trying out tegradrm.

I'm working mostly on Tegra30, so it helps me if we have Tegra30 support.

Let's hope the freedesktop.org work area gets created fast so that we
could keep our code bases in sync.

> Basically what I have is a very rudimentary driver for host1x, which
> waits for some of the subdevices to be registered and then creates a
> dummy device against which the Tegra DRM driver can bind. It's not quite
> what you proposed above, but very similar.

This sounds pretty good. I'll look into the subdevices implementation -
I might need to move their handling to nvhost. But until that happens,
this scheme sounds good.

> For now I've also put the host1x driver in the same directory as the
> Tegra DRM because there are no other users. We may want to change that
> at some point.

Ok. I can take care of exporting the host1x driver at the same time when
I get more functionality into it.

> Some thought will probably have to go into these. The easiest would
> probably be to have a driver that needs to do synchronization or other
> channel operations. It may make the requirements on the exact ioctls
> clearer.

Got it. When we are so far that there's channel support, I'll also write
a simple test program that performs some simple accelerated operation
with 2D unit. That test program can be used then as a template for other
user space code.

>> 4) Buffer management
> This should be cheap if we use GEM along with DMA-BUF. However without
> other drivers that the buffers can be shared with this won't do us any
> good. So maybe something like a video capturing driver for Tegra should
> be added first so we can actually test buffer sharing.

DMA-BUF could still help with sharing buffers between user space and
kernel, and between user space processes, so not all of the benefits
need another driver.

Terje
