From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: How to use the generic thermal sysfs.
Date: Fri, 13 Jul 2012 16:11:27 +0800
Message-ID: <1342167087.27605.158.camel@tegra-chromium-2>
References: <1342088573.27605.101.camel@tegra-chromium-2>
	 <4D68720C2E767A4AA6A8796D42C8EB5915287C@BGSMSX101.gar.corp.intel.com>
	 <1342144273.1682.237.camel@rui.sh.intel.com>
	 <1342164616.27605.129.camel@tegra-chromium-2>
	 <1342165278.1682.259.camel@rui.sh.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1342165278.1682.259.camel-fuY85erJQUO75v1z/vFq2g@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zhang Rui <rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: "R, Durgadoss" <durgadoss.r-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "Brown, Len" <len.brown-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org" <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org" <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, "joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org" <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-q7rQbLoQdy39qxiX1TGQuw@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alex Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, 2012-07-13 at 15:41 +0800, Zhang Rui wrote:
> On =E4=BA=94, 2012-07-13 at 15:30 +0800, Wei Ni wrote:
> > Our tegra thermal framework also will use the generic thermal layer=
=2E It
> > will register the cooling device, and run the throttling in this ge=
neric
> > framework.
> > But we have a special mechanism, when the temp is below the trip te=
mp,
> > we will set different cpu capability for different temp range. For
> > example, set the low/high temp as 20C/30C to the sensor, and set th=
e cpu
> > to the max capability, it mean the cpu can run up to the max freq a=
nd
> > voltage in this temp range. if the temp is out that range, the sens=
or
> > will have irq/alert to notify the tegra framework, then we will set=
 to
> > another temperature range and cpu capability.
> > I think we can try to add this mechanism to the generic framework a=
s a
> > new policy, right?
> >=20
> I think you can make use of the upper&lower limit in my patch set.
> Say, here is your thermal policy
> 20C - 30C, P0
> 30C - 40C, P1 - P2
> 40C - 60C, P3 - P5
> 60C+, P6 ~ Pn
>=20
> you can register to the thermal layer 4 passive trip points,
> 20C, 30C, 40C, 60C, and then
> 1) for trip 0 (20C), upper limit 0, lower limit 0
> 2) for trip 1 (30C), upper limit 2, lower limit 1
> 3) for trip 2 (40C), upper limit 5, lower limit 3
> 4) for trip 3 (60C), upper limit n, lower limit 6
>=20
> you can program your own sensor to get interrupt when the temperature
> hits 20C/30C/40C/60C, and the generic thermal layer will put the
> processors to proper frequency for each trip point.
>=20
> what do you think?

It's great, this is exactly what we need.
I think for these trip points, we can use a new trip type, such as
TRIP_LIMIT, and use new policy. Because in these state, we only need to
set the processors to proper frequency capability, it's not like the
passive type, the currently passive type will try to set cooling device
state continually.
And for these trip temp, it's better to add hysteresis value, so that i=
t
can avoid unnecessary interrupt.

>=20
> BTW, the upper and lower limit is introduced in the patch set I'm
> testing, so maybe you were not aware of it.

How can I get these codes?

>=20
> thanks,
> rui
