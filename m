From: Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 12/22] gpu: host1x: Correct host1x_job_pin() error handling
Date: Tue, 23 May 2017 02:32:21 +0200
Message-ID: <CABPQNSYOG0kXJEnqRGZq3_xjF0soe-PsE8rX9EcRunyBC67aZA@mail.gmail.com>
References: <cover.1495498184.git.digetx@gmail.com> <a153e811388386c26d21e26ac4deb72a4d01ae74.1495498184.git.digetx@gmail.com>
Reply-To: kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a153e811388386c26d21e26ac4deb72a4d01ae74.1495498184.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, May 23, 2017 at 2:14 AM, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> In case of relocations / waitchecks patching failure the jobs pins stay
> referenced till DRM file get closed, wasting memory. Add the missed
> unpinning.
>
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpu/host1x/job.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
> index d9933828fe87..14f3f957ffab 100644
> --- a/drivers/gpu/host1x/job.c
> +++ b/drivers/gpu/host1x/job.c
> @@ -592,22 +592,20 @@ int host1x_job_pin(struct host1x_job *job, struct device *dev)
>
>                 err = do_relocs(job, g->bo);
>                 if (err)
> -                       break;
> +                       goto out;
>
>                 err = do_waitchks(job, host, g->bo);
>                 if (err)
> -                       break;
> +                       goto out;
>         }
>
> -       if (IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL) && !err) {
> -               err = copy_gathers(job, dev);
> -               if (err) {
> -                       host1x_job_unpin(job);
> -                       return err;
> -               }
> -       }
> +       if (!IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL))
> +               goto out;
>
> +       err = copy_gathers(job, dev);
>  out:
> +       if (err)
> +               host1x_job_unpin(job);
>         wmb();
>
>         return err;
> --
> 2.13.0
>

One subtle undocumented change here, is that wmb() now gets called in
the copy_gathers()-error case (just like it already does for the other
error-cases). That's seems like an OK change, so:

Reviewed-by: Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
