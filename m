From: Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
Subject: Tegra30: Unknown SKU 177
Date: Tue, 08 Apr 2014 16:12:29 +0200
Message-ID: <534403CD.8010303@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi there

Looks like the latest T30MQS-P-A3 embedded SKUs that can e.g. be found 
on Toradex Colibri T30 V1.1D modules are not yet recognised by the 
mainline speedo driver:

[    0.000000] Tegra30: Unknown SKU 177
[    0.000000] fuse_speedo_calib: ATE prog ver 4.0
[    0.000000] Tegra30: CPU Speedo ID 0, Soc Speedo ID 0
[    0.000000] Tegra Revision: A03 SKU: 177 CPU Process: 2 Core Process: 0

Does this have any adverse effects?

If any further information is required just let me know.

Cheers

Marcel
