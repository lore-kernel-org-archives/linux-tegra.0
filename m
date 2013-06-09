From: Thomas Meyer <thomas-VsYtu1Qij5c@public.gmane.org>
Subject: Re: No HDMI output on AC100
Date: Sun, 09 Jun 2013 10:38:21 +0200
Message-ID: <1370767101.2283.6.camel@localhost.localdomain>
References: <1370680435.24531.12.camel@localhost.localdomain>
	 <4532876.1zmFKV0LLN@ax5200p>
	 <68C7110D-C493-4A1F-8011-5F9259C2F4E7@m3y3r.de>
	 <1370707552.1829.4.camel@antimon.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1370707552.1829.4.camel-6fNNZcyRN12a6lf8Wg2v7Z5kstrrjoWp@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Am Samstag, den 08.06.2013, 18:05 +0200 schrieb Lucas Stach:
> Am Samstag, den 08.06.2013, 16:21 +0200 schrieb Thomas Meyer:
> > > On Saturday 08 June 2013 10:33:55 Thomas Meyer wrote:
> > >> Kernel version: 3.10.0-0.rc4.git0.1.fc20.armv7hl
> > >> 
> > >> This is the latest Fedora ARM kernel. Config is available here:
> > >> http://pkgs.fedoraproject.org/cgit/kernel.git/tree/config-armv7
> > >> 
> > >> This is what I see in the kernel log:
> > >> 
> > >> $ dmesg |grep hdmi
> > >> [   33.403417] tegra-hdmi 54280000.hdmi: failed to get VDD regulator
> > >> [   33.403441] platform 54280000.hdmi: Driver tegra-hdmi requests probe
> > >> 
> > >> any ideas?
> > > 
> > > is the regulator (tps6586x) build-in?
> > 
> > No, it's a module.
> > 
> > > The make everything a module path isn't 
> > > well tested I guess. 
> > 
> It's not the problem here. The driver requests to be probed again and
> comes up once the regulator is there.
> 
> Though the pixel clock looks odd for a HD HDMI monitor. Try looking at
> the Xorg log to see what mode of your monitor get's chosen and why it
> fails.

Some more kernel logs:

[   34.087790] tps6586x-rtc tps6586x-rtc: rtc core: registered tps6586x-rtc as rtc1
[   34.089788] tegra-hdmi 54280000.hdmi: failed to get VDD regulator
[   34.089810] platform 54280000.hdmi: Driver tegra-hdmi requests probe deferral
[   34.102695] vdd_sys: no parameters
[   34.102731] vdd_sys: supplied by +5valw
[   34.104278] +1.2vs_sm0,vdd_core: 1200 mV 
[   34.104490] +1.2vs_sm0,vdd_core: supplied by vdd_sys
[   34.106047] +1.0vs_sm1,vdd_cpu: 1000 mV 
[   34.106240] +1.0vs_sm1,vdd_cpu: supplied by vdd_sys
[   34.107759] +3.7vs_sm2,vin_ldo*: 3700 mV 
[   34.108000] +3.7vs_sm2,vin_ldo*: supplied by vdd_sys
[   34.108773] REG-LDO_0: at 1200 mV 
[   34.108961] REG-LDO_0: supplied by +3.7vs_sm2,vin_ldo*
[   34.110586] +1.1vs_ldo1,avdd_pll*: 1100 mV 
[   34.110782] +1.1vs_ldo1,avdd_pll*: supplied by +3.7vs_sm2,vin_ldo*
[   34.112252] +1.2vs_ldo2,vdd_rtc: 1200 mV 
[   34.112747] +1.2vs_ldo2,vdd_rtc: supplied by +3.7vs_sm2,vin_ldo*
[   34.114529] +3.3vs_ldo3,avdd_usb*: 3300 mV 
[   34.114791] +3.3vs_ldo3,avdd_usb*: supplied by +3.7vs_sm2,vin_ldo*
[   34.116841] +1.8vs_ldo4,avdd_osc,vddio_sys: 1800 mV 
[   34.117077] +1.8vs_ldo4,avdd_osc,vddio_sys: supplied by +3.7vs_sm2,vin_ldo*
[   34.118239] +2.85vs_ldo5,vcore_mmc: 2850 mV 
[   34.119534] +2.85vs_ldo6,avdd_vdac: 1800 mV 
[   34.119726] +2.85vs_ldo6,avdd_vdac: supplied by +3.7vs_sm2,vin_ldo*
[   34.121021] +3.3vs_ldo7,avdd_hdmi: 3300 mV 
[   34.121212] +3.3vs_ldo7,avdd_hdmi: supplied by +3.7vs_sm2,vin_ldo*
[   34.122431] +1.8vs_ldo8,avdd_hdmi_pll: 1800 mV 
[   34.122620] +1.8vs_ldo8,avdd_hdmi_pll: supplied by +3.7vs_sm2,vin_ldo*
[   34.123690] +2.85vs_ldo9,vdd_ddr_rx: 2850 mV 
[   34.123954] +2.85vs_ldo9,vdd_ddr_rx: supplied by +3.7vs_sm2,vin_ldo*
[   34.125020] +3.3vs_rtc: 3300 mV 
[   34.126866] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[   34.126878] [drm] No driver support for vblank timestamp query.
[   34.189478] Console: switching to colour frame buffer device 240x67
[   34.214505] tegra-host1x 50000000.host1x: fb0:  frame buffer device
[   34.214517] tegra-host1x 50000000.host1x: registered panic notifier
[   34.214597] [drm] Initialized tegra 0.0.0 20120330 on minor 0
