From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH wq/for-4.5-fixes] workqueue: skip flush dependency checks
 for legacy workqueues
Date: Fri, 29 Jan 2016 16:07:52 +0100
Message-ID: <20160129150752.GA28437@ulmo>
References: <20151203002810.GJ19878@mtj.duckdns.org>
 <20151203093350.GP17308@twins.programming.kicks-ass.net>
 <20151203100018.GO11639@twins.programming.kicks-ass.net>
 <20151203144811.GA27463@mtj.duckdns.org>
 <20151203150442.GR17308@twins.programming.kicks-ass.net>
 <20151203150604.GC27463@mtj.duckdns.org>
 <20151203192616.GJ27463@mtj.duckdns.org>
 <20160126173843.GA11115@ulmo.nvidia.com>
 <20160129105946.GJ32380@htj.duckdns.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XsQoSWH+UP9D9v3l"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160129105946.GJ32380@htj.duckdns.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tejun Heo <tj@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ulrich Obergfell <uobergfe@redhat.com>, Ingo Molnar <mingo@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, kernel-team@fb.com, Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 29, 2016 at 05:59:46AM -0500, Tejun Heo wrote:
> fca839c00a12 ("workqueue: warn if memory reclaim tries to flush
> !WQ_MEM_RECLAIM workqueue") implemented flush dependency warning which
> triggers if a PF_MEMALLOC task or WQ_MEM_RECLAIM workqueue tries to
> flush a !WQ_MEM_RECLAIM workquee.
>=20
> This assumes that workqueues marked with WQ_MEM_RECLAIM sit in memory
> reclaim path and making it depend on something which may need more
> memory to make forward progress can lead to deadlocks.  Unfortunately,
> workqueues created with the legacy create*_workqueue() interface
> always have WQ_MEM_RECLAIM regardless of whether they are depended
> upon memory reclaim or not.  These spurious WQ_MEM_RECLAIM markings
> cause spurious triggering of the flush dependency checks.
>=20
>   WARNING: CPU: 0 PID: 6 at kernel/workqueue.c:2361 check_flush_dependenc=
y+0x138/0x144()
>   workqueue: WQ_MEM_RECLAIM deferwq:deferred_probe_work_func is flushing =
!WQ_MEM_RECLAIM events:lru_add_drain_per_cpu
>   ...
>   Workqueue: deferwq deferred_probe_work_func
>   [<c0017acc>] (unwind_backtrace) from [<c0013134>] (show_stack+0x10/0x14)
>   [<c0013134>] (show_stack) from [<c0245f18>] (dump_stack+0x94/0xd4)
>   [<c0245f18>] (dump_stack) from [<c0026f9c>] (warn_slowpath_common+0x80/=
0xb0)
>   [<c0026f9c>] (warn_slowpath_common) from [<c0026ffc>] (warn_slowpath_fm=
t+0x30/0x40)
>   [<c0026ffc>] (warn_slowpath_fmt) from [<c00390b8>] (check_flush_depende=
ncy+0x138/0x144)
>   [<c00390b8>] (check_flush_dependency) from [<c0039ca0>] (flush_work+0x5=
0/0x15c)
>   [<c0039ca0>] (flush_work) from [<c00c51b0>] (lru_add_drain_all+0x130/0x=
180)
>   [<c00c51b0>] (lru_add_drain_all) from [<c00f728c>] (migrate_prep+0x8/0x=
10)
>   [<c00f728c>] (migrate_prep) from [<c00bfbc4>] (alloc_contig_range+0xd8/=
0x338)
>   [<c00bfbc4>] (alloc_contig_range) from [<c00f8f18>] (cma_alloc+0xe0/0x1=
ac)
>   [<c00f8f18>] (cma_alloc) from [<c001cac4>] (__alloc_from_contiguous+0x3=
8/0xd8)
>   [<c001cac4>] (__alloc_from_contiguous) from [<c001ceb4>] (__dma_alloc+0=
x240/0x278)
>   [<c001ceb4>] (__dma_alloc) from [<c001cf78>] (arm_dma_alloc+0x54/0x5c)
>   [<c001cf78>] (arm_dma_alloc) from [<c0355ea4>] (dmam_alloc_coherent+0xc=
0/0xec)
>   [<c0355ea4>] (dmam_alloc_coherent) from [<c039cc4c>] (ahci_port_start+0=
x150/0x1dc)
>   [<c039cc4c>] (ahci_port_start) from [<c0384734>] (ata_host_start.part.3=
+0xc8/0x1c8)
>   [<c0384734>] (ata_host_start.part.3) from [<c03898dc>] (ata_host_activa=
te+0x50/0x148)
>   [<c03898dc>] (ata_host_activate) from [<c039d558>] (ahci_host_activate+=
0x44/0x114)
>   [<c039d558>] (ahci_host_activate) from [<c039f05c>] (ahci_platform_init=
_host+0x1d8/0x3c8)
>   [<c039f05c>] (ahci_platform_init_host) from [<c039e6bc>] (tegra_ahci_pr=
obe+0x448/0x4e8)
>   [<c039e6bc>] (tegra_ahci_probe) from [<c0347058>] (platform_drv_probe+0=
x50/0xac)
>   [<c0347058>] (platform_drv_probe) from [<c03458cc>] (driver_probe_devic=
e+0x214/0x2c0)
>   [<c03458cc>] (driver_probe_device) from [<c0343cc0>] (bus_for_each_drv+=
0x60/0x94)
>   [<c0343cc0>] (bus_for_each_drv) from [<c03455d8>] (__device_attach+0xb0=
/0x114)
>   [<c03455d8>] (__device_attach) from [<c0344ab8>] (bus_probe_device+0x84=
/0x8c)
>   [<c0344ab8>] (bus_probe_device) from [<c0344f48>] (deferred_probe_work_=
func+0x68/0x98)
>   [<c0344f48>] (deferred_probe_work_func) from [<c003b738>] (process_one_=
work+0x120/0x3f8)
>   [<c003b738>] (process_one_work) from [<c003ba48>] (worker_thread+0x38/0=
x55c)
>   [<c003ba48>] (worker_thread) from [<c0040f14>] (kthread+0xdc/0xf4)
>   [<c0040f14>] (kthread) from [<c000f778>] (ret_from_fork+0x14/0x3c)
>=20
> Fix it by marking workqueues created via create*_workqueue() with
> __WQ_LEGACY and disabling flush dependency checks on them.
>=20
> Signed-off-by: Tejun Heo <tj@kernel.org>
> Reported-by: Thierry Reding <thierry.reding@gmail.com>
> Link: http://lkml.kernel.org/g/20160126173843.GA11115@ulmo.nvidia.com

Thanks for fixing this, everything is back to normal:

Tested-by: Thierry Reding <treding@nvidia.com>

--XsQoSWH+UP9D9v3l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWq4BEAAoJEN0jrNd/PrOhSg0P/iQnhIAgP/KenvV57VM494Cn
8Rxg/x4MqZSMyAzeWxLK/wYXDUEFzwhzQSfUSkf1E0fnYwjII0uV5EzF/R87KNg2
A11xHR5xeEJSp/UHHp0EsmBU/CcbEwBCHkg+JZ0CZZtnjqf/YgSIkIC2hoJ/N1GW
bgz3WK5S/laeMBtdo9woaTrMVQt9RCkydwJiX6KjnHpKyFhnMqrVCCLZ/V3LA8bv
tli36s3sE0G0RcQ6AeWwjUFiUFfwC8cUNqh9P79iZh1y1JV8f/U+WRLRWb4rOd3+
/VBTnEFBv2fklgcBesZKn39hdab/U9bvpuopd4dP8ayGBHyMx7OwrCTgy4h98wxk
WZx6FKQ0iX1ZuiIzDtHeFMbIs4zw9JbOVWCiQ2w/rkQXg0Y7JYjb9KnMDYhIrsU6
3yFfseA2KnkTI/aPPCNXWwEK5O78W+nVoE8sVZkkfkHyv2p4fh4jjM+gY2fGHCjS
oPgz73hS5t19wj0QBvtBh5h/ULKVN7FasqvkWL9v1xIifZusm6TfYXLTg0Bh1jBf
dA1q4nkmf8qnRL9EApCJIhp6/ZB0lQAr71bIXh5PiD/XwzXvBwQFpDe+d6vXqMFj
tWO8MHO4kV0ZVLg5YsRFg7OPsAfWNeX70LdP7Zdqi2KZsihSG+yE344RwFuivBir
PcQ6OJM4EKPhEnU+kGWc
=9AMn
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--
