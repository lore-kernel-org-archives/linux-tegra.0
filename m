From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
Date: Mon, 27 Apr 2020 17:12:34 +0200
Message-ID: <20200427151234.GE3464906@ulmo>
References: <d2531fc1-b452-717d-af71-19497e14ef00@gmail.com>
 <a5198024-7273-74c4-b4f4-3a29d042bc36@nvidia.com>
 <f8fb1f7f-2497-033e-ff2c-c86c6caa9706@gmail.com>
 <fd1ca178-1ea3-851f-20a6-10bf00453ce3@nvidia.com>
 <a5734f19-254e-b6bc-e791-fa1ac63f11a4@gmail.com>
 <79f6560e-dbb5-0ae1-49f8-cf1cd95396ec@nvidia.com>
 <20200427074837.GC3451400@ulmo>
 <c1190858-eaea-8e94-b4d1-1cf28076c330@gmail.com>
 <20200427110033.GC3464906@ulmo>
 <3a06811c-02dc-ce72-ebef-78c3fc3f4f7c@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="0H629O+sVkh21xTi"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3a06811c-02dc-ce72-ebef-78c3fc3f4f7c-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--0H629O+sVkh21xTi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2020 at 05:21:30PM +0300, Dmitry Osipenko wrote:
> 27.04.2020 14:00, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Mon, Apr 27, 2020 at 12:52:10PM +0300, Dmitry Osipenko wrote:
> >> 27.04.2020 10:48, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >> ...
> >>>> Maybe but all these other problems appear to have existed for someti=
me
> >>>> now. We need to fix all, but for the moment we need to figure out wh=
at's
> >>>> best for v5.7.
> >>>
> >>> To me it doesn't sound like we have a good handle on what exactly is
> >>> going on here and we're mostly just poking around.
> >>>
> >>> And even if things weren't working quite properly before, it sounds to
> >>> me like this patch actually made things worse.
> >>
> >> There is a plenty of time to work on the proper fix now. To me it soun=
ds
> >> like you're giving up on fixing the root of the problem, sorry.
> >=20
> > We're at -rc3 now and I haven't seen any promising progress in the last
> > week. All the while suspend/resume is now broken on at least one board
> > and that may end up hiding any other issues that could creep in in the
> > meantime.
> >=20
> > Furthermore we seem to have a preexisting issue that may very well
> > interfere with this patch, so I think the cautious thing is to revert
> > for now and then fix the original issue first. We can always come back
> > to this once everything is back to normal.
> >=20
> > Also, people are now looking at backporting this to v5.6. Unless we
> > revert this from v5.7 it may get picked up for backports to other
> > kernels and then I have to notify stable kernel maintainers that they
> > shouldn't and they have to back things out again. That's going to cause
> > a lot of wasted time for a lot of people.
> >=20
> > So, sorry, I disagree. I don't think we have "plenty of time".
>=20
> There is about a month now before the 5.7 release. It's a bit too early
> to start the panic, IMO :)

There's no panic. A patch got merged and it broken something, so we
revert it and try again. It's very much standard procedure.

> Jon already proposed a reasonable simple solution: to keep PCIe
> regulators always-ON. In a longer run we may want to have I2C atomic
> transfers supported for a late suspend phase.

That's not really a solution, though, is it? It's just papering over
an issue that this patch introduced or uncovered. I'm much more in
favour of fixing problems at the root rather than keep papering over
until we loose track of what the actual problems are.

Thierry

--0H629O+sVkh21xTi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6m9mAACgkQ3SOs138+
s6HIgg//dIcA5nNp3RiKQ/afAlJ0Toi2/WrRH1Ah/2Pv7hgQuedUn+bgV0dvNTiA
bsN20O6poktDDuCkGV6n2FXn0wCFMhpdcTA1IZIuLdxF+agwWfNh2bn7u8QzrVyV
sQA4s6BHU8/RiZy5eN7KgEm9M+sqV5EH/ZUnXrTRL7cXKlf41HWwat98jDKa0i5f
Yj3RmeFq7QkIiyI1l+nq0izY6MPF+Lzq7ixsM+KgaAEofedzCMcLfwgOrOZD4xiK
tXmDlHqEhEcQAvXm8Ow9Z0mYUulaWetN8vU6WyViZP8YklFnzKuxBJNe3XTyoinQ
3dB6a3WA/M8sH3S/dhSRT/PiMAKwpCJROzLfNC1pLZXvXOwyDsJVr95TjamIVSHu
P8tzWMrbkzGlCbpqDp08GrD1yxGsSQsY1msrinSoNvb+27xgdEh6SFdGVZlDFPG1
kgMUs0uWQ+SFTvDlCh7HJ3Lug0qnJQzGeRKWMcRvCzStQCIA02gdZS0FUbnIufty
WVRK2tLpkJrA87gg1HHzxT8uCrJfIlo4x3wCGYTapCRikW9TlqkkpuO4yHeiwC3L
8Q9X1xQ7xRcOz3j8KgQYP2sApp/8XyULG23ETN2Ple5wMGj54Ab07JGEd/B4fKPW
I0J0Xp6T+WdpcBoilfSENMHoCTqMQ/6YBjGp7vv5aMGw4Y8kHrw=
=pTlO
-----END PGP SIGNATURE-----

--0H629O+sVkh21xTi--
