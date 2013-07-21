From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/4] ASOC: tegra: move AC97 clock defines
 to the controller node
Date: Mon, 22 Jul 2013 00:36:51 +0100
Message-ID: <20130721233651.GZ9858@sirena.org.uk>
References: <1374442132-24040-1-git-send-email-dev@lynxeye.de>
 <1374442132-24040-2-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4874319888583621358=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1374442132-24040-2-git-send-email-dev@lynxeye.de>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Lucas Stach <dev@lynxeye.de>
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org, Stephen Warren <swarren@wwwdotorg.org>
List-Id: linux-tegra@vger.kernel.org


--===============4874319888583621358==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+vcRm3WFmV0Q/ShD"
Content-Disposition: inline


--+vcRm3WFmV0Q/ShD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jul 21, 2013 at 11:28:49PM +0200, Lucas Stach wrote:
> Different from other Tegra sound controllers drivers, the AC97
> controller driver uses the tegra asoc utils directly to request the
> needed clocks, as they are needed at AC97 init time. Move the DT clock
> defines to the right place.

I'm sorry but I just don't understand what this change is supposed to do
- what is the current place, what is wrong with it and what is the
correct place?

--+vcRm3WFmV0Q/ShD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR7HCQAAoJELSic+t+oim9EqYP/jA+8bI5VbwcrnAlP9EswNiI
flYoTObJnrztAUvpB42AbN5cKsCNropXcXOOcE1upqZ7fJ1DPEXRmakYtSrxc/0U
94CDzZXydbk7GuSLFbUUIP0YES3OPMaa6CY/IzOk5nKznB4QDgWn6PVpHKp5VDLO
z8D8a5S484jh1LtBh0N/HMPgRoSZq9T9TSUnzINLSN0/9isYCrDh/y+YWNudNd7i
E65egOjZ8II7mKnj8K9dBF5H+BIAusywELrDzRwFn8GlXYI1p+q8KGu7vn3x4zvP
CCHknDIdq4yWlHtj2JD1rmM3A0SmnFF2Qfi2eElBkYarJBBZolRyk6U1c3KgmeGQ
3NgU070BwdJmjEGS4ACbKKQf2mvOW4Wp3WFJiNmio7owrVLmH3oRKYwaTcFe2bw/
bqA9jKcSQZRNdSNHhDngo4UrNdmFPf5TWZ+6UktBPvO05XmpnYvPbKTsQ+D1Xs7C
O2WMIAZqVkUw6Ca3HTM7rz2qzeDYby2BWbMlbxTfQ9h0pQ0tLn5sPG8DNQ7qOMkz
vDLlyPP1CnUlhDmWU1+57ntrruPpHLpL7Zg5HLDzbILV7ArFIIJFypSBz43ftGUY
g9U1mmLZOxxAJ9357Qg+lwga2IQfqM9osWCdaEuuJxqGRHIb4oYMsA2driIA5bSh
wWpHqGxpyE3GB+6AtyIy
=mVXe
-----END PGP SIGNATURE-----

--+vcRm3WFmV0Q/ShD--

--===============4874319888583621358==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============4874319888583621358==--
