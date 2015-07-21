From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH v3 4/4] dt: paz00: define nvec as child of i2c bus
Date: Tue, 21 Jul 2015 13:57:32 +0200
Message-ID: <2107735.0gMPOtIgYc@fb07-iapwap2>
References: <1437424546-30405-1-git-send-email-danindrey@mail.ru> <4778199.vGjAP5lpOS@fb07-iapwap2> <55AE0803.10603@mail.ru>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2479813.gKgmJeHZXj"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55AE0803.10603-JGs/UdohzUI@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-tBiZLqfeLfOHmIFyCCdPziST3g8Odh+X@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

--nextPart2479813.gKgmJeHZXj
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="windows-1252"

Am Dienstag, 21. Juli 2015, 11:51:15 schrieb Andrey Danin:
> On 21.07.2015 11:25, Marc Dietrich wrote:
> > I think in this case it would be better to leave nvec and dt as it is for
> > now, and just add the slave function to tegra-i2c. Otherwise we will
> > again have two different "nvidia,nvec-slave" bindings (one for the
> > intermediate hack and one for the final representation). As an
> > alternative, you could also add slave function and port nvec in the same
> > series.
> 
> First patch only adds slave functionality to tegra-i2c driver. I sent v3
> to fix only tegra-i2c as Wolfram suggested.
> 
> Unfortunately I haven't fixed all defects and I will resend patch(es).
> I can resend only first patch (for tegra-i2c) if it is more obvious for
> everyone.

It's up to you. I think if the NV guys are ok with the tegra i2c change, 
Wolfram can merge it right away for 4.3. Not sure about the state of the nvec 
changes though and if they can be ready soon.

Marc

--nextPart2479813.gKgmJeHZXj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAABCAAGBQJVrjOsAAoJEKyeR39HFBtohkgH/1WloHUL92tUyyfOYnbzs+WU
3Ctr8pBydk9P6Ky8iu0NXlvFan0qoH6hOjFygQIX/RisoIptWRa+9P4ReSy49v+3
oo/fIHZuT4NXAODD9g5DvxAl+3mt01Nc0JbVlnpSoeRwyEPq05OQ3hBzwmqrEkhu
KALP4TlsQtt5XPRUBXXHzlZ9TLMiNTxGam+koMad1YRzy3l1rWDQ1d9fp7La+Rrr
3ZGyGFw4R6KnluIVRPdIpke9yIub0QdqKHtZSDCRcyl4jX8esI6ssLszvaNSItWn
/SSWuOb9/1DELwPFgFm5OsjvLEiVIMFBJttyrH2bgJrXy7lzofFq8iP8qbK8Tj8=
=MzjV
-----END PGP SIGNATURE-----

--nextPart2479813.gKgmJeHZXj--
