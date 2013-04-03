From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: CPU idle LP2 breaks MSI on TrimSlice
Date: Wed, 3 Apr 2013 09:54:54 +0200
Message-ID: <20130403075454.GA25174@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IS0zKkzwUGydFO0o"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--IS0zKkzwUGydFO0o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Joseph,

I didn't want to hijack the other thread, so I'm starting a new one.
I've recently been trying to get the PCIe ethernet device on TrimSlice
working on top of the Tegra PCIe rework patches that I've been carrying
for quite a while.

A bit of background: when I last tried this back in January things still
worked fine, but I noticed that they aren't working on recent linux-next
versions. I was able to track down next-20130123 as the last working
version and next-20130128 as the first broken one (anything in between
didn't boot properly).

It turns out that the introduction of CPU idle (LP2) seems to have
introduced this breakage. Normally what I'd do is:

	$ ifconfig eth0 up

and wait for a few seconds for the kernel to report that a link has been
detected, after which running

	$ dhcpcd eth0

will successfully obtain an IP address. However, with the CPU idle
support enabled, the network interface no longer detects a link. The
reason for this is that the MSI that would usually occur after link
detection by the hardware never occurs when LP2 is enabled.

I've verified on top of next-20130402 that commenting out entry "1" in
tegra_idle_states (LP2) in cpuidle-tegra20.c "fixes" the issue. I'm able
to obtain an IP address via DHCP and use the network interface as usual.

I already talked to Stephen and Peter about this on IRC and none of us
could come up with a good explanation. Since you wrote the CPU idle
support I thought you might be able to shed some light on this.

Thierry

--IS0zKkzwUGydFO0o
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRW+BOAAoJEN0jrNd/PrOhO04P/iwNfHGS4BrY23f29Ripj5l4
Uw7KRy1gazpBf+m4//1/7Jgw1tzlI1HqxK/Jc/Cc/wfsB+SeVbYBYxKGODbp1B4F
uIALnMfdUGkM0JdeYgIcNmAuXWYNpIyLq95gOgt6zWXTI/dMbUL5GKzzkHPBL3z6
v82sgb2yb+/9MFgH2ReiNijTXN9lUlTdEq0pTJSzk47doYp3CzS2cbFmjFoaRbPs
HCQ2Zlyxx+Ik4p95oCcGADnvhKnhMF9L5+Y5aBqcGNVbhdaV28flDbE4J/cKOSZh
MVpPf463RkTITbROJBKmc6rU8USC9tGmS58cxmsm+3gopn3L94vM+f93cf3EqGnG
XvylrcXpmAC1LRsd3u3D/NWX/4STJVSpFIdJIyls/D37z+Dyj0F2+5xvBr0YoxRo
kYiSP9gshO7fye4hVyO1eSR4tIUZgVJgaWfZqU8xkGlGvo2PTNTL7MRFTohnI38L
yTVrbXThOIHjdbr1/Zxoi+nVm8sO3PMyQ97U+LsztFehIiJ5tHWNnDoOcFBCEK1i
kgT6KTVvQ9GRpOGOn4Jr16p7t0oOT92gNHz6NPUPOWYHbjEh5vytBkBTW2ZRtuWS
WRTiCpAZIQx9TSTC9YIhf2/LXv4ftEpsp2C9In5YVwdaJi9o/ivK/6FT38szE/hZ
yvfMKxTUWiBZKAfiNWX5
=B8/s
-----END PGP SIGNATURE-----

--IS0zKkzwUGydFO0o--
