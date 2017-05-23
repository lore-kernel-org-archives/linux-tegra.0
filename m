From: Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 14/22] gpu: host1x: Forbid relocation address shifting in
 the firewall
Date: Tue, 23 May 2017 02:33:49 +0200
Message-ID: <CABPQNSYQMiSqYG6A0NzrRESHfq4p-mTOiOUu=8yifnWdStaLbg@mail.gmail.com>
References: <cover.1495498184.git.digetx@gmail.com> <15311f1c044c3ff26624e2a980b0c477b1cf33b2.1495498184.git.digetx@gmail.com>
Reply-To: kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <15311f1c044c3ff26624e2a980b0c477b1cf33b2.1495498184.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, May 23, 2017 at 2:14 AM, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Incorrectly shifted relocation address will cause a lower memory corruption
> and likely a hang on a write or a read of an arbitrary data in case of IOMMU
> absent. As of now there is no use for the address shifting (at least on
> Tegra20) and adding a proper shifting / sizes validation is much more work.
> Let's forbid it in the firewall till a proper validation is implemented.
>
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpu/host1x/job.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
> index 190353944d23..1a1568e64ba8 100644
> --- a/drivers/gpu/host1x/job.c
> +++ b/drivers/gpu/host1x/job.c
> @@ -332,6 +332,10 @@ static bool check_reloc(struct host1x_reloc *reloc, struct host1x_bo *cmdbuf,
>         if (reloc->cmdbuf.bo != cmdbuf || reloc->cmdbuf.offset != offset)
>                 return false;
>
> +       /* relocation shift value validation isn't implemented yet */
> +       if (reloc->shift)
> +               return false;
> +
>         return true;
>  }
>
> --
> 2.13.0
>

Good call.


Reviewed-by: Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
