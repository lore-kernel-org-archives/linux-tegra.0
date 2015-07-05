From: Giancarlo Canales <gcanalesb-BUHhN+a2lJ4@public.gmane.org>
Subject: [cbootimage PATCH] tN: if_bct_is_tN_get_soc_config: Adds bounds
 checking to the BCT buffer.
Date: Sat, 04 Jul 2015 20:03:05 -0400
Message-ID: <8A8A7455-57BF-4F37-B70B-B1A8F2E16326@me.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
Content-Type: multipart/signed;
 boundary="Apple-Mail=_802345F4-1E92-4AA8-9F81-0644BA7D7084";
 protocol="application/pgp-signature"; micalg=pgp-sha512
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--Apple-Mail=_802345F4-1E92-4AA8-9F81-0644BA7D7084
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Checks if the BCT buffer is too small to be a valid =
`nvboot_config_table`.

Signed-off-by: Giancarlo Canales Barreto <gcanalesb-BUHhN+a2lJ4@public.gmane.org>
---
 src/t114/nvbctlib_t114.c | 3 +++
 src/t124/nvbctlib_t124.c | 3 +++
 src/t132/nvbctlib_t132.c | 3 +++
 src/t20/nvbctlib_t20.c   | 3 +++
 src/t210/nvbctlib_t210.c | 3 +++
 src/t30/nvbctlib_t30.c   | 3 +++
 6 files changed, 18 insertions(+)

diff --git a/src/t114/nvbctlib_t114.c b/src/t114/nvbctlib_t114.c
index dad8f4f..df68369 100644
--- a/src/t114/nvbctlib_t114.c
+++ b/src/t114/nvbctlib_t114.c
@@ -1139,6 +1139,9 @@ int =
if_bct_is_t114_get_soc_config(build_image_context *context,
 {
 	nvboot_config_table * bct =3D (nvboot_config_table *) =
context->bct;

+	if (context->bct_size < sizeof(nvboot_config_table))
+		return 0;
+
 	if (bct->boot_data_version =3D=3D BOOTDATA_VERSION_T114)
 	{
 		t114_get_soc_config(context, soc_config);
diff --git a/src/t124/nvbctlib_t124.c b/src/t124/nvbctlib_t124.c
index 5df93cd..1f6dc05 100644
--- a/src/t124/nvbctlib_t124.c
+++ b/src/t124/nvbctlib_t124.c
@@ -1152,6 +1152,9 @@ int =
if_bct_is_t124_get_soc_config(build_image_context *context,
 {
 	nvboot_config_table *bct =3D (nvboot_config_table *) =
context->bct;

+	if (context->bct_size < sizeof(nvboot_config_table))
+		return 0;
+
 	if (bct->boot_data_version =3D=3D BOOTDATA_VERSION_T124) {
 		t124_get_soc_config(context, soc_config);
 		return 1;
diff --git a/src/t132/nvbctlib_t132.c b/src/t132/nvbctlib_t132.c
index ab5ab34..4e5d31a 100644
--- a/src/t132/nvbctlib_t132.c
+++ b/src/t132/nvbctlib_t132.c
@@ -1233,6 +1233,9 @@ int =
if_bct_is_t132_get_soc_config(build_image_context *context,
 {
 	nvboot_config_table *bct =3D (nvboot_config_table *) =
context->bct;

+	if (context->bct_size < sizeof(nvboot_config_table))
+		return 0;
+
 	if (bct->boot_data_version =3D=3D BOOTDATA_VERSION_T132) {
 		t132_get_soc_config(context, soc_config);
 		return 1;
diff --git a/src/t20/nvbctlib_t20.c b/src/t20/nvbctlib_t20.c
index 4e07bf2..813806f 100644
--- a/src/t20/nvbctlib_t20.c
+++ b/src/t20/nvbctlib_t20.c
@@ -719,6 +719,9 @@ int if_bct_is_t20_get_soc_config(build_image_context =
*context,
 	cbootimage_soc_config **soc_config)
 {
 	nvboot_config_table * bct =3D (nvboot_config_table *) =
context->bct;
+
+	if (context->bct_size < sizeof(nvboot_config_table))
+		return 0;

 	if (bct->boot_data_version =3D=3D BOOTDATA_VERSION_T20)
 	{
diff --git a/src/t210/nvbctlib_t210.c b/src/t210/nvbctlib_t210.c
index 9921bbb..46da441 100644
--- a/src/t210/nvbctlib_t210.c
+++ b/src/t210/nvbctlib_t210.c
@@ -2306,6 +2306,9 @@ int =
if_bct_is_t210_get_soc_config(build_image_context *context,
 {
 	nvboot_config_table *bct =3D (nvboot_config_table*) =
context->bct;

+	if (context->bct_size < sizeof(nvboot_config_table))
+		return 0;
+
 	if (bct->boot_data_version =3D=3D BOOTDATA_VERSION_T210) {
 		t210_get_soc_config(context, soc_config);
 		return 1;
diff --git a/src/t30/nvbctlib_t30.c b/src/t30/nvbctlib_t30.c
index df3bef0..3590c89 100644
--- a/src/t30/nvbctlib_t30.c
+++ b/src/t30/nvbctlib_t30.c
@@ -927,6 +927,9 @@ int if_bct_is_t30_get_soc_config(build_image_context =
*context,
 {
 	nvboot_config_table * bct =3D (nvboot_config_table *) =
context->bct;

+	if (context->bct_size < sizeof(nvboot_config_table))
+		return 0;
+
 	if (bct->boot_data_version =3D=3D BOOTDATA_VERSION_T30)
 	{
 		t30_get_soc_config(context, soc_config);
--
2.1.4



--Apple-Mail=_802345F4-1E92-4AA8-9F81-0644BA7D7084
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJVmHQ6AAoJEMV5zjTxRIlLeI0QAKTSmy7Hw05fLthQrUcOXq3r
1Ephee8dl1lxT9IKuGdDfjnV3sSdprCx928m1KgBZLsxMNg6ltmjFpmV/6XByMSf
ChkrN/tYxJdOKGXCZxT4+mBgqylxmHNa0YdmvceJX+l/7aQwc1UY9Hj+77FiiYHS
/UopHPhHBAkmsTFUSOOvmkd3/LyFcIzJn5A1T4qWqaylUU92CT98Gybcwilofnee
+zqXbyhOhYHG3/fjEsbM5y5JmtooAB3sBBIbs+BMvybqMpCU8TusOnT/8ooAjXgg
xBbRtV6yARpCa9/yU+zDz0adyNNQUYsybL2pgU43kjPwHCgXTrE6YgZgRYCqoq9z
s/kWt8ErNlRh8NYvM1eTt/bsLo24QNlP0Syr0GiF8h1tQB7cG/8xPzVtCkcTc1hg
o1F/YcOCADuZl4s+5n+3MYI9uPKYukSxiXVOEyDDIQzNwaqrWvXJ7t7K17Fb05ch
IzLLhOAOTW/czajd5kTvqGDy8iV3dyKBVcPQ6Qlhzj8H4evoi5fBQte9ghkvB8KF
sb7OTcmi0xz8OWKnthj4sZTv3LbxBwKiNT6/ZTalMk2ff3qVtyp+FO/iTWZQBv87
eyLe1hSNK5mgY59Zal1QtJbMPsRQ2hO52PgvgdWChneHE5aRlJ9Tfn8biHjtxKqO
U7CBB2Vzh+jkoK0sBnmK
=JZ1N
-----END PGP SIGNATURE-----

--Apple-Mail=_802345F4-1E92-4AA8-9F81-0644BA7D7084--
