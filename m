From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH v3 4/4] dt: paz00: define nvec as child of i2c bus
Date: Tue, 21 Jul 2015 22:52:50 +0200
Message-ID: <20150721205250.GA1521@katana>
References: <1437424546-30405-1-git-send-email-danindrey@mail.ru>
 <4778199.vGjAP5lpOS@fb07-iapwap2>
 <55AE0803.10603@mail.ru>
 <2107735.0gMPOtIgYc@fb07-iapwap2>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lrZ03NoBR/3+SXJZ"
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2107735.0gMPOtIgYc@fb07-iapwap2>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-tBiZLqfeLfOHmIFyCCdPziST3g8Odh+X@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> It's up to you. I think if the NV guys are ok with the tegra i2c change,=
=20
> Wolfram can merge it right away for 4.3.

I asked him to resend, because I *want* to merge it for 4.3 :) Only the
slave-mode enablement for i2c, of course. The other patches need to go
via some other tree (when they are done).

So, V4 with only this one patch is a good idea in my book.


--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVrrEiAAoJEBQN5MwUoCm2gGAP/2bVp+X9GDE2skRGIHa+60b0
MvW2DZnF+j5yC7URzx9LxlZ/udynSga7Ndr7nGDybOg92yOwbK4o42oKElgRmXCG
lzEaGfN2627r7l5DQUxuqxVWxMSpy4dVdcUPLinpudmme5hpgmXE+5gWHlxR2sl6
b2vhogzjQVCEU4NdMOVkeVUtUXWDqAKfKrDRe+v8N31829zh62gRmVPE4EwhtNZZ
0XxQ9COoRPErU8U6UmBgZAL+NaV0YXyxX/iwKiM0JW6HpHX24rneyzygDA5Y2uQg
YrOt6BDD5K7kzw2abPlTSSTOpOtuY5zIkuEharO/ASR3FtPoSGL31VHv6+93jPGc
lB65rn6MfCEAHdMhQnFeA+/X/bkwh1xTZz6SYn7vRtcQws6GTQQjSEwlrYthOiyw
nvW4EB8DFoOlTPp9to8/veAFVeO5pe/g5yomJS4sm7/wHA3VVMqL0lCnf640Unww
icBfY7SYT9Y1nHafmGpwrpNeC5X7inscQwjucZIsvdCrnaOEdcWlYice+qBJ/lqK
j702gMewIT5S+Sk7DGBm4hGFhRPiLw2DFpMSALLsuxsvB31x2lIWCg+dgk8Rt8uF
KVfbgJTczmS2Vc8XYpULNnf59g301wP5o+8qmjKKGPohZHXVh/vdpcics04J18+A
cCv/JBx918p9nIDPEPlR
=mCbX
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--
