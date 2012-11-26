From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: xf86-video-tegra or xf86-video-modesetting?
Date: Mon, 26 Nov 2012 08:32:34 +0100
Message-ID: <20121126073234.GA17600@avionic-0098.adnet.avionic-design.de>
References: <20121124210916.GB27042@avionic-0098.adnet.avionic-design.de>
 <CADnq5_P1D7mwL6iYYbJSEBt8Ub5ejQmsMbupMNUU74d5==+gTw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CADnq5_P1D7mwL6iYYbJSEBt8Ub5ejQmsMbupMNUU74d5==+gTw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alex Deucher <alexdeucher-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: xorg-devel-go0+a7rfsptAfugRpC6u6w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 25, 2012 at 09:51:46PM -0500, Alex Deucher wrote:
> On Sat, Nov 24, 2012 at 4:09 PM, Thierry Reding
> <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
> > going into Linux 3.8 and NVIDIA posting initial patches
> > for 2D acceleration on top of it, I've been looking at the various ways
> > how this can best be leveraged.
> >
> > The most obvious choice would be to start work on an xf86-video-tegra
> > driver that uses the code currently in the works to implement the EXA
> > callbacks that allow some of the rendering to be offloaded to the GPU.
> > The way I would go about this is to fork xf86-video-modesetting, do some
> > rebranding and add the various bits required to offload rendering.
> >
> > However, that has all the usual drawbacks of a fork so I thought maybe
> > it would be better to write some code to xf86-video-modesetting to add
> > GPU-specific acceleration on top. Such code could be leveraged by other
> > drivers as well and all of them could share a common base for the
> > functionality provided through the standard DRM IOCTLs.
> >
> > That approach has some disadvantages of its own, like the potential
> > bloat if many GPUs do the same. It would also be a bit of a step back
> > to the old monolithic days of X.
>=20
> Just fork and fill in your own GPU specific bits.  Most accel stuff
> ends up being very GPU specific.

That doesn't exclude the alternative that I described. Maybe I didn't
express what I had in mind very clearly. What I propose is to add some
code to the modesetting driver that would allow GPU-specific code to be
called if matching hardware is detected (perhaps as stupidly as looking
at the DRM driver name/version). Such code could perhaps be called from
the DDX' .ScreenInit and call the GPU-specific function to register an
EXA driver.

That would allow a large body of code (modesetting, VT switching, ...)
to be shared among a number of drivers instead of duplicating the code
for each one and having to keep merging updates from the modesetting
driver as it evolves. So the GPU-specific acceleration would just sit on
top of the existing code and only be activated on specific hardware.
What I'm *not* proposing is to create an abstraction layer for
acceleration.

Thierry

--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQsxsSAAoJEN0jrNd/PrOhH+wQAKVN6LaVj03/wCiqjUSTXJO7
kQ2FseQ5DDg/IbgJ15Wxa0jR8FK5kJ1z5THJaSeoZT8MPVEXQvi+IuW1lhUlsGgy
GpKw9BgpYibcEKp/G2vpZJzfY9U3CoUAavaj2QABtug4sEFD121RWzw411nwY2ES
wUKCYPu8mgDOnGxnz8K0z7/Wr2DOA8fHKggEKnxJREqb3VJHouuZMAwW8sfif0bY
fwZNbztAmFzCmsqs1zSsfAafaWkmJ4XvZSftGodfaQhRsm6m0WujdXE/KmS8AO8b
BM7H4bAu3NK+nah6h7w3ydmXp86Qhx9al6l/XUrctWi5nPA7qgVgv3EbESe4jS+b
WGbCjzrz2qkCH5peEnLeyDcsDqGd8MIuQTr5jRm+psUwcTymP2hHwFlV2LqbpiDf
6VPyKZgu+sLXItF0LOzpsb6KQjsVRN/FHce6BVzY2UAlf5OgFsRRVkkQYPah+ia6
tYDJEyP2d9Ck4uxZL7KzfWRAuPSEPbFG5SgSrk+yKeq5fe3KoGM8HiY9PhXZYd1N
qdxGdFfwHMAUToau9TbEyMoBenG5k7uvTEV1KbyUggPEmRu3EnjhhjCNHSwMCi/b
f2VBGiLsRsSTOquHM06K3pYYqqN8P6CB8KnflivVWV3XkM0RNebxiiAIFuKH365b
yVXSpXtymhgxKdqEUNNN
=O5yZ
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--
