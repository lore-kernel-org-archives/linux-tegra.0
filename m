From: Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] drm/tegra: Check size of a submitted command buffer
Date: Fri, 12 May 2017 21:37:20 +0200
Message-ID: <CABPQNSae=_MFv=FrrYtUQE3jWpJiyrh-vekFs+jeN2iwQTsMOw@mail.gmail.com>
References: <20170512192903.25491-1-digetx@gmail.com>
Reply-To: kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170512192903.25491-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, May 12, 2017 at 9:29 PM, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> If command buffer claims a number of words that is higher than its BO can
> fit and a relocation lays past the BO, a kernel OOPS will be fired on that
> relocation address patching. This was triggered by an opentegra Xorg driver
> that erroneously pushed too many commands to the pushbuf.
>
> [   46.829393] Unable to handle kernel paging request at virtual address f09b2000
> ...
> [<c04a3ba4>] (host1x_job_pin) from [<c04dfcd0>] (tegra_drm_submit+0x474/0x510)
> [<c04dfcd0>] (tegra_drm_submit) from [<c04deea0>] (tegra_submit+0x50/0x6c)
> [<c04deea0>] (tegra_submit) from [<c04c07c0>] (drm_ioctl+0x1e4/0x3ec)
> [<c04c07c0>] (drm_ioctl) from [<c02541a0>] (do_vfs_ioctl+0x9c/0x8e4)
> [<c02541a0>] (do_vfs_ioctl) from [<c0254a1c>] (SyS_ioctl+0x34/0x5c)
> [<c0254a1c>] (SyS_ioctl) from [<c0107640>] (ret_fast_syscall+0x0/0x3c)
>
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Looks good, good catch!

Reviewed-by: Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
