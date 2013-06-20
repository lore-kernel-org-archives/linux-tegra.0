From: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PULL] drm-tegra-fixes
Date: Fri, 21 Jun 2013 06:37:30 +1000
Message-ID: <CAPM=9tz_-m+kZo9+BJ1P-3-d01+HDEQkM0-Kvdc4GFVffex5gg@mail.gmail.com>
References: <20130620103642.GB28263@manwe>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130620103642.GB28263@manwe>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

>   git://anongit.freedesktop.org/tegra/linux.git drm/fixes
>
> for you to fetch changes up to 2b15aa0fd466a4b2defdfd84c0b5168804b3eb33:
>
>   gpu: host1x: Rework CPU syncpoint increment (2013-06-20 12:21:38 +0200)
>
> I know this comes awfully late and is much bigger than I'd like. It's
> all my fault, though, since I've been travelling a lot lately and just
> didn't find the time to prepare this earlier. I did want to sort out
> patches that didn't warrant to go in before the final 3.10 release, but
> all met the criteria as far as I could tell.
>

Don't think I want to submit this to Linus, its way too much at this point,

User visible oops or regressions is all you get now really.

Dave.



> Arto Merilainen (5):
>       gpu: host1x: Check reloc table before usage
>       gpu: host1x: Copy gathers before verification
>       gpu: host1x: Fix memory access in syncpt request
>       gpu: host1x: Fix client_managed type
>       gpu: host1x: Rework CPU syncpoint increment
>
> Emil Goode (1):
>       drm/tegra: Include header drm/drm.h
>
> Laurent Pinchart (1):
>       drm/tegra: Remove DRIVER_BUS_PLATFORM from driver_features
>
> Terje Bergstrom (2):
>       gpu: host1x: Check INCR opcode correctly
>       gpu: host1x: Don't reset firewall between gathers
>
> Thierry Reding (5):
>       drm/tegra: Don't disable unused planes
>       drm/tegra: Explicitly set irq_enabled
>       drm/tegra: Honor pixel-format changes
>       MAINTAINERS: Update Tegra DRM entry
>       drm/tegra: Fix return value
>
> Wei Yongjun (2):
>       drm/tegra: fix missing unlock on error
>       drm/tegra: fix error return code in gr2d_submit()
>
>  MAINTAINERS                       |   7 +-
>  drivers/gpu/host1x/dev.h          |   8 +--
>  drivers/gpu/host1x/drm/dc.c       |   5 ++
>  drivers/gpu/host1x/drm/drm.c      |  14 +++-
>  drivers/gpu/host1x/drm/gr2d.c     |  12 ++--
>  drivers/gpu/host1x/hw/cdma_hw.c   |   2 +-
>  drivers/gpu/host1x/hw/syncpt_hw.c |  12 ++--
>  drivers/gpu/host1x/job.c          | 135 +++++++++++++++++---------------------
>  drivers/gpu/host1x/syncpt.c       |  26 +++-----
>  drivers/gpu/host1x/syncpt.h       |  13 ++--
>  include/uapi/drm/tegra_drm.h      |   2 +
>  11 files changed, 113 insertions(+), 123 deletions(-)
