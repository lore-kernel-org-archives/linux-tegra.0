From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] Host1x/TegraDRM UAPI (sync points)
Date: Sun, 28 Jun 2020 02:27:51 +0300
Message-ID: <5b1edaad-ba36-7b0f-5b02-457ae5b6d91e@gmail.com>
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9b06b7ec-f952-2561-7afb-5653514cd5d3-/1wQRMveznE@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, sumit.semwal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bhuntsman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

23.06.2020 15:09, Mikko Perttunen пишет:
> 
> ### IOCTL HOST1X_ALLOCATE_SYNCPOINT (on /dev/host1x)
> 
> Allocates a free syncpoint, returning a file descriptor representing it.
> Only the owner of the file descriptor is allowed to mutate the value of
> the syncpoint.
> 
> ```
> struct host1x_ctrl_allocate_syncpoint {
>        /**
>         * @fd:
>         *
>         * [out] New file descriptor representing the allocated syncpoint.
>         */
>        __s32 fd;
> 
>        __u32 reserved[3];
> };

We should need at least these basic things from the sync points API:

- Execution context shouldn't be able to tamper sync points of the other
contexts.

- Sync point could be shared with other contexts for explicit fencing.

- Sync points should work reliably.

Some problems of the current Host1x driver, like where it falls over if
sync point value is out-of-sync + all the hang-job recovery labor could
be easily reduced if sync point health is protected by extra UAPI
constraints.

So I think we may want the following:

1. We still should need to assign sync point ID to a DRM-channel's
context. This sync point ID will be used for a commands stream forming,
like it is done by the current staging UAPI.

So we should need to retain the DRM_TEGRA_GET_SYNCPT IOCTL, but improve it.

2. Allocated sync point must have a clean hardware state.

3. Sync points should be properly refcounted. Job's sync points
shouldn't be re-used while job is alive.

4. The job's sync point can't be re-used after job's submission (UAPI
constraint!). Userspace must free sync point and allocate a new one for
the next job submission. And now we:

  - Know that job's sync point is always in a healthy state!

  - We're not limited by a number of physically available hardware sync
points! Allocation should block until free sync point is available.

  - The logical number of job's sync point increments matches the SP
hardware state! Which is handy for a job's debugging.

Optionally, the job's sync point could be auto-removed from the DRM's
context after job's submission, avoiding a need for an extra SYNCPT_PUT
IOCTL invocation to be done by userspace after the job's submission.
Could be a job's flag.

We could avoid a need for a statically-allocated sync points at all for
a patched cmdstreams! The sync point could be dynamically allocated at a
job's submission time by the kernel driver and then cmdstream will be
patched with this sync point.
