From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/2] ARM: tegra: Mark Tegra124 HDMI compatible with
 Tegra114
Date: Sat, 17 May 2014 23:33:00 +0200
Message-ID: <20140517213258.GE1046@mithrandir>
References: <1400350881-22008-1-git-send-email-dgreid@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1809039536=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1400350881-22008-1-git-send-email-dgreid@chromium.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Dylan Reid <dgreid@chromium.org>
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, swarren@wwwdotorg.org
List-Id: linux-tegra@vger.kernel.org


--===============1809039536==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WBsA/oQW3eTA3LlM"
Content-Disposition: inline


--WBsA/oQW3eTA3LlM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 17, 2014 at 11:21:20AM -0700, Dylan Reid wrote:
> The HDMI driver that handles Tegra114 can handle Tegra124 as well,
> mark Tegra124 as compatible.  This makes HDMI output work on Venice2.
>=20
> Signed-off-by: Dylan Reid <dgreid@chromium.org>
> ---
>  arch/arm/boot/dts/tegra124.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

These patches don't seem to be based on linux-next. There are a couple
of patches in linux-next (queued for 3.16) that should fix these, in
particular:

	4b9701e02b3b drm/tegra: hdmi - Add Tegra124 support
	0d6696438d2c drm/tegra: hdmi - Add connector supply support

Could you try a recent linux-next to see if that fixes the issues you
are seeing? Note that Tegra doesn't boot on linux-next from the last few
days because of some cgroup regressions, but a fix was merged and should
be in Monday's linux-next, so unless new regressions are introduced that
would be a good candidate to test.

Thierry

--WBsA/oQW3eTA3LlM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTd9WKAAoJEN0jrNd/PrOhlrQQAJCZ2WUr4RdhywcuInO/MBud
T5prZAay1JZD6FJ7iq6EPJVeSsuDlSgJs3xTAdR12MkU1Cqvbd+DKWK1YrVAvJKu
mf7GnI/NGtPpxPOfkZOIdw2gWLcCNMqUI84WXE5uNm4esTq7VKsfZ3KzqbnPOwjF
KUH24Z+e6wkIA2ldME8ZObqdR4QE7nm4oaEY3RJ0UrXxeGV4gEBFovT4uUChhPn6
NyCrIyCX/gHFXAZ+4sdyOFUyeBG9ODT4qWgYbeLVbB8PeAOXYTNtLs8EswfQQo25
7iQyB6JuT1l06kx3wcQOy3/cFciYZoxrjmiSs7oHb3FHykpghr0WTKuRuFpxNHB8
6X+JCsNaHqZXgGckwo+VRFrqb3ehXiqGp45T9oSwAFNhaCWbf+86DCoAJPVfziK2
O5E/C913tAZ1NfDZSTzzNPWDIfo6RbzxFjkdlbqr4r0jh41g+whHrLjGSQ7XFZBZ
obmzMwFjQPKSvAPAwNbSBOJgot+4TUGndxcDHcudeVaM3vFPa5cSDCKRqNDSZlzQ
ytCeY4rVqTBcSJKBQOzcybxgmkO3bjxYUxndpSqVCbzlTMU++0hLPFyQKpr+HEwu
t/64AO1OjAdxkD2yB6F6XVyXzSA/Q+SR5oh5IMP6Y8rbIx9XpilkZ4o76SDzc7E/
5IU/i/3LpaRku2EfzIHV
=ywTN
-----END PGP SIGNATURE-----

--WBsA/oQW3eTA3LlM--

--===============1809039536==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1809039536==--
