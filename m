From: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC v2 8/8] drm: tegra: Add gr2d device
Date: Mon, 03 Dec 2012 17:30:00 +0800
Message-ID: <50BC7118.9060407@gmail.com>
References: <1353935954-13763-1-git-send-email-tbergstrom@nvidia.com> <1353935954-13763-9-git-send-email-tbergstrom@nvidia.com> <CAPM=9tzvt3J6D3zLPV97w629q62CNhAxX8V+_JZ6kmXxxz5fVg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPM=9tzvt3J6D3zLPV97w629q62CNhAxX8V+_JZ6kmXxxz5fVg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org" <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Dave:

I'm new in kernel development. Could you tell me or give me some
materials to read that why we need to align the size of IOCTL structures
to 64bit? I can understand if we're working in a 64bit kernel but why we
need to do this if we're in a 32bit arm kernel? Besides, why the
pointers in IOCTL structure should be declared as u64?

Mark
On 11/27/2012 06:15 AM, Dave Airlie wrote:
>>  static int tegra_drm_open(struct drm_device *drm, struct drm_file *filp)
>>  {
>> -       return 0;
>> +       struct tegra_drm_fpriv *fpriv;
>> +       int err = 0;
>> +
>> +       fpriv = kzalloc(sizeof(*fpriv), GFP_KERNEL);
>> +       if (!fpriv)
>> +               return -ENOMEM;
>> +
>> +       INIT_LIST_HEAD(&fpriv->contexts);
>> +       filp->driver_priv = fpriv;
>> +
> 
> who frees this?
>> +struct tegra_drm_syncpt_incr_args {
>> +       __u32 id;
>> +};
> 
> add 32-bits of padding here
> 
>> +
>> +struct tegra_drm_syncpt_wait_args {
>> +       __u32 id;
>> +       __u32 thresh;
>> +       __s32 timeout;
>> +       __u32 value;
>> +};
>> +
>> +#define DRM_TEGRA_NO_TIMEOUT   (-1)
>> +
>> +struct tegra_drm_open_channel_args {
>> +       __u32 class;
>> +       void *context;
> 
> no pointers use u64, align them to 64-bits, so 32-bits of padding,
> 
>> +};
>> +
>> +struct tegra_drm_get_channel_param_args {
>> +       void *context;
>> +       __u32 value;
> 
> Same padding + uint64_t for void *
> 
>> +};
>> +
>> +struct tegra_drm_syncpt_incr {
>> +       __u32 syncpt_id;
>> +       __u32 syncpt_incrs;
>> +};
>> +
>> +struct tegra_drm_cmdbuf {
>> +       __u32 mem;
>> +       __u32 offset;
>> +       __u32 words;
>> +};
> 
> add padding
>> +
>> +struct tegra_drm_reloc {
>> +       __u32 cmdbuf_mem;
>> +       __u32 cmdbuf_offset;
>> +       __u32 target;
>> +       __u32 target_offset;
>> +       __u32 shift;
>> +};
> 
> add padding
> 
>> +
>> +struct tegra_drm_waitchk {
>> +       __u32 mem;
>> +       __u32 offset;
>> +       __u32 syncpt_id;
>> +       __u32 thresh;
>> +};
>> +
>> +struct tegra_drm_submit_args {
>> +       void *context;
>> +       __u32 num_syncpt_incrs;
>> +       __u32 num_cmdbufs;
>> +       __u32 num_relocs;
>> +       __u32 submit_version;
>> +       __u32 num_waitchks;
>> +       __u32 waitchk_mask;
>> +       __u32 timeout;
>> +       struct tegra_drm_syncpt_incrs *syncpt_incrs;
>> +       struct tegra_drm_cmdbuf *cmdbufs;
>> +       struct tegra_drm_reloc *relocs;
>> +       struct tegra_drm_waitchk *waitchks;
>> +
>> +       __u32 pad[5];           /* future expansion */
>> +       __u32 fence;            /* Return value */
>> +};
> 
> lose all the pointers for 64-bit aligned uint64_t.
> 
> Probably should align all of these on __u64 and __u32 usage if possible.
> 
> i'll look at the rest of the patches, but I need to know what commands
> can be submitted via this interface and what are the security
> implications of it.
> 
> Dave.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
