From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 10/10] ARM: tegra: pcie: Add device tree support
Date: Wed, 15 Aug 2012 20:25:25 +0000
Message-ID: <201208152025.25252.arnd@arndb.de>
References: <1343332512-28762-1-git-send-email-thierry.reding@avionic-design.de> <CAErSpo7c4L=Ny=CtZwLB_XWTcN8tVWs_quuE_T+XLEGyhWwHkg@mail.gmail.com> <20120815145708.GA11331@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120815145708.GA11331-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wednesday 15 August 2012, Thierry Reding wrote:
> Yes, that was my understanding as well. So currently I haven't seen any
> problems with this because I only use one of the two host bridges. But I
> suppose I should add code to initialize the bus number aperture properly
> either via platform device resources (for the non-DT case) and the
> device tree otherwise.

I think when we last discussed this, the assumption was that each
root port has its own config space range and its own pci domain,
so you don't have to worry about bus apertures because each root port
can then have all 255 bus numbers. Has that turned out to be incorrect
now?

	Arnd
