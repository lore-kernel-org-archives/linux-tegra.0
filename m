From: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Subject: Re: [GIT PULL] PWM subsystem
Date: Thu, 28 Jun 2012 22:33:06 +1000
Message-ID: <20120628223306.1e6918316a6a5f65528ef63c@canb.auug.org.au>
References: <20120621083650.GA2529@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Thu__28_Jun_2012_22_33_06_+1000_GQF6.Z9OI9NXiY7_"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120621083650.GA2529-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bernhard Walle <walle-pDveNdigDaDu9UdzE1sIFA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

--Signature=_Thu__28_Jun_2012_22_33_06_+1000_GQF6.Z9OI9NXiY7_
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Thierry,

On Thu, 21 Jun 2012 10:36:51 +0200 Thierry Reding <thierry.reding@avionic-d=
esign.de> wrote:
>
> The PWM subsystem patches have gone through a number of versions now and
> all outstanding issues have been resolved. I believe that the subsystem
> is ready for broader testing in linux-next. If all goes well I plan to
> submit it to Linus during the 3.6 merge window.
>=20
> I am not aware of any dependencies in linux-next. The two patches that
> don't touch the PWM subsystem itself are OF related and have been acked
> by Rob Herring who prefers that I take them through the PWM tree.
>=20
> Please contact me if there are any issues with the tree.
>=20
> The following changes since commit cfaf025112d3856637ff34a767ef785ef5cf2c=
a9:
>=20
>   Linux 3.5-rc2 (2012-06-08 18:40:09 -0700)
>=20
> are available in the git repository at:
>=20
>   git://gitorious.org/linux-pwm/linux-pwm.git for-next
>=20
> for you to fetch changes up to b5156ca503f9471449b941364bb2bc34fa355d5d:
>=20
>   pwm: Take over maintainership of the PWM subsystem (2012-06-15 12:57:07=
 +0200)

I have added your tree now.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgment of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
	Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org

Legal Stuff:
By participating in linux-next, your subsystem tree contributions are
public and will be included in the linux-next trees.  You may be sent
e-mail messages indicating errors or other issues when the
patches/commits from your subsystem tree are merged and tested in
linux-next.  These messages may also be cross-posted to the linux-next
mailing list, the linux-kernel mailing list, etc.  The linux-next tree
project and IBM (my employer) make no warranties regarding the linux-next
project, the testing procedures, the results, the e-mails, etc.  If you
don't agree to these ground rules, let me know and I'll remove your tree
from participation in linux-next.

--Signature=_Thu__28_Jun_2012_22_33_06_+1000_GQF6.Z9OI9NXiY7_
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJP7E8CAAoJEECxmPOUX5FE/uQQAIfr+uNY/CBou1S8jMuaTi2V
zFZslVZ/xoupi4b+yKm5tR0fEzzqh3jtb2IbcPEK6B1qDQLFYxxug2Zgx7zRM07I
TuSxyx6InnO8HADsXkImGuCRpNk9usMrdK1ZnWB+FqMSGraI3X9j36Xyod1FvQOR
Mqh2bmngfMU1AYf9t/aRyFXu5P/VpD44egA1f0aTLowZRRer6e9VhKb9TU/4CHqB
7h6iSv+2OpA/STSrEeLD6zHLl0BpS4RgOz3C/G+Gwt/NbWUu+zCRjNcMpI9eOeqe
2qKWigibe4l1ypN9NJetnoawGOx1Bdc3bKYDt4GlHY83jdzfpBfzUhPe5YquyEgI
NgSt9NQlcuU46Q5fjpWtXhED9umII0ZVm8eVZJWNsnkGOCrH1KkRa69VCIgh7wlR
bXwu+XuZRJuX5VvFyRY+KD7EKEGhhnSM/toFHYwF9/pyhIaefMMslPfhW9lIWgft
LUtHQLT27Q/56H+xbNFuyHbhSjSe3nwiekooMmEmQU0NVHSpd6mzAkrBtYl1S+Sm
c1N1aL/2w8N+N4Fup3VArOSz6FB3z/a0seWr2vZRGnJCDc79z3Mkn+sqp72liGVE
xNxYw3qGC7v8f9MUO8/YXQrt4Y3IT+tTioQACr2hpznUPql6+dSR5KUD1xzQijii
5jJS0jcLZBIWqDJdH6oX
=s12w
-----END PGP SIGNATURE-----

--Signature=_Thu__28_Jun_2012_22_33_06_+1000_GQF6.Z9OI9NXiY7_--
