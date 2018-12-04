From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm/tegra: sor: Support for audio over HDMI
Date: Tue, 4 Dec 2018 15:40:55 +0100
Message-ID: <20181204144055.GB2608@ulmo>
References: <20181203153642.13562-1-thierry.reding@gmail.com>
 <e78a378e-edc3-2d29-e0d7-f2a3b7fe3fd3@gmail.com>
 <20181204130819.GA2608@ulmo>
 <93bf9722-3b13-48c9-27af-55e6d358afbc@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1271384538=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <93bf9722-3b13-48c9-27af-55e6d358afbc@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: linux-tegra@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>, dri-devel@lists.freedesktop.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============1271384538==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3lcZGd9BuhuYXNfi"
Content-Disposition: inline


--3lcZGd9BuhuYXNfi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 04, 2018 at 04:50:44PM +0300, Dmitry Osipenko wrote:
> On 04.12.2018 16:08, Thierry Reding wrote:
> > On Tue, Dec 04, 2018 at 02:09:07PM +0300, Dmitry Osipenko wrote:
> >> On 03.12.2018 18:36, Thierry Reding wrote:
> >>> From: Thierry Reding <treding@nvidia.com>
> >>>
> >>> This code is very similar to the audio over HDMI support on older chi=
ps.
> >>> Interoperation with the audio codec is done via a pair of codec scrat=
ch
> >>> registers and an interrupt that is raised at the SOR when the codec h=
as
> >>> written those registers.
> >>>
> >>> Signed-off-by: Thierry Reding <treding@nvidia.com>
> >>> ---
> >>
> >> Do you have any plans to implement integration with the sound
> >> subsystem? Indeed, there is HDMI audio configuration code for older
> >> chips in the Tegra's DRM driver that was added years ago.. but IIUC
> >> it's a kinda "dead code" without the integration.
> >=20
> > The integration all lives in sound/pci/hda/hda_tegra.c for the HDA
> > controller driver and sound/pci/hda/patch_hdmi.c for the HDMI codec
> > driver. The way that this works is that the HDMI codec driver writes
> > information about the audio format to so-called scratch registers via
> > HDA verbs. These HDA verbs are accessible in the SORs (or the HDMI on
> > older Tegra) which basically represent the HDMI codec. Writes to these
> > registers are detected and an interrupt is raised in the SOR (or HDMI)
> > controller, upon which the interrupt handler will configure the output
> > as needed for playback (i.e. program some registers, send out audio
> > infoframe, ...).
> >=20
> > From a userspace point of view you can simply access the HDMI codec as
> > an ALSA sound card. For example I use the speaker-test utility (from
> > alsa-utils) to test output like this:
> >=20
> > 	$ speaker-test -D hw:0,8 -c -F S16_LE -r 48000 -t sine -f 250 -l 1
> >=20
> > The same code that works from Tegra30 to Tegra210 also works on Tegra186
> > and Tegra194, though I have patches (which I plan to send out later
> > today) which add the HDA_CODEC_ENTRY entries as well as the necessary
> > device tree nodes to make all this work.
> >=20
> > Does that clarify things?
>=20
> Yes, that sounds like a nice way to integrate HW. I was also thinking
> from a good-old T20 perspective which AFAIK doesn't have that kind of
> HW integration, so was curious how it works for later Tegra's. Thank
> you very much for the explanation. Though it shouldn't be difficult to
> add SW integration with the audio codec.. but probably there was just
> no much need for it ever. It's good to know that it works for T30+,
> please keep up the good work :)

Yeah, downstream was (and still is I think) using a pure SW integration,
but it requires a custom API and then complicated code to look up the
correct SOR for a given HDMI codec and vice versa. Doing it via the HDA
codec scratch registers is what was originally intended from the design
teams and removes the need for any hacks.

For Tegra20 the situation is completely different because it doesn't
even have HDA, so we'd need to hook up one of the SPDIF outputs to HDMI
if we wanted to support HDMI audio there. I suspect that there must be
existing mechanisms to do this for platform devices, given that there
must be other devices that support HDMI audio and that don't integrate
tightly with an HDA codec.

Thierry

--3lcZGd9BuhuYXNfi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlwGkfQACgkQ3SOs138+
s6H2Bg//QCjUV2WzQuHqA8MXe3dOMpYZhJe81Kk1YuPq5R0eLD9H+URqRdxtTXa9
wGEpaBFqg6Ii6+2gtVMTQ8s5hMt0MjYePyYIM9k97ekU4v2d/jdSTWdGYpMVElGU
YGtDz3Y1iUSbPnsgCHCdT4g2SHQcVNAKB/rnneHzwYypzGu4BV8BE7ommT9h2d7E
eFvIADZaaSw6YqT82J5e1r0OVRaDd03gEjJHFF+9kHdS9tsIkzh+nRbTRN6ty++5
+w1CjTwJpMCH6eJgt6pfnRX7IQ1dR11C/70DMPt7dTlXJ6BX+j8Qu6c7++RzV/HB
rT+qtqdNNX1ouMJmfCLbAtl5XS/JKd5xm6Pf6hVbHmV7mTL/pBSfyIwGMc9VLRZW
Ja9qjCHU4PcZWKCUfx9V4fbdSDJO4vatdW4Q0m9BoNY09ri6u0KK+k/Z6emNzyS5
kpOQQOxwhIwRVZWQJL8+ij0d53ihjNcgxC9YVfPHNubrV6to66O17TMsn/ive47J
BNVvysNV2WxrGLVR6PDVuMaNzcx60QgxDfhT90vEHYTEeX2zh7iNM0wzAqnpsuEG
tCWR1cPEUYPoOu3pjTOfOu+Zu0AJXb0ddEOgdjJATBu7zm/RiASDtL4NgVxN0o4T
1oujPnuAHlWR2A+CZuA7HxsPIk5jZy7/LVPS4F2mv2Jn0sP4y1g=
=3/WD
-----END PGP SIGNATURE-----

--3lcZGd9BuhuYXNfi--

--===============1271384538==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1271384538==--
