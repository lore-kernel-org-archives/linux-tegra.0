From: Paul Kocialkowski <contact@paulk.fr>
Subject: Re: [PATCH 2/4] ARM: tegra: nyan: Use external control for bq24735
 charger
Date: Wed, 21 Sep 2016 13:03:40 +0200
Message-ID: <1474455820.1239.25.camel@paulk.fr>
References: <20160828173246.32621-1-contact@paulk.fr>
         <20160828173246.32621-2-contact@paulk.fr>
         <00697eef-0b36-1ff5-9c7a-43c1b53b52bc@nvidia.com>
         <1474394567.1215.14.camel@paulk.fr>
         <90828c8d-e46d-0956-d6b3-e88fc90f3049@nvidia.com>
         <1474444619.1239.13.camel@paulk.fr>
         <baca958f-1db6-b9f2-ce94-c523f21d6769@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-AXrLxD+4oIy57TzJkrYi"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <baca958f-1db6-b9f2-ce94-c523f21d6769@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--=-AXrLxD+4oIy57TzJkrYi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 21 septembre 2016 =C3=A0 11:10 +0100, Jon Hunter a =C3=A9crit=
=C2=A0:
> On 21/09/16 08:56, Paul Kocialkowski wrote:
>=20
> ...
>=20
> > Sure, this is exported at: /sys/class/power_supply/bq24735@5-0009
> > Also, note that the power-supply next branch[2] has some more fixes for=
 the
> > bq24735 driver.
>=20
> I tested the bq24735 on next-20160919 without any of your changes and=C2=
=A0
> when connecting or disconnecting the charger I see the following panic.
> Do you see this?

I have not encountered that, but have been basing my work off the latest rc=
, not
linux-next.

> / # [=C2=A0=C2=A0=C2=A030.120384] Unable to handle kernel NULL pointer de=
reference at virtual
> address 00000004
> [=C2=A0=C2=A0=C2=A030.128489] pgd =3D c0004000
> [=C2=A0=C2=A0=C2=A030.131187] [00000004] *pgd=3D00000000
> [=C2=A0=C2=A0=C2=A030.134759] Internal error: Oops: 17 [#1] PREEMPT SMP A=
RM
> [=C2=A0=C2=A0=C2=A030.140141] Modules linked in:
> [=C2=A0=C2=A0=C2=A030.143192] CPU: 1 PID: 71 Comm: kworker/1:1 Not tainte=
d 4.8.0-rc6-next-
> 20160919-00002-gbc9771827865-dirty #574
> [=C2=A0=C2=A0=C2=A030.153254] Hardware name: NVIDIA Tegra SoC (Flattened =
Device Tree)
> [=C2=A0=C2=A0=C2=A030.159509] Workqueue: events power_supply_changed_work
> [=C2=A0=C2=A0=C2=A030.164723] task: ee19f880 task.stack: ee1a0000
> [=C2=A0=C2=A0=C2=A030.169239] PC is at sbs_external_power_changed+0x50/0x=
5c
> [=C2=A0=C2=A0=C2=A030.174624] LR is at mod_timer+0x194/0x270
> [=C2=A0=C2=A0=C2=A030.178705] pc : [<c05b0c58>]=C2=A0=C2=A0=C2=A0=C2=A0lr=
 : [<c017cda0>]=C2=A0=C2=A0=C2=A0=C2=A0psr: 60000113
> [=C2=A0=C2=A0=C2=A030.178705] sp : ee1a1eb8=C2=A0=C2=A0ip : 80000000=C2=
=A0=C2=A0fp : ee8e3680
> [=C2=A0=C2=A0=C2=A030.190155] r10: eef98580=C2=A0=C2=A0r9 : 00000000=C2=
=A0=C2=A0r8 : 00000000
> [=C2=A0=C2=A0=C2=A030.195363] r7 : ee303000=C2=A0=C2=A0r6 : c05afef8=C2=
=A0=C2=A0r5 : ee3e03f8=C2=A0=C2=A0r4 : ee3e03d0
> [=C2=A0=C2=A0=C2=A030.201872] r3 : 00000000=C2=A0=C2=A0r2 : 00000000=C2=
=A0=C2=A0r1 : 40000193=C2=A0=C2=A0r0 : 00000001
> [=C2=A0=C2=A0=C2=A030.208382] Flags: nZCv=C2=A0=C2=A0IRQs on=C2=A0=C2=A0F=
IQs on=C2=A0=C2=A0Mode SVC_32=C2=A0=C2=A0ISA ARM=C2=A0=C2=A0Segment
> none
> [=C2=A0=C2=A0=C2=A030.215497] Control: 10c5387d=C2=A0=C2=A0Table: adcf006=
a=C2=A0=C2=A0DAC: 00000051
> [=C2=A0=C2=A0=C2=A030.221226] Process kworker/1:1 (pid: 71, stack limit =
=3D 0xee1a0210)
> [=C2=A0=C2=A0=C2=A030.227474] Stack: (0xee1a1eb8 to 0xee1a2000)
> [=C2=A0=C2=A0=C2=A030.231816]
> 1ea0:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0edc0bc00 ee303000
> [=C2=A0=C2=A0=C2=A030.239973] 1ec0: c05afef8 c05aff2c edc0bc20 c045ec1c e=
ef95c80 eef95c80
> 00000001 eea82d5c
> [=C2=A0=C2=A0=C2=A030.248136] 1ee0: edc0bd98 00000000 ee3031c0 ee303218 c=
0eab740 c05afcc4
> ee8e3680 ee3031c0
> [=C2=A0=C2=A0=C2=A030.256296] 1f00: eef9b800 00000000 eef98580 c0135824 e=
ef98598 c0e02100
> eef98580 ee8e3698
> [=C2=A0=C2=A0=C2=A030.264453] 1f20: 00000008 eef98598 c0e02100 ee1a0000 e=
ef98580 c0135a74
> ee840f80 ee8e3680
> [=C2=A0=C2=A0=C2=A030.272610] 1f40: c0135a3c 00000000 ee840f80 ee8e3680 c=
0135a3c 00000000
> 00000000 00000000
> [=C2=A0=C2=A0=C2=A030.280766] 1f60: 00000000 c013af18 00000000 00000000 0=
0000000 ee8e3680
> 00000000 00000000
> [=C2=A0=C2=A0=C2=A030.288922] 1f80: ee1a1f80 ee1a1f80 00000000 00000000 e=
e1a1f90 ee1a1f90
> ee1a1fac ee840f80
> [=C2=A0=C2=A0=C2=A030.297078] 1fa0: c013ae3c 00000000 00000000 c01078b8 0=
0000000 00000000
> 00000000 00000000
> [=C2=A0=C2=A0=C2=A030.305234] 1fc0: 00000000 00000000 00000000 00000000 0=
0000000 00000000
> 00000000 00000000
> [=C2=A0=C2=A0=C2=A030.313389] 1fe0: 00000000 00000000 00000000 00000000 0=
0000013 00000000
> 00000000 00000000
> [=C2=A0=C2=A0=C2=A030.321555] [<c05b0c58>] (sbs_external_power_changed) f=
rom [<c05aff2c>]
> (__power_supply_changed_work+0x34/0x3c)
> [=C2=A0=C2=A0=C2=A030.331623] [<c05aff2c>] (__power_supply_changed_work) =
from [<c045ec1c>]
> (class_for_each_device+0x4c/0xb4)
> [=C2=A0=C2=A0=C2=A030.341254] [<c045ec1c>] (class_for_each_device) from [=
<c05afcc4>]
> (power_supply_changed_work+0x5c/0xb0)
> [=C2=A0=C2=A0=C2=A030.350713] [<c05afcc4>] (power_supply_changed_work) fr=
om [<c0135824>]
> (process_one_work+0x124/0x33c)
> [=C2=A0=C2=A0=C2=A030.359912] [<c0135824>] (process_one_work) from [<c013=
5a74>]
> (worker_thread+0x38/0x4d4)
> [=C2=A0=C2=A0=C2=A030.367983] [<c0135a74>] (worker_thread) from [<c013af1=
8>]
> (kthread+0xdc/0xf4)
> [=C2=A0=C2=A0=C2=A030.375187] [<c013af18>] (kthread) from [<c01078b8>]
> (ret_from_fork+0x14/0x3c)
> [=C2=A0=C2=A0=C2=A030.382391] Code: e5911000 e3a00004 ebee0b88 e5943008 (=
e5933004)=C2=A0
> [=C2=A0=C2=A0=C2=A030.388504] ---[ end trace 083d55597e9a2254 ]---
> [=C2=A0=C2=A0=C2=A030.393140] Unable to handle kernel paging request at v=
irtual address
> ffffffec
> [=C2=A0=C2=A0=C2=A030.400342] pgd =3D c0004000
> [=C2=A0=C2=A0=C2=A030.403038] [ffffffec] *pgd=3Dafffd861, *pte=3D00000000=
, *ppte=3D00000000
> [=C2=A0=C2=A0=C2=A030.409309] Internal error: Oops: 37 [#2] PREEMPT SMP A=
RM
> [=C2=A0=C2=A0=C2=A030.414690] Modules linked in:
> [=C2=A0=C2=A0=C2=A030.417738] CPU: 1 PID: 71 Comm: kworker/1:1 Tainted:
> G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A04.8.0-rc6-next-20160919-00002-gbc9771827865-dirty #574
> [=C2=A0=C2=A0=C2=A030.429013] Hardware name: NVIDIA Tegra SoC (Flattened =
Device Tree)
> [=C2=A0=C2=A0=C2=A030.435265] task: ee19f880 task.stack: ee1a0000
> [=C2=A0=C2=A0=C2=A030.439782] PC is at kthread_data+0x4/0xc
> [=C2=A0=C2=A0=C2=A030.443779] LR is at wq_worker_sleeping+0x8/0xc8
> [=C2=A0=C2=A0=C2=A030.448381] pc : [<c013b8a8>]=C2=A0=C2=A0=C2=A0=C2=A0lr=
 : [<c01366e0>]=C2=A0=C2=A0=C2=A0=C2=A0psr: 20000193
> [=C2=A0=C2=A0=C2=A030.448381] sp : ee1a1c58=C2=A0=C2=A0ip : eef98f28=C2=
=A0=C2=A0fp : ee1a1cb4
> [=C2=A0=C2=A0=C2=A030.459836] r10: eef98a00=C2=A0=C2=A0r9 : c0e5f000=C2=
=A0=C2=A0r8 : c0d9ea00
> [=C2=A0=C2=A0=C2=A030.465048] r7 : ee19fcc8=C2=A0=C2=A0r6 : c0e02e08=C2=
=A0=C2=A0r5 : ee19f880=C2=A0=C2=A0r4 : eef98a00
> [=C2=A0=C2=A0=C2=A030.471556] r3 : 00000000=C2=A0=C2=A0r2 : 00000020=C2=
=A0=C2=A0r1 : 00000000=C2=A0=C2=A0r0 : ee19f880
> [=C2=A0=C2=A0=C2=A030.478066] Flags: nzCv=C2=A0=C2=A0IRQs off=C2=A0=C2=A0=
FIQs on=C2=A0=C2=A0Mode SVC_32=C2=A0=C2=A0ISA ARM=C2=A0=C2=A0Segment
> none
> [=C2=A0=C2=A0=C2=A030.485268] Control: 10c5387d=C2=A0=C2=A0Table: adcf006=
a=C2=A0=C2=A0DAC: 00000051
> [=C2=A0=C2=A0=C2=A030.490998] Process kworker/1:1 (pid: 71, stack limit =
=3D 0xee1a0210)
> [=C2=A0=C2=A0=C2=A030.497247] Stack: (0xee1a1c58 to 0xee1a2000)
> [=C2=A0=C2=A0=C2=A030.501590]
> 1c40:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0eef98a00 c0833a68
> [=C2=A0=C2=A0=C2=A030.509747] 1c60: 00000001 ee117a44 c0d99280 a0000193 0=
0000000 c0833d4c
> 00000001 ee117a44
> [=C2=A0=C2=A0=C2=A030.517904] 1c80: 00000000 ee117540 ee19f880 c01faf3c 0=
0000000 ee1a0000
> ee1a18ec 00000001
> [=C2=A0=C2=A0=C2=A030.526060] 1ca0: ee1a1cc8 ee19fc40 c05b0c5c 00000001 e=
e1a1cc4 c0833d4c
> ee19f880 ee1a18ec
> [=C2=A0=C2=A0=C2=A030.534217] 1cc0: ee85d3c0 c012277c ee1a1cc8 ee1a1cc8 0=
0000000 c0e5e2c4
> c0e07638 ee1a1e68
> [=C2=A0=C2=A0=C2=A030.542374] 1ce0: 60000113 0000000b c05b0c5c 00000001 c=
05b0c5a c010b6f8
> ee1a0210 0000000b
> [=C2=A0=C2=A0=C2=A030.550530] 1d00: c0e07638 ee1a0000 bf000000 00000008 6=
5000000 31313935
> 20303030 30613365
> [=C2=A0=C2=A0=C2=A030.558687] 1d20: 34303030 65626520 38623065 35652038 3=
0333439 28203830
> 33393565 34303033
> [=C2=A0=C2=A0=C2=A030.566843] 1d40: 00002029 c01b63c4 c0004000 00000004 e=
e1a1e68 00000017
> 00000000 00000017
> [=C2=A0=C2=A0=C2=A030.575000] 1d60: 00000004 eef98580 ee8e3680 c011a424 0=
0000004 c0115c20
> ee19f880 00000000
> [=C2=A0=C2=A0=C2=A030.583156] 1d80: ee19f900 ee2ecd80 ee19f880 c014a55c c=
014a460 ee19f880
> eef98a00 00000000
> [=C2=A0=C2=A0=C2=A030.591312] 1da0: a0000193 c0e07efc 00000017 c0115888 0=
0000004 ee1a1e68
> ee1a0000 eef98580
> [=C2=A0=C2=A0=C2=A030.599469] 1dc0: ee8e3680 c01012ac 1514622a 00000000 e=
e19f900 c0149578
> eef98a00 ee19f900
> [=C2=A0=C2=A0=C2=A030.607626] 1de0: 00000001 00000000 eef98a38 00000000 0=
00043e1 c014e11c
> ee2ecd00 ee19f900
> [=C2=A0=C2=A0=C2=A030.615781] 1e00: 00000010 00000000 00000006 00000000 0=
0000000 edc45440
> c0d992c4 00000000
> [=C2=A0=C2=A0=C2=A030.623938] 1e20: 00000001 00000000 00000000 00000001 0=
0004b4e 00000000
> 00000001 c0e5f000
> [=C2=A0=C2=A0=C2=A030.632095] 1e40: 00000000 00000000 ee19f900 ee19f900 c=
05b0c58 60000113
> ffffffff ee1a1e9c
> [=C2=A0=C2=A0=C2=A030.640251] 1e60: 00000000 c010bd78 00000001 40000193 0=
0000000 00000000
> ee3e03d0 ee3e03f8
> [=C2=A0=C2=A0=C2=A030.648408] 1e80: c05afef8 ee303000 00000000 00000000 e=
ef98580 ee8e3680
> 80000000 ee1a1eb8
> [=C2=A0=C2=A0=C2=A030.656566] 1ea0: c017cda0 c05b0c58 60000113 ffffffff 0=
0000051 00000000
> edc0bc00 ee303000
> [=C2=A0=C2=A0=C2=A030.664722] 1ec0: c05afef8 c05aff2c edc0bc20 c045ec1c e=
ef95c80 eef95c80
> 00000001 eea82d5c
> [=C2=A0=C2=A0=C2=A030.672886] 1ee0: edc0bd98 00000000 ee3031c0 ee303218 c=
0eab740 c05afcc4
> ee8e3680 ee3031c0
> [=C2=A0=C2=A0=C2=A030.681045] 1f00: eef9b800 00000000 eef98580 c0135824 e=
ef98598 c0e02100
> eef98580 ee8e3698
> [=C2=A0=C2=A0=C2=A030.689202] 1f20: 00000008 eef98598 c0e02100 ee1a0000 e=
ef98580 c0135a74
> ee840f80 ee8e3680
> [=C2=A0=C2=A0=C2=A030.697358] 1f40: c0135a3c 00000000 ee840f80 ee8e3680 c=
0135a3c 00000000
> 00000000 00000000
> [=C2=A0=C2=A0=C2=A030.705515] 1f60: 00000000 c013af18 00000000 00000000 0=
0000000 ee8e3680
> 00000000 00000000
> [=C2=A0=C2=A0=C2=A030.713672] 1f80: ee1a1f80 ee1a1f80 00000001 00010001 e=
e1a1f90 ee1a1f90
> ee1a1fac ee840f80
> [=C2=A0=C2=A0=C2=A030.721827] 1fa0: c013ae3c 00000000 00000000 c01078b8 0=
0000000 00000000
> 00000000 00000000
> [=C2=A0=C2=A0=C2=A030.729983] 1fc0: 00000000 00000000 00000000 00000000 0=
0000000 00000000
> 00000000 00000000
> [=C2=A0=C2=A0=C2=A030.738140] 1fe0: 00000000 00000000 00000000 00000000 0=
0000013 00000000
> 00000000 00000000
> [=C2=A0=C2=A0=C2=A030.746304] [<c013b8a8>] (kthread_data) from [<c01366e0=
>]
> (wq_worker_sleeping+0x8/0xc8)
> [=C2=A0=C2=A0=C2=A030.754292] [<c01366e0>] (wq_worker_sleeping) from [<c0=
833a68>]
> (__schedule+0x45c/0x6f0)
> [=C2=A0=C2=A0=C2=A030.762364] [<c0833a68>] (__schedule) from [<c0833d4c>]
> (schedule+0x50/0xb4)
> [=C2=A0=C2=A0=C2=A030.769394] [<c0833d4c>] (schedule) from [<c012277c>] (=
do_exit+0x6e8/0xa90)
> [=C2=A0=C2=A0=C2=A030.776340] [<c012277c>] (do_exit) from [<c010b6f8>] (d=
ie+0x470/0x488)
> [=C2=A0=C2=A0=C2=A030.782853] [<c010b6f8>] (die) from [<c011a424>]
> (__do_kernel_fault.part.0+0x64/0x1e4)
> [=C2=A0=C2=A0=C2=A030.790751] [<c011a424>] (__do_kernel_fault.part.0) fro=
m [<c0115c20>]
> (do_page_fault+0x398/0x3a4)
> [=C2=A0=C2=A0=C2=A030.799601] [<c0115c20>] (do_page_fault) from [<c01012a=
c>]
> (do_DataAbort+0x38/0xb8)
> [=C2=A0=C2=A0=C2=A030.807238] [<c01012ac>] (do_DataAbort) from [<c010bd78=
>]
> (__dabt_svc+0x58/0x80)
> [=C2=A0=C2=A0=C2=A030.814613] Exception stack(0xee1a1e68 to 0xee1a1eb0)
> [=C2=A0=C2=A0=C2=A030.819650] 1e60:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A000000001 40000193 00000000 00000000
> ee3e03d0 ee3e03f8
> [=C2=A0=C2=A0=C2=A030.827807] 1e80: c05afef8 ee303000 00000000 00000000 e=
ef98580 ee8e3680
> 80000000 ee1a1eb8
> [=C2=A0=C2=A0=C2=A030.835962] 1ea0: c017cda0 c05b0c58 60000113 ffffffff
> [=C2=A0=C2=A0=C2=A030.841002] [<c010bd78>] (__dabt_svc) from [<c05b0c58>]
> (sbs_external_power_changed+0x50/0x5c)
> [=C2=A0=C2=A0=C2=A030.849593] [<c05b0c58>] (sbs_external_power_changed) f=
rom [<c05aff2c>]
> (__power_supply_changed_work+0x34/0x3c)
> [=C2=A0=C2=A0=C2=A030.859660] [<c05aff2c>] (__power_supply_changed_work) =
from [<c045ec1c>]
> (class_for_each_device+0x4c/0xb4)
> [=C2=A0=C2=A0=C2=A030.869291] [<c045ec1c>] (class_for_each_device) from [=
<c05afcc4>]
> (power_supply_changed_work+0x5c/0xb0)
> [=C2=A0=C2=A0=C2=A030.878762] [<c05afcc4>] (power_supply_changed_work) fr=
om [<c0135824>]
> (process_one_work+0x124/0x33c)
> [=C2=A0=C2=A0=C2=A030.887963] [<c0135824>] (process_one_work) from [<c013=
5a74>]
> (worker_thread+0x38/0x4d4)
> [=C2=A0=C2=A0=C2=A030.896034] [<c0135a74>] (worker_thread) from [<c013af1=
8>]
> (kthread+0xdc/0xf4)
> [=C2=A0=C2=A0=C2=A030.903240] [<c013af18>] (kthread) from [<c01078b8>]
> (ret_from_fork+0x14/0x3c)
> [=C2=A0=C2=A0=C2=A030.910443] Code: e34c00a4 ebff90d2 eafffff2 e5903418 (=
e5130014)=C2=A0
> [=C2=A0=C2=A0=C2=A030.916520] ---[ end trace 083d55597e9a2255 ]---
> [=C2=A0=C2=A0=C2=A030.921122] Fixing recursive fault but reboot is needed=
!
>=20
>=20
--=20
Paul Kocialkowski, developer of low-level free software for embedded device=
s

Website: https://www.paulk.fr/
Coding blog: https://code.paulk.fr/
Git repositories: https://git.paulk.fr/ https://git.code.paulk.fr/
--=-AXrLxD+4oIy57TzJkrYi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJX4mkMAAoJEIT9weqP7pUMKrAP/iBWzsn7Cp2gd8/EvXpkVhmO
0H0jpbCzCha5iDbNMyxNv7mNZWzimfDbtjboHXrgxthdXZiIUKscAK40PR7SM6M7
RgFS5ttDSlFJ7gLL8gCc/N6W3Yt2dO2vrKzItUAt70lntcVM2iIgjpNPWwK3qZQ7
KVKMhBhMxQ7KBN4/+ev3hqUJN+AScW7AHsiF2t5Fpd0o/ry9KBufZISqhWl1RsD+
SiMVEh7eI/8ynGr9EKNp7DwCyD3iDEfVi2TOwiZ0iWGbGdS5k3C1Lg0RtxVzwP3Y
NVegdSpSOyIQMYm8nvJzTC//kwA04DQdADOIM8d8YJlmc7lOCDSOC/M4x2cvolKI
dUF3dFrmx7oBeWJ1guFz3rKAoEYeFNLXfd2Oy0rcgzDoM+nmskchjN8RIQS5MhG3
/IapPIENj/BqfsRYdJE5QgUphisXDoL6t/+2KylPaGZHyKW09MfQbX9Kn05AxD7G
rS9SqEPkIMoWRv9HzHMHZPfUFuH6EEh1InZWG/r4L3jodr+Ey1cbuNzDxzkRGFfR
+A4/vc+tjv11mkSANue5hWHu3MDCDMUtYgbc3RuCfVg2DdkS+JTIjZaUOWcUS/c2
F4eZEfZ2B3Iy5lble1WQ/YX+nek8dP75i7rreYm4GK9TlAxHfsxf6by+uEHndNQ7
xv77j33y5ZNhGNvTIQ3E
=M0ik
-----END PGP SIGNATURE-----

--=-AXrLxD+4oIy57TzJkrYi--
