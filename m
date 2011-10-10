From: Stephen Warren <swarren@nvidia.com>
Subject: RE: [PATCH] fix drivers/staging/nvec linkage error when keyboard is
	disabled
Date: Mon, 10 Oct 2011 10:25:07 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF173B23B539@HQMAIL01.nvidia.com>
References: <20112.34922.209107.730268@pilspetsen.it.uu.se>
	<1534774.fR3YHUzZE9@fb07-iapwap2>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devel-bounces@linuxdriverproject.org>
In-Reply-To: <1534774.fR3YHUzZE9@fb07-iapwap2>
Content-Language: en-US
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/devel>,
	<mailto:devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/devel>
List-Post: <mailto:devel@linuxdriverproject.org>
List-Help: <mailto:devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/devel>,
	<mailto:devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: devel-bounces@linuxdriverproject.org
Sender: devel-bounces@linuxdriverproject.org
To: Marc Dietrich <marvin24@gmx.de>, Mikael Pettersson <mikpe@it.uu.se>, "Olof Johansson (olof@lixom.net)" <olof@lixom.net>, "Greg KH
	(gregkh@suse.de)" <gregkh@suse.de>
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Colin Cross
	(ccross@android.com)" <ccross@android.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Marc Dietrich wrote at Sunday, October 09, 2011 9:48 AM:
> Hi Mikael,
> 
> thanks for review. The nvec driver received some overhaul in the 3.1 release cycle
> and he fruids can be viewed in linux-next tree. The nvec client drivers were
> converted to mfd children in the mean time. This solves the build error, but is not
> very flexible. We are planing to move the mfd stuct to the board file(s) in the next
> cycle.

Indeed, the code in v3.1-rc9 is quite different to that in linux-next, so
this exact problem doesn't exist in linux-next.

However, don't we still want to solve build problems for the final v3.1
release, or a stable update to that? As such,

Acked-by: Stephen Warren <swarren@nvidia.com>

I also CC'd the staging maintainer Greg KH and Tegra maintainers Olof and
Colin on this email.

> Also the maintainers were added. If you still find problems, please send email to the
> linux driver developemnt project and cc Julian and me. You may also check our
> development tree at http://gitorious.org/ac100/marvin24s-tree.
> 
> Thanks
> 
> Marc
> 
> Am Samstag, 8. Oktober 2011, 19:29:14 schrieb Mikael Pettersson:
> > Building linux-3.1-rc9 for the Tegra ARM SoC with CONFIG_MFD_NVEC=y
> > and CONFIG_KEYBOARD_NVEC=n results in the following linkage error:
> >
> > drivers/built-in.o: In function `tegra_nvec_probe':
> > /tmp/linux-3.1-rc9/drivers/staging/nvec/nvec.c:373: undefined reference to
> > `nvec_kbd_init' make: *** [.tmp_vmlinux1] Error 1
> >
> > Fixed by #ifdef:ing the call to nvec_kbd_init(), similar to the
> > existing #ifdef CONFIG_SERIO_NVEC_PS2 around the nvec_ps2() call.
> >
> > Signed-off-by: Mikael Pettersson <mikpe@it.uu.se>
> > ---
> >
> > --- linux-3.1-rc9/drivers/staging/nvec/nvec.c.~1~	2011-10-08 16:28:20.000000000
> > +0200 +++ linux-3.1-rc9/drivers/staging/nvec/nvec.c	2011-10-08 19:09:18.000000000
> > +0200 @@ -370,7 +370,9 @@ static int __devinit tegra_nvec_probe(st
> >  	nvec_write_async(nvec, EC_ENABLE_EVENT_REPORTING,
> >  				sizeof(EC_ENABLE_EVENT_REPORTING));
> >
> > +#ifdef CONFIG_KEYBOARD_NVEC
> >  	nvec_kbd_init(nvec);
> > +#endif
> >  #ifdef CONFIG_SERIO_NVEC_PS2
> >  	nvec_ps2(nvec);
> >  #endif

-- 
nvpublic
