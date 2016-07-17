From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: PCIe bridges on Jetson TK1
Date: Sun, 17 Jul 2016 02:27:25 +0200
Message-ID: <3a41e071-f7a2-f995-8c3d-ef211df6aa3a@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: U-Boot <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexander Graf <agraf-l3A5Bk7waGM@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

When I boot my Jetson TK1, by default I get this from lspci:

00:02.0 PCI bridge: NVIDIA Corporation TegraK1 PCIe x1 Bridge (rev a1)
01:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd.
RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller (rev 0c)

If however I plug some mini PCIe card, I get this instead:

00:01.0 PCI bridge: NVIDIA Corporation TegraK1 PCIe x4 Bridge (rev a1)
00:02.0 PCI bridge: NVIDIA Corporation TegraK1 PCIe x1 Bridge (rev a1)
01:00.0 Network controller: MEDIATEK Corp. Device 7612
02:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd.
RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller (rev 0c)

I.e., there is a new Tegra PCIe x4 bridge and the number of the previou=
s
x1 bridge changed.

That is ugly because it changes the ID of the on-board PCI NIC from
01:00.0 to 02:00.0, which on openSUSE renames the network interface fro=
m
enp1s0 to enp2s0, so that my /etc/sysconfig/network/ifcfg-enp1s0 does
not take effect and the network interface doesn't come up.

Tested with U-Boot v2016.05 and v2016.07 and kernel 4.6.2 and 4.7-rc6.

Shouldn't U-Boot or the kernel driver always configure the PCIe ports
the same way (both bridges available) since the slot is always there on
this board?

Thanks,
Andreas

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Norton
HRB 21284 (AG N=C3=BCrnberg)
