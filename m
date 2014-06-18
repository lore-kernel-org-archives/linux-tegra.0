From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] drm/tegra: add MODULE_DEVICE_TABLEs
Date: Wed, 18 Jun 2014 16:21:18 -0600
Message-ID: <53A210DE.80704@wwwdotorg.org>
References: <1403126355-16236-1-git-send-email-swarren@wwwdotorg.org>
 <20140618215058.GA26514@mithrandir>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1766082239=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20140618215058.GA26514@mithrandir>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, Stephen Warren <swarren@nvidia.com>, =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom@nvidia.com>, stable@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1766082239==
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="klx2xAta3N4vXX6fH9KR5Gjjb1712BRFL"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--klx2xAta3N4vXX6fH9KR5Gjjb1712BRFL
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 06/18/2014 03:51 PM, Thierry Reding wrote:
> On Wed, Jun 18, 2014 at 03:19:15PM -0600, Stephen Warren wrote:
>> From: Stephen Warren <swarren@nvidia.com>
>>
>> When tegra-drm.ko is built as a module, these MODULE_DEVICE_TABLEs all=
ow
>> the module to be auto-loaded since the module will match the devices
>> instantiated from device tree.
>=20
> I vaguely remember doing something like this a while back and getting a=

> bunch of link-time errors. But I assume that you've tested this, so I
> must be remembering wrongly.

Were the problems due to:

a) Simply building the tegradrm driver as modules.

I vaguely recall some runtime issues with tegradrm as a module, but I'm
not sure about build issues. I don't think this patch could make this
any worse.

b) Building as modules works, but adding MODULE_DEVICE_TABLE broke that.

This seems unlikely since *many* module in the kernel have a
MODULE_DEVICE_TABLE...

Certainly, with this patch applied, building tegradrm as a module in
next-20140611 works out just fine, and the code runs fine too. Building
tegra_defconfig (which has tegradrm builtin) on Linus' master with this
patch applied also works out fine.

I'll post v2 with the issue you mentioned addressed.


--klx2xAta3N4vXX6fH9KR5Gjjb1712BRFL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBAgAGBQJTohDeAAoJEJuNpwkmVCGc8FcP/3k/VL7uswWA5rA1R5fhZrKW
y/ZP7knehXqHYn10mS+VsCZU/rcsZ387C5OAKff5+5FKizcGJ2RulQtKH6prJGxm
ZpOs478/jJ/QlU5vZ903wjwGpJU4Hof47V3LyKeeNfjw/aLPcuv77iwe7otMWVyW
dOG++lr+fRu+sYvKZFHoGzH5Ljpj/cBxZUoIsDr6Sp0thHYEGM2eLtYEhscmmZKK
D+o2eYa1ucZ+/N9x8UoRfki3EDYjyULTyceIK9asZXyj/wT5Nnpo6SEdEPxYsSOy
G0S9jVir/0rAUB6jbvSmnxFcgRU4Kv+OpO2eqFwYGAt23UP2ShYbg4L1wQ2cBIaN
j8UM9iiYQPCSLGizwT9D5/4YQvkQc6n+YshKo4UzLIw0skjF1VMafECrPz885Cl/
Rhq67Ce8/hvApvdxeNNi8Pe/SS47Qvw13AB3Hve8aOlIPlQSgxmITtb3Q/Jb/bkc
HjY0G4H4m7BW/oUEmHjk9jt22QbNA3JZQlxxl6Rf0AlDxxGKlaITT+ogCBuKyo/h
YQRWruqAQxH4Wa+ZAlulHusyQZInjZOXNBSzEmCzJV5kMy1nw5DFoAP8OEBdhaCA
6zj0HqCw/Q03/St5bkBgDbDy71NjNFvxELdgz5cHzGrDbqMVtH2SyxNobTS9w8DB
dPfAfAoDOwisMS2+aQ0n
=JWM9
-----END PGP SIGNATURE-----

--klx2xAta3N4vXX6fH9KR5Gjjb1712BRFL--

--===============1766082239==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1766082239==--
