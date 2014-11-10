From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/5 v2] set: check seek success
Date: Mon, 10 Nov 2014 10:08:22 +0100
Message-ID: <20141110090821.GB12126@ulmo>
References: <1412237788-20611-1-git-send-email-patrick@georgi-clan.de>
 <545E95B1.5030703@georgi-clan.de>
 <20141110085102.GA12126@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TRYliJ5NKNqkz5bu"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20141110085102.GA12126@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Patrick Georgi <patrick-U1IrdZU7gScKt1dFYRw6Gg@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--TRYliJ5NKNqkz5bu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2014 at 09:51:03AM +0100, Thierry Reding wrote:
> On Sat, Nov 08, 2014 at 11:14:09PM +0100, Patrick Georgi wrote:
> > This could silently fail which leads to surprising behaviour.
> >=20
> > Found-by: Coverity Scan
> > Signed-off-by: Patrick Georgi <patrick-U1IrdZU7gScKt1dFYRw6Gg@public.gmane.org>
> > ---
> >  src/set.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/src/set.c b/src/set.c
> > index ff32b53..907d640 100644
> > --- a/src/set.c
> > +++ b/src/set.c
> > @@ -59,7 +59,11 @@ read_from_image(char	*filename,
> >  		return result;
> >  	}
> > =20
> > -	fseek(fp, offset, SEEK_SET);
> > +	if (fseek(fp, offset, SEEK_SET) =3D=3D -1) {
> > +		printf("Error: Couldn't seek to %s(%d)\n", filename, offset);
>=20
> offset is unsigned, so the format specifier should be %u. I also wonder
> whether it would be good to output errno along with the message (or the
> string representation thereof) to increase the information content. But
> given that none of the other error messages have that it could be a
> separate patch.
>=20
> With the %d -> %u for the format specifier, this is:
>=20
> Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

I just realized that I have commit access to the cbootimage repository,
so I just made the %d -> %u change myself and pushed.

Thanks,
Thierry

--TRYliJ5NKNqkz5bu
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUYICFAAoJEN0jrNd/PrOhSMAQAK+s44xI2AH8k8A+KpepJHjo
NfOk/f8i+iMeOYXavxFdrMCy5wKaARgMjZ2wxoOw0twnQSHngpBOES04jrYOQikD
i1sZmrkiJOSzDcdVAH6pL1LXEmdA3AlpYD2rf+qr/x4Is98TCstA10DvFucX4Bq2
SbECxhP9v1dQmuMNhFRGP51HCwMpJuS6zybWZpKMHSiTc7q2vflNfx2a+51izQob
dW13EBzWyEv/xALZ7qtttKmaabstQcLhJMA4P6LZ7IOtmWbuQvt5ARhb1M7jgXPZ
yi9sNaA2kv2CnDzCaoXO6CcfyhiLo2SQzMsrFwQGfq1K5VlghLoOviYJqWpeIVkZ
E1xRx0mTRE1jY6/jesK2FP2qmW5wDYC+2do+ILK/qwSGn1uP3icFImo5myWq+RAX
3RvNJWApgggzihDrtDrLKXTxKMHfWnxCFc4qKLIewsnE6afip94slecG77LU2NDR
QtkKBtZeLLcAr4CnCzv4TeKXrtJ6voYBEAlIfMUWhk81G/FXlCR0BQp93DbzzHVb
hhfIGzKizpbHksw2uOBtkwcoZDRRE5AXrRihgzLZR1+BsWveRz9D0n4lWL4trA1j
Ql9ndyDDoWoJI/BfpAYM8CdxYlO+tGhhdaWkgYQg9J1YSgPndvVc87cqsUcTg7ZI
jX+s3FVmmJdNLITwkibO
=LBSc
-----END PGP SIGNATURE-----

--TRYliJ5NKNqkz5bu--
