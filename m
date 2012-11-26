From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 1/6] video: tegra: Add nvhost driver
Date: Mon, 26 Nov 2012 10:25:24 +0100
Message-ID: <20121126092524.GB8602@avionic-0098.adnet.avionic-design.de>
References: <1353577684-7896-1-git-send-email-tbergstrom@nvidia.com>
 <1353577684-7896-2-git-send-email-tbergstrom@nvidia.com>
 <20121123233855.GD21555@avionic-0098.adnet.avionic-design.de>
 <50B07084.40707@nvidia.com>
 <20121124190416.GC26154@avionic-0098.adnet.avionic-design.de>
 <50B32690.7020102@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KFztAG8eRSV9hGtP"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50B32690.7020102-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--KFztAG8eRSV9hGtP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 26, 2012 at 10:21:36AM +0200, Terje Bergstr=C3=B6m wrote:
> On 24.11.2012 21:04, Thierry Reding wrote:
> >>> I would really like this to be phased in in more manageable chunks. F=
or
> >>> instance syncpoints could be added on top of the existing host1x
> >>> infrastructure (the display controllers can make use of it for VBLANK
> >>> reporting, right?), followed by channel support for command submissio=
n.
>=20
> I staged nvhost into 4 patches that each add some functionality:
>  * Add driver with API to read and increment sync point values
>  * Add syncpt wait and interrupt infrastructure
>  * Add channel and client support and related infrastructure (jobs, memmg=
r)
>  * Add debug support
>=20
> I hope that helps in reviews.

Sounds better.

> > I'm all for reusing your code. My concern is that the structure of this
> > is quite different from what can be found in the L4T downstream kernels
> > and therefore some rethinking may be required.
>=20
> As long as I can keep nvhost as a separate entity, I can port changes
> from upstream to downstream and vice versa and there's no architectural
> reason why we couldn't gradually move in downstream kernel to using
> tegradrm.
>=20
> If we merge host1x management code to tegradrm, there's no logical way
> of taking tegradrm into use in downstream.

I think I understand what you're saying. While I agree that it might be
better to move host1x out of tegra-drm in the long term, in particular
because other frameworks like V4L2 will start to use it eventually, I
have some reservations about whether it makes sense to do it right away.

Furthermore as I understand it, most of the work required to use
tegra-drm downstream would involve changes to the userspace components,
wouldn't it? None of that would be dependent on where in the kernel the
host1x driver resides.

Thierry

--KFztAG8eRSV9hGtP
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQszWEAAoJEN0jrNd/PrOhvGoQAJcgvKG/Dd5ZSFlH91Brmcgg
aNIwDs2iBl4qHMwsGVuzP4IC0jdssVjr6QT9iiMonEpVdbxcVvBio5d7a1a9OCs3
AYF7oJwNrTqD5eaNzbidJyPvrCHx2IRBfcedcQt+4vNvOHV+pFbC1KmeJrTzTYdO
Y+2VtquFXFC+jR7wKggHFZw9wVQRmonJ0xtmKYD8P7pxj7vktxHgFQp4P6/64b7Q
/Ov+Gnsutr329ZmLxEPMLkiVo43rhDZEWV1Iuber8bqM+F4QOCZ7U5yfai9i2qOu
mMWnt+O9X2tfhYx+3h1XITXSh2KTizmJ/+JJtuLvGzM5bysSj+ZIQY+8nL1X/ANe
3sn370cA4JUbEDIbFqsQgs7U/y07ol6m/B1+o3JNv6Clm5TzyDpMhId30gDH96GH
fIQxwYXfimCxSUTdtvH7J+K6WjxFNNicranzDbIscF0ZtH1e1DXvhospGHohyUJH
z/pVBBgK/NqIZMjS1gJYTIx7PMN0edEvtRFMJlWACdtw8bbtBb9MRFFLZu7Pyt07
TypO4oherzTYpNV1dralTAr3ah/MihcJX6TJT8Ezpvm4yzA/mH0FhwNjtKicrQoy
zHWbGPWyfU6j9QMdSvQ9bk4k/K0We8lGevLL/C5UXbZPn3UY8I7u785BIB0NaU1c
eikifZaBC0t8MwbNv+m8
=MA83
-----END PGP SIGNATURE-----

--KFztAG8eRSV9hGtP--
