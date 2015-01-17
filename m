From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] gpu: host1x: Store physical address to all bufs
Date: Sat, 17 Jan 2015 04:43:15 +0300
Message-ID: <54B9BE33.8010907@gmail.com>
References: <1421456866-31670-1-git-send-email-davidu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421456866-31670-1-git-send-email-davidu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Ung <davidu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, airlied-cv59FeDIM0c@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

17.01.2015 04:07, David Ung =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> From: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Signed-off-by: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>   drivers/gpu/host1x/job.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
> index 63bd63f..7f3cfff 100644
> --- a/drivers/gpu/host1x/job.c
> +++ b/drivers/gpu/host1x/job.c
> @@ -538,9 +538,12 @@ int host1x_job_pin(struct host1x_job *job, struc=
t device *dev)
>
>   		g->base =3D job->gather_addr_phys[i];
>
> -		for (j =3D i + 1; j < job->num_gathers; j++)
> -			if (job->gathers[j].bo =3D=3D g->bo)
> +		for (j =3D i + 1; j < job->num_gathers; j++) {
> +			if (job->gathers[j].bo =3D=3D g->bo) {
>   				job->gathers[j].handled =3D true;
> +				job->gathers[j].base =3D g->base;
> +			}
> +		}
>
>   		err =3D do_relocs(job, g->bo);
>   		if (err)
>
No commit description? Is it bugfix or optimization...

--=20
Dmitry
