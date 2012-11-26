From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: xf86-video-tegra or xf86-video-modesetting?
Date: Mon, 26 Nov 2012 09:13:21 +0100
Message-ID: <20121126081321.GC17600@avionic-0098.adnet.avionic-design.de>
References: <20121124210916.GB27042@avionic-0098.adnet.avionic-design.de>
 <CADnq5_P1D7mwL6iYYbJSEBt8Ub5ejQmsMbupMNUU74d5==+gTw@mail.gmail.com>
 <20121126073234.GA17600@avionic-0098.adnet.avionic-design.de>
 <CAPM=9tzfjtUVC5PrRLA3Y659ausf1j=uXp-zfMZFUXz-ir67FA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JgQwtEuHJzHdouWu"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPM=9tzfjtUVC5PrRLA3Y659ausf1j=uXp-zfMZFUXz-ir67FA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alex Deucher <alexdeucher-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, xorg-devel-go0+a7rfsptAfugRpC6u6w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--JgQwtEuHJzHdouWu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 26, 2012 at 05:45:38PM +1000, Dave Airlie wrote:
> On Mon, Nov 26, 2012 at 5:32 PM, Thierry Reding
> <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
> > On Sun, Nov 25, 2012 at 09:51:46PM -0500, Alex Deucher wrote:
> >> On Sat, Nov 24, 2012 at 4:09 PM, Thierry Reding
> >> <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
> >> > going into Linux 3.8 and NVIDIA posting initial patches
> >> > for 2D acceleration on top of it, I've been looking at the various w=
ays
> >> > how this can best be leveraged.
> >> >
> >> > The most obvious choice would be to start work on an xf86-video-tegra
> >> > driver that uses the code currently in the works to implement the EXA
> >> > callbacks that allow some of the rendering to be offloaded to the GP=
U.
> >> > The way I would go about this is to fork xf86-video-modesetting, do =
some
> >> > rebranding and add the various bits required to offload rendering.
> >> >
> >> > However, that has all the usual drawbacks of a fork so I thought may=
be
> >> > it would be better to write some code to xf86-video-modesetting to a=
dd
> >> > GPU-specific acceleration on top. Such code could be leveraged by ot=
her
> >> > drivers as well and all of them could share a common base for the
> >> > functionality provided through the standard DRM IOCTLs.
> >> >
> >> > That approach has some disadvantages of its own, like the potential
> >> > bloat if many GPUs do the same. It would also be a bit of a step back
> >> > to the old monolithic days of X.
> >>
> >> Just fork and fill in your own GPU specific bits.  Most accel stuff
> >> ends up being very GPU specific.
> >
> > That doesn't exclude the alternative that I described. Maybe I didn't
> > express what I had in mind very clearly. What I propose is to add some
> > code to the modesetting driver that would allow GPU-specific code to be
> > called if matching hardware is detected (perhaps as stupidly as looking
> > at the DRM driver name/version). Such code could perhaps be called from
> > the DDX' .ScreenInit and call the GPU-specific function to register an
> > EXA driver.
> >
> > That would allow a large body of code (modesetting, VT switching, ...)
> > to be shared among a number of drivers instead of duplicating the code
> > for each one and having to keep merging updates from the modesetting
> > driver as it evolves. So the GPU-specific acceleration would just sit on
> > top of the existing code and only be activated on specific hardware.
> > What I'm *not* proposing is to create an abstraction layer for
> > acceleration.
> >
>=20
> vmware kinda did something like that initially with modesetting, it
> was a bit messier, it would be nice though to just plug in stuff like
> glamor and things, but you still need to deal with pixmap allocation
> on a per-gpu basis.

I'm still very new to this game and I probably have a lot of catching up
to do. However I would expect it to be possible to override pixmap
allocation with GPU specific implementations. I've been looking at some
implementations of DDX drivers and I seem to remember that pixmap
management was done in the EXA driver, in which case it would be part of
the GPU specific code anyway.

> I'd rather make the modesetting code into a library, either separate
> or in the X server, but i've also investigated that and found it was
> too much effort for me at the time also.

That idea occurred to me as well. Given my lack of experience I'm not
sure I'd be very well suited for the job if you already judged it to be
too much effort...

Thierry

--JgQwtEuHJzHdouWu
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQsyShAAoJEN0jrNd/PrOhkxcQAJgjefrSmJKz1hgI++JEr+xJ
PMSXpBR1CXyID4YTEBDUzh/5lD0tLQPZgwRAp/4qPf5fujCchTfrgpuApgXbydMu
APgY2DumLXa08/0Oa7tRxem54monMV2aRl7RJ8Ob55klwLvfMFEPvD73PZKC9YB/
JeE8uLq1vJFh+tpWFrahBkTo5A18XoeyTiDbEl/UDuui0kfP2IiEXttbT87FDRz8
rRuDPkrCVTbCBuJgr1hUATw0VJAlUA7WDIJC+z+eXPt/8UGvynFwy0fH4g17lmBr
RsjcMOdpNUd9k5gHkJl5npGHhz6+ZOZADj30Bz7iR6+cLX+kVPIFfCAHv/Of2ORI
ZkM+LjDsX0dFlyvEzPtw8iyarrs4VmrxoDsI49TRA//vLjUzBYRKBN5GuN33i96g
iXNIqOTpkzWZEPSOrDi9J/eY5WTaPHuQ0zM271sNMue4qa8VpV6rlEVa0S2Wb5h9
kKW2bbRKnLpTbPr/TBD8ws7iLBMveznIJzc86fyo1Qh91ZHF8PHosnochleSiNxN
X5SubZVPOc7X5cpbfGeYGUDpIWIMtHgdz9cHn6Y+D5D8LchBbCNSo3mqnRs4GYvh
N26VUhvZM5P3LlUE5A6AyiYCO/zhnvkCYC84mfoeTVGvqlfmWcMboi2tXGYP9rg7
27/eNPFAfdYQj4NBkq3j
=OlM5
-----END PGP SIGNATURE-----

--JgQwtEuHJzHdouWu--
