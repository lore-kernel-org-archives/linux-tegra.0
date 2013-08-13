From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: question on possible i2c slave configuration
Date: Tue, 13 Aug 2013 16:16:03 +0200
Message-ID: <1674757.GDNdpd4ScH@fb07-iapwap2.physik.uni-giessen.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Laxman,

Stephen and me were discussing about the possible configuration of the i2c 
slave controller. The question here is if the slave and the master controller 
of the same port (or instance) can act in parallel.

This is of particular interest when it comes to device tree representation. 
The Tegra3 TRM mentions a that the master can address its own slave for 
testing purposes. Also the i2c block diagram suggests that there are two 
controllers (for master and slave) connected to the same bus.

If this is the case, master and slave mode is not exclusive, or in other 
words, the i2c master and slave need to share their resources.

Another question is (because this would add a lot of code complexity) if we 
want to allow such a configuration at all.

Thanks,

Marc
