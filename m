From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
Date: Mon, 4 May 2020 17:42:26 +0200
Message-ID: <20200504154226.GA614153@ulmo>
References: <fd1ca178-1ea3-851f-20a6-10bf00453ce3@nvidia.com>
 <a5734f19-254e-b6bc-e791-fa1ac63f11a4@gmail.com>
 <79f6560e-dbb5-0ae1-49f8-cf1cd95396ec@nvidia.com>
 <20200427074837.GC3451400@ulmo>
 <c1190858-eaea-8e94-b4d1-1cf28076c330@gmail.com>
 <20200427103851.GB24446@kunai>
 <dc2de966-81d6-6ad5-0c51-16dd28ca4165@gmail.com>
 <20200427141922.GD3464906@ulmo>
 <20200427153106.GA8113@kunai>
 <e5a3dd07-97f5-29f1-974e-3037a01cc89c@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lrZ03NoBR/3+SXJZ"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <e5a3dd07-97f5-29f1-974e-3037a01cc89c-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 02, 2020 at 05:40:35PM +0300, Dmitry Osipenko wrote:
> 27.04.2020 18:31, Wolfram Sang =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >=20
> >> Yes, that bug should be fixed anyway. But that doesn't justify breaking
> >> suspend/resume completely, which *is* a regression.
> >>
> >> Look, I'm not saying that we should drop this patch altogether. All I'm
> >> saying is that we should postpone it so that we can: a) get suspend and
> >> resume working again (and by doing so make sure no other suspend/resume
> >> regressions silently creep in, because that always seems to happen when
> >> you're not looking) and b) fix any preexisting issues without possibly
> >> scrambling the result with this perhaps unrelated fix.
> >>
> >> So, again, I think the safest road forward is to back this one out for
> >> now, fix whatever this other bug is and once suspend/resume is working
> >> properly again we can revisit this patch based on a known-good baselin=
e.
> >=20
> > I am with you here. I want to add that the proper fix should be
> > developed without thinking too much about stable in the first place.
> > *When* we have a proper working fix, then we can think about making it
> > "more" suitable for backporting. Yet, it may also be a result that older
> > kernels need a different solution. Or have no solution at all, in case
> > they can't do atomic_transfers and this is needed.
> >=20
> > D'accord?
> >=20
>=20
> I saw that you submitted the revert of the patches for 5.7, hopefully it
> won't result in putting the PCIe driver problem into the back burner.
> I'll try not to forget about these patches to resubmit them later on,
> once the problem will be resolved :)

I can put these two patches into a local development branch to keep
track of them. From what I said earlier, it looks like it would be fine
to apply these if we also make that runtime PM change (i.e. drop force
runtime PM and instead manually invoke runtime PM callbacks, which seems
to be in line with what the PM maintainers suggest, as pointed out
elsewhere in this thread).

How about if I put all of that into a branch and push it to linux-next
so that we can get some broader testing? I've already run it through our
internal test system, which, while not perfect, is the broadest system I
am aware of, and all tests came back positive.

I'm not exactly sure I see a real issue with the PCIe driver after those
patches are applied. The regulator errors are gone (presumably because
the regulators now do get turned off properly) and I don't observe any
other issues.

Thierry

--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6wN+AACgkQ3SOs138+
s6FAxQ//Z4QpPdcFLKFZCSCH23KA4t2/646O0Py+XUV421tLkrvkOepTvI2CXWQd
vj8cFw6SyA7IKDOEorgHT8nDwJqNTPuEO9eNS33QVlq21ezkibKXAfJH4kbrDr7l
pVFJajPsJWvHUS9ULWtWdQKbH7QgAFyiqO5r/b6tOP32uEN+uHAatlUb0ao3ZXnR
FZZWkZ4QdX+kxb1RRyLc6+KMIl/XwIdVkgXthRHjhKGT5UQOArj7LrxYQgPaUrqK
yFp9ahclAinfGsbPEHbIyxmDTy20SxQbfM9l9Bq/+Tb3NzXfhs5tTnFKx1SImXDY
0fEWZWLiV/uOzwVaAZZ80LRJd2T4VpYGdbX3m06GksmuZRfN74ART7F+dDegECXf
Eug96QB2gNLJKaxwP1eBnlLnEobsmAfIKpo4DMcdKD8kcdMQu6TAJSbIl4vT/f19
n0+er/TSPBmVO8c8FlnT2EXmrYvM2uy4BJiE7TdqU7SauexrUxErR5O2mt3Etofb
9aIq3aApVEG1SyU7/Q1HznCJREGv1kB711bgJxE32ZbgpqxdJF7tuTxWX7aV48Os
2HAO4tVeXZWJ5EiciF0v54QrH0TtsLhtbwb6GyIxJvjOLERDffzvKAwKgGXL+1XU
Ym4+vPB4bGYtfzASLHrJgMFSTVrHBlrS2v4ZOe5zcBgcBUJk48I=
=+3Hv
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--
