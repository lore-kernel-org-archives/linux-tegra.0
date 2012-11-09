From: Thierry Reding <thierry.reding@avionic-design.de>
Subject: Re: [PATCH] ARM: tegra: harmony: Add ADT7641 temperature sensor
Date: Fri, 9 Nov 2012 14:22:57 +0100
Message-ID: <20121109132257.GA29183@avionic-0098.mockup.avionic-design.de>
References: <1352465815-26984-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9jxsPFA5p3P2qPhR"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1352465815-26984-1-git-send-email-thierry.reding@avionic-design.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--9jxsPFA5p3P2qPhR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 09, 2012 at 01:56:55PM +0100, Thierry Reding wrote:
> The Harmony board has an Analog Devices ADT7461 temperature sensor
> connected to the DVC bus. It can be used to monitor the ambient (local)
> and on-die (remote) temperatures.

Note that I haven't actually tested this, as I no longer have access to
Harmony hardware. Testing can easily be done either by reading the files
=66rom sysfs directly or by running the sensors utility from the
lm-sensors package.

Thierry

--9jxsPFA5p3P2qPhR
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQnQOxAAoJEN0jrNd/PrOh/QQP/jUdnU0wVCfwCyhyXw0Fh+2h
PmPwDkW4ZDqO6DfbyXzJ2DjcPcRtYab8trdlzWP3ggNPXpA/LsRYrM9S1YzmFutp
lFYi8ifoygBQMBl1WCff4Qvp3ykzcLkZXjdxDIdx1RwKCUhLqkj8jYTpAr0/FucN
41IGiInGBwuEeiNE3rW2ZPVvSHgRRATRElYlwMH/jXUfgH34vMvp5nCJ/DioA+E/
BPCqS9MFDFTDb199S3KIxW4qdJo0my/Rn+feN+8HVD9/+uhMYPMTYO4GfPkatv71
o2HixCnbs1weBvbtqwE4Jyg2vptZ+VtclkH8euldhCnTUv4HBqjvmLG0B2Bj39Q1
cND7kEDtYJnKrOiEgY6MFoXy5+UpZBp4N15nP/WyUJfgoxFoBHWaVC3bjWJZjH54
51B2F0NnX0dRjPS/gIgv3ttCbFDBdwWkg9y6rn+jaU4ci6JQf6tWvas29nPY/qXv
WKNckgLtphvbtgToXO/I/xRoU6MmYGT+RctRoTC2ZXu5A7edfLWN1MwHNRQGRmBa
+CQV4kl6kaWAQ4iYpDNbJk+MsEGcZ79sjHgNmZOt1LKYycMQKTpld0Yd06WEHXxM
Rix0KsaOt2b/thKaKgG2en33gmd7TDTRR7X2wlAbG1VXUsTdY4KjYWaiKf6/buJo
YEJ9SdB9vFEBdTrySB/f
=GaKy
-----END PGP SIGNATURE-----

--9jxsPFA5p3P2qPhR--
