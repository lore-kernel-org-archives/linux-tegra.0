From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] Host1x/TegraDRM UAPI (drm_tegra_channel_map)
Date: Fri, 26 Jun 2020 01:47:46 +0300
Message-ID: <4f9ddf30-ad8d-3750-20d7-867be17a1006@gmail.com>
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
> ### DRM_TEGRA_CHANNEL_MAP
> 
> Make memory accessible by the engine while executing work on the channel.
> 
> ```
> #define DRM_TEGRA_CHANNEL_MAP_READWRITE        (1<<0)
> 
> struct drm_tegra_channel_map {
>         /*
>          * [in] ID of the channel for which to map memory to.
>          */
>         __u32 channel_id;
>         /*
>          * [in] GEM handle of the memory to map.
>          */
>         __u32 handle;
> 
>         /*
>          * [in] Offset in GEM handle of the memory area to map.
>          *
>          * Must be aligned by 4K.
>          */
>         __u64 offset;

Could you please give a use-case example for this partial mapping?

I vaguely recalling that maybe it was me who suggested this in the past..

I kinda see that this could be useful for a case where userspace
allocates a large chunk of memory and then performs sub-allocations in
the userspace driver. But do we have a real-world example for this right
now?

Please see more below.

>         /*
>          * [in] Length of memory area to map in bytes.
>          *
>          * Must be aligned by 4K.
>          */
>         __u64 length;
> 
>         /*
>          * [out] IOVA of mapped memory. Userspace can use this IOVA
>          *   directly to refer to the memory to skip using relocations.
>          *   Only available if hardware memory isolation is enabled.
>          *
>          *   Will be set to 0xffff_ffff_ffff_ffff if unavailable.
>          */
>         __u64 iova;
> 
>         /*
>          * [out] ID corresponding to the mapped memory to be used for
>          *   relocations or unmapping.
>          */
>         __u32 mapping_id;
>         /*
>          * [in] Flags.
>          */
>         __u32 flags;
> 
>         __u32 reserved[6];
> };

It looks to me that we actually need a bit different thing here.

This MAP IOCTL maps a portion of a GEM and then returns the mapping_id.
And I think we need something more flexible that will allow us to use
GEM handles for the relocation IDs, which should fit nicely with the
DMA-reservations.

What about an IOCTL that wraps GEM into another GEM? We could wrap a
portion of GEM_A into a GEM_B, and then map the GEM_B using the MAP IOCTL.

It could be something like this:

### DRM_TEGRA_BO_WRAP

struct drm_tegra_wrap_bo {
	__u32 bo_handle_wrapped; // out
	__u32 bo_handle;         // in
	__u64 offset;
	__u64 length;
};

### DRM_TEGRA_CHANNEL_MAP

struct drm_tegra_channel_map {
        __u32 channels_mask;
	__u32 mapping_id;
        __u32 bo_handle;
        __u32 flags;
        __u64 iova;
};

===

This allows multiple mapping_ids to have the same backing GEM, so the
mapping_id could be resolved into a BO during of job's submission for
the DMA-reservations handling.

Also:

  1. Maybe the WRAP IOCTL could be a generic GEM IOCTL?

  2. I guess we could start easy without the WRAP IOCTL and
     add it later on once there will be a real-world need.
