From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RFC PATCH 13/13] arm64: tegra: Add DPAUX pinctrl bindings
Date: Fri, 17 Jun 2016 18:50:16 +0200
Message-ID: <20160617165016.GN27475@ulmo.ba.sec>
References: <1466165027-17917-1-git-send-email-jonathanh@nvidia.com>
 <1466165027-17917-14-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0239372973=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1466165027-17917-14-git-send-email-jonathanh@nvidia.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, Wolfram Sang <wsa@the-dreams.de>, Stephen Warren <swarren@wwwdotorg.org>, dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============0239372973==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qi3SIpffvxS/TM8d"
Content-Disposition: inline


--qi3SIpffvxS/TM8d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 17, 2016 at 01:03:47PM +0100, Jon Hunter wrote:
> Add the DPAUX pinctrl states for the DPAUX nodes defining all three
> possible states of "aux", "i2c" and "off". Also add the 'i2c-bus'
> node for the DPAUX nodes so that the I2C driver core does not attempt
> to parse the pinctrl state nodes.
>=20
> Populate the nodes for the pinctrl clients of the DPAUX pin controller.
> There are two clients for each DPAUX instance, namely the SOR and one of
> the I2C adapters. The SOR clients may used the DPAUX pins in either AUX
> or I2C modes and so for these devices we don't define any of the generic
> pinctrl states (default, idle, etc) because the SOR driver will directly
> set the state needed. For I2C clients only the I2C mode is used and so
> we can simplify matters by using the generic pinctrl states for default
> and idle.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi | 48 ++++++++++++++++++++++++++=
++++++
>  1 file changed, 48 insertions(+)

Looks good to me. Thanks for driving this to conclusion.

Thierry

--qi3SIpffvxS/TM8d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXZCpHAAoJEN0jrNd/PrOhtMQQAIKiKWis2Mq9TkKioEu5QC2B
ziRtOLZ74UClY9CyMv8GHCP7Mxqb50IMgBvuFgKBV2BAxdcw5Bjfaeq7vd5GYkYd
JeA8eT8G12cXwsTJWEC5+PZWdbmI8/wTbWk6+QAs6FnwD+IGH5oaWWlOfxSDygOL
e6HCgB8QWQIrggO/rTnI4y4G3ysVr6Oeno7POJcVHcQ+x0QeaHiBAjt4AqjGhnMc
mppIYqdClD+9yj4AFMWq9q9TrfjlLynC2YKubOzHOFQ5Et5YJx1A1miMezooITyG
ONechqStnZCHAalyTmew6m86QGHH323K5C/myCi2Z6E/z8+70kQyxTsrghgj0W5o
w8DDW2DPRWI2nfrTY3E7Vyfr+5wSfaR+B824OVpcWMK+ogzd/wtK+PzmDPSdd6WF
hDkeBTPhNAQFZapTDY1Cjx3RBp4nd+CoTq9eKxE1N9/XmIc6VYMhR9vFzpO69Rrt
sh7YDzbWL7QwAHJKdm4tCFVhW31bJDWSj8Q8tyu17F9iy9TCXNZkVq9U74UD8h+Y
Kr5iSLTXz9mFPiKy/xl/2F17S4sKnTEZ3e9Nq1NLJAcKXL1PSVwBVNAewJHRoyBR
iIZbIaqiZ/jXnu41YU+c91oeQHscBASNyoN1ki9lqXaHWxKVGTpDHiPkK7ootFpP
QJswOVn76Tl6/MSYI1gB
=5K4k
-----END PGP SIGNATURE-----

--qi3SIpffvxS/TM8d--

--===============0239372973==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0239372973==--
