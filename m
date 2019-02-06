From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v2] i2c: of: Try to find an I2C adapter matching the parent
Date: Wed, 6 Feb 2019 10:49:12 +0100
Message-ID: <20190206094912.nnfsfzivwbss4yye@ninjato>
References: <20190125131142.26837-1-thierry.reding@gmail.com>
 <20190205124443.GF1045@kunai>
 <20190206093851.5sxretbl7ajizi5f@ninjato>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1443454562=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190206093851.5sxretbl7ajizi5f@ninjato>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Tristan Bastian <tristan-c.bastian@gmx.de>, Vlado Plaga <rechner@vlado-do.de>, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============1443454562==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="do5mluflvbh7kd23"
Content-Disposition: inline


--do5mluflvbh7kd23
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> And there is a regression! Good that I didn't push out before
> double-checking. No one noticed that this breaks registering child
> devices because of_i2c_register_devices() doesn't have a pointer to work
> with anymore?

Well, sorry, I forgot an important detail. There is no regression
because most drivers still populate adap->dev.of_data with the node
pointer of their parent. I experimentally removed this from my driver
under test motivated by this comment from the commit in the Fixes: tag:

"Linking it to the device node of the parent device is wrong, as it
leads to 2 devices sharing the same device node, which is bad practice,"

But removing this bad practice from I2C core is more work. I wonder now
if we are in some inconsistent in-between state if I apply this patch as
is?


--do5mluflvbh7kd23
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlxarZcACgkQFA3kzBSg
KbYZLQ//ZvsNDAQOXd3mTGX8ECUnrYFFYngHPggUzdRmQ0jwlU1s9CoCypmKWp6h
NzFNgUHzS3gGiLWWo/c/VUosi+lXXrn89d6A2Drc6wJgtklfIwX1al8+KfuSXwbk
gtIeOu1nHub+UHo1mZiITgmJ5sltprA+EaBXaHGdogUGoNMpvzBfqAaBQbgVU3k4
bIAzwMBD1qdApjA4y5zxMCWQdrmV0fD4S/mg/xh5eUW2LYWVGqxroKrEgGQlbwU9
68oLvaOU/esbaIdZPY7VGd/Ne3cKop1lsCWseHtTxQ9HlMpHfsxY1v3Z7vyfld6n
eXWhExngA2Nvi80xYna1/GUyo5/hUFlnt2xmHCSguR6hLoHk9/mCmCglfAtXqXYT
HFPfFwO8haWQUJRm478tgqSVDK4iPVAuPgzBDkpkhS4cgoX3xE4A/KZLv9G9PvBy
hsdJn5DzgzhWsslvYPt8xMrz89pfRDgtdGhPVKjJALEJmVi/Mh60Ci99CmOH08sE
IS+wtz9R4UvW4VsiIP9SeZipdg43aqvxyh6kq1SsH/yswB4B9XaU1ngHH26Z/QpM
G+H638siTsGg+0TWVQ9eZQsFMZ8ks4J7sMMeNS7GctNfDUuJzZJ7W5F0mOUeOz57
qx0SV1x/6UEsvdU40uYRUhgjHks3oYzy5jLsr8YW1uU+gVJsRDE=
=6hZL
-----END PGP SIGNATURE-----

--do5mluflvbh7kd23--

--===============1443454562==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1443454562==--
