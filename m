From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: PCIe device tree support
Date: Tue, 21 Feb 2012 09:15:47 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF17BD8BC302@HQMAIL01.nvidia.com>
References: <20120220191804.GA14499@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120220191804.GA14499-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "Olof Johansson (olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org)" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Thierry Reding wrote at Monday, February 20, 2012 12:18 PM:
> I would like to add device tree support for the Tegra2 PCIe controller. From
> what I understand this will require the PCIe code to be rewritten as a proper
> platform driver in order to be able to instantiate it via the device tree. Is
> that correct?

That's probably the cleanest way, yes.

Is there a drivers/ directory for PCI/PCIe host controllers? Moving the
code there might be nice if so, although IIRC when I asked Olof about
that a number of months back, he said quite a few host controllers were
in arch/...

Thanks for contemplating this; I had it in the back of my mind to do this
to get everything converted to DT, but there were always other things
going on.

-- 
nvpublic
