From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 00/11] ARM: tegra: Add PCIe device tree support
Date: Sun, 18 Mar 2012 10:31:59 -0700
Message-ID: <20120318173159.GB24110@quad.lixom.net>
References: <1331218291-16119-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1331218291-16119-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Jesse Barnes <jbarnes-Y1mF5jBUw70BENJcbMCuUQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Mar 08, 2012 at 03:51:20PM +0100, Thierry Reding wrote:
> This patch series adds support for device tree based probing of the PCIe
> controller found on Tegra SoCs.
> 
> Patches 1 and 2 have already been posted by Grant and Mark respectively
> but I've included them here for reference. Both patches are dependencies
> for the subsequent patches.
> 
> Patches 3, 4 and 5 add support for obtaining the regulators required to
> power the PCIe controller from the device tree. Patches 6 and 7 are
> required to make some common PCI functions available after the init
> phase because the deferred probing will postpone the probing of the PCIe
> controller driver until that point.
> 
> Patches 8 and 9 make the PCIe controller code available as a driver and
> add the corresponding platform devices to the boards that enable PCIe
> (Harmony and TrimSlice). Patch 10 adds MSI support and patch 11 finally
> adds a device tree binding with documentation.
> 
> The code in patch 10 (MSI support) is based on the Vibrante kernel and I
> wasn't able to get a proper Signed-off-by or even copyright information.
> Perhaps somebody at NVIDIA can find out?

Hi,

This patch series looks good to me, but I'm out of time to stage it for
3.4. Stephen is taking over lead maintainership for 3.5 and forward,
so I'll let him pick it up for that release.


-Olof
