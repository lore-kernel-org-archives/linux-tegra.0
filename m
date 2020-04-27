From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
Date: Mon, 27 Apr 2020 13:00:33 +0200
Message-ID: <20200427110033.GC3464906@ulmo>
References: <77a31b2f-f525-ba9e-f1ae-2b474465bde4@gmail.com>
 <470b4de4-e98a-1bdc-049e-6259ad603507@nvidia.com>
 <d2531fc1-b452-717d-af71-19497e14ef00@gmail.com>
 <a5198024-7273-74c4-b4f4-3a29d042bc36@nvidia.com>
 <f8fb1f7f-2497-033e-ff2c-c86c6caa9706@gmail.com>
 <fd1ca178-1ea3-851f-20a6-10bf00453ce3@nvidia.com>
 <a5734f19-254e-b6bc-e791-fa1ac63f11a4@gmail.com>
 <79f6560e-dbb5-0ae1-49f8-cf1cd95396ec@nvidia.com>
 <20200427074837.GC3451400@ulmo>
 <c1190858-eaea-8e94-b4d1-1cf28076c330@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="m51xatjYGsM+13rf"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <c1190858-eaea-8e94-b4d1-1cf28076c330-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--m51xatjYGsM+13rf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2020 at 12:52:10PM +0300, Dmitry Osipenko wrote:
> 27.04.2020 10:48, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
> >> Maybe but all these other problems appear to have existed for sometime
> >> now. We need to fix all, but for the moment we need to figure out what=
's
> >> best for v5.7.
> >=20
> > To me it doesn't sound like we have a good handle on what exactly is
> > going on here and we're mostly just poking around.
> >=20
> > And even if things weren't working quite properly before, it sounds to
> > me like this patch actually made things worse.
>=20
> There is a plenty of time to work on the proper fix now. To me it sounds
> like you're giving up on fixing the root of the problem, sorry.

We're at -rc3 now and I haven't seen any promising progress in the last
week. All the while suspend/resume is now broken on at least one board
and that may end up hiding any other issues that could creep in in the
meantime.

Furthermore we seem to have a preexisting issue that may very well
interfere with this patch, so I think the cautious thing is to revert
for now and then fix the original issue first. We can always come back
to this once everything is back to normal.

Also, people are now looking at backporting this to v5.6. Unless we
revert this from v5.7 it may get picked up for backports to other
kernels and then I have to notify stable kernel maintainers that they
shouldn't and they have to back things out again. That's going to cause
a lot of wasted time for a lot of people.

So, sorry, I disagree. I don't think we have "plenty of time".

Thierry

--m51xatjYGsM+13rf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6mu08ACgkQ3SOs138+
s6GkNQ/+MM+0bsgj+vHl+YaAN2lhG38F1/Aeh44skTQX8cmsPvvL03ucTRBOf3wW
TjMvlg4+8pFnBfUFEm6YfhBayoh4pemFZUyKjMiqrNExB3W2h+IPaixKQwRM5SPs
V6JpfP5Gc0Esye8UPKq7p8LUTFPRhlFfTzb3E9YcaWjW4cQu9Uv2BjfECQuSwkpa
dyTA7nuxuZzWk9vqNG8SDAb5yjXo5yZn5XxTKn0NoQSQkHGV0LLTO0xrhU7UIhah
oGT0bywp6iwncSYkHyKE0mgM1tLK3LUVyfjgXtwj9WK77VVrxkIeGPPRoG0z0GWj
NhoywNPnO8GCwpMpnJ+rY/YQPGbmIvxtxQ3WyydiWVpmV89+91Fo+bJa0hYTServ
tNlE2UoaZc43AvNkgpj6832xT4AjIWEF6HomFrr90qDhN/TIojUJYtyxEm1uh0UO
h78qHYBRqo+6WV+Txladbr2USeO2bMRNwYkohHawMIfTyGgPaZTlmR8a/tuVIyFe
Iz8DpUPs1yNKO0mbAGJ8yOaQs8QuJVoqQiWRMjedcyIqUASRQOVkjymqVrv8JZou
W9lgTK12eRxP47VyFtIY+sr4pT1g3Tx+eScMfZJb8SMw+/94q2F9keKuy7C2anM0
qfA8QFlxh9X71T+zlxeoWVrc5/LOmR+u0BJe/vLj4ix9FRGYVmg=
=IL/X
-----END PGP SIGNATURE-----

--m51xatjYGsM+13rf--
