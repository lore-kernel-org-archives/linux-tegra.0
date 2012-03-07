From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH V2] regulator: fixed: Support for open drain gpio pin
Date: Wed, 7 Mar 2012 10:55:56 +0000
Message-ID: <20120307105556.GB3107@opensource.wolfsonmicro.com>
References: <1331116113-22565-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IrhDeMKUP4DT/M7F"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1331116113-22565-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: lrg-l0cyMroinI0@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ldewanagn-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--IrhDeMKUP4DT/M7F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 07, 2012 at 03:58:33PM +0530, Laxman Dewangan wrote:
> Adding flag on fixed regulator board configuration structure
> to specify whether gpio is open drain type or not.

This looks good, I'll apply it after the next merge window - it'll need
to wait for the GPIO side of things to be merged up via Linus' tree.

--IrhDeMKUP4DT/M7F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPVz6yAAoJEBus8iNuMP3d53kP/02uPjPgFVlxTaot3ZLWT/Kf
+bKAbKKQPMyRmCdUsT0z+ES1BFIpKYTS0aHdg09GZv2XWOyqeXzWv9JQNUrzhERD
6umAPGijhvaWk8fQpYr8+/E/+cuf+39zdMydy8vHt3jRYuAR2vwZ4AauCULtWN+1
4LICkcUdSOE2V7n+LiVpC22TQfk9pSnspVSAgvDGk3fz3w/940JYw90WYm210RR5
C2o8Uryby8ErUgHPQgA9lCdEVgvmdviBKAT4l6QqbmDCQEpV0kpuSFJu39IYyKrM
KE91ekTX9H47oAA0gn6PLpleZ8LltupWdYFG3Okitg5ySS6kAu+VRIkvdEv013CD
rg+GJUkNLT56ZTSzjr4rPTvpDpEgBynpB66jqohWBcKcURIVnSJ2OcKaZ4dWORme
m+rktC9S1ufKl4PV6GA6Sc230ht29ogVnyBkUCvX/pyircw20s6e07uFLOrPWqXd
Javj1j9hmyd5nNS3UlD9uR8aO+RYQLgFHXnFShv+bicr4AivM8f2X5Lu0Hx/asAP
HgYkx/aOh59jlhwxKDAr9iaMcpWFtnEDVspqy9lzhB22x7XvkRmMk8NPnX1oNIJh
MJRmipIqXZMslrP85/Jk7n8BKT/553ec5rBKGDjtuuTJDD2KHSmyD8kmZ/hs49/O
ATIccpUtc05h72pg0f/4
=O1Cc
-----END PGP SIGNATURE-----

--IrhDeMKUP4DT/M7F--
