From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: xf86-video-tegra or xf86-video-modesetting?
Date: Sun, 25 Nov 2012 14:37:59 +0100
Message-ID: <20121125133759.GA30264@avionic-0098.adnet.avionic-design.de>
References: <20121124210916.GB27042@avionic-0098.adnet.avionic-design.de>
 <1353797672.1479.17.camel@tellur>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qDbXVdCdHGoSgWSk"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1353797672.1479.17.camel@tellur>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: xorg-devel-go0+a7rfsptAfugRpC6u6w@public.gmane.org, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--qDbXVdCdHGoSgWSk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 24, 2012 at 11:54:32PM +0100, Lucas Stach wrote:
> Am Samstag, den 24.11.2012, 22:09 +0100 schrieb Thierry Reding:
> > Hi,
> >=20
> > With tegra-drm going into Linux 3.8 and NVIDIA posting initial patches
> > for 2D acceleration on top of it, I've been looking at the various ways
> > how this can best be leveraged.
> >=20
> > The most obvious choice would be to start work on an xf86-video-tegra
> > driver that uses the code currently in the works to implement the EXA
> > callbacks that allow some of the rendering to be offloaded to the GPU.
> > The way I would go about this is to fork xf86-video-modesetting, do some
> > rebranding and add the various bits required to offload rendering.
> >=20
> As much as I dislike to say this, but forking the modesetting driver to
> bring in the Tegra specific 2D accel might be the best way to go for
> now. Especially looking at the very limited resources available to
> tegradrm development and NVIDIAs expressed desire to do as few changes
> as possible to their downstream work.

So true. But I'm not sure if it's a good excuse to not do things the
right way, even if it ends up being more work. If the general situation
can be improved then I think it's worth the effort.

> > However, that has all the usual drawbacks of a fork so I thought maybe
> > it would be better to write some code to xf86-video-modesetting to add
> > GPU-specific acceleration on top. Such code could be leveraged by other
> > drivers as well and all of them could share a common base for the
> > functionality provided through the standard DRM IOCTLs.
> >=20
> We don't have any standard DRM IOCTLs for doing acceleration today. The
> single fact that we are stitching together command streams in userspace
> for execution by the GPU renders a common interface unusable. We don't
> even have a common interface to allocate GPU resources suitable for
> acceleration: the dumb IOCTLs are only guaranteed to give you a buffer
> the display engine can scan out from, nothing in there let's you set up
> more fancy things like tiling etc, which might be needed to operate on
> the buffer with other engines in some way.

With the common base that could be shared I meant all the modesetting
code and framebuffer setup that xf86-video-modesetting already does.
I've been wanting to add support for planes as well, which comes with
another set of standard IOCTLs in DRM.

Rewriting all of that in different drivers doesn't seem very desirable
to me and sounds like a lot of wasted effort. And that's not couting the
maintenance burden to keep up with the latest changes in the generic
modesetting driver.

> > That approach has some disadvantages of its own, like the potential
> > bloat if many GPUs do the same. It would also be a bit of a step back
> > to the old monolithic days of X.
> >=20
> For some thoughts about how a unified accelerated driver for various
> hardware devices could be done I would like to point at my presentation
> at this years XDC.
> However doing this right might prove as a major task, so as I already
> said it might be more worthwhile to just stuff the Tegra specific bits
> into a fork of the modesetting driver.

One major advantage of putting this into the modesetting driver is that
as more hardware support is added common patterns might emerge and make
it easier to refactor things into generic code.

Thierry

--qDbXVdCdHGoSgWSk
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQsh83AAoJEN0jrNd/PrOhXe0P/3t/QP9DnBeeLd0oJ4Iw4+0V
JbpriZVzb+k7D9V6JXHEzbcw9o6q8gdjQgUE5ih8V0qa8H7wSN9NpURY2Vh2k0/n
0gmULj4quaE3KS49i9+Fyr5owrElPYAs542DY0uhKtBa9dXmTJ6Skf4MeJgc/72A
lNJy1JvYoeWGD5rs8AQFQ48Lr2XXJMkM1Wx/+lHFZSA8ElGU/64yWMB7JyeH9SRk
HKv0Rxx8RP5sDPcoRq9UETrI4xBeiNnbwoyrVTH8Mu2cpRIGitslxBNjHocgHQ2+
YBjKJdEXmWYryrrn95SGoz0HfSGqbd3LoENp5u3der1vrIagnb0oD7+WKhUmsc7y
4sZRKKz0iMjiqStR504rauPvfCicrwWke63NMluLc100qGvWNW7FBELrNDh9egbA
8ixxCTVKZVDQDjNYgtEOVK+/r/bvlEnRJHW+ykjEWpuqtyI4G8t0MFw61yeQpv76
vgkL77Fsuw4+eFdZ74p8EAIEvyGdCajkgn+EUj5hZ5gAo6+SSOpcFAMaFQ0duFjw
LbNnkXrU1aOt4fv9g/e1A6CSZw+ZI0GxN7Fify1mwBdRkE1NbPRMZ4+kzxKdtJvz
Hf7/EhEuN78P+QejwsxamOq+ZhjmOaDMgzjEpREzTaWfGR6ldHZH1abbo2LfNg1w
jXXxjtVK2zk4YwGz1tVS
=TPrw
-----END PGP SIGNATURE-----

--qDbXVdCdHGoSgWSk--
