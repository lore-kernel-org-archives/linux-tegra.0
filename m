From: Patrick Georgi <pgeorgi-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: [cbootimage] Allow @ in paths consumed by cbootimage
Date: Thu, 10 Mar 2016 18:34:56 +0100
Message-ID: <CAE-gjdUeMdnNcPOZJpCz1_V7FKAh0aHMpqkhkkWpA4XpjPOo4Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Patrick Georgi <pgeorgi-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>

diff --git src/parse.c src/parse.c
index 6f37dad..39d746c 100644
--- src/parse.c
+++ src/parse.c
@@ -249,7 +249,7 @@ parse_filename(char *str, char *name, int chars_rem=
aining)
         * Check if the filename buffer is out of space, preserving one
         * character to null terminate the string.
         */
-       while (isalnum(*str) || strchr("\\/~_-+:.", *str)) {
+       while (isalnum(*str) || strchr("\\/~_-+:.@", *str)) {

                chars_remaining--;


--=20
Google Germany GmbH, ABC-Str. 19, 20354 Hamburg
Registergericht und -nummer: Hamburg, HRB 86891, Sitz der Gesellschaft:=
 Hamburg
Gesch=C3=A4ftsf=C3=BChrer: Matthew Scott Sucherman, Paul Terence Manicl=
e
