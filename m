From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/9] ARM: tegra: Enable LVDS output on Harmony
Date: Tue, 8 Oct 2013 11:55:48 +0200
Message-ID: <20131008095548.GD19633@ulmo.nvidia.com>
References: <1381146528-18069-1-git-send-email-treding@nvidia.com>
 <1381146528-18069-3-git-send-email-treding@nvidia.com>
 <52532432.6040101@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cHMo6Wbp1wrKhbfi"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52532432.6040101-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--cHMo6Wbp1wrKhbfi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 07, 2013 at 03:14:26PM -0600, Stephen Warren wrote:
> On 10/07/2013 05:48 AM, Thierry Reding wrote:
> > Add backlight and panel modes for the Harmony TFT LCD panel. Note that
> > currently the panel power supply is marked as boot-on/always-on because
> > otherwise regulator_enable() and regulator_disable() will become
> > unbalanced. That's something that needs to be fixed properly in the
> > panel driver.
>=20
> Presumably that's something that will be fixed before I apply these
> patches, since the DT content shouldn't rely on the presence/absence of
> bugs in one particular OS's drivers?

Oh, that's fixed in the latest versions of the panel driver. I updated
the Dalmore patches, but forgot that I had used a similar hack for
Harmony.

I'll update this patch, thanks for catching.

Thierry

--cHMo6Wbp1wrKhbfi
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSU9akAAoJEN0jrNd/PrOhF/IP/1Qsz0v4Pq3BzY5npmlQmScD
m0Zt361bJLHg8JhDc3q3GAZyv/sClvBeDH3QpN/uR5V3GpAIytexCCkSYzmOHKbw
NGCIIhDqszbC9CyoTKviYWWma+38TeX0iguLi8s4OGIYiUK/rctyO78xfqAKgUMo
By/y+RgWLzqi3musR9DE3Tkz25V6o9qiflpF7+1iZfWDcz+fpvWmwEkYKDJl3x2d
mKaJ6ub7YSck6iagqGPQpXlbOdifoVhYfM9v1Q7vlY2TYWILM5XNz0HqRVEjdZ/9
sH7C3bObioaz/J93tdZ94XsY/H1ScxLieZXcywbtu++aIUjASI1p2aLGRg5M8aUg
nb4RW/DU3mTspKvASXVURBdbfOKVayLTRIOWR6ed7pLeppZc6oQANZZRPlY0QSyC
6s6l+1rRRBNOXsBmMXepOfxuHl3wUn+1nL0xBaMdO7kPnh3PhugndLdiplTn6XXr
9steukaafDcmut/VxLs7NICTPI8rjMAWao+CkvAfoRV/XEgEJSt2b5mMtFOC1iyp
KgLXk3z7sUQ2r5yDbCFybubkyF8VhV3j/E64omzLkDghHwNihPxZGpWsp/204Lc6
z9CTwPKdZDCuRdQwL5M2LBHGgYTLiAoEeTFv5Ghejjaw6+TSMs+0oL+Nynet2yQf
t5or9NXMtp/5PK1l6zG/
=ydCe
-----END PGP SIGNATURE-----

--cHMo6Wbp1wrKhbfi--
