From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 1/3] usb: xhci: tegra: Prepare for adding runtime PM
 support
Date: Fri, 27 Apr 2018 12:08:22 +0200
Message-ID: <20180427100822.GP30388@ulmo>
References: <1524754750-3633-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xXygN3QAmJYWdGtb"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1524754750-3633-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--xXygN3QAmJYWdGtb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 26, 2018 at 03:59:08PM +0100, Jon Hunter wrote:
> When adding runtime PM support to the Tegra XHCI driver, it is desirable
> to move the function calls to enable the clocks, regulators and PHY from
> the tegra_xusb_probe into the runtime PM handlers. Currently, the
> clocks, regulators and PHY are all enabled before we call
> usb_create_hcd() in tegra_xusb_probe(), however, we cannot call
> pm_runtime_get_sync() at this point because the platform device data is
> not yet initialised. Fortunately, the function usb_create_hcd() can be
> called before we enable the clocks, regulators and PHY and so prepare
> for adding runtime PM support, by moving the call to usb_create_hcd()
> before we enable the hardware.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

Acked-by: Thierry Reding <treding@nvidia.com>

--xXygN3QAmJYWdGtb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlri9pYACgkQ3SOs138+
s6HzjhAAwVHAmy4sZt3lLaoj3GhqOOVEexovo3hsAp5Se568AXbA3qHi+iYXPlZn
5jd10c+vZlC7Su2+2RzrKZhPmqUGTYWWw2bqBQ5xVGx04dyFk656vsCvENsE4ftJ
InDd+WezMSBDIRcVtXMfNGFpS9Y1YwWy2QuvME2/mxSAICVneQ0sKHKSGa6xNPdx
/6eGtIxTGyS2U7mQ683L26KSCNnYvyek0YNnd1/AuF/ycykfCV0tlysCFFIqxmaz
udGtP4uaG5TVM8Wc/rUMX83bqkFHwS7A0mY+fP78qn+PPyUZlvsBXi8ljm4OXnd8
Q9wwptIcODODk2dnjbTOIjgakvcR0DavpbXtK/udmZ8nH1eeeV41ZpvFMgw0zJxp
fCiIm2nAjUrwEk/ZD8YQti4GFvq/rQ6xv4h6ElQ150jG+LkcHA2FNHBddaZsAG2z
5iQdNOup/a1N0R7uBU+kc/6UUuVtNwSDTA1DrntAvW7kOsTqU+JhSvG89V69rsM9
P3vIfmyc5EE6nYotPCoegHmLd9R/6/B0HUTW/BSs37mnR6entdPxmbgyj10atvQM
2g7LyXSM31CPyne1atMWLBzxBFkugCKrLGI4W6D8ISUN8Nf1DFjth9vh6qTnOPBY
Uf3t9QXPUtHLspbSyeCM49tyHGHH/D9KEEzd2CNvZqfixq4rOPg=
=oRd8
-----END PGP SIGNATURE-----

--xXygN3QAmJYWdGtb--
