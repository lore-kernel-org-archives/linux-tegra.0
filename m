From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: spidev t20 on 2.6.36.2 kernel problem
Date: Thu, 04 Apr 2013 12:26:23 -0600
Message-ID: <515DC5CF.5030303@wwwdotorg.org>
References: <1243821364971837@web10h.yandex.ru> <515C5D4C.9050108@wwwdotorg.org> <883501365053928@web30f.yandex.ru> <515DBA35.6000309@wwwdotorg.org> <1714461365098590@web4d.yandex.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1714461365098590-5jccDmya2mZuio3avFS2gg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikhail Goryunov <gormih78-o+MxOtu4lMCHXe+LvDLADg@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04/04/2013 12:03 PM, Mikhail Goryunov wrote:
> By the way in the upstream kernel 3.8.5 in my opinion there is no header file with registers of tegra t20?

Which aspect of the registers?

If you mean the base address of each HW module: that is described in
device-tree now. See arch/arm/boot/dts/tegra20.dtsi.

If you mean the individual register fields for each module, those are
part of the individual drivers; either in the .c file or an accompanying
.h file. For example, drivers/gpio/gpio-tegra.c or
sound/soc/tegra/tegra20_i2s.h.
