From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH V3 2/4] regulator: tps62360: add dt support
Date: Fri, 11 May 2012 15:58:34 +0100
Message-ID: <20120511145833.GG3960@opensource.wolfsonmicro.com>
References: <1336718325-8372-1-git-send-email-ldewangan@nvidia.com>
 <1336718325-8372-3-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PpAOPzA3dXsRhoo+"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1336718325-8372-3-git-send-email-ldewangan@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: grant.likely@secretlab.ca, rob.herring@calxeda.com, linux@arm.linux.org.uk, lrg@ti.com, swarren@nvidia.com, olof@lixom.net, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--PpAOPzA3dXsRhoo+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 11, 2012 at 12:08:43PM +0530, Laxman Dewangan wrote:

This looks good overall but I do have a few things with the binding.

> +Optional properties:
> +- ti,enable-force-pwm: Enable force PWM mode. This is boolean value.

Hrm, this is fairly generic - it's REGULATOR_MODE_ACTIVE.  But I'm a bit
unsure about how generic exposing it is in bindings since it's often
dynamic in the running system, we've really not got any mainline
examples of something setting a mode.  With modern regulators the mode
detection stuff in the hardware is generally good enough that there's no
benefit from doing this, it's suprising to actually see systems that
benefit.

> +- ti,enable-vout-discharge: Enable output discharge. This is boolean value.

This I think we should definitely add a framework feature for this and
make into a generic property, it's a very standard feature and more
normally set unconditionally.

--PpAOPzA3dXsRhoo+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJPrSkTAAoJEBus8iNuMP3db+oP/0hU19Mz/JJEqe+HDN49uLUX
d5ptW/axDrCjn2xyXl02+X8DBBqaALcJxc7aEKJYUPYJwyTWVhqXFzbMEiBbjZu5
KchrsqFrB2YazEiKt3kaaLEZHZsq+y2626lYhTWn7LbqYPz+RwYbe7K64GWbbydu
c4P7/o3MbxRAezHlJz+TQfGrdqJwk9Xz9A//SvPPCB3YNrNcJS0KL8TIeMvE6Yvi
Ime8h0ixRELvOMQbN5bEm4oyDFG0qb4zX2UMw1WGWqGrB6OsOMncHj3T7Hgf4R5r
Va7giQBNLWXBuH6udRFJ9XA0tZzOIcth5J7PC3MGyxmJmzynUcKqRwUBGF1811y/
cPJEH8D5Zcty+SliasHAoect5wTzTnx74TPv2ITbluElETPFu6iOINbr8qh+uvyH
z1EkLSJRGNhVxcBp/S8MwVBciBBop24TLQKelCYgtsDvsHUg/igrt7GJzAMouj94
8BM4+MuZv6pVsflxW17FgStj/VYBIqMd1ZTc6R2V0K7LaZDXZ2Dun0r/KWaf4MWS
EH6KNWL709hDhh8bn0mJa6ZoFzuC7jz3twXJcpKWLqAcS9fJ2ng2e2WrIV5dVZYv
3myv7wPlHSTYNjYPS3TXkvkMG8vEaq+9Wt89WS/Q4gjY1/HppDEfWqKEFWW5JHv+
EGZLrK+M3r17nW1/Cwmp
=/ByV
-----END PGP SIGNATURE-----

--PpAOPzA3dXsRhoo+--
