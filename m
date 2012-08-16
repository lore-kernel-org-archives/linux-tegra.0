From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v3 05/10] resource: add PCI configuration space support
Date: Thu, 16 Aug 2012 09:18:20 -0600
Message-ID: <502D0F3C.4010308@wwwdotorg.org>
References: <1343332512-28762-1-git-send-email-thierry.reding@avionic-design.de> <1343332512-28762-6-git-send-email-thierry.reding@avionic-design.de> <CAErSpo4qg45brVRwEbw3=R04VsbnvUowSMWcT+M6VoAxbf3Cqg@mail.gmail.com> <20120814055542.GB16181@avionic-0098.mockup.avionic-design.de> <CAErSpo6LYpkC5wop53S1r1z3ov4+w4soqrQARzbbouVs1trzUg@mail.gmail.com> <20120814180142.GA9430@avionic-0098.mockup.avionic-design.de> <CAErSpo4Efy-Dt67rktzNiYfZfOTSu=pmYtyGd3tR-zZQ3jDGtA@mail.gmail.com> <20120815064902.GB15665@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120815064902.GB15665-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 08/15/2012 12:49 AM, Thierry Reding wrote:
...
> Stephen: Could you try to find out whether the regular
> configuration space translation can just be omitted if we already
> set up the one for the extended configuration space? In
> tegra_pcie_setup_translations(), BAR 0 is setup for regular
> configuration space (which requires a 16 MiB region), while BAR 1
> is setup for the extended configuration space (requiring a full 256
> MiB region). However, if I understand correctly, each of the
> registers that can be accessed via the BAR 0 translation can also
> be accessed via the BAR 1 translation. That seems like we're 
> wasting the 16 MiB set aside for the BAR 0 mapping.

I have confirmed that in theory, the EXTCFG space can indeed be used
to access any register, making the regular config space redundant.
However, using the HW this way has apparently received less validation.
