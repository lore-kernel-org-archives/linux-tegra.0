From: Patrick Georgi <patrick-U1IrdZU7gScKt1dFYRw6Gg@public.gmane.org>
Subject: Re: [PATCH 4/5 v2] set: check seek success
Date: Sun, 09 Nov 2014 08:57:07 +0100
Message-ID: <545F1E53.8080301@georgi-clan.de>
References: <1412237788-20611-1-git-send-email-patrick@georgi-clan.de> <545E95B1.5030703@georgi-clan.de> <14992150720.2771.879d79c6f3490faa837fa11cb97f42bf@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="gqhwJgFxDme7ABiAC7uwrcdViB9QFf8Tb"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <14992150720.2771.879d79c6f3490faa837fa11cb97f42bf-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--gqhwJgFxDme7ABiAC7uwrcdViB9QFf8Tb
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



Am 09.11.2014 um 02:04 schrieb Thierry Reding:
> On November 8, 2014 11:22:54 PM Patrick Georgi <patrick-U1IrdZU7gScKt1dFYRw6Gg@public.gmane.org>=
 wrote:
>> This could silently fail which leads to surprising behaviour.
>>
>> Found-by: Coverity Scan
>> Signed-off-by: Patrick Georgi <patrick-U1IrdZU7gScKt1dFYRw6Gg@public.gmane.org>
>> ---
>>  src/set.c | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> This clearly isn't a patch against the Linux kernel, so it'd be good to=

> clarify what repository it should be applied to so people don't have
> to guess.
Oops, I'm sorry. This is for https://github.com/NVIDIA/cbootimage


Thanks,
Patrick


--gqhwJgFxDme7ABiAC7uwrcdViB9QFf8Tb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCAAGBQJUXx5TAAoJECaARpXRYUjyTs0QAJ347jJobFBdt9bvyQB4ZtmD
vt6HkfIs7Sli5WQhbtD3e1FYk6jNR7H2NqZBBZKp4Et41j2NldCf3aQkwfGQYLW2
FITNxW7NBC2TQiflWI/bw0NGGzNjFRm0UbhFjK3vCOXipq9JBEL0ysN6U6M2CbHN
w7RaQIzbsSri+lX7rQMcUTGlDcB+LDJchy0Itcnib/3J6vOtk66I5ZvueGIKt/qH
DH1pMYCqdVv4p6FcDFWE1jgrdOEF8kpTREE9RTUhyOIDiy3KXTqCd7Dg7Y8jhwfW
T8Nv/0TLbd61naFgDY6Ri+vDWHBtBmRW67CCekkhuXuX9eF1wfN1fHQqLH1ps5ye
IGa8AfjUmZjOWFlTcAIUifTSRw8beMEfclLIK26K4fAwEaK8F6/iNMWdSTX1zJXB
qg1HHEIElASlWlgeFO2P0VV7WpmuOeT9D7sZDlhRoWuCFdLqLLxyDq0aD+f7TX7q
ft+QIUTyeusEM5mjynmx6VavhxhcnBmcrRus4lhJSGo4fQ5XBrc8vV84zvfQ2xQj
A+Jwy34aPyq8xKL126ONiPBjKNcTq4QRdvcxGEDZzRx4O7yDzDLVAdl7ILTScOdl
41zTxWs9BZwUDycAneaFjpRKjp9woIvv0pszvmhCxOSfBzwM1YWlanMm/07CqnMd
KS5iMsvKv9yOLmy/8tiQ
=nR28
-----END PGP SIGNATURE-----

--gqhwJgFxDme7ABiAC7uwrcdViB9QFf8Tb--
