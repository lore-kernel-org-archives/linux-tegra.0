From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/5 v2] set: check seek success
Date: Mon, 17 Nov 2014 12:32:25 +0100
Message-ID: <20141117113224.GD25699@ulmo>
References: <1412237788-20611-1-git-send-email-patrick@georgi-clan.de>
 <545E95B1.5030703@georgi-clan.de>
 <20141110085102.GA12126@ulmo>
 <5460E87B.1040209@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jL2BoiuKMElzg3CS"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5460E87B.1040209-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Patrick Georgi <patrick-U1IrdZU7gScKt1dFYRw6Gg@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--jL2BoiuKMElzg3CS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2014 at 09:31:55AM -0700, Stephen Warren wrote:
> On 11/10/2014 01:51 AM, Thierry Reding wrote:
> >On Sat, Nov 08, 2014 at 11:14:09PM +0100, Patrick Georgi wrote:
> >>This could silently fail which leads to surprising behaviour.
> >>
> >>Found-by: Coverity Scan
> >>Signed-off-by: Patrick Georgi <patrick-U1IrdZU7gScKt1dFYRw6Gg@public.gmane.org>
> >>---
> >>  src/set.c | 6 +++++-
> >>  1 file changed, 5 insertions(+), 1 deletion(-)
> >>
> >>diff --git a/src/set.c b/src/set.c
> >>index ff32b53..907d640 100644
> >>--- a/src/set.c
> >>+++ b/src/set.c
> >>@@ -59,7 +59,11 @@ read_from_image(char	*filename,
> >>  		return result;
> >>  	}
> >>
> >>-	fseek(fp, offset, SEEK_SET);
> >>+	if (fseek(fp, offset, SEEK_SET) =3D=3D -1) {
> >>+		printf("Error: Couldn't seek to %s(%d)\n", filename, offset);
> >
> >offset is unsigned, so the format specifier should be %u. I also wonder
> >whether it would be good to output errno along with the message (or the
> >string representation thereof) to increase the information content. But
> >given that none of the other error messages have that it could be a
> >separate patch.
>=20
> Using perror() might be useful?

Indeed, that would also make these messages go to stderr instead of
stdout and be more idiomatic.

Thierry

--jL2BoiuKMElzg3CS
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUadzIAAoJEN0jrNd/PrOhZ74P/2ItFkv8JMQlSt5bJde3lkg0
mOgbzofiTqGCn8l4+ZCVjXW/Tt4LUOQEELjMzA8/V6QZur+6u5gpRl7elKQcgGM9
DIrz/0gyNYkM+mWS1AWs7HRT4kl+XCou+ojXC7D66tp/lxhQwBS6m3eq0nmisH5G
u/5AiS0w0K08oNrcMHJf3rZSPEBVUj9QDKst/yuh26Fz1TSgiree2JxUBNRMqL6I
5kGkKHwbaX5tXYfi4MkXU/s2Qbrl2OuJj9kjsYJZ06eESUh2IbTLrc/6uAxv0Brz
ypeQXY5YTtjAF1A2PIKCQ4kdQUiJi29c2Fqd203LFWlxzo/BcYIQAMABdmYCcBCS
nyGCK90yG+jl12yK0w6dszmXPCIWtjaU2EGOIhJVz3dGP3OrNLncochbM5uquAGa
BRw/+1y2bJiRTq3HluwRnNpD/rcZmJbXQeGA6c0JZTODMTkEbLdM/w5Dm5+B9K3v
6red/eObRgZv/3JfL2KxbcROBpFKfketjmz4jmDjGABkfYJYcxi83RUqXrfZwR+w
AN7D80wkonZTJ0toMUjRS4lU4PTwKMaGPUmoBh26WPS80MZs3qQhc0xm90PLu7MB
s9SK88jTYsAOfyIS5DnqZdcAkW4xxL4GXnMgA7B0NeZIr9iUrcKtFX+NNerZbEk3
ifnh73j6YsXYjlFa8Sjw
=OC8T
-----END PGP SIGNATURE-----

--jL2BoiuKMElzg3CS--
