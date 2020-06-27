From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] Host1x/TegraDRM UAPI (drm_tegra_submit_syncpt_incr)
Date: Sun, 28 Jun 2020 00:47:13 +0300
Message-ID: <9ddfedff-f465-b22d-5d6f-c7ba01731455@gmail.com>
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
> struct drm_tegra_submit_syncpt_incr {
>         /*
>          * [in] Syncpoint FD of the syncpoint that the job will
>          *   increment.
>          */
>         __s32 syncpt_fd;
> 
>         /*
>          * [in] Number of increments that the job will do.
>          */
>         __u32 num_incrs;
> 
>         /*
>          * [out] Value the syncpoint will have once all increments have
>          *   executed.
>          */
>         __u32 fence_value;
> 
>         __u32 reserved[1];
> };

The job should be considered executed once the final sync point is
incremented.

Hence, there should be only one sync point per-job for increment, why
would you ever need more than one?

Could you please explain what this submit_syncpt_incr is about?
