From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] pinctrl: tegra: Various Tegra124 fixes
Date: Fri, 6 Dec 2013 20:33:20 +0100
Message-ID: <20131206193319.GA923@mithrandir>
References: <52A10C7B.8070406@wwwdotorg.org>
 <1386330839-30559-1-git-send-email-treding@nvidia.com>
 <52A204E9.4080801@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tThc/1wpZn/ma/RB"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52A204E9.4080801-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 06, 2013 at 10:10:01AM -0700, Stephen Warren wrote:
> On 12/06/2013 04:53 AM, Thierry Reding wrote:
> > Remove various gratuitous blank lines and other minor whitespace and
> > style cleanups. Add some missing commas within group arrays to prevent
> > the compiler from concatenating the strings. Remove unneeded
> > TEGRA_MUX_SAFE entry from enumeration and drop gratuitous _dt suffix
> > from tegra_mux enumeration type name. Drop an unwarranted FIXME comment
> > and rename gmi_ad8_ph0 pin to ph0 since that's how it's referenced in
> > the DS06472001 datasheet.
>=20
> Thierry, I assume this patch is against the version I have in my local
> development branch?

No, those changes were rebased on top of the patches that Laxman sent
yesterday.

> I'm expecting Laxman to roll this into the patches he posts, and send a
> new complete version to LinusW, so there's no upstream action required
> for this patch series at present, just an action for Laxman.

Yes, those were meant for Laxman to squash into his patch and resent. I
should have said so.

Thierry

--tThc/1wpZn/ma/RB
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSoiZ/AAoJEN0jrNd/PrOhTzoP/RPRjDjS8CBj7S/2abfTf97H
zf0zJIyiu317jD+8rWuU60hgyy8FxconqUJqVAwt+CSFusBurN9g4C/f/J6WC0Hi
sbkCLXw/IGSjUxX/C67SJO55Uum6aGegngo/6RQSNs0aRBo2GO1upNgj6670S4F3
nM3zuZE0nOFxQdN2eg08KqXwTyrk0ZEAhtt6NJ30e7V1f08JOtyo1p+tCQuUThOM
ib14h1z9S9ksRYoEpJIZ9mZYIhtIYlNmp1L7Kjz9jomy1MsVnL0l96khZQnbd0C4
DK1vQxBxXlfaMK2AkxtYYzXwFZPZH6MpceNaLoDTha90t4ibGrsxlmqFl+dPkIwn
KokK6QU5fujpeiVE9gOlJRLbp41D63daud+Z+WZG7FksiOk+6FalhzmBqvYUbtBQ
1/3AxneQOWX44EmRNBkoWny/EhKrifPW5x84zdfzf/2uMVtMb+kuVKFHI26kD5mN
7gZeqyM9YOslQO14kQa0y8EJIs+Fs3QYbqh697OZvOsBl6tqemjr3qvFM02sDn3b
y3GnC6RA6hloNOyhOkOBKo1ZgwTaBOymEn9g138q5f2uAAR0g2iJ7RkPwAwdhTOR
79ED3fzcoRVNICPrLIvdZlq7oiiDs+V2gtdTMuTJUqrmkMnNwKNmuu/PtFRJzvYV
cCOHACrFKlbhbKbSK6Jp
=70mr
-----END PGP SIGNATURE-----

--tThc/1wpZn/ma/RB--
