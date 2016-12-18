From: Martin Michlmayr <tbm-R+vWnYXSFMfQT0dZR+AlfA@public.gmane.org>
Subject: Reboot hangs on Jetson TX1
Date: Sat, 17 Dec 2016 20:27:16 -0800
Message-ID: <20161218042716.GA7344@jirafa.cyrius.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Reboot hangs on the Jetson TX1 developer kit.  This is with mainline
u-boot and mainline 4.9 (and before) using defconfig.

The last line I see is:

[   31.227974] kvm: exiting hardware virtualization

and then it just hangs.

poweroff doesn't work either.

(The last line is kvm related but the problem has nothing to do with
kvm.)

-- 
Martin Michlmayr
http://www.cyrius.com/
