From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 13/14] ARM: tegra: harmony: Initialize PCIe from DT
Date: Thu, 10 Jan 2013 16:58:40 -0700
Message-ID: <50EF55B0.7030106@wwwdotorg.org>
References: <1357764194-12677-1-git-send-email-thierry.reding@avionic-design.de> <1357764194-12677-14-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1357764194-12677-14-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Andrew Murray <andrew.murray-5wv7dgnIgG8@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/09/2013 01:43 PM, Thierry Reding wrote:
> With the device tree support in place, probe the PCIe controller from
> the device tree and remove the corresponding workaround in the board
> file.

For some reason, the ports on Harmony fail to initialize correctly with
this driver, although they do with plain next-20130109:

> [    2.698922] tegra-pcie 80003000.pcie-controller: link 0 down, retrying
> [    2.925722] tegra-pcie 80003000.pcie-controller: link 0 down, retrying
> [    3.155411] tegra-pcie 80003000.pcie-controller: link 0 down, retrying
> [    3.178428] tegra-pcie 80003000.pcie-controller: link 0 down, ignoring
> [    3.199713] tegra-pcie 80003000.pcie-controller: failed to add port pci: -19

^^^ There's definitely something plugged into this port, and it's
enumerated OK with the old driver.

> [    3.433551] tegra-pcie 80003000.pcie-controller: link 1 down, retrying
> [    3.667624] tegra-pcie 80003000.pcie-controller: link 1 down, retrying
...
> [    3.901493] tegra-pcie 80003000.pcie-controller: link 1 down, retrying
> [    3.902589] tegra-pcie 80003000.pcie-controller: link 1 down, ignoring
> [    3.902615] tegra-pcie 80003000.pcie-controller: failed to add port pci: -19
> [    3.903780] tegra-pcie 80003000.pcie-controller: PCI host bridge to bus 0000:00
> [    3.903815] pci_bus 0000:00: root bus resource [io  0x82000000-0x8200ffff]
> [    3.903844] pci_bus 0000:00: root bus resource [mem 0xa0000000-0xafffffff]
> [    3.903871] pci_bus 0000:00: root bus resource [mem 0xb0000000-0xbfffffff pref]
> [    3.903901] pci_bus 0000:00: root bus resource [bus 00-ff]
