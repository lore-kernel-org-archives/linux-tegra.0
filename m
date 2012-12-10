From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: NVIDIA Tegra DDX
Date: Mon, 10 Dec 2012 11:56:27 +0100
Message-ID: <20121210105627.GA7503@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cNdxnHkX5QqsyA0e"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: xorg-devel-go0+a7rfsptAfugRpC6u6w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I've upload a rebranded and cleaned up version of xf86-video-tegra to a
repository on gitorious[0]. Don't get too excited, since this is really
just a fork of the modesetting driver with some unnecessary pieces such
as PCI support removed.

Aaron had some reservations about calling this xf86-video-tegra because
it will clash with the binary tegra_drv.so provided by NVIDIA. However I
couldn't come up with anything more creative. Distributions will have to
deal with this in some way or another anyway and there really isn't a
way of running both drivers on top of the same kernel currently, so I
decided not to care.

Thierry

[0]: https://gitorious.org/thierryreding/xf86-video-tegra

--cNdxnHkX5QqsyA0e
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQxb/bAAoJEN0jrNd/PrOhbjAQALzzPtryRkf5NAw8z7FhmRwd
UsO6CF6WT27kZL13UZDwtUlXqRjpgX8EZOqiOKiTwk1xVjJxnecGI7xovncAJYQA
AAK0vUJ3xaK7SUMKVAu9FjUnLLP88EDUaMSq5wASlGnI6aK72A3qW/Uv0oJdYfsA
b/u9qwnZdS7KBEFMK5reMSgtNwvCJNWmNLGCeCdTt9B1U+E6g7m+KsfMl3+PaXhA
jVBQnhkgl9zCEgooK9JFE5Espclvkhyh+/cVh9Z8Tg5cN0PU3S12wpKav531dx5W
/ImsNOcBZnOTlHodPDuqc9ZiTs7lok0VzV8/HKpLh1M7MHP+cOEMtv0clsied/CG
u8V+rnQKpNtT/m2J/qOV/IkkkS1OvJSll3drqUySzibCQgnGY47qr3WNvEi1xq66
6gBxMpmKi9kXBE79PE7iAulYGKTnpDUGiJx7qDtLd5Ya8js21WmYJLYPsRaV60kk
Acj7p/OlM9qlbO1Fm5Y9kBIkQ4yyrGrEbP/N1scHPoFbiXWxDXY3HTgboB6rzPN4
Peh2Wh/wOhk/HM1mO8JB+bXYlTVb8FlUz6Qla+P5M6wQtvQbZW4uy7FpoANQ6XuN
HaUE7VH8bcqXpK7uBxHwa8DJRZ20FSydvr4GgrxPzwqXhDdu+aJgjrEsHNnA2z0p
KxXBr7RjTm0qkUNMk94H
=Mm9p
-----END PGP SIGNATURE-----

--cNdxnHkX5QqsyA0e--
