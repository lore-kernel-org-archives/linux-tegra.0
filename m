From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: Unstable Kernel behavior on an ARM based board
Date: Tue, 5 Mar 2019 12:36:25 +0100
Message-ID: <20190305113625.GD26369@ulmo>
References: <CA+_ZnZS48d0OOTQJjktieO-yf09Ch6MRQLFoCjRtUgcXMrjWmg@mail.gmail.com>
 <20190302123907.qoe46qs6qmx7qnjs@shell.armlinux.org.uk>
 <453072a9-52e2-7591-750f-624ca27e0bbf@gmx.net>
 <CA+_ZnZTrGCzPLKWZdxBzV1Z9b+c-Sp27DeUeV2XFW0+ZNZipGw@mail.gmail.com>
 <e530ec49-942d-a993-9081-901c0ce29c75@arm.com>
 <CA+_ZnZTCtghS+oUdXGW+h6SVD6nMPfsyDAvOwEugrhx6NJ3yFg@mail.gmail.com>
 <20190304142546.GB24676@ulmo>
 <CA+_ZnZQRV_7ytmbQZvWZUuyYiai0+Yo-pqV19RKebWAwSQokxQ@mail.gmail.com>
 <20190305103222.GB26369@ulmo>
 <CA+_ZnZTzTGbVggEVMVkwJRAXrjg36Cms_3MiQciucRmMUpi2Hw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1995601839715104642=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CA+_ZnZTzTGbVggEVMVkwJRAXrjg36Cms_3MiQciucRmMUpi2Hw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Embedded Engineer <embed786@gmail.com>
Cc: linux-tegra@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Vladimir Murzin <vladimir.murzin@arm.com>, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============1995601839715104642==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IDYEmSnFhs3mNXr+"
Content-Disposition: inline


--IDYEmSnFhs3mNXr+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 05, 2019 at 04:05:14PM +0500, Embedded Engineer wrote:
> On Tue, Mar 5, 2019 at 3:32 PM Thierry Reding <thierry.reding@gmail.com> =
wrote:
> >
> > One thing besides memory timings in BCT that comes to mind that could be
> > causing memory corruption are power supplies. Are you sure they're all
> > correctly configured and enabled as required?
>=20
> This part is 100% same as the Jetson TK1 on hardware end. And in
> device tree, the node 'vdd_1v35_lp0: sd2' has already
> 'regulator-always-on' property. We also tried once by using
> oscilloscope to check if the power drops/fluctuates during operation
> but noticed that DDR chips were getting stable power.

Okay, sounds like that's not relevant here, then.

> > Does the upstream kernel and DTB boot reliably, even if it doesn't get
> > you to a login prompt? Or does it also behave erratically like the
> > downstream kernel and DTB that you have?
>=20
> 2 out of 10 times it behaved erratically, i.e. one time it stuck at
> 'Starting kernel ...' and the other time it stuck after following
> prints:
>=20
> Starting kernel ...
>=20
> [    0.000000] Booting Linux on physical CPU 0x0
> [    0.000000] Linux version 5.0.0-rc8-next-20190304-dirty
> (teresol@ubuntu) (gcc version 6.1.1 20160711 (Linaro GCC 6.1-2016.08))
> #2 SMP PREEMPT Tue Mar 5 02:15:14 PST 2019
> [    0.000000] CPU: ARMv7 Processor [413fc0f3] revision 3 (ARMv7), cr=3D1=
0c5387d
> [    0.000000] CPU: div instructions available: patching division code
> [    0.000000] CPU: PIPT / VIPT nonaliasing data cache, PIPT instruction =
cache
> [    0.000000] OF: fdt: Machine model: NVIDIA Tegra124 Jetson TK1
> [    0.000000] earlycon: uart0 at MMIO 0x70006300 (options '115200n8')
> [    0.000000] printk: bootconsole [uart0] enabled
> [    0.000000] Memory policy: Data cache writealloc
> [    0.000000] cma: Reserved 64 MiB at 0xac000000

Okay, this could corroborate the aliasing hypothesis. If aliasing is
really the problem, it would most likely indicate an issue in the BCT
that happened as part of shmooing. I'm not very familiar with the tests
run as part of the Shmoo suite, but I would've hoped that it contains
tests for aliasing.

Thierry

--IDYEmSnFhs3mNXr+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlx+XzUACgkQ3SOs138+
s6F9Yg/+Laqi9mWzjCbiOUv5HVE4y7MagNvGCS1l5B4R6CnxAYnNByqO63PehWRR
b/sR+852j8uDYWnSmlaqGcz6imb2c+gWDEMMOZzeORWRvtZge5EillrldqaKAiEE
/y3myaJIxg1LC2DdZKojHDOOwmWi8tTyMs4J04PNlhPNAiztjtx6Y8YKNqbXH57T
8W+FHXnTvJLI//gQ0GjfvRleLFAct4LgXoOGFv52JsggiMGgUYidgQhUNwnFu/Qa
/PtL8ag20rTG75zSXaD3rq+RUUVDVHl0zyXFSg22D/rkROv3dQ7MnVEPl/yPQ8b5
WZgRHU2ZFcbBiTOV4bZVU+ZM/cciLHL8zjgc/lClAnI1fa1nB2eEMU8Km8FfTCiI
I9w2ebQ6QpzTXdNf9h2/RboVl/QjgLYn4d4OFGl1sr008fMffX+Gc3SHs5iLuqXR
eyE4qrs0LZRKpyglBtKTjUXOBixSZogHh+JpTlDjMmhO44yhW163mWT5tT2qjutb
rjW3Eg+T5DVQNjL29SWlz6j2qwzRCn0P1Lz5SUI0f88L4j+yDbse54wGM1X3RiZb
Lh4qReAlcWWt78tNmeYY57LcyYTHEij5xrDySlxkqzwxzJg3gbD6fvlPfKLkEU12
+I6j/KV+8OuHRAlzF28w2LZX1U1F1EIUVDYCgKF3Q8d5iPs49Lo=
=kTB4
-----END PGP SIGNATURE-----

--IDYEmSnFhs3mNXr+--


--===============1995601839715104642==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1995601839715104642==--
