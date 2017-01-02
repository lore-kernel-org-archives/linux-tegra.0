From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Ethernet on Tegra TX
Date: Mon, 2 Jan 2017 18:10:12 +0100
Message-ID: <20170102171012.GD18393@ulmo.ba.sec>
References: <CAGWmfYqgarb5cC08wtkWiWjWMR3tXm39z7bKH8+LZN+sThD8Qg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kvUQC+jR9YzypDnK"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGWmfYqgarb5cC08wtkWiWjWMR3tXm39z7bKH8+LZN+sThD8Qg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Claudio Scordino <claudio-YOzL5CV4y4YG1A2ADO40+w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--kvUQC+jR9YzypDnK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 02, 2017 at 04:50:46PM +0100, Claudio Scordino wrote:
> Dear guys,
>=20
> just to let you know that trying the instructions at
> http://elinux.org/Jetson/TX1_Upstream_Kernel with a TX1 board and a
> 4.9 kernel, the Ethernet interface doesn't start.
>=20
> The console complains saying "RTNETLink Network unreachable" and
> ifconfig only shows the loopback interface.
>=20
> Attached the .config file.
>=20
> Once found the reason (I still have to investigate but you may already
> know), you may want to update the page with further instructions.
>=20
> Best regards and wishes for 2017.
>=20
>                 Claudio

Can you send out a boot log? Maybe there's something in it that would
help determine what's going on.

Thanks,
Thierry

--kvUQC+jR9YzypDnK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlhqiXQACgkQ3SOs138+
s6H3DQ//fhD2G3hY3t7VF1Zgz8OId1gD+12YeCV2J1g9ifXNxsl49/GP9Hm9JMUC
P0V2XACb35iOZybPVS+aNPiMJHDFmaCQ2s+oimaJ5iHV+MGdt2zt4EElLZgBhD0J
PSW2bm4f1qdRHn2tVch7mlRsYNJ4CILSkPzxoC+WPFtYqV5fqToNUZXBDneFYX5m
ji+lEowZ07RqKQ4HsrJp3IhqMEFXhmeXBxBpku5akJslog1FKwzlEnSjKU8XQvn+
E6oOPmmyk9Nn+gw2C9LuchRe3yJrUOZb3py5aBLcYF2cqWd4Duoc8E4l/kc/41fC
sfR2t1kTUp0BKn3xYXW8+yZfWhKWyy7pwmNhygIBlOKIJ8c9u5ElTJCjJYjotUsD
xeSTKuI7gERch6wDyfh2Pjz9ZlO7P9CP6FP7TTM5qcVYjrFI4/z0AkAn9Iet1UCs
3FYwRjCgcaVXmSN8e+DWKHsHFfweRPOASt0/JNchLuoeLxI6HBSvrRidXjELGYzm
AAA+qffoYlMsXZ+ACWQAv/2QxuyDOu+okOgZQgLvLy0hfILE6bmgA75kwthdxcON
HJ+s7T1FcH6dzCM9YQOioxxo3DUR0uXJ0EQa5IvUNm9q+PUiHnF2UpM7xW79hlPX
eRFdIx49tZ16yI1XEsypQ7mYs//S6CgRWUQGeK8HTIvilj52xuE=
=oNPt
-----END PGP SIGNATURE-----

--kvUQC+jR9YzypDnK--
