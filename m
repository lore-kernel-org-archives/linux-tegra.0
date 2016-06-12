From: Martin Michlmayr <tbm-R+vWnYXSFMfQT0dZR+AlfA@public.gmane.org>
Subject: tegra-devfreq hangs TK1 with R21.4 u-boot
Date: Sat, 11 Jun 2016 20:45:41 -0700
Message-ID: <20160612034541.GA31426@jirafa.cyrius.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

I noticed that the Jetson TK1 hangs during boot (when/before mounting
the SD disk) when CONFIG_ARM_TEGRA_DEVFREQ=y is set and when u-boot
from R21.4 is used (2014.10-rc2).

The hang does not occur when I disable tegra-devfreq or when I use
tegra-devfreq in combination with u-boot 2016.03 (from DENX upstream,
built by Debian).

Steps to reproduce:

ARCH=arm make multi_v7_defconfig
Set CONFIG_ARM_TEGRA_DEVFREQ=y
Boot from an external SD card and it will hang when/before mounting the
SD card.

-- 
Martin Michlmayr
http://www.cyrius.com/
