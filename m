From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH] staging: nvec: insert blank lines after declarations
Date: Fri, 04 Jul 2014 09:39:46 +0200
Message-ID: <2268306.t0PVlUp3mj@fb07-iapwap2>
References: <20140703191554.GA12029@ThinkPad>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1664320.lmTQ5RBMUP"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140703191554.GA12029@ThinkPad>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pawel Lebioda <pawel.lebioda89-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>, ac100-oU9gvf+ajcQ97yFScArB1dHuzzzSOjJt@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--nextPart1664320.lmTQ5RBMUP
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Donnerstag, 3. Juli 2014, 21:15:57 schrieb Pawel Lebioda:
> Hi,
> 
> This patch fixes coding style warnings reported by checkpatch.pl:
> "Missing a blank line after declarations".

thanks. Looking at the checkpatch output, its requirement of at
least 4 lines of help text looks like a bit overkill though.
 
> Signed-off-by: Pawel Lebioda <pawel.lebioda89-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>  drivers/staging/nvec/nvec_paz00.c | 1 +
>  drivers/staging/nvec/nvec_power.c | 1 +
>  drivers/staging/nvec/nvec_ps2.c   | 2 ++
>  3 files changed, 4 insertions(+)

Acked-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>

--nextPart1664320.lmTQ5RBMUP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAABAgAGBQJTtlpCAAoJEKyeR39HFBton7cIAIsdSvQrO2B+GzmYqBcP/CZI
vd7/MyQUG03NuAf5Zjby6UiSZX8xbVge5lXVMIthKlChLG2azcYB/7QmtmM4Mdux
PivNonXDVJA6do1VaDji3Q2UXn6A8IM01DLEopyQrk+XnmkV8v4S3X/K3VYm3rBP
RViyo2HFR1fax+H3odOLNBExirjMauZWYWzYPZKb3LxBIzTggeyn9ND8aDNFyZCC
Rqd4ghKQvwJL0RFxRmChugg6A0i+PAAmhn/rmjcFaAwnK/hFyUa+JdOy0Saet4iq
jtmYUdvZkjzQiwOCFeltprB959ROBdW1DKjOgJnyCDHa5DYmNEx75y04hg8lKgU=
=TFKr
-----END PGP SIGNATURE-----

--nextPart1664320.lmTQ5RBMUP--
