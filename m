From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 8/9] arm/tegra: seaboard: add EMC table to device tree
Date: Wed, 4 Jan 2012 15:51:03 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF17761F1590@HQMAIL01.nvidia.com>
References: <1324599468-12845-1-git-send-email-olof@lixom.net>
 <1324599468-12845-9-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1324599468-12845-9-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Olof Johansson wrote at Thursday, December 22, 2011 5:18 PM:
> Timings for the T25 version of seaboard, only one memory manufacturer
> and timing table (two speeds).

There exist Seaboards with Tegra20 rather than Tegra25. Should we:
* Rename tegra-seaboard.dts to tegra-seaboard.dtsi
* Create tegra-seaboard-t20.dts and tegra-seaboard-t25.dts which include
  tegra-seaboard.dtsi, and add the EMC tables to the Tegra25 version only?

Are the timings for true Seaboard and the Springbank variant identical?

-- 
nvpublic
