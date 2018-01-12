From: Chris Wilson <chris-Y6uKTt2uX1cEflXRtASbqLVCufUGDwFn@public.gmane.org>
Subject: Re: [PATCH 0/3] drm/tegra: Add support for fence FDs
Date: Fri, 12 Jan 2018 10:40:16 +0000
Message-ID: <151575361658.23681.15835882826597063093@mail.alporthouse.com>
References: <20180111222249.29105-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180111222249.29105-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Quoting Thierry Reding (2018-01-11 22:22:46)
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> This set of patches adds support for fences to Tegra DRM and complements
> the fence FD support for Nouveau. Technically this isn't necessary for a
> fence-based synchronization loop with Nouveau because the KMS core takes
> care of all that, but engines behind host1x can use the IOCTL extensions
> provided here to emit fence FDs that in turn can be used to synchronize
> their jobs with either the scanout engine or the GPU.

Whilst hooking up fences, I advise you to also hook up drm_syncobj.
Internally they each resolve to another fence, so the mechanics are
identical, you just need another array in the uABI for in/out syncobj.
The advantage of drm_syncobj is that userspace can track internal fences
using inexhaustible handles, reserving the precious fd for IPC or KMS.
-Chris
