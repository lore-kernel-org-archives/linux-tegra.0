From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 10/10] ARM: tegra: pcie: Add device tree support
Date: Thu, 16 Aug 2012 07:03:50 +0000
Message-ID: <201208160703.50364.arnd@arndb.de>
References: <1343332512-28762-1-git-send-email-thierry.reding@avionic-design.de> <201208152025.25252.arnd@arndb.de> <20120816045539.GA17067@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120816045539.GA17067-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thursday 16 August 2012, Thierry Reding wrote:
> At least for the config space this is incorrect. There's a single region
> to access the configuration space for all devices below the PCIe
> controller. So it is shared by both (Tegra20) or all three (Tegra30)
> root ports.
> 
> I'm not sure about PCI domains. Do you have any good pointers as to
> where I could read up on them? If they need special hardware support,
> then I think Tegra doesn't support them either. At least I haven't come
> across any mention of domains while going through the, admittedly some-
> what sparse on PCIe, Tegra documentation.

I was referring to the same thing here: if you had a separate config
space for each root port, they would by definition be separate PCI
domain. So you don't have them.

	Arnd
