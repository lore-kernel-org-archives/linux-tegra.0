From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH v1] i2c: tegra: Make timeout error more informative
Date: Tue, 10 Mar 2020 12:37:06 +0100
Message-ID: <20200310113706.GW1987@ninjato>
References: <20200302173512.2743-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="AFjAQ8ujNJnIGHaX"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200302173512.2743-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--AFjAQ8ujNJnIGHaX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 02, 2020 at 08:35:12PM +0300, Dmitry Osipenko wrote:
> The I2C timeout error message doesn't tell us what exactly failed and some
> I2C client drivers do not clarify the error either. Adding WARN_ON_ONCE()
> results in a stacktrace being dumped into KMSG, which is very useful for
> debugging purposes.

This is good for debugging, in deed, yet not good in the generic case.
Timeouts are not an exception on the I2C bus (think of an EEPROM which
is busy during an erase cycle), so it shouldn't be printed at all.

This prinout should rather be dropped or at least be dev_dbg.


--AFjAQ8ujNJnIGHaX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5ne+EACgkQFA3kzBSg
KbZV0Q//T4qO5EWJYaUa32aqo+HXKBPF6IH+vqrC9SoFXkMtY1nFqCLRkNHJzG3Z
oweohZqW2IQf4rZNyxVoGWAiO+5yy+iGupJ1ozQPJR1tH/o/Cm4Rer2Ns9e696Gy
0mL0G47UpwVrWtfSPBwye3L99CbVeEXECc1gLLna0Bl+rsL6cPjuP0U7kj1FbeDK
hRVlBTnn1WtWIYpfACCXAqiaytWG16Yph86GyohwFUEmevq3w4/1+1c3gRsofiwo
NDBa15hEQIAEnSR5oTdtY2meBxNAAirNPg6Nu/W3G/SEZ0qMxORwXHrwY5z9h8QV
OvlhaVcSZ+ncQu/wGxJcq1ZOt+w4dU+LCswo8jO8t9IwJ5jfqyqSGiFd8OMnMHPP
UKUna18m5usqF8pUWBo9ltutcTr4iRbdzw/Ot1vd6l+Bnp+ATA824k6r8gnwAP61
xHKgYoie2c75bTDKCmyTtmMgNfc5M9Sr2mVl9JN1FRINlzw/Lu+IBwRdoS4X/xOB
cGMKssftAS1O8L6ZRGtfPP7giCjDOvUcnE+gLUp5H8+aP4+rPABvrnn5JRMByeAM
tKEW/R+fm9RXVlFDyF7oPTpWeSfEhZjz6NPK0ceT37lZYj0Nw9UvwKe2NueziVf/
6XIUjaUl+HIGJNCqZcs+uh32fr6b+mIamsJeuivlE8262uhlSIs=
=sNpK
-----END PGP SIGNATURE-----

--AFjAQ8ujNJnIGHaX--
