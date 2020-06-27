From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] Host1x/TegraDRM UAPI (drm_tegra_submit_command)
Date: Sun, 28 Jun 2020 01:32:00 +0300
Message-ID: <f31fbe3b-3fc5-2ece-4c2c-9ff4e99995d6@gmail.com>
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
> /* Command is an opcode gather from a GEM handle */
> #define DRM_TEGRA_SUBMIT_COMMAND_GATHER             0
> /* Command is an opcode gather from a user pointer */
> #define DRM_TEGRA_SUBMIT_COMMAND_GATHER_UPTR        1
> /* Command is a wait for syncpt fence completion */
> #define DRM_TEGRA_SUBMIT_COMMAND_WAIT_SYNCPT        2
> /* Command is a wait for SYNC_FILE FD completion */
> #define DRM_TEGRA_SUBMIT_COMMAND_WAIT_SYNC_FILE     3
> /* Command is a wait for DRM syncobj completion */
> #define DRM_TEGRA_SUBMIT_COMMAND_WAIT_SYNCOBJ       4
> 
> /*
>  * Allow driver to skip command execution if engine
>  * was not accessed by another channel between
>  * submissions.
>  */
> #define DRM_TEGRA_SUBMIT_CONTEXT_SETUP                        (1<<0)
> 
> struct drm_tegra_submit_command {
>         __u16 type;
>         __u16 flags;

Shouldn't the "packed" attribute be needed if a non-32bit aligned fields
are used?

>         union {
>                 struct {
>                     /* GEM handle */
>                     __u32 handle;
> 
>                     /*
>                      * Offset into GEM object in bytes.
>                      * Must be aligned by 4.
>                      */
>                     __u64 offset;

64bits for a gather offset is a bit too much, in most cases gathers are
under 4K.

u32 should be more than enough (maybe even u16 if offset is given in a
dword granularity).

>                     /*
>                      * Length of gather in bytes.
>                      * Must be aligned by 4.
>                      */
>                     __u64 length;

u32/16

>                 } gather;

>                 struct {
>                         __u32 reserved[1];
> 
>                         /*
>                          * Pointer to gather data.
>                          * Must be aligned by 4 bytes.
>                          */
>                         __u64 base;
>                         /*
>                          * Length of gather in bytes.
>                          * Must be aligned by 4.
>                          */
>                         __u64 length;
>                 } gather_uptr;

What about to inline the UPTR gather data and relocs into the
drm_tegra_submit_command[] buffer:

struct drm_tegra_submit_command {
	struct {
		u16 num_words;
		u16 num_relocs;

		gather_data[];
		drm_tegra_submit_relocation relocs[];
	} gather_uptr;
};

struct drm_tegra_channel_submit {
        __u32 num_syncpt_incrs;
        __u32 syncpt_idx;

        __u64 commands_ptr;
	__u32 commands_size;
...
};

struct drm_tegra_submit_command example[] = {
	cmd.gather_uptr{},
	...
	gather_data[],
	gather_relocs[],
	cmd.wait_syncpt{},
	...
};

This way we will have only a single copy_from_user() for the whole
cmdstream, which should be more efficient to do and nicer from both
userspace and kernel perspectives in regards to forming and parsing the
commands.
