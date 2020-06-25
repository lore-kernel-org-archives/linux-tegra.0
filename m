From: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Subject: Re: [RFC] Host1x/TegraDRM UAPI
Date: Thu, 25 Jun 2020 12:23:17 +0300
Message-ID: <d635556c-6fdf-44a4-664b-e7d8449cd27a@kapsi.fi>
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
 <10f9a8e5-9972-76bc-f60a-1bf1211e55e1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <10f9a8e5-9972-76bc-f60a-1bf1211e55e1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, sumit.semwal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bhuntsman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 6/25/20 3:47 AM, Dmitry Osipenko wrote:
> 23.06.2020 15:09, Mikko Perttunen пишет:
>> #define DRM_TEGRA_SUBMIT_CREATE_POST_SYNC_FILE      (1<<0)
>> #define DRM_TEGRA_SUBMIT_CREATE_POST_SYNCOBJ        (1<<1)
> 
> The sync object shouldn't be created by the kernel driver and we
> shouldn't need the sync-file FD.
> 
> Please consider this example of how syncobj may be used:
> 
>    1. Syncobj is created by userspace.
> 
>    2. Syncobj's handle (post_fence) is passed with the job to the kernel
> driver.
> 
>    3. Userspace waits on syncobj for the job's submission.
> 
>    4. Kernel driver attaches job-completion dma-fence(s) to the syncobj
> after starting to execute the job.
> 
>    5. Userspace waits on syncobj for the job's completion.
> 
> Syncobj is a superset of the sync-file fence:
> 
>    a) Syncobj doesn't have a backing file descriptor when it's created.
> For example, why would you need an FD if you're not going to share fence
> with other processes. It's possible to get FD out of syncobj later on,
> please see [1][2].
> 
>    b) Syncobj is designed to be used with a GPU jobs. For example,
> userspace passes job to the GPU driver's scheduler and then waits until
> job has been started to execute on hardware, this is already supported
> by syncobj.
> 
>    c) It is possible to attach sync-file's fence to a syncobj [1][2][3]
> and now:
> 
>    - Userspace may attach sync-file's fence to a syncobj.
> 
>    - Userspace may use this syncobj for the job's pre-fence.
> 
>    - Kernel driver will take out the pre-fence from the syncobj during of
> the job's submission and reset the syncobj's fence to NULL.
> 
>    - Job's scheduler will wait on this pre-fence before starting to
> execute job.
> 
>    - Once the job is started to execute, the job's scheduler will attach
> the job's completion-fence to the syncobj. Now syncobj has a post-fence!
> 
>    d) It is possible to get sync-file FD out of syncobj [1][2][4].
> 
> [1]
> https://elixir.bootlin.com/linux/v5.7.2/source/include/uapi/drm/drm.h#L730
> [2]
> https://elixir.bootlin.com/linux/v5.7.2/source/include/uapi/drm/drm.h#L933
> [3]
> https://elixir.bootlin.com/linux/v5.7.2/source/drivers/gpu/drm/drm_syncobj.c#L653
> [4]
> https://elixir.bootlin.com/linux/v5.7.2/source/drivers/gpu/drm/drm_syncobj.c#L674
> 
> ===
> 
> So, sync object can carry both pre-fence and post-fence, and they could
> be sync-file FDs!
> 
> The corollary is that we can get away by using a single syncobj handle
> for the job's submission IOCTL.
> 

Ah, clearly I hadn't understood syncobjs properly :) Last time I spent 
significant time with this they didn't exist yet.. I'll check this out.

Mikko
