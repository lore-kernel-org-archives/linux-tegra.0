From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: disable LP2 cpuidle state if PCIe is enabled
Date: Mon, 6 May 2013 22:44:24 +0200
Message-ID: <20130506204424.GA18286@avionic-0098.adnet.avionic-design.de>
References: <1367872744-25002-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SUOF0GtieIMvvwua"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1367872744-25002-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Jay Agarwal <jagarwal-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 06, 2013 at 02:39:04PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Tegra20 HW appears to have a bug such that PCIe device interrupts, whether
> they are legacy IRQs or MSI, are lost when LP2 is enabled. To work around
> this, simply disable LP2 if the PCI driver and DT node are both enabled.
>=20
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Thierry,
>=20
> This patch is physically based on next-20130506 so that it doesn't
> conflict with any of the recent cpuidle cleanup work. I'm sending it with
> the expectation that you'll apply it to your PCIe development branch
> though. If you do that, you'll see some conflicts unless you rebase your
> dev branch onto something more recent than next-20130422; I assume you'll
> do that rebase soon enough anyway, but if you weren't planning to, I can
> resend the patch based on your current dev branch.

Yes, I'll be rebasing my development branch soon anyway and I'll pull
this patch into the branch. Thanks for writing it.

Thierry

--SUOF0GtieIMvvwua
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRiBYoAAoJEN0jrNd/PrOhScoP/i6HBKFXQ/b1NK9TiceQvLvG
F63UHEaPSgPx9suJuaRHEhKdSaHkh227rB/zMcvzdM03UxyCKJbJtjwLvrcp9OXd
Q7sWqQMAS2uOaQ4tssxpunS/cIyNuKVRx42UQvsqAlG9MAz/+1QAKw01iUoPyZXt
Xn3/UnFEmbWWXxurtQrDca1aP4oUCPZDqGps3qiyPeDHllqOht84xMo4OR+pPRrL
mhaIBAp/G1ZgxR/MOeqszTT62xYJxPvpyquQ2B8ksBcDR0kFrWj0wi1eOlD0zc91
rEAVPOQ9SzFmp59ndpn4/jrnyBQKiei5yjsdXRSr7ylIFO7V13DVgm+tuXF+SKs6
bsbmbp/sf2CkkLPB+kVfF7v2Rschfn545eeHxFmLiZkIQvkZZCWONj9N+WJ0Y6Br
5tGEkbewoDb3JlVOk+S/WIY2tKzhRg1SE100JiPizIaJ86OmQ6fHjakS0aMNw+wM
+WmviQYJnwwHX1zRNd6/jhtwU6+uPd8b5fFmAZYaxhOz2buxhOaeYAXszVBZUo+x
IUQDsGTDU88OMDEZVKmvBP57EyRM5LQYLjc2ZvB4108RIKluAv/5kOOpeVmf1Dkt
1wW6szWaYjU3D8kNKCe19GsnDCwj5/r8IiVzc6RmpCz31bfFTTY2/9pbd3Z+N1Bo
60I/14eRbdKqDkPFTm62
=nm7Q
-----END PGP SIGNATURE-----

--SUOF0GtieIMvvwua--
