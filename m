From: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/6] video: tegra: Add nvhost driver
Date: Sat, 24 Nov 2012 09:00:20 +0200
Message-ID: <50B07084.40707@nvidia.com>
References: <1353577684-7896-1-git-send-email-tbergstrom@nvidia.com> <1353577684-7896-2-git-send-email-tbergstrom@nvidia.com> <20121123233855.GD21555@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121123233855.GD21555-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 24.11.2012 01:38, Thierry Reding wrote:
> Okay, there's a huge amount of code here. From a quick look this seems
> like the whole nvhost implementation as found in the L4T kernel. It'll
> obviously take quite a bit of time to go through all of it.

Thanks Thierry for your comments.

It's actually about a third of of the downstream nvhost. I left out
support for all client modules, ioctl APIs, hardware context, nvmap
(obviously) and various other features.

But yes, the amount of code is still significant and I feel the pain,
too. I'm attempting to keep downstream and upstream nvhost as similar to
each other as possible so that we can port changes easily between the
two trees. In downstream kernel nvhost manages all its clients (except
DC only partially), so it's kept as its own driver. I'm hoping we'd end
up using tegradrm in downstream, and keeping nvhost as separate entity
is playing a role there.

If it helps, I could write up an essay on the structure of nvhost and
why it works that way. That should help in understanding some of the
design decisions in code.

> I would really like this to be phased in in more manageable chunks. For
> instance syncpoints could be added on top of the existing host1x
> infrastructure (the display controllers can make use of it for VBLANK
> reporting, right?), followed by channel support for command submission.
>
> While VBLANK reporting is already rudimentarily supported using the
> display controllers' VBLANK interrupts, adding syncpt based support
> should be easy to do.

Yep, vblank is a sync point register.

I attempted to tune the code down to only having syncpt support, but it
pulled in still enough (interrupts, syncpts, power management) that the
patch went down about 40% in size. I thought that as the staging didn't
bring really small parts, I deleted that attempt.

I could redo that if it helps. I guess removing dynamic power management
would be the first step, and channels the second. In review process,
they're anyway in separate files so I'm not sure about the benefits, though.

I'm not convinced about moving the code to live inside tegradrm. There's
really not that much host1x infrastructure in tegradrm's host1x.c that
we could leverage except binding device and driver and enabling and
disabling host1x clocks. Most of code in current host1x.c is dedicated
to managing the drm sub-clients, which anyway logically belong to drm.c.

To implement sync points in tegradrm, we'd need to re-implement syncpt
and interrupt support in tegradrm. That's a significant part of code,
and we already have code for that, so I'd like to leverage it as far as
possible.

> Last but not least, I'd really appreciate it if we could settle on one
> name for this component. One place calls it graphics host, another one
> refers to it as host1x and now we have an nvhost driver for it. The TRM
> isn't very consistent either, unfortunately, but a number of chapters
> refer to it as host1x and the clock that drives the block is also named
> host1x. Those are pretty much the reasons why I chose to call the DT
> node and the driver host1x and I would like to suggest we stay with it
> to keep things less confusing.

Graphics host and host1x are names for the hardware block. Graphics host
is an older name, host1x is the proper name.

nvhost is the driver for host1x and its client modules in downstream
kernel. The naming gets confusing in upstream kernel because of shared
responsibility of client modules. tegradrm's 2D driver is just glue
between tegradrm and nvhost.

host1x as the name of the driver wouldn't cover the fact that it's also
managing client modules.

I'll still try to figure out a way to clear up the naming, and
suggestions are welcome. :-)

Terje
