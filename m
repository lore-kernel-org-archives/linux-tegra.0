From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm/tegra: sor: Support for audio over HDMI
Date: Tue, 4 Dec 2018 14:08:19 +0100
Message-ID: <20181204130819.GA2608@ulmo>
References: <20181203153642.13562-1-thierry.reding@gmail.com>
 <e78a378e-edc3-2d29-e0d7-f2a3b7fe3fd3@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1836594402=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <e78a378e-edc3-2d29-e0d7-f2a3b7fe3fd3@gmail.com>
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


--===============1836594402==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ikeVEW9yuYc//A+q"
Content-Disposition: inline


--ikeVEW9yuYc//A+q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 04, 2018 at 02:09:07PM +0300, Dmitry Osipenko wrote:
> On 03.12.2018 18:36, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > This code is very similar to the audio over HDMI support on older chips.
> > Interoperation with the audio codec is done via a pair of codec scratch
> > registers and an interrupt that is raised at the SOR when the codec has
> > written those registers.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
>=20
> Do you have any plans to implement integration with the sound
> subsystem? Indeed, there is HDMI audio configuration code for older
> chips in the Tegra's DRM driver that was added years ago.. but IIUC
> it's a kinda "dead code" without the integration.

The integration all lives in sound/pci/hda/hda_tegra.c for the HDA
controller driver and sound/pci/hda/patch_hdmi.c for the HDMI codec
driver. The way that this works is that the HDMI codec driver writes
information about the audio format to so-called scratch registers via
HDA verbs. These HDA verbs are accessible in the SORs (or the HDMI on
older Tegra) which basically represent the HDMI codec. Writes to these
registers are detected and an interrupt is raised in the SOR (or HDMI)
controller, upon which the interrupt handler will configure the output
as needed for playback (i.e. program some registers, send out audio
infoframe, ...).

=46rom a userspace point of view you can simply access the HDMI codec as
an ALSA sound card. For example I use the speaker-test utility (from
alsa-utils) to test output like this:

	$ speaker-test -D hw:0,8 -c -F S16_LE -r 48000 -t sine -f 250 -l 1

The same code that works from Tegra30 to Tegra210 also works on Tegra186
and Tegra194, though I have patches (which I plan to send out later
today) which add the HDA_CODEC_ENTRY entries as well as the necessary
device tree nodes to make all this work.

Does that clarify things?

Thierry

--ikeVEW9yuYc//A+q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlwGfEAACgkQ3SOs138+
s6FxZRAAgBcdxzxiz4YVKAGo0FyEiP4+aViOXbw86qqZ6glWOVmCmbzuemSM2kc8
y87v1cHIJ7yWhhHUW7WX9FnLoU8G4qy/asDFdZGrEmpj24owvvDRKdj5vRQsSHdb
TSXPyRBcIUtwZW7/8PYif9hmGk1C+ZZSlvjY4lmraQ9QH0WseRYdZKjksaOeV0ce
psd9TKjT8JhLmKzdYPd/+YucA3yHjr7VwBbQRFsldbv/K/UnjTQFTDhrAiM3lapH
IE8Y/xgSkEebwJhrdCSLctSD9YzpXZCdGrqoi+UZEGwUdWNOJxxS4e0b+eWj7Afr
Sg2kYo2nkF00isy724MxNKGKK0WYsv7Dn0Dw1BP/Dm859L4y2AlyyZ2FV4dsPOLT
lFRiq6bQGhdLT6xpuHz/1ErjKKcJnYbVH/o6PvtfVKNyOTdptJdGsc8Hcv+t3AZ8
y2A02I/hafY4YSt+2+GX35nrzqzc7aTAaICgOum7bovbu1yw5Jcab4b7sTi11Nrj
eCoHLGX5gyze8s9paYdVSbz/tH+RUNyeeFnoEK+mP/apwq9HooxqmJoayB4x9WAx
7pk3pvT03NNQuZKM25Shsrbaaqh+iukN4jUr+0q8hBSVEGj1W7EO2c3dNcZfC10z
9ajH/lLtaI32eZnDl1cxH1b1HXEdPTYj1qzQw8+RFzRgc/pm7SM=
=smgM
-----END PGP SIGNATURE-----

--ikeVEW9yuYc//A+q--

--===============1836594402==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1836594402==--
