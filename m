From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PULL] drm/tegra: Changes for v3.13-rc1
Date: Mon, 4 Nov 2013 13:11:46 +0100
Message-ID: <20131104121145.GB18722@ulmo.nvidia.com>
References: <20131031091727.GA16198@ulmo.nvidia.com>
 <20131104102253.GE4167@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="i0/AhcQY5QxfSsSZ"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131104102253.GE4167-dv86pmgwkMBes7Z6vYuT8azUEOm+Xw19@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Cc: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--i0/AhcQY5QxfSsSZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 04, 2013 at 11:22:53AM +0100, Daniel Vetter wrote:
> On Thu, Oct 31, 2013 at 10:17:28AM +0100, Thierry Reding wrote:
[...]
> >       drm/tegra: Move subdevice infrastructure to host1x
>=20
> I've just shot at this patch on the m-l, but I'd be rather unhappy if the
> new drm_bus madness this add gets into drm-next. Would be a definite step
> backwards imo for the drm core. Also more work for me to fix it all up ...

In all fairness, the patches were posted for review a while back (4
weeks ago) and I had no idea any such rework was in place, much less
that anybody else considered drm_bus to be a bad idea.

Perhaps we could maintain a list of TODO items somewhere with notes as
to what's currently being worked on. Maybe such a list already exists
and I'm just not aware of it?

It'd be unfortunate if this series can't be merged for 3.13. The patch
you object to is early in the list and everything after it depends on
it, so if that doesn't make it in, then none of the rest will make it
either.

I've also explained elsewhere that the only thing drm_bus related that
this adds is a new define for DRIVER_BUS_HOST1X and an implementation of
=2Eset_busid. The former should be trivial to remove, while the latter is
the only one that you've kept in the cleanup tree you've posted.

Also I'd like to reassert my offer to help. While working on this I've
actually came across various oddities myself, like how the bus type was
completely unused, and had added them to my TODO list of things to look
into later.

I really appreciate the work you do, but I think we could use some more
coordination to avoid conflicts such as these and perhaps share the load
of cleanup work. Is there anything in particular that I could do to help
improve the situation?

Thierry

--i0/AhcQY5QxfSsSZ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSd48BAAoJEN0jrNd/PrOhzXQQAK4dY8pnbnzybyShbT/wxWiU
NJVg4Vh6bz0MgJmgWABTDhhgBaFa2NhmTCaShRQOOK2NbeHJEV1UxXWyFEYRj0bh
49TuZMgOUFPW2ZAG5QlmQjhUbtR3RjsrF4hkEkQRwEW0GS3ss7wMd77ZPVdNErFu
PgAjY2ej/6ZP1mT/yLgRUey6rwv1i9i7jdRqySCKDaq2VGKiV5N7DC/AXgBTgapj
/XTa+uHTuTQq01Z+wNCi517yviaQp+9GuOcaI10/RqhDf0tqH8/Ofz9UIxG/cLO8
lzCiogo5fH5FEgwIiwlRxG1GOGseHsBDLbzS4fclo0ISN+ZDqmStuGb1jjdk6StF
uzJJpnUnM8yLetduxjNzFrYeJbz6EXW0BU274xdgq8QDww4hSSCQeIQuB2kaCikk
3J7iGnjSSITOa5TTL9TVCKGVtX9Bxf1FvRm2jWnWhG4dUCjWFm0HfsPJ9XA5yS9f
HQjzBRt8HzTNbgFTfFjaE9ub1NGw8Hnj3kHAtTrKH+JrQDZVu3vfgQ574cNzIA/s
leS4z3LNfXVb6GVf7wbTIogLmUucDcIkHsQa10yTdkHp00Ql6XNzyO3ZM+vSsDNo
MZxrUwLKt3Z/11WA11IOdU8C0XMySiCNVmRkSWOUE3hdB6lhjelM39IWcALHGNvM
Ba753maetFcOjlbgg3Ob
=YhqT
-----END PGP SIGNATURE-----

--i0/AhcQY5QxfSsSZ--
