From: Marc Dietrich <marvin24@gmx.de>
Subject: Re: [PATCH v3 4/4] dt: paz00: define nvec as child of i2c bus
Date: Tue, 21 Jul 2015 10:25:31 +0200
Message-ID: <4778199.vGjAP5lpOS@fb07-iapwap2>
References: <1437424546-30405-1-git-send-email-danindrey@mail.ru>
 <55AD73F4.2050502@wwwdotorg.org> <55ADE829.4030108@mail.ru>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5269712430870901435=="
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <55ADE829.4030108@mail.ru>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Andrey Danin <danindrey@mail.ru>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, ac100@lists.launchpad.net, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Julian Andres Klode <jak@jak-linux.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wolfram Sang <wsa@the-dreams.de>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, linux-i2c@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, linux-tegra@vger.kernel.org, devel@linuxdriverproject.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Alexandre Courbot <gnurou@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

--===============5269712430870901435==
Content-Type: multipart/signed; boundary="nextPart2571602.0YnnqBGjHM"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart2571602.0YnnqBGjHM
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="windows-1252"

Am Dienstag, 21. Juli 2015, 09:35:21 schrieb Andrey Danin:
> On 21.07.2015 1:19, Stephen Warren wrote:
> > On 07/20/2015 02:35 PM, Andrey Danin wrote:
> >> NVEC driver was reimplemented to use tegra i2c. Use common i2c bindings
> >> for NVEC node.
> >> 
> >> diff --git a/arch/arm/boot/dts/tegra20-paz00.dts
> >> b/arch/arm/boot/dts/tegra20-paz00.dts
> >> 
> >> +        nvec: nvec@45 {
> >> +            compatible = "nvidia,nvec-slave";
> >> +            reg = <0x45>;
> > 
> > I think you need to or in I2C_OWN_SLAVE_ADDRESS from
> > <dt-bindings/i2c/i2c.h> here?
> 
> Sorry, I mentioned it in letter 0 only.
> I will rework nvec driver and device tree according to i2c core slave
> implementation later. v3 of this patchset is for fixing tegra i2c driver
> only.

I think in this case it would be better to leave nvec and dt as it is for now, 
and just add the slave function to tegra-i2c. Otherwise we will again have two 
different "nvidia,nvec-slave" bindings (one for the intermediate hack and one 
for the final representation). As an alternative, you could also add slave 
function and port nvec in the same series.

Marc

--nextPart2571602.0YnnqBGjHM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAABCAAGBQJVrgH7AAoJEKyeR39HFBtoUNAH/3uXLYSyTg+rWF+hEN+1A0e+
h/SL1QtahmapHS+mq7caG+F9irKll3jcMG2hJRbHTJLaxYJM0dpNJ9h9WrioOI5Z
+tHwmCpJpkgBmVf9728ON6vwpt2mAXnOgs1Gmg1ORxO0e8fBsC3lOlhbHmp/W+Z4
GJbWkKy376Poh2GvRxKidlJKyLURWWow1RWlj9HAQfNJVdqkK+dv8bxPEV7Cll4F
Rf/TBlM+djEdIf7vCTXlid+8wqHYygj1nPa68KmqpsQo2+ISEZ6++316xDFHD6pc
SG/9xY/o2zAmob9JC8GgNYWysM5+xUM3vUiK7OoVS37s5EnibQFkaKa7s3EEI4Y=
=J41g
-----END PGP SIGNATURE-----

--nextPart2571602.0YnnqBGjHM--


--===============5269712430870901435==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devel mailing list
devel@linuxdriverproject.org
http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel

--===============5269712430870901435==--
