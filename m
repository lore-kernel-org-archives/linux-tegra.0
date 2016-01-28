From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] workqueue: warn if memory reclaim tries to flush
 !WQ_MEM_RECLAIM workqueue
Date: Thu, 28 Jan 2016 13:48:38 +0100
Message-ID: <20160128124838.GB26897@ulmo>
References: <20151203002810.GJ19878@mtj.duckdns.org>
 <20151203093350.GP17308@twins.programming.kicks-ass.net>
 <20151203100018.GO11639@twins.programming.kicks-ass.net>
 <20151203144811.GA27463@mtj.duckdns.org>
 <20151203150442.GR17308@twins.programming.kicks-ass.net>
 <20151203150604.GC27463@mtj.duckdns.org>
 <20151203192616.GJ27463@mtj.duckdns.org>
 <20160126173843.GA11115@ulmo.nvidia.com>
 <20160128101210.GC6357@twins.programming.kicks-ass.net>
 <20160128124700.GA26897@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vGgW1X5XWziG23Ko"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160128124700.GA26897@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ulrich Obergfell <uobergfe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-team-b10kYP2dOMg@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--vGgW1X5XWziG23Ko
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 28, 2016 at 01:47:00PM +0100, Thierry Reding wrote:
> On Thu, Jan 28, 2016 at 11:12:10AM +0100, Peter Zijlstra wrote:
> > On Tue, Jan 26, 2016 at 06:38:43PM +0100, Thierry Reding wrote:
> > > > Task or work item involved in memory reclaim trying to flush a
> > > > non-WQ_MEM_RECLAIM workqueue or one of its work items can lead to
> > > > deadlock.  Trigger WARN_ONCE() if such conditions are detected.
> > > I've started noticing the following during boot on some of the device=
s I
> > > work with:
> > >=20
> > > [    4.723705] WARNING: CPU: 0 PID: 6 at kernel/workqueue.c:2361 chec=
k_flush_dependency+0x138/0x144()
> > > [    4.736818] workqueue: WQ_MEM_RECLAIM deferwq:deferred_probe_work_=
func is flushing !WQ_MEM_RECLAIM events:lru_add_drain_per_cpu
> > > [    4.748099] Modules linked in:
> > > [    4.751342] CPU: 0 PID: 6 Comm: kworker/u8:0 Not tainted 4.5.0-rc1=
-00018-g420fc292d9c7 #1
> > > [    4.759504] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
> > > [    4.765762] Workqueue: deferwq deferred_probe_work_func
> > > [    4.771004] [<c0017acc>] (unwind_backtrace) from [<c0013134>] (sho=
w_stack+0x10/0x14)
> > > [    4.778746] [<c0013134>] (show_stack) from [<c0245f18>] (dump_stac=
k+0x94/0xd4)
> > > [    4.785966] [<c0245f18>] (dump_stack) from [<c0026f9c>] (warn_slow=
path_common+0x80/0xb0)
> > > [    4.794048] [<c0026f9c>] (warn_slowpath_common) from [<c0026ffc>] =
(warn_slowpath_fmt+0x30/0x40)
> > > [    4.802736] [<c0026ffc>] (warn_slowpath_fmt) from [<c00390b8>] (ch=
eck_flush_dependency+0x138/0x144)
> > > [    4.811769] [<c00390b8>] (check_flush_dependency) from [<c0039ca0>=
] (flush_work+0x50/0x15c)
> > > [    4.820112] [<c0039ca0>] (flush_work) from [<c00c51b0>] (lru_add_d=
rain_all+0x130/0x180)
> > > [    4.828110] [<c00c51b0>] (lru_add_drain_all) from [<c00f728c>] (mi=
grate_prep+0x8/0x10)
> >=20
> > Right, also, I think it makes sense to do lru_add_drain_all() from a
> > WQ_MEM_RECLAIM workqueue, it is, after all, aiding in getting memory
> > freed.
> >=20
> > Does something like the below cure things?
> >=20
> > TJ does this make sense to you?
> >=20
> > ---
> >  mm/swap.c | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/mm/swap.c b/mm/swap.c
> > index 09fe5e97714a..a3de016b2a9d 100644
> > --- a/mm/swap.c
> > +++ b/mm/swap.c
> > @@ -666,6 +666,15 @@ static void lru_add_drain_per_cpu(struct work_stru=
ct *dummy)
> > =20
> >  static DEFINE_PER_CPU(struct work_struct, lru_add_drain_work);
> > =20
> > +static struct workqueue_struct *lru_wq;
> > +
> > +static int __init lru_init(void)
> > +{
> > +	lru_wq =3D create_workqueue("lru");
> > +	return 0;
> > +}
> > +early_initcall(lru_init);
> > +
> >  void lru_add_drain_all(void)
> >  {
> >  	static DEFINE_MUTEX(lock);
> > @@ -685,7 +694,7 @@ void lru_add_drain_all(void)
> >  		    pagevec_count(&per_cpu(lru_deactivate_pvecs, cpu)) ||
> >  		    need_activate_page_drain(cpu)) {
> >  			INIT_WORK(work, lru_add_drain_per_cpu);
> > -			schedule_work_on(cpu, work);
> > +			queue_work_on(cpu, &lru_wq, work);
>                                            ^
>=20
> This ampersand is too much here and causes a compile-time warning.
> Removing it and booting the resulting kernel doesn't trigger the
> WQ_MEM_RECLAIM warning anymore, though.
>=20
> Tested on top of next-20160128.

This implies that if you want to turn this into a proper patch:

Tested-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Alternatively, if you come up with a different way to fix things,
please let me know and I'll be happy to test again.

Thierry

--vGgW1X5XWziG23Ko
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWqg4mAAoJEN0jrNd/PrOhWuwP/2rGTAWvPVPIN3EjMVsdS1uv
Ki+jEseFje9wpEocK45RNzLtANrGbVwicXoMPuFypMeYes6tpkCwH5EoX8/P2Yh2
gr1Tx0GIkaVnFRZ2dCZ2kgeEmSJqJgQZKu1CmUyhUZMeH/9x6yEmt6WbF7WXGwws
MnnOhn5NetZ2CldLzQqYatigi0prH1Poum5KfNqk/DgwYROg7Nm6PIIqkguKwp6U
MJgX6A/Q2CufjDt+bbD23KLCs2eD7U0HaXHCQIBAlJbBudWu274TOdZnG8BwiDGe
GZySZZkz6S58KRKxHStokcJ8nbFR/7pbTjyo6zU4FbopT3arPB7sN7Z7y1PI/OWN
6CXIi0wd4a3GcZIft8PADajjwXW+OCrVGqI6VeMpyGPqZ0h9QC+eo3EDPV7uH7cJ
mjaM4q1pHwJD8cz2BYPKhP+ZPxyCzCOi2xRTNTPAKfGd3W7MhzHO8WLwY+7K3xnk
IlrPz26MxqkF1odFMUDO06UjgELVVPUy4ij5Q3U9yiKkU165J6mwnBNDOVm2ewOl
7vXrd3WaGmi0P970EzAW9XEf4a5m5D2QozSCmq73qrfWXJcI5cb5XT+37kWlnAJU
dwmU/S4X9yhqXdVg5KVMLfOhURfHdVAHY0zD1Nqs9ca4wBpSTTb+NuQVsp0sUIaP
K1W9HHJRS/lwIfWhF/d3
=T1sn
-----END PGP SIGNATURE-----

--vGgW1X5XWziG23Ko--
