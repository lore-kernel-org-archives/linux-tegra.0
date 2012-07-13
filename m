From: Zhang Rui <rui.zhang@intel.com>
Subject: RE: How to use the generic thermal sysfs.
Date: Fri, 13 Jul 2012 15:41:18 +0800
Message-ID: <1342165278.1682.259.camel@rui.sh.intel.com>
References: <1342088573.27605.101.camel@tegra-chromium-2>
	 <4D68720C2E767A4AA6A8796D42C8EB5915287C@BGSMSX101.gar.corp.intel.com>
	 <1342144273.1682.237.camel@rui.sh.intel.com>
	 <1342164616.27605.129.camel@tegra-chromium-2>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1342164616.27605.129.camel@tegra-chromium-2>
Sender: linux-kernel-owner@vger.kernel.org
To: Wei Ni <wni@nvidia.com>
Cc: "R, Durgadoss" <durgadoss.r@intel.com>, "Brown, Len" <len.brown@intel.com>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "khali@linux-fr.org" <khali@linux-fr.org>, "joe@perches.com" <joe@perches.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@ger.kernel.org" <linux-tegra@ger.kernel.org>, Alex Courbot <acourbot@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On =E4=BA=94, 2012-07-13 at 15:30 +0800, Wei Ni wrote:
> On Fri, 2012-07-13 at 09:51 +0800, Zhang Rui wrote:
> > On =E5=9B=9B, 2012-07-12 at 04:54 -0600, R, Durgadoss wrote:
> > > Hi,
> > >=20
> > > > -----Original Message-----
> > > > From: Wei Ni [mailto:wni@nvidia.com]
> > > > Sent: Thursday, July 12, 2012 3:53 PM
> > > > To: Zhang, Rui; Brown, Len; akpm@linux-foundation.org; khali@li=
nux-fr.org;
> > > > joe@perches.com; R, Durgadoss
> > > > Cc: linux-kernel@vger.kernel.org; linux-tegra@ger.kernel.org;
> > > > acourbot@nvidia.com
> > > > Subject: How to use the generic thermal sysfs.
> > > >=20
> > > > Hi, all
> > > > I'm working on the tegra thermal throttling upstream issue.
> > > > The tegra30 board use the nct1008 as the thermal sensor, and th=
e lm90 is
> > > > the sensor driver. We want to use the generic thermal sysfs.
> > > >=20
> > > > My question is where should we register the thermal zone device=
? We may
> > > > have two place to do it:
> > > > 1. register it in the sensor driver, such as lm90.c
> > > > In this way, the sensor driver doesn't need to export any APIs,=
 such as
> > > > get_temp.
> > >=20
> > > This approach is preferred.
> > >=20
> > > > 2. register in my tegra thermal framework.
> > > > In this way, the sensor driver need to export some APIs, which =
are used
> > > > to register the ops and do any other things.
> > >=20
> > > What do you mean by "my tegra thermal framework" ? Where does the=
 source
> > > file for this sit in the mainline kernel ?
> > >=20
> > I have the same question.
> > It sounds like that you want to use the tegra thermal framework to =
do
> > thermal management instead of the generic thermal layer, right?
> >=20
> > IMO, the purpose of the generic thermal layer is
> > 1) do kernel thermal management
> > 2) export unique sysfs I/F to userspace so that users/userspace
> > applications can take over the thermal management.
> >=20
> > what is the benefit to have another driver to do thermal management=
 in
> > kernel?
> > If the current thermal management in the generic thermal layer can =
not
> > work well on your platform, it is a good chance to enhance the kern=
el
> > thermal manager. :)
>=20
> Our tegra thermal framework also will use the generic thermal layer. =
It
> will register the cooling device, and run the throttling in this gene=
ric
> framework.
> But we have a special mechanism, when the temp is below the trip temp=
,
> we will set different cpu capability for different temp range. For
> example, set the low/high temp as 20C/30C to the sensor, and set the =
cpu
> to the max capability, it mean the cpu can run up to the max freq and
> voltage in this temp range. if the temp is out that range, the sensor
> will have irq/alert to notify the tegra framework, then we will set t=
o
> another temperature range and cpu capability.
> I think we can try to add this mechanism to the generic framework as =
a
> new policy, right?
>=20
I think you can make use of the upper&lower limit in my patch set.
Say, here is your thermal policy
20C - 30C, P0
30C - 40C, P1 - P2
40C - 60C, P3 - P5
60C+, P6 ~ Pn

you can register to the thermal layer 4 passive trip points,
20C, 30C, 40C, 60C, and then
1) for trip 0 (20C), upper limit 0, lower limit 0
2) for trip 1 (30C), upper limit 2, lower limit 1
3) for trip 2 (40C), upper limit 5, lower limit 3
4) for trip 3 (60C), upper limit n, lower limit 6

you can program your own sensor to get interrupt when the temperature
hits 20C/30C/40C/60C, and the generic thermal layer will put the
processors to proper frequency for each trip point.

what do you think?

BTW, the upper and lower limit is introduced in the patch set I'm
testing, so maybe you were not aware of it.

thanks,
rui
> >=20
> > thanks,
> > rui
> >=20
> > > >=20
> > > > How should I do it?
> > > >=20
> > > > And in current codes, there have the event notification, in the=
 form of
> > > > a netlink event. But it's difficult to be used in the kernel, i=
t's
> > > > normally for the communication with user-space. How about to ad=
d a
> > > > notify call chain for it? So when the sensor has irq alert, it =
can send
> > > > a notify to my thermal framework in kernel.
> > >=20
> > > We are working on a notification API from any generic sensor driv=
er to
> > > the thermal framework.
> > > Please have a look at the 'notify_thermal_framework' API in the p=
atch here:
> > > http://www.spinics.net/lists/linux-acpi/msg36049.html
>=20
> It's cool. I will cherry pick them to run it.
>=20
> > >=20
> > > Thanks,
> > > Durga
> > >=20
> >=20
> >=20
>=20
>=20
