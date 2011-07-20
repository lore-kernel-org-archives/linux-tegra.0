From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] arm/dt: tegra devicetree support
Date: Wed, 20 Jul 2011 12:56:07 -0600
Message-ID: <20110720185607.GJ4642@ponder.secretlab.ca>
References: <20110719234158.2779.15394.stgit@ponder>
 <CAOesGMiy1t-98KZ_imFkGO-ify3S_00d_0XKc2vcLNRekxOvpw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOesGMiy1t-98KZ_imFkGO-ify3S_00d_0XKc2vcLNRekxOvpw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Jul 19, 2011 at 04:56:46PM -0700, Olof Johansson wrote:
> Nice!
>=20
>=20
> On Tue, Jul 19, 2011 at 4:43 PM, Grant Likely <grant.likely@secretlab=
=2Eca> wrote:
> > Everything required to populate NVIDIA Tegra devices from the devic=
e
> > tree. =A0This patch adds a new DT_MACHINE_DESC() which matches agai=
nst
> > a tegra20 device tree. =A0So far it only registers the on-chip devi=
ces,
> > but it will be refined in follow on patches to configure clocks and
> > pin IO from the device tree also.
> >
> > Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>=20
> Acked-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org
>=20
>=20
> Minor nit:
>=20
> > +++ b/arch/arm/boot/dts/tegra20.dtsi
> > @@ -0,0 +1,148 @@
> > +/include/ "skeleton.dtsi"
> > +
> > +/ {
> > + =A0 =A0 =A0 model =3D "NVIDIA Tegra 250";
>=20
> NVIDIA Tegra2 or Tegra20 to be more in line with the recent 250->20
> conversion (and Harmony)

I'll remove the model property entirely.  It doesn't make any sense
for the soc include file since "model" describes the system.

g.
