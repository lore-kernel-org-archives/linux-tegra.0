From: Zhang Rui <rui.zhang@intel.com>
Subject: Re: How to use the generic thermal sysfs.
Date: Fri, 27 Jul 2012 15:39:53 +0800
Message-ID: <1343374793.1682.475.camel@rui.sh.intel.com>
References: <1342088573.27605.101.camel@tegra-chromium-2>
	 <4D68720C2E767A4AA6A8796D42C8EB5915287C@BGSMSX101.gar.corp.intel.com>
	 <1342144273.1682.237.camel@rui.sh.intel.com>
	 <1342164616.27605.129.camel@tegra-chromium-2>
	 <1342165278.1682.259.camel@rui.sh.intel.com>
	 <1343295094.4042.24.camel@tegra-chromium-2>
	 <1343352098.1682.447.camel@rui.sh.intel.com>
	 <1343357901.4042.70.camel@tegra-chromium-2>
	 <20120727093037.094335eb@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120727093037.094335eb@endymion.delvare>
Sender: linux-kernel-owner@vger.kernel.org
To: Jean Delvare <khali@linux-fr.org>
Cc: Wei Ni <wni@nvidia.com>, "R, Durgadoss" <durgadoss.r@intel.com>, "Brown, Len" <len.brown@intel.com>, akpm@linux-foundation.org, joe@perches.com, linux-kernel@vger.kernel.org, linux-tegra@ger.kernel.org, Alex Courbot <acourbot@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On =E4=BA=94, 2012-07-27 at 09:30 +0200, Jean Delvare wrote:
> On Fri, 27 Jul 2012 10:58:21 +0800, Wei Ni wrote:
> > On Fri, 2012-07-27 at 09:21 +0800, Zhang Rui wrote:
> > > is it possible to program the sensor at this time, in your own th=
ermal
> > > driver?
> >=20
> > Since we are using the generic thermal driver lm90.c, I'm not sure =
if we
> > could program these limits in the generic driver, I think it's bett=
er to
> > have a generic interface to set the limits, so I wish to add a
> > callback .set_limits() in the generic thermal framework.
>=20
> I can confirm that hwmon drivers do not set limits, it is up to
> user-space to do it if they want. So if there is a need to do so in t=
he
> kernel itself, a proper interface at the generic thermal framework
> level seems appropriate.
>=20
oh, setting limits from userspace?
I think you can program the senor when writing the trip point?
with this patch,
http://marc.info/?l=3Dlinux-acpi&m=3D134318814620429&w=3D2

thanks,
rui
