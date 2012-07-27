From: Wei Ni <wni@nvidia.com>
Subject: RE: How to use the generic thermal sysfs.
Date: Fri, 27 Jul 2012 10:58:21 +0800
Message-ID: <1343357901.4042.70.camel@tegra-chromium-2>
References: <1342088573.27605.101.camel@tegra-chromium-2>
	 <4D68720C2E767A4AA6A8796D42C8EB5915287C@BGSMSX101.gar.corp.intel.com>
	 <1342144273.1682.237.camel@rui.sh.intel.com>
	 <1342164616.27605.129.camel@tegra-chromium-2>
	 <1342165278.1682.259.camel@rui.sh.intel.com>
	 <1343295094.4042.24.camel@tegra-chromium-2>
	 <1343352098.1682.447.camel@rui.sh.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1343352098.1682.447.camel@rui.sh.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Zhang Rui <rui.zhang@intel.com>
Cc: "R, Durgadoss" <durgadoss.r@intel.com>, "Brown, Len" <len.brown@intel.com>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "khali@linux-fr.org" <khali@linux-fr.org>, "joe@perches.com" <joe@perches.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@ger.kernel.org>, Alex Courbot <acourbot@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Fri, 2012-07-27 at 09:21 +0800, Zhang Rui wrote:
> On =E5=9B=9B, 2012-07-26 at 17:31 +0800, Wei Ni wrote:
> > On Fri, 2012-07-13 at 15:41 +0800, Zhang Rui wrote:
> > > On =E4=BA=94, 2012-07-13 at 15:30 +0800, Wei Ni wrote:
> > > >=20
> > > > Our tegra thermal framework also will use the generic thermal l=
ayer. It
> > > > will register the cooling device, and run the throttling in thi=
s generic
> > > > framework.
> > > > But we have a special mechanism, when the temp is below the tri=
p temp,
> > > > we will set different cpu capability for different temp range. =
=46or
> > > > example, set the low/high temp as 20C/30C to the sensor, and se=
t the cpu
> > > > to the max capability, it mean the cpu can run up to the max fr=
eq and
> > > > voltage in this temp range. if the temp is out that range, the =
sensor
> > > > will have irq/alert to notify the tegra framework, then we will=
 set to
> > > > another temperature range and cpu capability.
> > > > I think we can try to add this mechanism to the generic framewo=
rk as a
> > > > new policy, right?
> > > >=20
> > > I think you can make use of the upper&lower limit in my patch set=
=2E
> > > Say, here is your thermal policy
> > > 20C - 30C, P0
> > > 30C - 40C, P1 - P2
> > > 40C - 60C, P3 - P5
> > > 60C+, P6 ~ Pn
> > >=20
> > > you can register to the thermal layer 4 passive trip points,
> > > 20C, 30C, 40C, 60C, and then
> > > 1) for trip 0 (20C), upper limit 0, lower limit 0
> > > 2) for trip 1 (30C), upper limit 2, lower limit 1
> > > 3) for trip 2 (40C), upper limit 5, lower limit 3
> > > 4) for trip 3 (60C), upper limit n, lower limit 6
> > >=20
> > > you can program your own sensor to get interrupt when the tempera=
ture
> > > hits 20C/30C/40C/60C, and the generic thermal layer will put the
> > > processors to proper frequency for each trip point.
> > >=20
> > > what do you think?
> >=20
> > Hi, Rui
> > I'm trying your upper/lower codes on our tegra platform.
> > Since we want to set limit value to the sensor to get interrupt, an=
d
> > many sensor drivers can support the limit alert property, could we =
add a
> > new callback .set_limits() for the thermal zone device, so that we =
can
> > program it in the generic layer. when the temperature hits the
> > trip_temp,
>=20
> at this time, there should be an interrupt, right?

Yes, there will have an interrupt.

>=20
> >  we can try to set to the next limit range.
>=20
> is it possible to program the sensor at this time, in your own therma=
l
> driver?

Since we are using the generic thermal driver lm90.c, I'm not sure if w=
e
could program these limits in the generic driver, I think it's better t=
o
have a generic interface to set the limits, so I wish to add a
callback .set_limits() in the generic thermal framework.

>=20
> thanks,
> rui
> > I can try to add these codes base on your patches.
> >=20
> > Thanks.
> > Wei.
> >=20
> > >=20
> > > BTW, the upper and lower limit is introduced in the patch set I'm
> > > testing, so maybe you were not aware of it.
> > >=20
> > > thanks,
> > > rui
> >=20
> >=20
> >=20
>=20
>=20
