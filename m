From: Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC v2 8/8] drm: tegra: Add gr2d device
Date: Mon, 26 Nov 2012 15:59:37 -0600
Message-ID: <CAF6AEGu629qj-pgd5gaJEpo2QqqUZYXyDJk14c5rgdAwh-wMPg@mail.gmail.com>
References: <1353935954-13763-1-git-send-email-tbergstrom@nvidia.com>
	<1353935954-13763-9-git-send-email-tbergstrom@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1353935954-13763-9-git-send-email-tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Nov 26, 2012 at 7:19 AM, Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>
> +struct tegra_drm_submit_args {
> +       void *context;

Just a quick comment..

You shouldn't really use ptr here, but instead use a 64bit type so
that you don't run into issues later for armv8/64bit.  Same comment
applies in a few other places too.

I'll try and spend a bit more time going through this in more detail
in the coming days

BR,
-R

> +       __u32 num_syncpt_incrs;
> +       __u32 num_cmdbufs;
> +       __u32 num_relocs;
> +       __u32 submit_version;
> +       __u32 num_waitchks;
> +       __u32 waitchk_mask;
> +       __u32 timeout;
> +       struct tegra_drm_syncpt_incrs *syncpt_incrs;
> +       struct tegra_drm_cmdbuf *cmdbufs;
> +       struct tegra_drm_reloc *relocs;
> +       struct tegra_drm_waitchk *waitchks;
> +
> +       __u32 pad[5];           /* future expansion */
> +       __u32 fence;            /* Return value */
> +};
> +
