From: Martin Michlmayr <tbm-R+vWnYXSFMfQT0dZR+AlfA@public.gmane.org>
Subject: Flicker with fb on Jetson TK1
Date: Sun, 24 Jul 2016 19:02:34 -0700
Message-ID: <20160725020234.GA25839@jirafa.cyrius.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Running X with fb on the Jetson TK1, I get a flicker on the monitor
from time to time.  I don't think I need to do anything to trigger it
(such as moving the mouse).  It just happens from time to time.

I don't have the right X patches for nouveau, so X is using fbdev
which I guess means the tegra-drm driver.

This is with mainline u-boot (2016.07-rc1) and mainline kernel (4.6).

I uploaded a video in which you can see the flicker several times
(e.g. at 0:03, 0:16 and 0:28):
http://www.cyrius.com/tmp/tk1/

-- 
Martin Michlmayr
http://www.cyrius.com/
