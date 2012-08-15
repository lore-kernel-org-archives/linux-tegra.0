From: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 10/10] ARM: tegra: pcie: Add device tree support
Date: Wed, 15 Aug 2012 14:48:15 -0600
Message-ID: <CAErSpo7=_zzNCXujq-XJjcb=3wMkUPyUeyQSQ6G59Q-Q6VLd3g@mail.gmail.com>
References: <1343332512-28762-1-git-send-email-thierry.reding@avionic-design.de>
 <CAErSpo7c4L=Ny=CtZwLB_XWTcN8tVWs_quuE_T+XLEGyhWwHkg@mail.gmail.com>
 <20120815145708.GA11331@avionic-0098.mockup.avionic-design.de> <201208152025.25252.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201208152025.25252.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Aug 15, 2012 at 2:25 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Wednesday 15 August 2012, Thierry Reding wrote:
>> Yes, that was my understanding as well. So currently I haven't seen any
>> problems with this because I only use one of the two host bridges. But I
>> suppose I should add code to initialize the bus number aperture properly
>> either via platform device resources (for the non-DT case) and the
>> device tree otherwise.
>
> I think when we last discussed this, the assumption was that each
> root port has its own config space range and its own pci domain,
> so you don't have to worry about bus apertures because each root port
> can then have all 255 bus numbers. Has that turned out to be incorrect
> now?

If that's the case, there's no problem.  I just want to be explicit
about the host bridge bus number aperture because I'd like to make
pci_scan_root_bus() fail if no aperture is supplied or if the aperture
overlaps with something we've already seen.  I don't know if that
means you want to add a domain and [bus 00-ff] range in device tree,
or if you want to make some device tree rule about every host bridge
being in its own domain, or what.

Bjorn
