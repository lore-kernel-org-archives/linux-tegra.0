From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: Re: [PATCH v2 3/5] ARM: dt: tegra: add ADT7461 temperature sensor topaz00 device tree
Date: Wed, 01 Feb 2012 10:41:08 +0100
Message-ID: <10400303.NeisCxkuIb@fb07-iapwap2>
References: <cover.1327776641.git.marvin24@gmx.de> <9421201.72pNsFM5zn@ax5200p> <20120201082604.GL7399@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120201082604.GL7399-O5ziIzlqnXUVNXGz7ipsyg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Am Mittwoch, 1. Februar 2012, 00:26:04 schrieb Olof Johansson:
> On Tue, Jan 31, 2012 at 07:53:21PM +0100, Marc Dietrich wrote:
> > Add the ADT7461 temperature monitoring IC which is connected via
> > the DVC controller.
> > 
> > Signed-off-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
> > ---
> > 
> >  arch/arm/boot/dts/tegra-paz00.dts |    5 +++++
> >  1 files changed, 5 insertions(+), 0 deletions(-)
> > 
> > diff --git a/arch/arm/boot/dts/tegra-paz00.dts b/arch/arm/boot/dts/tegra-
> > paz00.dts
> > index f667343..81e1d30 100644
> > --- a/arch/arm/boot/dts/tegra-paz00.dts
> > +++ b/arch/arm/boot/dts/tegra-paz00.dts
> > @@ -35,6 +35,11 @@
> > 
> >         i2c@7000d000 {
> >         
> >                 clock-frequency = <400000>;
> > 
> > +
> > +               adt7461@4c {
> > +                       compatible = "adi,adt7461";
> > +                       reg = <0x4c>;
> > +               };
> 
> It's common to name the device node temp-sensor (or temperature-sensor) instead
> of the model of the actual chip. The name isn't significant for the binding,
> but it's a practice that's been used on other platforms for a long time.
> 
> I'll just fix it up when applying, if ok with you. No need to respin just for
> this.

Renaming it to something like "temp-sensor" is also ok for me. Feel free to change 
this.

Thanks!

Marc
