From: Martin Michlmayr <tbm-R+vWnYXSFMfQT0dZR+AlfA@public.gmane.org>
Subject: poweroff on TK1: 7000d000.i2c: i2c transfer timed out
Date: Wed, 22 Jun 2016 21:08:39 -0700
Message-ID: <20160623040839.GA22569@jirafa.cyrius.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

I get the following when I run 'poweroff' on a Jetson TK1 with the
Debian kernel:

[  938.650925] systemd-shutdown[1]: Powering off.
[  939.677570] reboot: Power down
[  940.680206] tegra-i2c 7000d000.i2c: i2c transfer timed out
[  940.685751] as3722-power-off as3722-power-off: RESET_CONTROL_REG update failed, -110
[  940.694297] Kernel panic - not syncing: Attempted to kill init!  exitcode=0x00000000

Interestingly, a kernel compiled with the multi_v7 defconfig powers
off correctly.  I believe all of the obvious options are enabled in
the Debian kernel.  I played around with multi_v7_defconfig and
eventually saw it there as well but it wasn't obvious what options
mattered. (Sorry, I know this is a lousy bug report!)   I'm wonder if
it's a timing issue.

Has anyone seen this before?

-- 
Martin Michlmayr
http://www.cyrius.com/
