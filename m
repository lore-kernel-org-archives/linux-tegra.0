From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RFC PATCH 11/13] arm64: tegra: Add SOR power-domain node
Date: Mon, 20 Jun 2016 18:37:32 +0200
Message-ID: <20160620163732.GB6175@ulmo.ba.sec>
References: <1466165027-17917-1-git-send-email-jonathanh@nvidia.com>
 <1466165027-17917-12-git-send-email-jonathanh@nvidia.com>
 <20160617164202.GJ27475@ulmo.ba.sec> <5767B4F2.2090306@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2083512556=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <5767B4F2.2090306@nvidia.com>
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


--===============2083512556==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="p4qYPpj5QlsIQJ0K"
Content-Disposition: inline


--p4qYPpj5QlsIQJ0K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 20, 2016 at 10:18:42AM +0100, Jon Hunter wrote:
>=20
> On 17/06/16 17:42, Thierry Reding wrote:
> > * PGP Signed by an unknown key
> >=20
> > On Fri, Jun 17, 2016 at 01:03:45PM +0100, Jon Hunter wrote:
> >> Add node for SOR power-domain for Tegra210 and populate the SOR
> >> power-domain phandle for SOR and DPAUX nodes that are dependent
> >> on this power-domain.
> >>
> >> Please note that although neither the SOR or DPAUX drivers currently
> >> support runtime power-management, by populating the power-domain node
> >> the SOR power-domain will be turned on before probing SOR or DPAUX
> >> devices and kept on while the devices are bound.
> >>
> >> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> >> ---
> >>  arch/arm64/boot/dts/nvidia/tegra210.dtsi | 18 ++++++++++++++++++
> >>  1 file changed, 18 insertions(+)
> >=20
> > I've got patches queued in my drm-tegra tree to add support for runtime
> > PM for the SOR driver. Will that in some way clash with this work if
> > merged in parallel?
>=20
> Yes I had seen those. I was wondering if I should include them here but
> opted not too (as it was becoming a massive series). It should be fine
> to enable RPM later, you just need to be aware that the partition could
> turn off on a RPM put so you just need to ensure that any register
> context is saved and restored.

This doesn't matter much for Tegra DRM because we always program the
entire set of registers after pm_runtime_get(), which already resets
the IP block anyway.

> By the way, one item I am not certain about is the relationship between
> the HDMI device and the SOR device. If the HDMI is in the SOR partition
> it should also have the SOR power-domain populated, but it just uses the
> SOR, then the SOR driver should handle this.

On Tegra210 the HDMI output is driven by the SOR, and that's implemented
by the SOR driver, too, so the partition setup should be correct
already.

On Tegra124 and earlier the HDMI output is driven by a separate IP block
that's not at all related to SOR, and I haven't found any evidence that
it would be in the SOR power partition either.

Thierry

--p4qYPpj5QlsIQJ0K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXaBvMAAoJEN0jrNd/PrOhNGIQAKUF6vpzHHT0vCZ2QfFAaVdx
Jle+ZGr05RrfIKVzwHtFe08r+0AAvQgK3/Gjy9Q8XEzGnYv6Yyl9L5v/MdI14eG9
Lb/KmyaETGCsFyELz+mlZdfIbBktgOIG0g7YqEfpxDBMpEuAjgAPR+LPRF2dFeJk
7uSp+FOr4b0t1ttJHFV1EZb4CcXvEv3bJdzWbMKKiDTRPPcr9673cUYaRTCcq7mq
Y3H+G/pYvJsLdL8hzAOu0DdiHrZMFC9W5spt8bMfs1nbNCfafRNHs9Cu0aYZ39R5
ZaiTumYAHybCJzr2sDvoG9wRKlHcSV+DjWi2QzYJRivMTSQoJcNYl/lddOs8lvie
0Cw1kLaZveLC+/c4SSWI+G0mfU6PefhypD2io5UBGXQoT8WTPRQTCh+H+okCGdbo
hXuezFA0gQaIticoWo8Axp+d1/M8KHrTQCs1HLScgpT0G95r/AjnuqXWllvRWs/4
wwREf0cRd/uwazGoilLRn+sWlMgsYZMg83XIfK+n/Innn7p3lAG8/47INUaef554
aPxsCYYa8rZHeMEB9OIXIAUDTnNsF4Jk84Zpq7tfp2ZGJSIPIoCJKbEL3m2Ch1SB
MxyOzvLJ1DsqI/s7rx6M85PMZz/gMb/5Z6kAsbBSyNL3TD27SNi881HZ+iE3Z2Bf
kZrhPxCc9mZTYDn3uxei
=s3vL
-----END PGP SIGNATURE-----

--p4qYPpj5QlsIQJ0K--

--===============2083512556==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============2083512556==--
