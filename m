From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: xf86-video-opentegra
Date: Wed, 6 Feb 2013 22:07:16 +0100
Message-ID: <20130206210716.GA1292@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IS0zKkzwUGydFO0o"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: xorg-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--IS0zKkzwUGydFO0o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I completely forgot to announce this. The previous discussion of this
resulted in a 2:1 vote in favour of xf86-video-opentegra. So I decided
to let democracy have its way.

I've pushed the latest version (based on xf86-video-modesetting 0.6.0)
to gitorious[0] and uploaded a tarball[1] if people prefer that.

One thing I want to propose is to make the driver part of the xorg
project on freedesktop.org. Given that other DDX drivers are part of the
same project make it an obvious choice, but if everyone thinks that it's
a bad idea I'll go and request a git repository for the tegra project
instead.

Thierry

[0]: http://gitorious.org/thierryreding/xf86-video-opentegra
[1]: http://people.freedesktop.org/~tagr/xf86-video-opentegra-0.6.0.tar.xz

--IS0zKkzwUGydFO0o
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJREsYEAAoJEN0jrNd/PrOhIuoP/1drHLSKZxub5rAMhiap3b9i
qBG8ViZBUeDk0Wt+qzB8zV8mdz3a3YiorBw+pYANcL0w11xl5G0YcNCHFp1IRf3u
/oXqhZEixw4/sB5xdRa4Gfzm+WnxEhAu7FQ77RxyCHDQt1Jn21tnT98OzD6wu2wZ
EHr/GI1wnN+7EvwBrotnE4v0Twxy6MEVFS3DkZg7ZZHTLkJGhY9L91wSZXAsMGSu
tLX9iw6FeD1Ch+tht0ByWO9A2KN7rSpwWFmgu7/U6HJcZv4/fVpAua5kjOnsyZfq
vizi89ab4RnL2NgG2uFvT/O1OnxMFxE2KDbZDLJyZFx5+H0xCwN/nmU0IwcsjqNG
ej+etA/AzDMS6hcPkSGOka1VNYCLTfi9XJnXKRYDlytfs7BR6od5n93JyL36rPiH
2B9eC54bTLfLSV8LJWKvGU0xMp9d/nRoFewxSHcew6imdRCOm+ke9GcKspmvmQ8G
+pauDRDntnQzXyqtiUxfWjcw/ekt8ksXw9DLykylIaNdJZ8RyJ98z4Foyw45Fkwb
B9J130ib3XoqFuM4INR1oVTq7RN/7xPN4PlzumEsYo5Zh1ZCjGhP60kBlrepZZJr
xs8CEyKOsz2pdAMgeAYE5Wd7yX/d86b7WjRAs8c3eUVCg25V7mIRF9TRv5lZG4hi
ybXInkDRSOv2509BD6O5
=6j5i
-----END PGP SIGNATURE-----

--IS0zKkzwUGydFO0o--
