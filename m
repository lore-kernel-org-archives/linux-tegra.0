From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] Host1x/TegraDRM UAPI
Date: Thu, 25 Jun 2020 01:33:34 +0300
Message-ID: <7cc0d47b-024a-263e-3b63-1d1184b462b3@gmail.com>
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
> struct drm_tegra_submit_relocation {
>         /* [in] Index of GATHER or GATHER_UPTR command in commands. */
>         __u32 gather_command_index;
> 
>         /*
>          * [in] Mapping handle (obtained through CHANNEL_MAP) of the memory
>          *   the address of which will be patched in.
>          */
>         __u32 mapping_id;
> 
>         /*
>          * [in] Offset in the gather that will be patched.
>          */
>         __u64 gather_offset;
> 
>         /*
>          * [in] Offset in target buffer whose paddr/IOVA will be written
>          *   to the gather.
>          */
>         __u64 target_offset;
> 
>         /*
>          * [in] Number of bits the resulting address will be logically
>          *   shifted right before writing to gather.
>          */
>         __u32 shift;
> 
>         __u32 reserved[1];
> };

We will also need read/write direction flag here for the
DMA-reservations set up, it will be used for the implicit BO fencing by
the job's scheduler.
