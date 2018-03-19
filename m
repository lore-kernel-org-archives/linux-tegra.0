From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [GIT PULL] drm/tegra: Changes for v4.17-rc1
Date: Mon, 19 Mar 2018 17:52:40 +0100
Message-ID: <20180319165240.GA22770@ulmo>
References: <20180319095939.17131-1-thierry.reding@gmail.com>
 <1521469926.13125.10.camel@toradex.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0579436405=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1521469926.13125.10.camel@toradex.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: linux-tegra@vger.kernel.org


--===============0579436405==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="T4sUOijqQbZv57TR"
Content-Disposition: inline


--T4sUOijqQbZv57TR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 19, 2018 at 02:32:08PM +0000, Marcel Ziswiler wrote:
> Hi Thierry
>=20
> On Mon, 2018-03-19 at 10:59 +0100, Thierry Reding wrote:
> > Hi Dave,
> >=20
> > The following changes since commit
> > 7928b2cbe55b2a410a0f5c1f154610059c57b1b2:
> >=20
> >   Linux 4.16-rc1 (2018-02-11 15:04:29 -0800)
> >=20
> > are available in the Git repository at:
> >=20
> >   git://anongit.freedesktop.org/tegra/linux tags/drm/tegra/for-4.17-
> > rc1
> >=20
> > for you to fetch changes up to
> > 27e92f1f1600c214bf649daddb9b88b68330a8d1:
> >=20
> >   drm/tegra: prime: Implement ->{begin,end}_cpu_access() (2018-03-17
> > 00:04:20 +0100)
> >=20
> > Apologies for the delay. I originally wanted to send this out on
> > Friday
> > but then ran into a pair of bugs that I thought might be caused by
> > this
> > branch. Turns out that they were both already broken in v4.16-rc1 and
> > I
> > just hadn't tested for the corner case, so I caught them only very
> > late
> > in the release cycle.
> >=20
> > Anyway, the fixes for that are on the drm/tegra/fixes branch for
> > which
> > I sent an updated pull request earlier. The stuff here's fairly
> > trivial
> > and incremental improvements.
>=20
> Both linux-next as of Friday and today as well as your
> tags/drm/tegra/for-4.17-rc1 fail for me on TK1 as follows:
>=20
> [    3.609146] +V1.05_AVDD_HDMI_PLL: supplied by +V1.05
> [    3.614294] +V3.3_AVDD_HDMI: supplied by +V1.05
> [    3.622078] ------------[ cut here ]------------
> [    3.626719] WARNING: CPU: 2 PID: 87 at
> /run/media/zim/Build/Sources/linux-
> tegra.git/drivers/gpu/drm/drm_fourcc.c:204 drm_format_info+0x48/0x50
> [    3.639588] Modules linked in:
> [    3.642673] CPU: 2 PID: 87 Comm: kworker/2:1 Not tainted 4.16.0-rc1
> #2
> [    3.649213] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
> [    3.655495] Workqueue: events deferred_probe_work_func
> [    3.660672] [<c01117e4>] (unwind_backtrace) from [<c010c9fc>]
> (show_stack+0x10/0x14)
> [    3.668430] [<c010c9fc>] (show_stack) from [<c09d39d8>]
> (dump_stack+0x8c/0xa0)
> [    3.675684] [<c09d39d8>] (dump_stack) from [<c0122b50>]
> (__warn+0xe0/0xf8)
> [    3.682587] [<c0122b50>] (__warn) from [<c0122c80>]
> (warn_slowpath_null+0x40/0x48)
> [    3.690189] [<c0122c80>] (warn_slowpath_null) from [<c0505438>]
> (drm_format_info+0x48/0x50)
> [    3.698551] [<c0505438>] (drm_format_info) from [<c0529fd0>]
> (tegra_plane_format_mod_supported+0x14/0x30)
> [    3.708150] [<c0529fd0>] (tegra_plane_format_mod_supported) from
> [<c05186cc>] (drm_universal_plane_init+0x2ec/0x59c)
> [    3.718703] [<c05186cc>] (drm_universal_plane_init) from
> [<c052c36c>] (tegra_dc_init+0x1b8/0x510)
> [    3.727611] [<c052c36c>] (tegra_dc_init) from [<c04d8b5c>]
> (host1x_device_init+0x44/0xd0)
> [    3.735821] [<c04d8b5c>] (host1x_device_init) from [<c0523ef4>]
> (tegra_drm_load+0x228/0x308)
> [    3.744291] [<c0523ef4>] (tegra_drm_load) from [<c0501024>]
> (drm_dev_register+0x138/0x1d0)
> [    3.752588] [<c0501024>] (drm_dev_register) from [<c0523a30>]
> (host1x_drm_probe+0x34/0x58)
> [    3.760883] [<c0523a30>] (host1x_drm_probe) from [<c05570f8>]
> (driver_probe_device+0x254/0x32c)
> [    3.769612] [<c05570f8>] (driver_probe_device) from [<c0555578>]
> (bus_for_each_drv+0x58/0xb8)
> [    3.778145] [<c0555578>] (bus_for_each_drv) from [<c0556dc0>]
> (__device_attach+0xd0/0x138)
> [    3.786436] [<c0556dc0>] (__device_attach) from [<c05562f4>]
> (bus_probe_device+0x84/0x8c)
> [    3.794645] [<c05562f4>] (bus_probe_device) from [<c05545cc>]
> (device_add+0x3b4/0x5b8)
> [    3.802599] [<c05545cc>] (device_add) from [<c04d908c>]
> (host1x_subdev_register+0xac/0xd4)
> [    3.810897] [<c04d908c>] (host1x_subdev_register) from [<c04d958c>]
> (host1x_client_register+0x108/0x128)
> [    3.820412] [<c04d958c>] (host1x_client_register) from [<c05380d0>]
> (tegra_hdmi_probe+0x1e4/0x2d0)
> [    3.829406] [<c05380d0>] (tegra_hdmi_probe) from [<c0558d00>]
> (platform_drv_probe+0x50/0xac)
> [    3.837855] [<c0558d00>] (platform_drv_probe) from [<c05570f8>]
> (driver_probe_device+0x254/0x32c)
> [    3.846756] [<c05570f8>] (driver_probe_device) from [<c0555578>]
> (bus_for_each_drv+0x58/0xb8)
> [    3.855309] [<c0555578>] (bus_for_each_drv) from [<c0556dc0>]
> (__device_attach+0xd0/0x138)
> [    3.863603] [<c0556dc0>] (__device_attach) from [<c05562f4>]
> (bus_probe_device+0x84/0x8c)
> [    3.871809] [<c05562f4>] (bus_probe_device) from [<c0556780>]
> (deferred_probe_work_func+0x4c/0x148)
> [    3.880885] [<c0556780>] (deferred_probe_work_func) from
> [<c013c6e0>] (process_one_work+0x1ec/0x55c)
> [    3.890047] [<c013c6e0>] (process_one_work) from [<c013d830>]
> (worker_thread+0x29c/0x598)
> [    3.898237] [<c013d830>] (worker_thread) from [<c0142414>]
> (kthread+0x14c/0x154)
> [    3.905662] [<c0142414>] (kthread) from [<c01010e8>]
> (ret_from_fork+0x14/0x2c)
> [    3.912901] Exception stack(0xee2b1fb0 to 0xee2b1ff8)
> [    3.917958] 1fa0:                                     00000000
> 00000000 00000000 00000000
> [    3.926153] 1fc0: 00000000 00000000 00000000 00000000 00000000
> 00000000 00000000 00000000
> [    3.934348] 1fe0: 00000000 00000000 00000000 00000000 00000013
> 00000000
> [    3.941050] ---[ end trace f2913c9fb893aca6 ]---
> ...
> [    4.594476] Unable to handle kernel NULL pointer dereference at
> virtual address 00000005
> [    4.602584] pgd =3D b237c3d6
> [    4.605293] [00000005] *pgd=3D00000000
> [    4.608895] Internal error: Oops: 5 [#1] PREEMPT SMP ARM
> [    4.614209] Modules linked in:
> [    4.617274] CPU: 2 PID: 87 Comm: kworker/2:1 Tainted:
> G        W        4.16.0-rc1 #2
> [    4.625105] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
> [    4.631376] Workqueue: events deferred_probe_work_func
> [    4.636525] PC is at tegra_plane_format_mod_supported+0x18/0x30
> [    4.642448] LR is at warn_slowpath_null+0x40/0x48
> [    4.647153] pc : [<c0529fd4>]    lr : [<c0122c80>]    psr: 20000113
> [    4.653419] sp : ee2b1be0  ip : 00000000  fp : 00000001
> [    4.658644] r10: 00000001  r9 : 00000008  r8 : c0e04c48
> [    4.663870] r7 : c0529fbc  r6 : eda9bac4  r5 : 03000000  r4 :
> 00000010
> [    4.670396] r3 : 03000010  r2 : 00000200  r1 : c0ec2540  r0 :
> 00000000
> [    4.676925] Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA
> ARM  Segment none
> [    4.684060] Control: 10c5387d  Table: 8000406a  DAC: 00000051
> [    4.689806] Process kworker/2:1 (pid: 87, stack limit =3D 0x62aacce7)
> [    4.696072] Stack: (0xee2b1be0 to 0xee2b2000)
> ...
> [    4.970477] [<c0529fd4>] (tegra_plane_format_mod_supported) from
> [<c05186cc>] (drm_universal_plane_init+0x2ec/0x59c)
> [    4.981009] [<c05186cc>] (drm_universal_plane_init) from
> [<c052c36c>] (tegra_dc_init+0x1b8/0x510)
> [    4.989891] [<c052c36c>] (tegra_dc_init) from [<c04d8b5c>]
> (host1x_device_init+0x44/0xd0)
> [    4.998076] [<c04d8b5c>] (host1x_device_init) from [<c0523ef4>]
> (tegra_drm_load+0x228/0x308)
> [    5.006523] [<c0523ef4>] (tegra_drm_load) from [<c0501024>]
> (drm_dev_register+0x138/0x1d0)
> [    5.014795] [<c0501024>] (drm_dev_register) from [<c0523a30>]
> (host1x_drm_probe+0x34/0x58)
> [    5.023067] [<c0523a30>] (host1x_drm_probe) from [<c05570f8>]
> (driver_probe_device+0x254/0x32c)
> [    5.031773] [<c05570f8>] (driver_probe_device) from [<c0555578>]
> (bus_for_each_drv+0x58/0xb8)
> [    5.040303] [<c0555578>] (bus_for_each_drv) from [<c0556dc0>]
> (__device_attach+0xd0/0x138)
> [    5.048572] [<c0556dc0>] (__device_attach) from [<c05562f4>]
> (bus_probe_device+0x84/0x8c)
> [    5.056761] [<c05562f4>] (bus_probe_device) from [<c05545cc>]
> (device_add+0x3b4/0x5b8)
> [    5.064688] [<c05545cc>] (device_add) from [<c04d908c>]
> (host1x_subdev_register+0xac/0xd4)
> [    5.072962] [<c04d908c>] (host1x_subdev_register) from [<c04d958c>]
> (host1x_client_register+0x108/0x128)
> [    5.082450] [<c04d958c>] (host1x_client_register) from [<c05380d0>]
> (tegra_hdmi_probe+0x1e4/0x2d0)
> [    5.091418] [<c05380d0>] (tegra_hdmi_probe) from [<c0558d00>]
> (platform_drv_probe+0x50/0xac)
> [    5.099862] [<c0558d00>] (platform_drv_probe) from [<c05570f8>]
> (driver_probe_device+0x254/0x32c)
> [    5.108739] [<c05570f8>] (driver_probe_device) from [<c0555578>]
> (bus_for_each_drv+0x58/0xb8)
> [    5.117268] [<c0555578>] (bus_for_each_drv) from [<c0556dc0>]
> (__device_attach+0xd0/0x138)
> [    5.125537] [<c0556dc0>] (__device_attach) from [<c05562f4>]
> (bus_probe_device+0x84/0x8c)
> [    5.133720] [<c05562f4>] (bus_probe_device) from [<c0556780>]
> (deferred_probe_work_func+0x4c/0x148)
> [    5.142774] [<c0556780>] (deferred_probe_work_func) from
> [<c013c6e0>] (process_one_work+0x1ec/0x55c)
> [    5.151913] [<c013c6e0>] (process_one_work) from [<c013d830>]
> (worker_thread+0x29c/0x598)
> [    5.160100] [<c013d830>] (worker_thread) from [<c0142414>]
> (kthread+0x14c/0x154)
> [    5.167504] [<c0142414>] (kthread) from [<c01010e8>]
> (ret_from_fork+0x14/0x2c)
> [    5.174727] Exception stack(0xee2b1fb0 to 0xee2b1ff8)
> [    5.179784] 1fa0:                                     00000000
> 00000000 00000000 00000000
> [    5.187965] 1fc0: 00000000 00000000 00000000 00000000 00000000
> 00000000 00000000 00000000
> [    5.196147] 1fe0: 00000000 00000000 00000000 00000000 00000013
> 00000000
> [    5.202768] Code: e1a04002 e1a05003 ebff6d07 e1943005 (15d00005)=20
> [    5.208926] ---[ end trace f2913c9fb893aca9 ]---
>=20
> Is this something your drm/tegra/fixes address or do you know what
> might be the issue?

This looks like an issue with the format modifier patch in
drm/tegra/for-next, and I'm somewhat surprised to see that because it
means you're trying to set a format that's not supported by the
drm_format_info() function. It should be easy to fix that, though.

Can you find out which format is missing from the table? Something like
the patch below should show which one is missing.

Thanks,
Thierry

--- >8 ---
diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index 5ca6395cd4d3..07abfc383ae3 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -174,7 +174,7 @@ const struct drm_format_info *__drm_format_info(u32 for=
mat)
 		{ .format =3D DRM_FORMAT_VYUY,		.depth =3D 0,  .num_planes =3D 1, .cpp =
=3D { 2, 0, 0 }, .hsub =3D 2, .vsub =3D 1 },
 		{ .format =3D DRM_FORMAT_AYUV,		.depth =3D 0,  .num_planes =3D 1, .cpp =
=3D { 4, 0, 0 }, .hsub =3D 1, .vsub =3D 1, .has_alpha =3D true },
 	};
-
+	struct drm_format_name_buf buf;
 	unsigned int i;
=20
 	for (i =3D 0; i < ARRAY_SIZE(formats); ++i) {
@@ -182,6 +182,7 @@ const struct drm_format_info *__drm_format_info(u32 for=
mat)
 			return &formats[i];
 	}
=20
+	WARN(1, "format %s not supported\n", drm_get_format_name(format, &buf));
 	return NULL;
 }
=20

--T4sUOijqQbZv57TR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlqv6tUACgkQ3SOs138+
s6HXWA//VAb1d+XaCjt+OX463qzPNDZx+cXNGJgKrDUgnlyfh2hxJG/J8smNkDIF
mgP5tZkYwF+X3MEulq8xRp0ut7KwiBrudSUA2TakPDmkgqhgq9eEisOFrZtiZs/J
D6L+boYU1yd7wiCQZgC9iy/JjF02WiAhaPrTAtKpa02saav+kEbPa+ruuLEr8CoB
MM1jjrMaxYHUSbjU5Nci0iVzw2ewYjeG2ExTdURWAUrPvHYaeJQ1qmia4UppfmC6
GYcUr91ViRYMyGi+j5u2c5XcoGbrO1lQDmHjpxNLf63xi0N1SlMZ9art6S3gtR1j
U38fKU5UN/rAzCXe/Pv1/AXAK5jYq2Rxrp1ZSOHg36FPA98p/mmyhGq945uSDRBS
IuVNEAnSPcEnoX4rfdFMp8p2kfff0clLKqBHim3EDwMzdHkw8vJxwrnHepQiI9E1
g6oy1N2sLtfog7/Ajodgkj5Zx3IuWgJ/sgUFpwxYRWIIFr4eBjVjkRxxqWpKyzOS
+MKPKTu/5NkGYsCK9ca/K/ann6oDrC0L3zpHbzCEpo/X4WLz8vFFkQSj2gnds1nx
63x4Ora249PiWwqG5ZsqqgTmdGK9aenh/gkNYWIIQCzo7Y1ftYrb+2Bci5Vvm4IR
bS1v0tEaR22P18d723pqEH1K83kXeM9bo7dd4ICj4ZRM0uFlzxM=
=QNAO
-----END PGP SIGNATURE-----

--T4sUOijqQbZv57TR--

--===============0579436405==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0579436405==--
