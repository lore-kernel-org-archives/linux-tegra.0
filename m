From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RFC PATCH 07/13] dt-bindings: i2c: Add support for 'i2c-bus'
 subnode
Date: Fri, 17 Jun 2016 18:45:25 +0200
Message-ID: <20160617164525.GL27475@ulmo.ba.sec>
References: <1466165027-17917-1-git-send-email-jonathanh@nvidia.com>
 <1466165027-17917-8-git-send-email-jonathanh@nvidia.com>
 <20160617163054.GD32754@leverpostej>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1614843684=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20160617163054.GD32754@leverpostej>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Wolfram Sang <wsa@the-dreams.de>, dri-devel@lists.freedesktop.org, Jon Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============1614843684==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DXIF1lRUlMsbZ3S1"
Content-Disposition: inline


--DXIF1lRUlMsbZ3S1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 17, 2016 at 05:30:54PM +0100, Mark Rutland wrote:
> On Fri, Jun 17, 2016 at 01:03:41PM +0100, Jon Hunter wrote:
> > The I2C driver core for boards using device-tree assumes any subnode of
> > an I2C adapter in the device-tree blob as being a I2C slave device.
> > Although this makes complete sense, some I2C adapters may have subnodes
> > which are not I2C slaves but subnodes presenting other features. For
> > example some Tegra devices have an I2C interface which may share its
> > pins with other devices and to share these pins subnodes for
> > representing these pins so they have be shared via the pinctrl framework
> > are needed.
> >=20
> > To allow I2C adapters to have non-I2C specific subnodes in device-tree
> > that are not parsed by the I2C driver core by adding support for a
> > 'i2c-bus' subnode where I2C slaves can be placed. If the 'i2c-bus'
> > subnode is present then all I2C slaves must be placed under this subnod=
e.
> >=20
> > Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> > ---
> >  Documentation/devicetree/bindings/i2c/i2c.txt | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/i2c/i2c.txt b/Documentat=
ion/devicetree/bindings/i2c/i2c.txt
> > index f31b2ad1552b..ed56b08c7e6e 100644
> > --- a/Documentation/devicetree/bindings/i2c/i2c.txt
> > +++ b/Documentation/devicetree/bindings/i2c/i2c.txt
> > @@ -32,6 +32,14 @@ wants to support one of the below features, it shoul=
d adapt the bindings below.
> >  - clock-frequency
> >  	frequency of bus clock in Hz.
> > =20
> > +- i2c-bus
> > +	For I2C adapters that have child nodes that are a mixture of both I2C
> > +	devices and non-I2C devices (such as a pin controller), the 'i2c-bus'
> > +	subnode can be used for populating I2C devices to prevent the I2C core
> > +	from attempting to add any non-i2c nodes as I2C devices. If 'i2c-bus'
> > +	subnode is present then all I2C slaves must be added under this
> > +	subnode.
>=20
> The general idea seems sound.
>=20
> It would be good if we could remove the mention of the I2C core,
> something like:
>=20
>   - i2c-bus
> 	For I2C adapters that have child nodes that are a mixture of both I2C
> 	devices and non-I2C devices (such as a pin controller), the 'i2c-bus'
> 	subnode can be used for populating I2C devices. If an 'i2c-bus'
> 	subnode is present, only subnodes of this will be considered as
> 	I2C slaves.
>=20
> How are #address-cells and #size-cells handled in this case? I assume
> that they should live under the i2c-bus subnode, which should be called
> out.

Good catch. Yes, I think the i2c-bus subnode would be the right place
for #address-cells and #size-cells.

Thierry

--DXIF1lRUlMsbZ3S1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXZCklAAoJEN0jrNd/PrOhaqcP/1SMSQE8VZtKXGSLX9gSEgan
1TFrFfvHh47/S/Agb+5r8KD4EvQl8rmyQUNhuQkGAvUSVLndMTT7Pyl2qZT6xbOB
MmcFPU3DNJVLyOfUN2Aqmi7HW5Rx16AR5SFFcRnk1jo17v1r2eHH6WlsJ/74Pe/I
buPiT7nhyM4EQwFvcCDHeMjGhpgho5VPX2WubCjL77rUJS1g8/haYPC4PtoFgXEM
lhkd+kvltA9rPHxhENm++wd/aXZ84obfTz7mWOFGXlwCqX3Q67Tt719BSZNVnPO2
kzBUz5a3MtDQdqwExQC/aZlXY64Rs7yReJtBE9LVC3+4YP5WVl1vLleh8SfJf+ys
lNmCMfG27dlNctfXkqn6cDdSQgY8FFNC+4YXbF8WEMMdLWsQ2hHgcttoYqYZdXIy
+PV99vjvANHgFW9UqpYOUEXCZ9cUx3TZYyL52wGwrccDYspasLV2kaj1B6xWWrPM
BiL+Llk8MCzPxY9XGKQ7XPfm2cGfKDnLfLJ3Yxa9jY+1AAV+48SmIoXU+hNNOwGc
+kJik3skfgzEr53YOH4UdIsJPOxMXS3C+pNda/N9LVUTWJoJwMBhsm5RaH7zPzCf
M4kiBIEU84qXXOIaEi9imJdOl37SPncghDqGjzvZfLOhVDsJRkVPuU1XkIIuOInJ
sb3yDnOYRm841PTP8LgR
=HXYj
-----END PGP SIGNATURE-----

--DXIF1lRUlMsbZ3S1--

--===============1614843684==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1614843684==--
