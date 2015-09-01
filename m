From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Nouveau] [RFC PATCH v2 0/5] More explicit pushbuf error handling
Date: Tue, 1 Sep 2015 23:26:29 +1000
Message-ID: <CACAvsv7Bfz-1Ck2=6DbA_N9CggEcPbXNOjM+6JHM_hxC9LHN-A@mail.gmail.com>
References: <1441021115-28537-1-git-send-email-kholtta@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441021115-28537-1-git-send-email-kholtta-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?S29uc3RhIEjDtmx0dMOk?= <kholtta-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 31 August 2015 at 21:38, Konsta H=C3=B6ltt=C3=A4 <kholtta-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org=
> wrote:
> Hi there,
>
> Resending these now that they've had some more polish and testing, an=
d I heard
> that Ben's vacation is over :-)
>
> These patches work as a starting point for more explicit error mechan=
isms and
> better robustness. At the moment, when a job hangs or faults, it seem=
s that
> nouveau doesn't quite know how to handle the situation and often resu=
lts in a
> hang. Some of these situations would require either completely resett=
ing the
> gpu, and/or a complex path for only recovering the broken channel.
Yes, this has been an issue that's been on my "really nice to
implement" list for quite a long time now, and only gotten around to
getting it partially done (as you can see).  Thanks for looking at
this!

>
> To start, I worked on support for letting userspace know what exactly=
 happened.
> Proper recovery would come later. The "error notifier" in the first p=
atch is a
> simple shared buffer between kernel and userspace. Its error codes ma=
tch
> nvgpu's. Alternatively, the status could be queried with an ioctl, bu=
t that
> would be considerably more heavyweight. I'd like to know if the event=
 mechanism
> is meant for these kinds of events at all (engines notify errors upwa=
rds to the
> drm layer). Another alternative would probably be to register the sam=
e buffer
> to all necessary engines separately in nvif method calls? Or register=
 it to
> just one (e.g., fifo) and get that engine when errors happen in other=
s (e.g.,
> gr)? And drm handles probably wouldn't fit there? Please comment on t=
his; I
> wrote this before understanding the mthd mechanism.
=46or the moment, I've just got a couple of high-level
comments/questions on these patches so far before we worry about
nit-picking the details:

Is there any real need to have a full-blown notifier-style object to
pass this info back to userspace?  The DRM has an event mechanism
where userspace could poll on its fd to get events, which is what I'd
assume you'd be doing inside of fence waits with the error notifier?
NVIF events are actually hooked up to this mechanism already, so
userspace could directly request them and cut quite a lot out of that
first patch.  But, the NVKM-level passing of these events back over
NVIF is pretty much where I was going with the design too.  So, good
to see you've done that :)

>
> Additionally, priority and timeout management for separate channels i=
n flight
> on the gpu is added in two patches. Neither is exactly what the name =
says, but
> the effect is the same, and this is what nvgpu does currently. Those =
two
> patches call the fifo channel object's methods directly from userspac=
e, so a
> hack is added in the nvif path to accept that. The objects are NEW'd =
from
> kernel space, so calling from userspace isn't allowed, as it appears.=
 How
> should this be managed in a clean way?
Is there any requirement to be able to adjust the priority of
in-flight channels?  Or would it be satisfactory to have these as
arguments to the channel creation functions?  Either way is fine, the
latter is preferred if there's no use case for adjusting it afterwards
though.

I'm attempting to get some better channel handling (you might have
noticed the current stuff the kernel uses is a bit fragile, it's
evolved over a long time and several generations of channel classes)
in place in time for 4.4, part of which will likely involve giving
userspace better control over the arguments that get passed at channel
creation time.

As for the permissions problem, that can be resolved fairly easily I
think, I'll play with a few ideas and see what I come up with.

Thanks,
Ben.

>
> Also, since nouveau often hangs on errors, the userspace hangs too (w=
aiting on
> a fence). The final patch attempts to fix this in a couple of specifi=
c error
> paths to forcibly update all fences to be finished. I'd like to hear =
how that
> would be handled properly - consider the patch just a proof-of-concep=
t and
> sample of what would be necessary.
>
> I don't expect the patches to be accepted as-is - as a newbie, I'd ap=
preciate
> any high-level comments on if I've understood anything, especially th=
e event
> and nvif/method mechanisms (I use the latter from userspace with a ha=
ck
> constructed from the perfmon branch seen here earlier into nvidia's i=
nternal
> libdrm-equivalent). The fence-forcing thing is something that is nece=
ssary with
> the error notifiers (at least with our userspace that waits really lo=
ng or
> infinitely on fences). I'm working specifically on Tegra and don't kn=
ow much
> about the desktop's userspace details, so I may be biased in some are=
as.
>
> I'd be happy to write sample tests on e.g. libdrm for the new methods=
 once the
> kernel patches would get to a good shape, if that's required for acce=
pting new
> features. I tested these to work as a proof-of-concept on Jetson TK1,=
 and the
> code is adapted from the latest nvgpu.
>
> The patches can also be found in http://github.com/sooda/nouveau and =
are based
> on a version of gnurou/staging.
>
> Thanks!
> Konsta (sooda in IRC)
>
> Konsta H=C3=B6ltt=C3=A4 (5):
>   notify channel errors to userspace
>   don't verify route =3D=3D owner in nvkm ioctl
>   gk104: channel priority/timeslice support
>   gk104: channel timeout detection
>   HACK force fences updated on error
>
>  drm/nouveau/include/nvif/class.h       |  20 ++++
>  drm/nouveau/include/nvif/event.h       |  12 +++
>  drm/nouveau/include/nvkm/engine/fifo.h |   5 +-
>  drm/nouveau/nouveau_chan.c             |  95 +++++++++++++++++++
>  drm/nouveau/nouveau_chan.h             |  10 ++
>  drm/nouveau/nouveau_drm.c              |   1 +
>  drm/nouveau/nouveau_fence.c            |  13 ++-
>  drm/nouveau/nouveau_gem.c              |  29 ++++++
>  drm/nouveau/nouveau_gem.h              |   2 +
>  drm/nouveau/nvkm/core/ioctl.c          |   9 +-
>  drm/nouveau/nvkm/engine/fifo/base.c    |  56 ++++++++++-
>  drm/nouveau/nvkm/engine/fifo/gf100.c   |   2 +-
>  drm/nouveau/nvkm/engine/fifo/gk104.c   | 166 +++++++++++++++++++++++=
+++++++---
>  drm/nouveau/nvkm/engine/fifo/nv04.c    |   2 +-
>  drm/nouveau/nvkm/engine/gr/gf100.c     |   5 +
>  drm/nouveau/uapi/drm/nouveau_drm.h     |  13 +++
>  16 files changed, 415 insertions(+), 25 deletions(-)
>
> --
> 2.1.4
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
