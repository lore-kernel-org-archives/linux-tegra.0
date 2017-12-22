From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Nouveau] [bug report] null ptr deref in nouveau_platform_probe
 (tegra186-p2771-0000)
Date: Fri, 22 Dec 2017 09:13:57 +0100
Message-ID: <20171222081357.GA25205@ulmo>
References: <CAHMsQjWKhgm5BnngHtH6QeWumNrbSS=LaTRD=XCSy5+iovg7mA@mail.gmail.com>
 <20171220190405.GD9687@ulmo>
 <CAHMsQjXAXj-0gctfkpi+f8cuPrxF67BWNnG0ZsnTHL3u307vOA@mail.gmail.com>
 <20171221181141.GA31262@ulmo>
 <CAHMsQjW5HKpZWMgx9=77z4GC0u1pfgncv353G1LbMkNxMV=-6w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3MwIy2ne0vdjdPXF"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAHMsQjW5HKpZWMgx9=77z4GC0u1pfgncv353G1LbMkNxMV=-6w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anthony Eden <aeden-EfZU8u+QLuPpgkiH4x7ZXw@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--3MwIy2ne0vdjdPXF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 21, 2017 at 02:37:59PM -0500, Anthony Eden wrote:
> I applied the changes manually. This time, Xorg is actually starting...
>=20
> [   16.862744] WARNING: CPU: 3 PID: 381 at
> drivers/gpu/drm/nouveau/nouveau_bo.c:280 nouveau_bo_new+0x450/0x4d0
> [nouveau]
> [   16.873333] Modules linked in: nouveau i2c_algo_bit ttm tegra_drm
> gpio_keys drm_kms_helper drm drm_panel_orientation_quirks(P) host1x
> dwmac_dwc_qos_eth stmmac_platform stmmac ptp pps_core
> syscopyarea sysfillrect sysimgblt fb_sys_fops
> [   16.894001] CPU: 3 PID: 381 Comm: Xorg Tainted: P S
> 4.15.0-rc3-next-20171214-ARCH-AEDEN+ #3
> [   16.903546] Hardware name: NVIDIA Tegra186 P2771-0000 Development Boar=
d (DT)
> [   16.910578] pstate: 60000005 (nZCv daif -PAN -UAO)
> [   16.915527] pc : nouveau_bo_new+0x450/0x4d0 [nouveau]
> [   16.920729] lr : nouveau_bo_new+0x78/0x4d0 [nouveau]
> [   16.925678] sp : ffff00000a34bb40
> [   16.928980] x29: ffff00000a34bb60 x28: ffff8001f67f0598
> [   16.934280] x27: 0000000000000000 x26: ffff8001c8858c00
> [   16.939579] x25: 0000000000020000 x24: 0000000000000004
> [   16.944878] x23: 0000000000020000 x22: 0000000000000000
> [   16.950176] x21: 0000000000000000 x20: 0000000000000000
> [   16.955475] x19: ffff8001c891d000 x18: 0000000000000080
> [   16.960773] x17: 0000ffffba6a7bc0 x16: ffff000008294300
> [   16.966072] x15: 0000000000000001 x14: 000000000000002f
> [   16.971370] x13: 0000000000000000 x12: 0000ffffbac20030
> [   16.976667] x11: 0000000000000009 x10: ffff8001c8b7ce80
> [   16.981964] x9 : 0000000000000004 x8 : 0000000000000001
> [   16.987263] x7 : 0000000000000006 x6 : 000000000000000a
> [   16.992562] x5 : 0000000000000000 x4 : 00000000ffffffff
> [   16.997860] x3 : 0000000000000004 x2 : 0000000000000005
> [   17.003157] x1 : 0000000000000006 x0 : ffff8001c8b7ce8c
> [   17.008456] Call trace:
> [   17.011066]  nouveau_bo_new+0x450/0x4d0 [nouveau]
> [   17.015924]  nouveau_gem_new+0xa4/0x148 [nouveau]
> [   17.020771]  nouveau_gem_ioctl_new+0x48/0xd8 [nouveau]
> [   17.025953]  drm_ioctl_kernel+0x70/0xd8 [drm]
> [   17.030343]  drm_ioctl+0x180/0x3e0 [drm]
> [   17.034424]  nouveau_drm_ioctl+0x6c/0xc8 [nouveau]
> [   17.039207]  do_vfs_ioctl+0xb0/0x730
> [   17.042771]  SyS_ioctl+0x8c/0xa8
> [   17.045991]  el0_svc_naked+0x20/0x24
> [   17.049555] ---[ end trace d0b542d40499d1bb ]---
> [   17.252701] nouveau 17000000.gpu: fifo: read fault at 0000011000
> engine 06 [HOST0] client 06 [GPC0/L1_2] reason 02 [PTE] on channel 1
> [00f206d000 Xorg[381]]
> [   17.266694] nouveau 17000000.gpu: fifo: channel 1: killed
> [   17.272090] nouveau 17000000.gpu: fifo: runlist 0: scheduled for recov=
ery
> [  17.278901] nouveau 17000000.gpu: Xorg[381]: channel 1 killed!
>=20
> In case this is useful, I put the diff on my linux-next 2017-12-14 tree h=
ere:
> https://github.com/aleden/scratch/blob/c16f5dcee60971b1fbdc6b9e6059fecbda=
27bf55/linux-next-2017-12-14.1.diff

Looks like Ben updated his branch sometime between our mails, since the
top three patches you seem to have ended up applying aren't the ones
that I had in mind. Sorry about that.

Specifically I think you need these three patches:

	https://github.com/skeggsb/nouveau/commit/46ae630592a9082eea0ba513f588faac=
1014b7ab
	https://github.com/skeggsb/nouveau/commit/56bd00148306b14ae7b7d683c755992f=
47539fcc
	https://github.com/skeggsb/nouveau/commit/0fbb2f642a1714626c945ec14c892dbf=
64bb4f22

The first of those you already have. I'm fairly certain that the second
patch will fix the "fifo: read fault" errors.

I'm curious, though, how you manage to X to get the GPU involved at all
on a Jetson TX2. Are you setting up DRI_PRIME? Or using Mesa patches to
enable a "renderonly" setup?

Thanks,
Thierry

--3MwIy2ne0vdjdPXF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlo8vsAACgkQ3SOs138+
s6EKmA/+KCx4WXewOIOuBVSmQaH4C/btRwULaSL2pA2n5aVmMSrrsOqMtrN/eG4R
xPsu5LoFnFm+uPRh7gHenKlVzggCVg7UsVEmoVUC0laORXd+cq+f5tsdyJfFS3Ad
rzt2WqwMZ3DUHgveST1OSYy/V+RZljDkeZCFD5eMe2lNnG3ZXdHYsjoiCOEMYjJ/
647BWc8XZV1PMUvTi20HfTg/kWG+uvyOXRv2UGy1aETMO1+vsPAqciQxAHQ1i3h3
0zTqIKCxfEMHDCMB9zspVDqBnObkjo1tKSoARAe3SoTig8i40ESLPrSG9YPh5ysC
T24O2GNsGSP8ooc00f8ElM5qpp1AYObBYOMALbfdk6E/VSzlaVTginEP0oB6RAes
Pt5BnEOKNcswQveNerWVngjovO1wTJD5yFHNIqse/RaXwbQ+uPK1XbZcam4DVFMX
zCIMH8rzuKJ4L8x5mjzhvWVnAJMaNr9M6kS6zqk+6OnFL70eAhAx6tVwVJjLusJO
Ugx8TNwrYrebmHZLku6RwVuGWy+QiCtW/bGDmVphzNJPTGmw6ABch6dQFziWV8WE
psNl00SJWj2vuDOk+X1Thf5YXvNPSRfZlLEo8uRq6raWMZH1LS0ehBI44aaXh6iO
t5W9G2kwi2S1MiCPcqpHfQefr4dbo3HOxI+5X0kQ5L9Id4I1RhY=
=LIEG
-----END PGP SIGNATURE-----

--3MwIy2ne0vdjdPXF--
