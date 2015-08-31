From: =?UTF-8?q?Konsta=20H=C3=B6ltt=C3=A4?= <kholtta-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH v2 0/5] More explicit pushbuf error handling
Date: Mon, 31 Aug 2015 14:38:30 +0300
Message-ID: <1441021115-28537-1-git-send-email-kholtta@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi there,

Resending these now that they've had some more polish and testing, and =
I heard
that Ben's vacation is over :-)

These patches work as a starting point for more explicit error mechanis=
ms and
better robustness. At the moment, when a job hangs or faults, it seems =
that
nouveau doesn't quite know how to handle the situation and often result=
s in a
hang. Some of these situations would require either completely resettin=
g the
gpu, and/or a complex path for only recovering the broken channel.

To start, I worked on support for letting userspace know what exactly h=
appened.
Proper recovery would come later. The "error notifier" in the first pat=
ch is a
simple shared buffer between kernel and userspace. Its error codes matc=
h
nvgpu's. Alternatively, the status could be queried with an ioctl, but =
that
would be considerably more heavyweight. I'd like to know if the event m=
echanism
is meant for these kinds of events at all (engines notify errors upward=
s to the
drm layer). Another alternative would probably be to register the same =
buffer
to all necessary engines separately in nvif method calls? Or register i=
t to
just one (e.g., fifo) and get that engine when errors happen in others =
(e.g.,
gr)? And drm handles probably wouldn't fit there? Please comment on thi=
s; I
wrote this before understanding the mthd mechanism.

Additionally, priority and timeout management for separate channels in =
flight
on the gpu is added in two patches. Neither is exactly what the name sa=
ys, but
the effect is the same, and this is what nvgpu does currently. Those tw=
o
patches call the fifo channel object's methods directly from userspace,=
 so a
hack is added in the nvif path to accept that. The objects are NEW'd fr=
om
kernel space, so calling from userspace isn't allowed, as it appears. H=
ow
should this be managed in a clean way?

Also, since nouveau often hangs on errors, the userspace hangs too (wai=
ting on
a fence). The final patch attempts to fix this in a couple of specific =
error
paths to forcibly update all fences to be finished. I'd like to hear ho=
w that
would be handled properly - consider the patch just a proof-of-concept =
and
sample of what would be necessary.

I don't expect the patches to be accepted as-is - as a newbie, I'd appr=
eciate
any high-level comments on if I've understood anything, especially the =
event
and nvif/method mechanisms (I use the latter from userspace with a hack
constructed from the perfmon branch seen here earlier into nvidia's int=
ernal
libdrm-equivalent). The fence-forcing thing is something that is necess=
ary with
the error notifiers (at least with our userspace that waits really long=
 or
infinitely on fences). I'm working specifically on Tegra and don't know=
 much
about the desktop's userspace details, so I may be biased in some areas=
=2E

I'd be happy to write sample tests on e.g. libdrm for the new methods o=
nce the
kernel patches would get to a good shape, if that's required for accept=
ing new
features. I tested these to work as a proof-of-concept on Jetson TK1, a=
nd the
code is adapted from the latest nvgpu.

The patches can also be found in http://github.com/sooda/nouveau and ar=
e based
on a version of gnurou/staging.

Thanks!
Konsta (sooda in IRC)

Konsta H=C3=B6ltt=C3=A4 (5):
  notify channel errors to userspace
  don't verify route =3D=3D owner in nvkm ioctl
  gk104: channel priority/timeslice support
  gk104: channel timeout detection
  HACK force fences updated on error

 drm/nouveau/include/nvif/class.h       |  20 ++++
 drm/nouveau/include/nvif/event.h       |  12 +++
 drm/nouveau/include/nvkm/engine/fifo.h |   5 +-
 drm/nouveau/nouveau_chan.c             |  95 +++++++++++++++++++
 drm/nouveau/nouveau_chan.h             |  10 ++
 drm/nouveau/nouveau_drm.c              |   1 +
 drm/nouveau/nouveau_fence.c            |  13 ++-
 drm/nouveau/nouveau_gem.c              |  29 ++++++
 drm/nouveau/nouveau_gem.h              |   2 +
 drm/nouveau/nvkm/core/ioctl.c          |   9 +-
 drm/nouveau/nvkm/engine/fifo/base.c    |  56 ++++++++++-
 drm/nouveau/nvkm/engine/fifo/gf100.c   |   2 +-
 drm/nouveau/nvkm/engine/fifo/gk104.c   | 166 +++++++++++++++++++++++++=
+++++---
 drm/nouveau/nvkm/engine/fifo/nv04.c    |   2 +-
 drm/nouveau/nvkm/engine/gr/gf100.c     |   5 +
 drm/nouveau/uapi/drm/nouveau_drm.h     |  13 +++
 16 files changed, 415 insertions(+), 25 deletions(-)

--=20
2.1.4
