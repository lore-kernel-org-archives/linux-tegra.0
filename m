From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: Unstable Kernel behavior on an ARM based board
Date: Tue, 5 Mar 2019 12:57:30 +0100
Message-ID: <20190305115730.GE26369@ulmo>
References: <20190302123907.qoe46qs6qmx7qnjs@shell.armlinux.org.uk>
 <453072a9-52e2-7591-750f-624ca27e0bbf@gmx.net>
 <CA+_ZnZTrGCzPLKWZdxBzV1Z9b+c-Sp27DeUeV2XFW0+ZNZipGw@mail.gmail.com>
 <e530ec49-942d-a993-9081-901c0ce29c75@arm.com>
 <CA+_ZnZTCtghS+oUdXGW+h6SVD6nMPfsyDAvOwEugrhx6NJ3yFg@mail.gmail.com>
 <20190304142546.GB24676@ulmo>
 <CA+_ZnZQRV_7ytmbQZvWZUuyYiai0+Yo-pqV19RKebWAwSQokxQ@mail.gmail.com>
 <20190305100731.uz6tleu3fkaruwb6@shell.armlinux.org.uk>
 <CA+_ZnZTeZLyCcjZduQODzjWxTpU96AefzvTBDFbq2CSjVQxONg@mail.gmail.com>
 <20190305112226.rhbl3dwopmip45ja@shell.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4846032223771148353=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190305112226.rhbl3dwopmip45ja@shell.armlinux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc: Embedded Engineer <embed786@gmail.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Andrew Lunn <andrew@lunn.ch>, Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============4846032223771148353==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XuV1QlJbYrcVoo+x"
Content-Disposition: inline


--XuV1QlJbYrcVoo+x
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 05, 2019 at 11:22:26AM +0000, Russell King - ARM Linux admin wr=
ote:
> On Tue, Mar 05, 2019 at 03:29:26PM +0500, Embedded Engineer wrote:
> > On Tue, Mar 5, 2019 at 3:07 PM Russell King - ARM Linux admin
> > <linux@armlinux.org.uk> wrote:
> > >
> > > Please apply this patch so we can see the (ptrval) values.  Thanks.
> >=20
> > Please find below logs after applying patch:
> >=20
> > https://pastebin.com/6TaBxPX5
>=20
> So we have a pattern here:
>=20
> tegra-udc 7d000000.usb: dma_pool_alloc ci_hw_qh, ec056080 (corrupted)
> 00000000: c0 00 00 00 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 =C2=A0.........=
=2E......
> 00000010: a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 =C2=A0.........=
=2E......
> 00000020: 80 00 00 00 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 =C2=A0.........=
=2E......
> 00000030: a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 =C2=A0.........=
=2E......
> tegra-udc 7d000000.usb: dma_pool_alloc ci_hw_qh, ec056140 (corrupted)
> 00000000: 80 01 00 00 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 =C2=A0.........=
=2E......
> 00000010: a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 =C2=A0.........=
=2E......
> 00000020: 40 01 00 00 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 =C2=A0@........=
=2E......
> 00000030: a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 =C2=A0.........=
=2E......
> tegra-udc 7d000000.usb: dma_pool_alloc ci_hw_qh, ec0561c0 (corrupted)
> 00000000: 00 02 00 00 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 =C2=A0.........=
=2E......
> 00000010: a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 =C2=A0.........=
=2E......
> 00000020: 40 03 00 00 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 =C2=A0@........=
=2E......
> 00000030: a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 =C2=A0.........=
=2E......
> tegra-udc 7d000000.usb: dma_pool_alloc ci_hw_qh, ec056200 (corrupted)
> 00000000: 40 02 00 00 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 =C2=A0@........=
=2E......
> 00000010: a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7=C2=A0 .........=
=2E......
> 00000020: 40 05 00 00 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 =C2=A0@........=
=2E......
> 00000030: a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 =C2=A0.........=
=2E......
>=20
> and so it goes on.
>=20
> The first four bytes are the offset to the next free block of memory in
> this page, so can be ignored.  The remainder of the bytes should all be
> 0xa7, but every word at offset 32 into these is corrupted with what
> looks to be a similar offset.
>=20
> We dump 0x40 bytes, which, reading the code makes the pool size 0x40
> bytes in size.  Tabulating the object offset, the next offset, and
> the corruption at offset 32.  Corruption1 is from your latest log,
> corruption2 is derived from your previous log using the next pointer
> to tie up between the two:
>=20
> object offset	next		corruption1	corruption2
> 0x0080		0x00c0		0x00000080	0x00000080
> 0x0140		0x0180		0x00000140	0x00000100
> 0x01c0		0x0200		0x00000340	0x000001c0
> 0x0200		0x0240		0x00000540	0x000001c0
> 0x0280		0x02c0		0x00000340	0x00000300
> 0x0340		0x0380		0x00000540	0x00000140
> 0x03c0		0x0400		0x00000540	0x00000300
> 0x0400		0x0440		0x000003c0	0x00000140
> 0x0480		0x04c0		0x00000540	0x000003c0
> 0x0540		0x0580		0x00000480	0x00000540
> 0x05c0		0x0600		0x000005c0	0x000005c0
> 0x0600		0x0640		0x00000500	0x000005c0
> 0x0680		0x06c0		0x00000740	0x00000680
> ??????		0x0780				0x00000740
> 0x07c0		0x0800		0x000007c0	0x00000700
>=20
> The corruption looks very much like offset values, except they do not
> seem to follow any rhyme or reason.  They also appear to be different
> on each boot.
>=20
> Given that the sequence here when a pool allocation occurs is:
>=20
> 1. allocate DMA coherent page
> 2. memset entire page with 0xa7
> 3. write next offsets
> 4. initialise 'offset' to zero (offset of first free object)
> 5. add page to pools list of pages
> 6. allocate first object, updating offset to the next free offset read
>    from the first word of the object.
>=20
> then when the next allocation request comes along, we allocate the
> next object in the same way as step 6.  At the point of allocating the
> third object, we find that there is corruption in the third object at
> 0x20 bytes into it - or 0xa0 bytes into the page.
>=20
> Now, what does the driver that's allocating these do with them?  That
> is done via init_eps() in drivers/usb/chipidea/udc.c, which doesn't do
> anything with the allocated memory.  This is the only place that the
> driver allocates from this DMA pool, which is done in a loop, so we
> know that the objects allocated from this pool will be in relatively
> quick succession.
>=20
> So this does not make sense.
>=20
> I really doubt that there is anything wrong with the kernel - this USB
> driver is used on other SoCs (such as iMX6) and does not exhibit this
> problem - it also works on the Tegra TK1 platform as well.
>=20
> You are definitely seeing memory corruption here - but given what the
> above looks like, I'd put forward another possible scenario - maybe
> u-boot or something else is leaving a USB controller or some other DMA
> agent active, which is writing over memory while the kernel is trying
> to boot, resulting in memory corruption.

That had occurred to me as well. The kernel command line contains a
couple of memory regions that I think our downstream kernel parses and
uses to reserve memory (redacted here for readability):

	console=3DttyS0,115200n8
	console=3Dtty1
	no_console_suspend=3D1
	lp0_vec=3D2064@0xf46ff000
	mem=3D2015M@2048M
	memtype=3D255
	ddr_die=3D2048M@2048M
	section=3D256M
	pmuboard=3D0x0177:0x0000:0x02:0x43:0x00
	tsec=3D32M@3913M
	otf_key=3Dc75e5bb91eb3bd947560357b64422f85
	usbcore.old_scheme_first=3D1
	core_edp_mv=3D1150
	core_edp_ma=3D4000
	tegraid=3D40.1.1.0.0
	debug_uartport=3Dlsport,3
	power_supply=3DAdapter
	audio_codec=3Drt5640
	modem_id=3D0
	android.kerneltype=3Dnormal
	fbcon=3Dmap:1
	commchip_id=3D0
	usb_port_owner_info=3D0
	lane_owner_info=3D6
	emc_max_dvfs=3D0
	touch_id=3D0@0
	board_info=3D0x0177:0x0000:0x02:0x43:0x00
	net.ifnames=3D0
	root=3D/dev/mmcblk1p1
	rw
	rootwait
	tegraboot=3Dsdmmc
	gpt
	maxcpus=3D0
	pci=3Dnoaer

Two things stand out here:

	mem=3D2015M@2048M
	tsec=3D32M@3913M

So it looks like there are two carveout regions that the kernel isn't
supposed to touch and presumably somebody else could be using them. If
there's overlap between them and the DMA memory used by the DMA pool,
that could perhaps explain what's going on here.

Can you try the following patch and send the boot log again?

Thanks,
Thierry

--- >8 ---
diff --git a/mm/dmapool.c b/mm/dmapool.c
index 76a160083506..6343d74cb963 100644
--- a/mm/dmapool.c
+++ b/mm/dmapool.c
@@ -361,11 +361,11 @@ void *dma_pool_alloc(struct dma_pool *pool, gfp_t mem=
_flags,
 				continue;
 			if (pool->dev)
 				dev_err(pool->dev,
-					"dma_pool_alloc %s, %p (corrupted)\n",
-					pool->name, retval);
+					"dma_pool_alloc %s, %px/%pad (corrupted)\n",
+					pool->name, retval, handle);
 			else
-				pr_err("dma_pool_alloc %s, %p (corrupted)\n",
-					pool->name, retval);
+				pr_err("dma_pool_alloc %s, %px/%pad (corrupted)\n",
+					pool->name, retval, handle);
=20
 			/*
 			 * Dump the first 4 bytes even if they are not

--XuV1QlJbYrcVoo+x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlx+ZCcACgkQ3SOs138+
s6H5Kg/9HmmyaKCUcTHRCaXMsN96MR+uCdrSEHr49+myRj2tnA4YaX7GPU2wmHcC
KVEBAHM3dgd2QY8ObCrLaVuTNZZBvnr1lRrNha3xE93VIs+4+GBEnv1abk/EbC+2
546Grx0zdTeQF+ZM9OsutUhqeK5QRODj45nlnLU9nVQ+FwxHeLc8oXZpaTNj8Ktb
sjEKdvqX35K95JAXfTV1L/e6tYk89gC7AIvhB5Zd+4UgG5vYoearjr8KQDsFPh6b
HQnfT5siUYdHwj3d6FcGzzWDr1QfoUihOmnjMM0/wmpijVF9+OiYCv/DruHdX3a0
3NUvCiM0tf7EZW2Xyagy7ZO6QKJN0pP4x/bdWI6ehMNV3qmKMgroMgY5gl2o/z+W
zQsMmXnJ0kBmpYUgCOA/4nrJ+gJp6eE0AmKeqfg6nNDvaBIjUJj9LwFxWnsUPWY4
sfB0uV62mjUY5goc5dNRZbjXmXZFpbziWHK3lvYlCH21wgR8M7jcD/j7XeaUhhvw
9NmuqTq3A5gi9GJkko3xYMJ0kVijS0CVpF/Q13xdDwztB54R5K1JXk/VHGLnalr4
tVCzI9ZZSRSXuXD5+UAVhiDUjn+pwNW51ur36Dbquheh0YYLU1RbVCz2lvLIlsII
Dxmiewz43e9h4B+/XjP/pnkgVESJgKIjPtWatgnOtbC8mDTA9p4=
=FFsl
-----END PGP SIGNATURE-----

--XuV1QlJbYrcVoo+x--


--===============4846032223771148353==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4846032223771148353==--
