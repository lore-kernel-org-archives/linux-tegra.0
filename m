From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Tegra DRM with HDMI support (\o/)
Date: Thu, 11 Oct 2012 22:07:05 +0200
Message-ID: <20121011200705.GB27599@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wzJLGUyc3ArbnUjN"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--wzJLGUyc3ArbnUjN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I've finally managed to get HDMI working on Tegra20. Unfortunately the
xf86-video-modesetting driver doesn't work on top of it yet, but I think
that's a different error somewhere else and I'm still trying to figure
out what exactly is going wrong. However, a framebuffer console can be
run on top of it, as does a small test program that I've written for
testing.

The branch that contains all of this is the tegra/next branch on my
personal Linux kernel tree on gitorious[0]. Some other things are
included as well, such as the latest PCIe driver, an experimental draft
of a NAND driver (loosely based on the U-Boot driver by Jim Lin and
Simon Glass) as well as various fixes and hacks. Some of it is probably
also junk that I'll throw away at some point. The branch isn't very
clean, but it should work well enough for anybody who wants to give it a
try.

My plan was to get LVDS and HDMI to work on Tegra20 with CMA for GEM
object allocations before submitting for mainline inclusion. Since all
of these are now working I will clean up the branch, provide a branch
with only the DRM bits into a separate branch and submit the patches for
review, with the hope of getting them included in 3.8. A lot of the HDMI
work has been contributed by NVIDIA's Mark Zhang, who is also busy (and
apparently very close to) getting Tegra30 support working. If he can
make it work, Tegra30 support can be included as well.

All of that said, I invite everyone with access to Tegra hardware to
give the DRM driver a spin and report back if you encounter any
problems. Feel free to also drop a note on success.

Thierry

[0]: git://gitorious.org/thierryreding/linux.git

--wzJLGUyc3ArbnUjN
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQdybpAAoJEN0jrNd/PrOh5eEP+gJxS2KX7eq18K11WV19S/aO
poKlfL2jFozIo15eB1yGDNFXjPh5rkaLQ9FbE0tn9WhwQ4fMds7t0ON0+2b7KGK1
5PkWRh2PvyC2UPBopg8HuAVty5TD99F/Yx7UzPQy+RNdsHFkXb4+LmsGX4BiRlSY
CX+uimRgO70xo7JUiK48799BSCtOz+eEb31NQAOVuwEOGZ96ovcXvZrFaPx5ObzY
lCfT6C9MvW7Pw3OKlEt20Naw6jaR/rUrFStxAkEZ77NRaj5LuJfsyQN47TtCEIHb
vn5z4RiZBudepaTOsH0BDLtBrN71HSI+Ov2kvPU5mxWLk4C+E5F3O7iHiUC3DJDg
f4qhdeltjzH7Nq+zvC62i+W33NzrDgir9lXrvBoifv4dwb2o/B8P4Q1dmmVi6Hv4
gCX5N2cJj4Sexd7Uqpghy3KB1AvgNaafh5jostwhqka84uW7nMlHV2WwTFCpDO+j
K4us1mSRepHZ2y1edxEUwEsBFNQTrsPMljilPNk9ZMQ5tU9X+Q3XWZx9SN6VI6Fr
vcDaR44cNOru0lre5ZqrtyXglAJEGdXmg2U0wA+yfb0qkw4o77M29byJhFH/IXj5
8xqjAsJwzZ0gNZ9K7YqLYkc0iIfj+mEgUuB95l0I01wiPYiB8gZUblHtCBQe/a9P
h0vDpAiCj42k7GOwHpnP
=nufH
-----END PGP SIGNATURE-----

--wzJLGUyc3ArbnUjN--
