From: Richard Leitner <me-M/VWbR8SM2SsTnJN9+BGXg@public.gmane.org>
Subject: Question about "missing" tegra features
Date: Thu, 03 Jul 2014 09:11:39 +0200
Message-ID: <c3a33a3d722302b1f4d877649d485d2f@webmail-alfa3028.alfahosting-server.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hello folks,
I've a general question regarding the linux-tegra development:
Why are there tegra features which are available in NVIDIA's kernel tree 
[1], but not included in mainline (or at least your tegra tree)?
I've just noticed that for the USB device controller 
(drivers/usb/gadget/tegra_udc.{c,h}), but it seems there are more such 
"cases".

Is there any documentation on what is supported/included in mainline 
already and what not?

I would be grateful for any response.

Thanks & regards,
richard

[1] http://nv-tegra.nvidia.com/gitweb/?p=linux-3.10.git
