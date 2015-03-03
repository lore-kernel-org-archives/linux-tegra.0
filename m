From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] gpu: host1x: Reduce host1x job allocation size
Date: Tue, 3 Mar 2015 16:17:50 +0900
Message-ID: <CAAVeFuKDF1vpBMLRT=LjXDgbxLhiW2PLUsGEMO0RZumej+Tnyw@mail.gmail.com>
References: <1422066931-31580-1-git-send-email-davidu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422066931-31580-1-git-send-email-davidu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Ung <davidu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Apologies for the delayed review.

On Sat, Jan 24, 2015 at 11:35 AM, David Ung <davidu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> There is 2 set of num_relocs * sizeof(*) array at the end of host1x job.
> Only the first is really used and with job->gather_addr_phys pointing
> somewhere within the 1st set of reloc physical addresses.
> During pin_job, job->gather_addr_phys array is set indirectly by indexing
> num_relocs offset of job->reloc_addr_phys.
> Correct the total job size, explicily set job->gather_addr_phys array in
> 2nd for loop of pin_job and record its physical address.
>
> Signed-off-by: David Ung <davidu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/host1x/job.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
> index 63bd63f..37c67d2 100644
> --- a/drivers/gpu/host1x/job.c
> +++ b/drivers/gpu/host1x/job.c
> @@ -46,8 +46,8 @@ struct host1x_job *host1x_job_alloc(struct host1x_channel *ch,
>                 (u64)num_unpins * sizeof(struct host1x_job_unpin_data) +
>                 (u64)num_waitchks * sizeof(struct host1x_waitchk) +
>                 (u64)num_cmdbufs * sizeof(struct host1x_job_gather) +
> -               (u64)num_unpins * sizeof(dma_addr_t) +
> -               (u64)num_unpins * sizeof(u32 *);
> +               (u64)num_relocs * sizeof(dma_addr_t) +
> +               (u64)num_cmdbufs * sizeof(dma_addr_t);

This seems to be correct but I'd like to have confirmation from
Arto/Thierry/Terje in case I overlooked something.

>         if (total > ULONG_MAX)
>                 return NULL;
>
> @@ -212,7 +212,8 @@ static unsigned int pin_job(struct host1x_job *job)
>                 if (!phys_addr)
>                         goto unpin;
>
> -               job->addr_phys[job->num_unpins] = phys_addr;
> +               g->base = phys_addr;
> +               job->gather_addr_phys[i] = phys_addr;

Looking through the driver it is not clear to me why we have both
addr_phys and the gather_addr_phys/reloc_addr_phys couple since we end
up using addr_phys instead. It seems like other replacements like this
one could be done to improve code clarity. Ultimately I don't see any
reason why addr_phys should even exist - maybe see if you could
replace its uses with one of gather_addr_phys or reloc_addr_phys for a
v2 of this patch?

I suspect a v2 should be divided into two patches, one that fixes the
allocation size, the other that removes the addr_phys member.

Also on a related note I suspect host1x_job_alloc() could set
num_relocs and num_waitchk itself instead of relying on the caller to
do so (that would be 3 patches then :)). Someone who understands
host1x better, please contradict me if this is wrong.

>                 job->unpins[job->num_unpins].bo = g->bo;
>                 job->unpins[job->num_unpins].sgt = sgt;
>                 job->num_unpins++;
> @@ -536,8 +537,6 @@ int host1x_job_pin(struct host1x_job *job, struct device *dev)
>                 if (g->handled)
>                         continue;
>
> -               g->base = job->gather_addr_phys[i];
> -
>                 for (j = i + 1; j < job->num_gathers; j++)
>                         if (job->gathers[j].bo == g->bo)
>                                 job->gathers[j].handled = true;
> --
> 1.8.1.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
