From: Thierry Reding <thierry.reding@avionic-design.de>
Subject: Re: [RFC v2 1/8] video: tegra: Add nvhost driver
Date: Fri, 30 Nov 2012 07:53:58 +0100
Message-ID: <20121130065358.GD26474@avionic-0098.adnet.avionic-design.de>
References: <1353935954-13763-1-git-send-email-tbergstrom@nvidia.com>
	<1353935954-13763-2-git-send-email-tbergstrom@nvidia.com>
	<20121128212301.GA25531@avionic-0098.adnet.avionic-design.de>
	<50B73710.2040102@nvidia.com> <50B7AAA6.70702@wwwdotorg.org>
	<50B85828.4090405@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0113074982=="
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <50B85828.4090405@nvidia.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom@nvidia.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Stephen Warren <swarren@wwwdotorg.org>
List-Id: linux-tegra@vger.kernel.org


--===============0113074982==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YToU2i3Vx8H2dn7O"
Content-Disposition: inline


--YToU2i3Vx8H2dn7O
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 30, 2012 at 08:54:32AM +0200, Terje Bergstr=C3=B6m wrote:
> On 29.11.2012 20:34, Stephen Warren wrote:
> > On 11/29/2012 03:21 AM, Terje Bergstr=C3=B6m wrote:
> >> True. I might also as well delete the general interrupt altogether, as
> >> we don't use it for any real purpose.
> >=20
> > Do make sure the interrupts still are part of the DT binding though, so
> > that the binding fully describes the HW, and the interrupt is available
> > to retrieve if we ever do use it in the future.
>=20
> Sure, I will just not use the generic irq in DT, but it won't require
> any changes in DT bindings.
>=20
> > You can still create tables of clocks inside the driver and loop over
> > them. So, loop unrolling isn't related to my comments at least. It's
> > just that clk_get() shouldn't take its parameters from platform data.
> >=20
> > But if these are clocks for (arbitrary) child modules (that may or may
> > not exist dynamically), why aren't the drivers for the child modules
> > managing them?
>=20
> There are actually two things here that I mixed, and because of that I
> probably confused everybody else.
>=20
> Let's rip out the ACM. ACM is generic to all modules, and in nvhost owns
> the clocks. That's why list of clocks and their frequency policies have
> been part of the device description in nvhost. ACM is being replaced
> with runtime PM in downstream kernel, but it still requires rigorous
> testing and analysis of power profile before we can move to it.
>=20
> Then, the second thing is that nvhost_probe() has had its own loop to go
> through the clocks of host1x module. It's copy-paste of what ACM did,
> which is just bad design. That's easily replaceable with static code, as
> nvhost_probe() is just for host1x. I'll do that, and as I rip out the
> generic power management code, I'll also make 2D and host1x drivers
> enable the clocks at probe with static code.
>=20
> So I think we have a solution that resonates with all proposals.

Yes, that sounds good to me.

Thierry

--YToU2i3Vx8H2dn7O
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQuFgGAAoJEN0jrNd/PrOhD/sP/2p008KhKvNhnBwVMguB3D9L
2ZCli8RZXDj2kIy/oDihHHM0HEG2DC6WwHXYqQZs8+i8MPr6rz83Ur7gB8uv8mXo
oT4wVOSssXME4BKu1pXFZv16TgGY5I2A5n57H3MqHp0dB/DvVFwqBLqKRSXzGBHY
xVxBFpX1KyDPraZYrDHWHMBO9vc6NBKD4eEyB6PBsJrXS+NFPjHLFLAwv/plKvit
Uvli/atIUJHAq+gJZOJ1IjsVcJExKnVtE44NLst1N2/XPR5WCwghiwbWjEMjLzi3
HcnNa22gBuvqqIaeaSzdTyb2KOz5nM8YW86X7zN2ROscfwB0Rcv745I2dta8cDqg
OwHEGfYDRFstTAETmLmEes0hND6YemSv4gvs2fqzMgzePaMfzYS9nAvi9u8pSbhU
9cuDXOfGTjZh/uu/Gwi0aO4v4zJyINuKHMxgKbaotSPYCCThwq69HuehiJNFxpsw
0h+PdfdOp6YIPcEnyWrehZLDULUIeP0oeDvMDU/f2Gc+xmHglSL31x0k21E49j+1
WCSMWbIiwFjYPKWIXyw2h/iX6X/OXCH/Tx17MJ9pU24hG0wCVjDtkF64T92RekBJ
oaj/4f3/ZOp/Q2UD3OLcLPSnVCP4TEKyhX4B0zph9lYFsLynk3VjVGnLvK8HZuBr
D58NVB4MYJw+PLQwRvWR
=bXaS
-----END PGP SIGNATURE-----

--YToU2i3Vx8H2dn7O--

--===============0113074982==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0113074982==--
