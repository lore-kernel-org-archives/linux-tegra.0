From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 5/5] rtc: tegra: use managed rtc_device_register
Date: Sun, 10 Mar 2013 23:51:50 +0100
Message-ID: <20130310225150.GJ4743@avionic-0098.mockup.avionic-design.de>
References: <1362852816-13460-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pMCBjikF2xGw87uL"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1362852816-13460-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--pMCBjikF2xGw87uL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Mar 09, 2013 at 11:43:36PM +0530, Laxman Dewangan wrote:
> Use devm_rtc_device_register for registering rtc device.
> This will reduce the code for unregistering rtc device in
> cleanup path and remove the implementation of remove
> callback of platform driver.

And RTC is also an abbreviation. =)

Thierry

--pMCBjikF2xGw87uL
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRPQ6GAAoJEN0jrNd/PrOhcjkQAJmyMum2G2cts+CbdQ+srVsP
wvbvRaBtnmDMXOJlrqpSIq+gPVf00rjaxzgArN60XWx8AKuFme5e7/UybSRH2/qE
EfEER8RDyy01rBhOKcGoOpSyu162/Ed4cGPgbFqPauiKcqEd3hte8SNUsEInRZP4
atmdwTqLab0DQjkBWFSkHcKY5HDmGz+8dIRzBhulwX+wU+/egEfPBhJ6L/GlObFt
uiYwot0VvkXEAq/9gBrFzmU+YEAhalfoImASebSYzJ80/wwWtwyhiPo5l87bhYHN
I7diOIi5re5O57u3Nny11/sNwLIS6/FSSgusB/pLIU5kMwjAvmlnJ//OQOhcqKO/
zHW2XiiXTP8WoMBmmgu3oljVowYG34l7neoLbwOmYOBWwiTeFVSryZIFhoRDHI63
KfpWNv6KTYyhkNbzxLoff/jOHQlOOK1t3bo29Voe3gbVtN+edM7YvYPuhctgqPp9
L76+Y1FIKJKszi3GnEB5MLLeKoZ/A6BZOwyxLADg2FDrNfaktMUYv4uBLh06YCfl
OgpXbwvjiz1qKPqx+3bZ/UuMaCzphZvr+SdnXSIRvbiT78BTWwhGOINrYt/s4NE/
f7jHT1xqMAYkzueF01/VKn8nOBTmC8yy/N+5UcyFvDtiIo+ZfLPuVyAYu0uTiUqo
ukME93ULj+GkxVAqL9Hd
=M2s7
-----END PGP SIGNATURE-----

--pMCBjikF2xGw87uL--
