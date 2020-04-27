From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
Date: Mon, 27 Apr 2020 17:31:07 +0200
Message-ID: <20200427153106.GA8113@kunai>
References: <a5198024-7273-74c4-b4f4-3a29d042bc36@nvidia.com>
 <f8fb1f7f-2497-033e-ff2c-c86c6caa9706@gmail.com>
 <fd1ca178-1ea3-851f-20a6-10bf00453ce3@nvidia.com>
 <a5734f19-254e-b6bc-e791-fa1ac63f11a4@gmail.com>
 <79f6560e-dbb5-0ae1-49f8-cf1cd95396ec@nvidia.com>
 <20200427074837.GC3451400@ulmo>
 <c1190858-eaea-8e94-b4d1-1cf28076c330@gmail.com>
 <20200427103851.GB24446@kunai>
 <dc2de966-81d6-6ad5-0c51-16dd28ca4165@gmail.com>
 <20200427141922.GD3464906@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="WIyZ46R2i8wDzkSu"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200427141922.GD3464906@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--WIyZ46R2i8wDzkSu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Yes, that bug should be fixed anyway. But that doesn't justify breaking
> suspend/resume completely, which *is* a regression.
>=20
> Look, I'm not saying that we should drop this patch altogether. All I'm
> saying is that we should postpone it so that we can: a) get suspend and
> resume working again (and by doing so make sure no other suspend/resume
> regressions silently creep in, because that always seems to happen when
> you're not looking) and b) fix any preexisting issues without possibly
> scrambling the result with this perhaps unrelated fix.
>=20
> So, again, I think the safest road forward is to back this one out for
> now, fix whatever this other bug is and once suspend/resume is working
> properly again we can revisit this patch based on a known-good baseline.

I am with you here. I want to add that the proper fix should be
developed without thinking too much about stable in the first place.
*When* we have a proper working fix, then we can think about making it
"more" suitable for backporting. Yet, it may also be a result that older
kernels need a different solution. Or have no solution at all, in case
they can't do atomic_transfers and this is needed.

D'accord?


--WIyZ46R2i8wDzkSu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6m+rYACgkQFA3kzBSg
KbbGqw//cZv3rO5AhOcCCxeJFxoGIgIv9CidGK0fmKlYf0RLugGFMb0p4djzlUIG
SqC/DZviHJVrmLbQgWChpBlwgIHdLoQNICqa8mNp5/dDfpsfC+ipjKG0cIiPTHhF
Xih33dEwEp89eAxjb583BPUtMu6QGd8npiTyexDAiWFow0uYzms9JGZUGlAujZg0
3tbbdQAHjW7bH4XtLcVl8umKGNV5zaIrdvDQl2rFm9Q+BRj6jN/zGKefFptsJols
dLo76cXnTCdaHD5NRLMJESULyDUKSCP+C12d7KZ3PBsPPnBHAecze88WkmJzLqR1
5l8GKHV9aNWJ4tmjr/B0rujvFZThpTJ8WNaxrYUqC5Lc27tiblLsJTfG04d9u6He
jEXc0Osn+UQhmnoY0xBGUkXOict6u7beNE051fDqH6fvNUk1X5FZLobi9eVnsj10
B4r2Z37jvKVRqz2W1vxkAAYrHdIzX+r/rJR7jIa8MjADuFpDSEpONkG10LKF6rnG
Kyq9vlETJtN7FMvJ3gfWC89N93CXHXTiuJf1k9d1C2rJxTtvXf2wmppxBTE81ZES
B29+V239qytKHdZOKrVZEqCsmnml9ufrdcRSkjm+yXIst6M1zX8uchC5RaEgkDeK
40gJRr3GD/E8OWXEJ7gdWHwf63p8yWeTthkBn+2NlHVImCFkbs8=
=aG5Q
-----END PGP SIGNATURE-----

--WIyZ46R2i8wDzkSu--
