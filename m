From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Nouveau] [bug report] null ptr deref in nouveau_platform_probe
 (tegra186-p2771-0000)
Date: Wed, 20 Dec 2017 20:04:05 +0100
Message-ID: <20171220190405.GD9687@ulmo>
References: <CAHMsQjWKhgm5BnngHtH6QeWumNrbSS=LaTRD=XCSy5+iovg7mA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="XvKFcGCOAo53UbWW"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAHMsQjWKhgm5BnngHtH6QeWumNrbSS=LaTRD=XCSy5+iovg7mA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anthony Eden <aeden-EfZU8u+QLuPpgkiH4x7ZXw@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--XvKFcGCOAo53UbWW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2017 at 04:09:14PM -0500, Anthony Eden wrote:
> With linux-next-2017-12-14, I get a crash when nouveau is loaded by
> systemd-udevd.
>=20
> [   12.050625] Unable to handle kernel NULL pointer dereference at virtual
> address 00000058
> [   12.050627] Mem abort info:
> [   12.050628]   ESR =3D 0x96000004
> [   12.050630]   Exception class =3D DABT (current EL), IL =3D 32 bits
> [   12.050631]   SET =3D 0, FnV =3D 0
> [   12.050632]   EA =3D 0, S1PTW =3D 0
> [   12.050633] Data abort info:
> [   12.050634]   ISV =3D 0, ISS =3D 0x00000004
> [   12.050635]   CM =3D 0, WnR =3D 0
> [   12.050637] user pgtable: 4k pages, 48-bit VAs, pgd =3D 00000000af2ac1=
b1
> [   12.050639] [0000000000000058] *pgd=3D0000000000000000
> [   12.050643] Internal error: Oops: 96000004 [#1] SMP
> [   12.050644] Modules linked in: dwmac_dwc_qos_eth(+) stmmac_platform
> stmmac ptp nouveau(+) tegra_drm(+) i2c_algo_bit ttm gpio_keys
> drm_kms_helper drm drm_panel_orientation_quirks(P) syscopy
> area sysfillrect sysimgblt fb_sys_fops pps_core host1x
> [   12.050665] CPU: 0 PID: 261 Comm: systemd-udevd Tainted: P S
>   4.15.0-rc3-next-20171214-ARCH-AEDEN+ #3
> [   12.050666] Hardware name: NVIDIA Tegra186 P2771-0000 Development Board
> (DT)
> [   12.050668] pstate: 80000005 (Nzcv daif -PAN -UAO)
> [   12.050675] pc : mutex_lock+0x28/0x58
> [   12.050676] lr : mutex_lock+0x1c/0x58
> [   12.050677] sp : ffff00000a33b970
> [   12.050679] x29: ffff00000a33b970 x28: ffff000009527a20
> [   12.050682] x27: ffff8001c5089c00 x26: ffffffffffffffff
> [   12.050684] x25: 0000000000000001 x24: 0000000000000001
> [   12.050686] x23: 0000000000000000 x22: 0000000000000000
> [   12.050689] x21: ffff8001c8c5af80 x20: 0000000000000058
> [   12.050691] x19: 0000000000000058 x18: 0000000000000230
> [   12.050693] x17: fffffffffffffff0 x16: ffff7e00071fb300
> [   12.050695] x15: 0000000000000000 x14: ffffffffffffffff
> [   12.050697] x13: 0000000000000038 x12: 0000000000000018
> [   12.050700] x11: 0101010101010101 x10: 7f7f7f7f7f7f7f7f
> [   12.050702] x9 : 0000000000000000 x8 : ffff8001c8c5b000
> [   12.050704] x7 : 0000000000000000 x6 : 000000000000003f
> [   12.050706] x5 : 0000000000000040 x4 : 0000000000000000
> [   12.050708] x3 : 0000000000000004 x2 : 0000000000000000
> [   12.050710] x1 : ffff8001c915b800 x0 : 0000000000000000
> [   12.050713] Process systemd-udevd (pid: 261, stack limit =3D
> 0x00000000247b2b64)
> [   12.050714] Call trace:
> [   12.050717]  mutex_lock+0x28/0x58
> [   12.050721]  iommu_attach_device+0xac/0xf8
> [   12.050948]  nvkm_device_tegra_new+0x260/0x510 [nouveau]
> [   12.051166]  nouveau_platform_device_create+0x48/0xa8 [nouveau]
> [   12.051364]  nouveau_platform_probe+0x34/0x80 [nouveau]
> [   12.051368]  platform_drv_probe+0x60/0xc0
> [   12.051372]  driver_probe_device+0x33c/0x4a0
> [   12.051375]  __driver_attach+0xdc/0x128
> [   12.051377]  bus_for_each_dev+0x5c/0xa8
> [   12.051379]  driver_attach+0x30/0x40
> [   12.051381]  bus_add_driver+0x218/0x2b8
> [   12.051384]  driver_register+0x6c/0x118
> [   12.051385]  __platform_driver_register+0x54/0x60
> [   12.051578]  nouveau_drm_init+0x164/0x1000 [nouveau]
> [   12.051584]  do_one_initcall+0x44/0x138
> [   12.051588]  do_init_module+0x64/0x1dc
> [   12.051590]  load_module+0x12f4/0x14b8
> [   12.051592]  SyS_finit_module+0xd8/0xf0
> [   12.051594]  el0_svc_naked+0x20/0x24
> [   12.051597] Code: 97fffa1e d2800000 d5384101 f9800271 (c85ffe62)
> [   12.051600] ---[ end trace 7e15532ee457d321 ]---
> [   12.346156] iommu: Adding device 15220000.display to group 1
> [   12.360735] tegra-dpaux 15040000.dpaux: 15040000.dpaux supply vdd not
> found, using dummy regulator
> [   12.372895] tegra-dpaux 155c0000.dpaux: 155c0000.dpaux supply vdd not
> found, using dummy regulator
> [   12.384763] tegra-sor 15580000.sor: failed to probe output: -517
> [   12.391830] tegra-sor 15580000.sor: failed to probe output: -517

Hi Anthony,

can you try the attached patch? I've had that in my tree for a little
while as part of a small series that fixes up IOMMU usage (groups are
really better for a number of reasons than directly attaching to
devices), but kept forgetting to send it out.

Thierry
--- >8 ---
=46rom c7684f9fab66cf59838f3efbb271fb50d68711a5 Mon Sep 17 00:00:00 2001
=46rom: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Date: Thu, 14 Dec 2017 13:54:54 +0100
Subject: [PATCH] drm/nouveau: tegra: Use IOMMU groups

Use IOMMU groups to attach the GPU to its IOMMU domain. This is not
strictly necessary because the domain isn't shared with any other
device, but it makes the code consistent with how IOMMU is handled in
other drivers and provides an easy way to detect when no IOMMU has
been attached via device tree.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/include/nvkm/core/tegra.h  |  1 +
 drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c | 18 +++++++++++-------
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/tegra.h b/drivers/gp=
u/drm/nouveau/include/nvkm/core/tegra.h
index 5c102d0206a7..5a9a796380dc 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/tegra.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/tegra.h
@@ -25,6 +25,7 @@ struct nvkm_device_tegra {
=20
 		struct nvkm_mm mm;
 		struct iommu_domain *domain;
+		struct iommu_group *group;
 		unsigned long pgshift;
 	} iommu;
=20
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c b/drivers/g=
pu/drm/nouveau/nvkm/engine/device/tegra.c
index 78597da6313a..1f07999aea1d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
@@ -110,7 +110,8 @@ nvkm_device_tegra_probe_iommu(struct nvkm_device_tegra =
*tdev)
=20
 	mutex_init(&tdev->iommu.mutex);
=20
-	if (iommu_present(&platform_bus_type)) {
+	tdev->iommu.group =3D iommu_group_get(dev);
+	if (tdev->iommu.group) {
 		tdev->iommu.domain =3D iommu_domain_alloc(&platform_bus_type);
 		if (!tdev->iommu.domain)
 			goto error;
@@ -132,7 +133,7 @@ nvkm_device_tegra_probe_iommu(struct nvkm_device_tegra =
*tdev)
 			tdev->iommu.pgshift -=3D 1;
 		}
=20
-		ret =3D iommu_attach_device(tdev->iommu.domain, dev);
+		ret =3D iommu_attach_group(tdev->iommu.domain, tdev->iommu.group);
 		if (ret)
 			goto free_domain;
=20
@@ -140,19 +141,21 @@ nvkm_device_tegra_probe_iommu(struct nvkm_device_tegr=
a *tdev)
 				   (1ULL << tdev->func->iommu_bit) >>
 				   tdev->iommu.pgshift, 1);
 		if (ret)
-			goto detach_device;
+			goto detach_group;
 	}
=20
 	return;
=20
-detach_device:
-	iommu_detach_device(tdev->iommu.domain, dev);
+detach_group:
+	iommu_detach_group(tdev->iommu.domain, tdev->iommu.group);
=20
 free_domain:
 	iommu_domain_free(tdev->iommu.domain);
=20
 error:
+	iommu_group_put(tdev->iommu.group);
 	tdev->iommu.domain =3D NULL;
+	tdev->iommu.group =3D NULL;
 	tdev->iommu.pgshift =3D 0;
 	dev_err(dev, "cannot initialize IOMMU MM\n");
 #endif
@@ -162,10 +165,11 @@ static void
 nvkm_device_tegra_remove_iommu(struct nvkm_device_tegra *tdev)
 {
 #if IS_ENABLED(CONFIG_IOMMU_API)
-	if (tdev->iommu.domain) {
+	if (tdev->iommu.group && tdev->iommu.domain) {
 		nvkm_mm_fini(&tdev->iommu.mm);
-		iommu_detach_device(tdev->iommu.domain, tdev->device.dev);
+		iommu_detach_group(tdev->iommu.domain, tdev->iommu.group);
 		iommu_domain_free(tdev->iommu.domain);
+		iommu_group_put(tdev->iommu.group);
 	}
 #endif
 }
--=20
2.15.1


--XvKFcGCOAo53UbWW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlo6tCUACgkQ3SOs138+
s6HM+A/+KS+tnTF9OjNAWQfFim7vZKVnMzcICL5ixS0TavN695cmQkpxW7pR5siW
FJN3sJm8mZHkjo1AOKn3EnztunBaLzavVtP6Xg+wG8fTX91+AxfPPodig1h2TTc4
sgLhxpIew4nUlskiSoe+d3cDFZS2ru1lljdzzR/wYdwJK1owGcz/1RQGAR073trD
jP75WeHoq0u22HoMfYAHmj/SBopRg33jJylAV0YfoTnio3JFX+BmGidXQognUYud
2TcAXRfLFAKSc70qW8HY5NB8LIAoUByUBs0TM/xJjJ3Yb0+mg/Skg4Uhcieg9Bzq
Hd3kE+qvi6+fgXJa/C0PjM2YmRXs3AMaQdjQI1UtMlD7j7REAdL5Jumt1i3N76Jr
pNQDM7zmhmGPUEQI/eRZfb2orSFFr9sg1akV7VPpL61ZslrfG+ejlVhNw1S+47TN
Kbmxbkfl9m+FXEkfn4msRrUPiPZQQ7To9/ADsm038XbyvHha3fRfvg6/ZLZKFcTe
0yJTO0pabCsDGs4J+KUDNPy8enOU43o6XVkk8g98M5RM+a0eQj7mKN6P5yWOhR4g
74U73gfn8B/XeNQX6Z1YAtgfXGt/v/RBxN/8BGPN5RQTJOhGNRrjc2CJlNfsX4bM
87+qwgdTpKP6DfczIItHDmPC5c6Tp9hus7EuRZN8tf1KVlgrPQA=
=4iLG
-----END PGP SIGNATURE-----

--XvKFcGCOAo53UbWW--
