From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
Date: Wed, 29 Apr 2020 10:14:48 +0200
Message-ID: <20200429081448.GA2345465@ulmo>
References: <f8fb1f7f-2497-033e-ff2c-c86c6caa9706@gmail.com>
 <fd1ca178-1ea3-851f-20a6-10bf00453ce3@nvidia.com>
 <a5734f19-254e-b6bc-e791-fa1ac63f11a4@gmail.com>
 <79f6560e-dbb5-0ae1-49f8-cf1cd95396ec@nvidia.com>
 <20200427074837.GC3451400@ulmo>
 <c1190858-eaea-8e94-b4d1-1cf28076c330@gmail.com>
 <20200427110033.GC3464906@ulmo>
 <3a06811c-02dc-ce72-ebef-78c3fc3f4f7c@gmail.com>
 <20200427151234.GE3464906@ulmo>
 <1ab276cf-c2b0-e085-49d8-b8ce3dba8fbe@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bp/iNruPH9dso1Pn"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1ab276cf-c2b0-e085-49d8-b8ce3dba8fbe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2020 at 06:18:34PM +0300, Dmitry Osipenko wrote:
> 27.04.2020 18:12, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Mon, Apr 27, 2020 at 05:21:30PM +0300, Dmitry Osipenko wrote:
> >> 27.04.2020 14:00, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> On Mon, Apr 27, 2020 at 12:52:10PM +0300, Dmitry Osipenko wrote:
> >>>> 27.04.2020 10:48, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>>> ...
> >>>>>> Maybe but all these other problems appear to have existed for some=
time
> >>>>>> now. We need to fix all, but for the moment we need to figure out =
what's
> >>>>>> best for v5.7.
> >>>>>
> >>>>> To me it doesn't sound like we have a good handle on what exactly is
> >>>>> going on here and we're mostly just poking around.
> >>>>>
> >>>>> And even if things weren't working quite properly before, it sounds=
 to
> >>>>> me like this patch actually made things worse.
> >>>>
> >>>> There is a plenty of time to work on the proper fix now. To me it so=
unds
> >>>> like you're giving up on fixing the root of the problem, sorry.
> >>>
> >>> We're at -rc3 now and I haven't seen any promising progress in the la=
st
> >>> week. All the while suspend/resume is now broken on at least one board
> >>> and that may end up hiding any other issues that could creep in in the
> >>> meantime.
> >>>
> >>> Furthermore we seem to have a preexisting issue that may very well
> >>> interfere with this patch, so I think the cautious thing is to revert
> >>> for now and then fix the original issue first. We can always come back
> >>> to this once everything is back to normal.
> >>>
> >>> Also, people are now looking at backporting this to v5.6. Unless we
> >>> revert this from v5.7 it may get picked up for backports to other
> >>> kernels and then I have to notify stable kernel maintainers that they
> >>> shouldn't and they have to back things out again. That's going to cau=
se
> >>> a lot of wasted time for a lot of people.
> >>>
> >>> So, sorry, I disagree. I don't think we have "plenty of time".
> >>
> >> There is about a month now before the 5.7 release. It's a bit too early
> >> to start the panic, IMO :)
> >=20
> > There's no panic. A patch got merged and it broken something, so we
> > revert it and try again. It's very much standard procedure.
> >=20
> >> Jon already proposed a reasonable simple solution: to keep PCIe
> >> regulators always-ON. In a longer run we may want to have I2C atomic
> >> transfers supported for a late suspend phase.
> >=20
> > That's not really a solution, though, is it? It's just papering over
> > an issue that this patch introduced or uncovered. I'm much more in
> > favour of fixing problems at the root rather than keep papering over
> > until we loose track of what the actual problems are.
>=20
> It's not "papering over an issue". The bug can't be fixed properly
> without introducing I2C atomic transfers support for a late suspend
> phase, I don't see any other solutions for now. Stable kernels do not
> support atomic transfers at all, that proper solution won't be backportab=
le.

Hm... on a hunch I tried something and, lo and behold, it worked. I can
get Cardhu to properly suspend/resume on top of v5.7-rc3 with the
following sequence:

	revert 9f42de8d4ec2 i2c: tegra: Fix suspending in active runtime PM state
	apply http://patchwork.ozlabs.org/project/linux-tegra/patch/20191213134417=
=2E222720-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org/

I also ran that through our test farm and I don't see any other issues.
At the time I was already skeptical about pm_runtime_force_suspend() and
pm_runtime_force_resume() and while I'm not fully certain why exactly it
doesn't work, the above on top of v5.7-rc3 seems like a good option.

I'll try to do some digging if I can find out why exactly force suspend
and resume doesn't work.

Thierry

--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6pN3QACgkQ3SOs138+
s6FqAQ//RHJgl9oNrYYROPHrxVn2OtMcmj5+/dkO6Kh5NhE2esqn/x81QNWSgHwJ
b2KkOJJW9z7npldk5w6IR5VPwN8Su4bcK16e9gGOBLvOyjltOm50txt/rRIByKpI
0/9H158SB13+ppy1tfOMnq6u3imcbO/3YgjZ8+NXSpghACCAhwEfgh5sccG/ZoXK
GC1AsI7QHQxDR/HONQKhQNqnUWeEW8OJ9+WrZJrFZQ7PgkSF7bEEReAGFlR7jMTJ
d8oqCP7OdrAWWskeHOdvlGeYyxl0EjTIwEDFe/ggh0hNBuG1RmcyPQSf/FOo5n54
ZgaSfi7wwQbnK3XTjJSBZBKwBGwlio0Fky0UbP2fZpWNLnf161n0QTPNc7xsu/Ex
jNjqZx1KE1xLgo1Hv+2rz6xRFT1TTyB7J/jIxazqhn5cP1Sk+8oY/4/IAr7kmPbq
2DZS+ijyqcGO+P4qDtPsdHn1j9MQTimVfF/tTzLIx31PH/+b92btgl0MMx3/tPXt
14K7kJ6idTPm34vPVw0Lk3NWkI3oCr2xBawY9gSWYETQd5FUlA/OtP0aP91A1CQU
BVv3txR7kxVCsGqKtv5PCS1PgLWcpJDBxsffOELv/FIb/X6SlbFBkOV51aptOlYS
PZkLNNzV4KkFQMipM/E+p3gPx366wnhHXo1MhCqlVfwnQZtzCWI=
=NmFD
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--
