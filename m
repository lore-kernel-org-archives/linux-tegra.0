From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 06/10] ARM: tegra: pcie: Add MSI support
Date: Tue, 12 Jun 2012 09:40:22 -0600
Message-ID: <4FD762E6.2080906@wwwdotorg.org>
References: <1339427118-32263-1-git-send-email-thierry.reding@avionic-design.de> <1339427118-32263-7-git-send-email-thierry.reding@avionic-design.de> <4FD660F9.7030807@wwwdotorg.org> <20120612050713.GB3669@avionic-0098.mockup.avionic-design.de> <20120612061003.GC4040@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120612061003.GC4040-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jesse Barnes <jbarnes-Y1mF5jBUw70BENJcbMCuUQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06/12/2012 12:10 AM, Thierry Reding wrote:
> * Thierry Reding wrote:
>> * Stephen Warren wrote:
>>> On 06/11/2012 09:05 AM, Thierry Reding wrote:
> [...]
>>>> +static int tegra_pcie_disable_msi(struct platform_device
>>>> *pdev)
>>> 
>>> Should this free pcie->msi->pages?
>> 
>> Yes it should. I actually mention making that change in the
>> changelog but in fact didn't.
> 
> This is really moot because the driver cannot be built as a module
> currently because arch_setup_msi_irq() and arch_teardown_msi_irq()
> need to be built-in so tegra_pcie_disable_msi() will be called only
> just before the machine is shut down.
> 
> Perhaps this is something that should be addressed? Or is it just
> not worth the effort?

Well, if the driver provides a shutdown/removal path at all, it seems
like it should be complete. I assume it's trivial to free those pages?
