From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: permission to move definition of struct rpmsg_channel_info
Date: Tue, 10 Sep 2013 19:00:51 +0200
Message-ID: <20130910170051.GB22111@ulmo>
References: <5220F099.1020002@nvidia.com>
 <CAK=WgbZ2JgtAonvdyeDZazYBGdKpPAieJtjzi7MM6nwqhVfs7g@mail.gmail.com>
 <20130909125745.GD22197@ulmo>
 <CAK=Wgbbxp5pfQm1mvCZ2phigXe_e2_J_Zkrof9tx2jggi8EMjQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bCsyhTFzCvuiizWE"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAK=Wgbbxp5pfQm1mvCZ2phigXe_e2_J_Zkrof9tx2jggi8EMjQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ohad Ben-Cohen <ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>
Cc: Arjun Gopalan <agopalan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Brian Swetland <swetland-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--bCsyhTFzCvuiizWE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 09, 2013 at 10:06:24PM +0200, Ohad Ben-Cohen wrote:
> On Mon, Sep 9, 2013 at 2:57 PM, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>=
 wrote:
[...]
> > Looking at the remoteproc core, it seems that there's no direct way to
> > change the firmware running on a remoteproc at runtime.
>=20
> One way is to unload and load the driver, but you can also use the
> bind/unbind sysfs files of your driver (echo -n device-name >
> /sys/..../{un}bind).

I'm not quite sure how that solves the issue with replacing the firmware
image. The driver will still request the same firmware on rebind, so the
only way to have a different firmware loaded would be to replace the
file. That sounds sub-optimal. But it's not very important at this stage
so it can be deferred until (and if) it becomes a real issue.

> Does that help?

Yes, thanks very much for confirming.

Thierry

--bCsyhTFzCvuiizWE
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSL1BCAAoJEN0jrNd/PrOh8DkP/A8n8aHDgsm+KWqsS355Zb2A
6dtfx4EOgSgDteXTKMPycSOirwQ+uEDS6UPDavm0olnSLiik4kF7r9BuS8VtTqz9
nWFBUMVupVDunpgjrG5Cj1AsHI191pPoW+lvvV+J+i2wvuHTXkBVpXxfJ6SPQffx
zr/FAstuwSxmexra8IQx1zYsxi7AkaeZ+8UIxtgiX3Skht/WqgF2d6k7j6ZMgKEA
UBq2QsNBb6yD6/z5GaM+x51507pWEPcDyLnGgudIQ1/I+FImdwuLzoBqimRaPlE3
vCespgJIpKd2QcdRrBMOwQmolp9ZifuMGfUgrVXFY1oQBpBGon8usXOe/WU2SQ9s
MD+/ljHyRhUam0PQ12oMAnE6lw9VtkjLhKfz5w4S/ZpcakX6+jr9J5v/BTJWDTq+
UGuUCuXuRgolgAMwLXBWK+gaHE3g9kTy6lSHGyd3kcB1zYVTjHZ8VPaHeL+KXmLt
u41G/OJaUBz12zAeYXh0CgOxRtSP90zjesH5vdv+eaBG2bo8crRVvnQk6Z6TsgCv
Kbm+bV1o1WbgyhPzSjcn1/gtntAgyZVMpJ3qFq6GmFD2Sl2xHOU/3NK+QRReuc90
zfC8vV3RwsMxJk8WjJQj4OWTs+EsW9fTD7qnScBHBGjp+2xPkdOD5Dvy/XL26tNg
ezpeEMOnoqKNzmHAPDBp
=hUaN
-----END PGP SIGNATURE-----

--bCsyhTFzCvuiizWE--
