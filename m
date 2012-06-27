From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: Tegra DRM device tree bindings
Date: Wed, 27 Jun 2012 08:37:30 +0200
Message-ID: <20120627063730.GC8496@avionic-0098.adnet.avionic-design.de>
References: <20120626105513.GA9552@avionic-0098.mockup.avionic-design.de>
 <4FE9B291.2020305@nvidia.com>
 <4FE9F582.6010805@wwwdotorg.org>
 <4FEAA4A0.3060407@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+xNpyl7Qekk2NvDX"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4FEAA4A0.3060407-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--+xNpyl7Qekk2NvDX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 27, 2012 at 09:13:52AM +0300, Terje Bergstr=C3=B6m wrote:
> On 26.06.2012 20:46, Stephen Warren wrote:
>=20
> > I'd certainly like to see some upstream discussion re: why exactly we
> > have a custom bus type here. What does it do that a regular platform bus
> > doesn't do? Are those features something that would be generally useful
> > to add to the existing platform bus? Can we instead add hooks into
> > platform bus rather than creating a new bus? I recall you saying that
> > the nvhost_bus duplicated a lot of code from the existing platform bus.
>=20
> Yes, the code is largely a copy of platform bus. One big difference is
> type safety - all the nvhost_bus APIs take in and give out nvhost_device
> or nvhost_driver pointers. At the registration time I also enforce
> parent-child relationship to host1x and bus clients.

I don't know where NVIDIA wants to go with respect to device trees in
their downstream kernels, but at least for mainline (with DT-only
support on Tegra) the parent-child relationship will be rooted in the
DT anyway.

> Another is that I am able to enumerate all host1x related devices. The
> latter could of course be done via listing the children of host1x.
>=20
> And third is that I was able to add version field to device to
> distinguish between Tegra2 and Tegra3 3D (for example) and make the bus
> use that information for binding driver and device. As the sysfs entry
> path is determined by the device name, this allows keeping the old sysfs
> APIs.

Again this can easily be represented by the DT compatible property.

Thierry

--+xNpyl7Qekk2NvDX
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJP6qoqAAoJEN0jrNd/PrOhAukP/23FExDqn6SrTAyQZRKzZPIn
FStdFrHx/rp1RAU0r15iVM6LmJhECgtqQDZ6cXNFKR7/CWBkEWT7336/dGUyaltu
2XNte6f9rspJ2moWC4LyAxPEDGkwR1lQT0IKmetKCjmMSZdDSGgz5ylvGVDmG5ur
JtGNL3EQpP14uOyLyPqGAd3dxeKGKUAxx6Tz1lLZjmi2Rd9uLh8JMmbFtKwiSz99
zBF042YfC1zca290FXrTXn+eIkjENguNUYViLV9OXIqT9y4+CrMkKdxew7e8inl4
s4ji67ku+2vZ8WHNyhfFIMRyxxFB7yEvqCdeW/FaEEARlNlGjCXEJXh7hSBNYMUm
FotisZLOCTC0y3f04siJ9O5dZZ0prpz9tUgC55+CbW6cmdCk/kMaDSu0iFj1YCmx
S4NI7kXMKqZfqMMdHN7FiK9MwvvTa5ameN6h68hNnhuQ5lPsjr5CefIyLyGDa0AV
HlcM429Qj4pgSwKwnhf7/dkn/EtSSHT3Mdjnz2UmVMvF5k39qVlP9ivzo+YDy6zA
YSIaSD/atwCUWI1TOGoxa4ZbnE4NQmDWCcZZEbbIVn58FOr29NictfgEHre+oh/s
p5/M3hKBxxx2F1Xm/msxuhKLGUNvolgwp8VZMe82MCyu4esh0wbDIeCxIqjvFUzZ
nOwNOHR6eFPnVvi0Lgfc
=03a5
-----END PGP SIGNATURE-----

--+xNpyl7Qekk2NvDX--
