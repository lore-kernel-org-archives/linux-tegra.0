From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 13/24] drm/tegra: tegra_fb -> drm_framebuffer
Date: Thu, 17 May 2018 15:46:10 +0200
Message-ID: <20180517134610.GA26515@ulmo>
References: <CAPj87rPKDwBK7qoOoY2zXoS6T02toATPRsk=39m_OBr=s1kXTw@mail.gmail.com>
 <20180330141138.28987-1-daniels@collabora.com>
 <20180330141138.28987-13-daniels@collabora.com>
 <CAPj87rNg7N92q5RnwpSO13uNx8rsKV=EoB82fpvc0c=SGiqDyw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0924498865=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAPj87rNg7N92q5RnwpSO13uNx8rsKV=EoB82fpvc0c=SGiqDyw@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Stone <daniel@fooishbar.org>
Cc: linux-tegra@vger.kernel.org, Daniel Stone <daniels@collabora.com>, dri-devel <dri-devel@lists.freedesktop.org>
List-Id: linux-tegra@vger.kernel.org


--===============0924498865==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jI8keyz6grp/JLjh"
Content-Disposition: inline


--jI8keyz6grp/JLjh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 17, 2018 at 02:11:16PM +0100, Daniel Stone wrote:
> Hi Thierry,
>=20
> On 30 March 2018 at 15:11, Daniel Stone <daniels@collabora.com> wrote:
> > Since tegra_fb is now the same as drm_framebuffer, we can just replace
> > the type completely.
> >
> > Signed-off-by: Daniel Stone <daniels@collabora.com>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: linux-tegra@vger.kernel.org
>=20
> Did this still need some more testing, or is it OK to apply?

Sorry, this completely fell off the table. I've tested patches 11-15 and
they work fine. Applied all of them to drm/tegra/for-next.

Thanks,
Thierry

--jI8keyz6grp/JLjh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlr9h58ACgkQ3SOs138+
s6HHrw//aDSoOyjMZbNPzSVHYlKU2X14wMLXf7tG/urDtGxWTMgLkQy23Nvmew/5
1SgvS7O1k/vBqaHQ/zjQdSJZf5SxT2ytx65Hiwb5+FsG2UxyQmefhkTYmFHEDsVb
GqMADeiUTW03D7ntqLglk66sM+aiBfCGp/OJLEMrWpXmqDywxT1UvsJVfDLFYV54
jQcld3986UYU52vzDyXAG1+n5DLTgxMoO9A/Mp9LQb3kjp0TC+cd1Q2fk3YmRCHe
63Plf595SIoR4ym2nkSFHtFAU+lq++LOMucQ/EHNlNNEBKLhHebBnBIeBDnfd9XM
RLNzZuwDWXj2DaPtdaJRMHmKrxdi6bZcaHE0ljI1u8xCycH1Yuu+q6fZzuXlPaeo
7fWuhV1nNpstJaf0HMYOM1n1pGVJNyJok3VGhLwlVwjaoSLHlhkrs+d19Hsl0F4w
z1A429PcHZ7apQu92oZvm2iKoUwshi8bVQKWtdlnySjsxwkyYKFpVKhnuXKifGhO
As1Lhu/gs9BxWoWfJHUFSaVd1Ltyf26MSizPhzhxNCZ86csfa4wH/c5Ll70BQCkz
PFgGi3wqDJR1ZjtXzeaKa73Ix15Tn+t+Uq40EQnpTIsIrra8umCAZIJcshf/yilE
6+eu/h0ahVr2cEM4+9NsoO8oyUhsJEt3+TsroqU5QfRBC4cBjY4=
=rrGO
-----END PGP SIGNATURE-----

--jI8keyz6grp/JLjh--

--===============0924498865==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0924498865==--
