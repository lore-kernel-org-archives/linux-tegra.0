From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 340/493] arm: remove use of __devinitdata
Date: Tue, 20 Nov 2012 10:43:54 +0900
Message-ID: <20121120014352.GP4483@opensource.wolfsonmicro.com>
References: <1353349642-3677-1-git-send-email-wfp5p@virginia.edu>
 <1353349642-3677-340-git-send-email-wfp5p@virginia.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0UhZIN3Sa23/ILEd"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1353349642-3677-340-git-send-email-wfp5p-4Ng6DfrEGID2fBVCVOL8/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bill Pemberton <wfp5p-4Ng6DfrEGID2fBVCVOL8/A@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--0UhZIN3Sa23/ILEd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 19, 2012 at 01:24:49PM -0500, Bill Pemberton wrote:
> CONFIG_HOTPLUG is going away as an option so __devinitdata is no
> longer needed.

Acked-by: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>

--0UhZIN3Sa23/ILEd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQquBHAAoJELSic+t+oim9CbMP/jWpPF1w7xFKpd66D5Qz/mgy
055RceymL9s8srbjA98uWr65QEqtswPcgLMmUrAvw1a3sGiC3v3Xby3b6QnhZwRi
W6xul3sBf+empT1MZ7EBcWERvdZI3/9/r914QIssEOyQ1ifHAaTg0iHi0g6xMyca
V9fWlYsJqg/UlbYnRji/YBgrvOnuZj05MZ/dTRyChq7wPDWoOK8yobedCK0fEN6B
KQFfZfEsaZMw8Lnio7WoBDMN4c0mIzfDPBbux1fnjqkw3CkxMnoaEQx87Z2Y6Orl
OU/8Wl7+ktNJgHKIvh2/b48NG8syKqZowvt2pV74Fsxw5bvYqGnZSpxoX7pmuLqs
0SjNCN7kDK1gVfB7YvSdvDBo4p4qJxWvdUOrcMV66kDlRt1+T3RFiqTajNcEh88D
98VLX/rNMmyT7OdNdXX5oZFFVUR3vn60qHURRZ/w2PFpFHQyuFcAXzShpOaws8GE
Y93O9paIm65OnbDyAf1+Hx7CslNGByudARks8bVU28niZ51+HYBpWN+OWREyxyTn
oPFKL3OpPmhGPUVSg9SBdsEioz1G1TjVEJ1BWdmkAtcXSolZmRHLdYLj0pFM9TB6
IGmu3NAjjGKvjbnQU+nJRKw/t0l3pyP4s0o3Moj2LMEMnOLpA61Xl2BYcYcF3u2L
KQn11wMe80r0h0F3grqa
=BmWB
-----END PGP SIGNATURE-----

--0UhZIN3Sa23/ILEd--
