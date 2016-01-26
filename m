From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] workqueue: warn if memory reclaim tries to flush
 !WQ_MEM_RECLAIM workqueue
Date: Tue, 26 Jan 2016 18:38:43 +0100
Message-ID: <20160126173843.GA11115@ulmo.nvidia.com>
References: <20151203002810.GJ19878@mtj.duckdns.org>
 <20151203093350.GP17308@twins.programming.kicks-ass.net>
 <20151203100018.GO11639@twins.programming.kicks-ass.net>
 <20151203144811.GA27463@mtj.duckdns.org>
 <20151203150442.GR17308@twins.programming.kicks-ass.net>
 <20151203150604.GC27463@mtj.duckdns.org>
 <20151203192616.GJ27463@mtj.duckdns.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UlVJffcvxoiEqYs2"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151203192616.GJ27463-qYNAdHglDFBN0TnZuCh8vA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ulrich Obergfell <uobergfe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-team-b10kYP2dOMg@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 03, 2015 at 02:26:16PM -0500, Tejun Heo wrote:
> Task or work item involved in memory reclaim trying to flush a
> non-WQ_MEM_RECLAIM workqueue or one of its work items can lead to
> deadlock.  Trigger WARN_ONCE() if such conditions are detected.
>=20
> Signed-off-by: Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
> ---
> Hello,
>=20
> So, something like this.  Seems to work fine here.  If there's no
> objection, I'm gonna push it through wq/for-4.5.
>=20
> Thanks.
>=20
>  kernel/workqueue.c |   35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>=20
> --- a/kernel/workqueue.c
> +++ b/kernel/workqueue.c
> @@ -2330,6 +2330,37 @@ repeat:
>  	goto repeat;
>  }
> =20
> +/**
> + * check_flush_dependency - check for flush dependency sanity
> + * @target_wq: workqueue being flushed
> + * @target_work: work item being flushed (NULL for workqueue flushes)
> + *
> + * %current is trying to flush the whole @target_wq or @target_work on i=
t.
> + * If @target_wq doesn't have %WQ_MEM_RECLAIM, verify that %current is n=
ot
> + * reclaiming memory or running on a workqueue which doesn't have
> + * %WQ_MEM_RECLAIM as that can break forward-progress guarantee leading =
to
> + * a deadlock.
> + */
> +static void check_flush_dependency(struct workqueue_struct *target_wq,
> +				   struct work_struct *target_work)
> +{
> +	work_func_t target_func =3D target_work ? target_work->func : NULL;
> +	struct worker *worker;
> +
> +	if (target_wq->flags & WQ_MEM_RECLAIM)
> +		return;
> +
> +	worker =3D current_wq_worker();
> +
> +	WARN_ONCE(current->flags & PF_MEMALLOC,
> +		  "workqueue: PF_MEMALLOC task %d(%s) is flushing !WQ_MEM_RECLAIM %s:%=
pf",
> +		  current->pid, current->comm, target_wq->name, target_func);
> +	WARN_ONCE(worker && (worker->current_pwq->wq->flags & WQ_MEM_RECLAIM),
> +		  "workqueue: WQ_MEM_RECLAIM %s:%pf is flushing !WQ_MEM_RECLAIM %s:%pf=
",
> +		  worker->current_pwq->wq->name, worker->current_func,
> +		  target_wq->name, target_func);
> +}
> +
>  struct wq_barrier {
>  	struct work_struct	work;
>  	struct completion	done;
> @@ -2539,6 +2570,8 @@ void flush_workqueue(struct workqueue_st
>  		list_add_tail(&this_flusher.list, &wq->flusher_overflow);
>  	}
> =20
> +	check_flush_dependency(wq, NULL);
> +
>  	mutex_unlock(&wq->mutex);
> =20
>  	wait_for_completion(&this_flusher.done);
> @@ -2711,6 +2744,8 @@ static bool start_flush_work(struct work
>  		pwq =3D worker->current_pwq;
>  	}
> =20
> +	check_flush_dependency(pwq->wq, work);
> +
>  	insert_wq_barrier(pwq, barr, work, worker);
>  	spin_unlock_irq(&pool->lock);
> =20

I've started noticing the following during boot on some of the devices I
work with:

[    4.723705] WARNING: CPU: 0 PID: 6 at kernel/workqueue.c:2361 check_flus=
h_dependency+0x138/0x144()
[    4.736818] workqueue: WQ_MEM_RECLAIM deferwq:deferred_probe_work_func i=
s flushing !WQ_MEM_RECLAIM events:lru_add_drain_per_cpu
[    4.748099] Modules linked in:
[    4.751342] CPU: 0 PID: 6 Comm: kworker/u8:0 Not tainted 4.5.0-rc1-00018=
-g420fc292d9c7 #1
[    4.759504] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
[    4.765762] Workqueue: deferwq deferred_probe_work_func
[    4.771004] [<c0017acc>] (unwind_backtrace) from [<c0013134>] (show_stac=
k+0x10/0x14)
[    4.778746] [<c0013134>] (show_stack) from [<c0245f18>] (dump_stack+0x94=
/0xd4)
[    4.785966] [<c0245f18>] (dump_stack) from [<c0026f9c>] (warn_slowpath_c=
ommon+0x80/0xb0)
[    4.794048] [<c0026f9c>] (warn_slowpath_common) from [<c0026ffc>] (warn_=
slowpath_fmt+0x30/0x40)
[    4.802736] [<c0026ffc>] (warn_slowpath_fmt) from [<c00390b8>] (check_fl=
ush_dependency+0x138/0x144)
[    4.811769] [<c00390b8>] (check_flush_dependency) from [<c0039ca0>] (flu=
sh_work+0x50/0x15c)
[    4.820112] [<c0039ca0>] (flush_work) from [<c00c51b0>] (lru_add_drain_a=
ll+0x130/0x180)
[    4.828110] [<c00c51b0>] (lru_add_drain_all) from [<c00f728c>] (migrate_=
prep+0x8/0x10)
[    4.836018] [<c00f728c>] (migrate_prep) from [<c00bfbc4>] (alloc_contig_=
range+0xd8/0x338)
[    4.844186] [<c00bfbc4>] (alloc_contig_range) from [<c00f8f18>] (cma_all=
oc+0xe0/0x1ac)
[    4.852093] [<c00f8f18>] (cma_alloc) from [<c001cac4>] (__alloc_from_con=
tiguous+0x38/0xd8)
[    4.860346] [<c001cac4>] (__alloc_from_contiguous) from [<c001ceb4>] (__=
dma_alloc+0x240/0x278)
[    4.868944] [<c001ceb4>] (__dma_alloc) from [<c001cf78>] (arm_dma_alloc+=
0x54/0x5c)
[    4.876506] [<c001cf78>] (arm_dma_alloc) from [<c0355ea4>] (dmam_alloc_c=
oherent+0xc0/0xec)
[    4.884764] [<c0355ea4>] (dmam_alloc_coherent) from [<c039cc4c>] (ahci_p=
ort_start+0x150/0x1dc)
[    4.893367] [<c039cc4c>] (ahci_port_start) from [<c0384734>] (ata_host_s=
tart.part.3+0xc8/0x1c8)
[    4.902055] [<c0384734>] (ata_host_start.part.3) from [<c03898dc>] (ata_=
host_activate+0x50/0x148)
[    4.910919] [<c03898dc>] (ata_host_activate) from [<c039d558>] (ahci_hos=
t_activate+0x44/0x114)
[    4.919523] [<c039d558>] (ahci_host_activate) from [<c039f05c>] (ahci_pl=
atform_init_host+0x1d8/0x3c8)
[    4.928733] [<c039f05c>] (ahci_platform_init_host) from [<c039e6bc>] (te=
gra_ahci_probe+0x448/0x4e8)
[    4.937770] [<c039e6bc>] (tegra_ahci_probe) from [<c0347058>] (platform_=
drv_probe+0x50/0xac)
[    4.946197] [<c0347058>] (platform_drv_probe) from [<c03458cc>] (driver_=
probe_device+0x214/0x2c0)
[    4.955061] [<c03458cc>] (driver_probe_device) from [<c0343cc0>] (bus_fo=
r_each_drv+0x60/0x94)
[    4.963575] [<c0343cc0>] (bus_for_each_drv) from [<c03455d8>] (__device_=
attach+0xb0/0x114)
[    4.971828] [<c03455d8>] (__device_attach) from [<c0344ab8>] (bus_probe_=
device+0x84/0x8c)
[    4.979994] [<c0344ab8>] (bus_probe_device) from [<c0344f48>] (deferred_=
probe_work_func+0x68/0x98)
[    4.988941] [<c0344f48>] (deferred_probe_work_func) from [<c003b738>] (p=
rocess_one_work+0x120/0x3f8)
[    4.998062] [<c003b738>] (process_one_work) from [<c003ba48>] (worker_th=
read+0x38/0x55c)
[    5.006144] [<c003ba48>] (worker_thread) from [<c0040f14>] (kthread+0xdc=
/0xf4)
[    5.013362] [<c0040f14>] (kthread) from [<c000f778>] (ret_from_fork+0x14=
/0x3c)

This seems to be caused by the interaction of the probe deferral
workqueue with WQ_MEM_RECLAIM workqueue. Any ideas on how to solve this?

Thierry

--UlVJffcvxoiEqYs2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWp68iAAoJEN0jrNd/PrOhdgoP/iomrtmxSW3FqWMpstelU8vE
I7HZIiCcoKEo6JIHx4ftQWOHtTc4HAWM4RHFhsUyY2RAiKAp9xLT+TW0HR3a6hec
EIoCi4Hhy2+pIcd1GgJf+MrAmI5J0C1dMHaYErJmcb/J269XVT4s3vGF6L7ZjTAT
5qCI/7bquUWryXWsjV6dpPdJym9zLrN48aoH4MBlt4R4xvXe+yON3aal4MdeN94c
jCO8JnawxmZzifggsyDMpSoblpIGz1qStt31jPgTtYpTtvCz9h7lsQlija3FHBkH
lb2zO5JRsWowsvPpP3wC+54LbuW9su154fGSPdeMI4ftvSddKN/gh5psxhrcJVYg
W5U1spi73eZkjm86DHhkRPMAnQZhb/5ocgrL96utWFaCaEoTcQD0iWYdvPEvPyu6
KS+Z/EXEykJavdrWr4imPi3tcLKtx8NWRLzL/2qindE5HYMNTQtN+vIN/orUCLA+
XyTMnY+6WtMbFIymV1jXeNBGcH/ydtKbh+0FnYaHZ+3YKjascpVrlfdjjUtKzBxm
EEq195Q+eyuwfS7SyUr8C8KbsSWicmCd9lRTVaP/2stjqhntYog+0Vr1WsnoG7AI
1/JibmT5BNu+XztJxePQU4UV/8XxKQZuQXlIl99SgM3wBwGfW30UlklxX5GdHsbk
RHLvtgwYT4UoFlmOowcy
=DqS8
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--
