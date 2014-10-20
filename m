From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v2] PCI: tegra: Enable root port specific features
Date: Mon, 20 Oct 2014 10:52:49 -0600
Message-ID: <54453DE1.1020602@wwwdotorg.org>
References: <1413803091-10824-1-git-send-email-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1413803091-10824-1-git-send-email-vidyas@nvidia.com>
Sender: linux-pci-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>, thierry.reding@gmail.com, bhelgaas@google.com
Cc: kthota@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 10/20/2014 05:04 AM, Vidya Sagar wrote:
> Enables root port to advertise its ASPM-L1 capability
> resulting in possible link entry to L1 when an ASPM-L1 capable
> device is connected
> Enables per-controller & per-TMS clock clamping by default
> Enabling above features result in more power saving
>
> It also avoids PM message truncation by waiting for DLLP to finish
> before entering into L1 or L2

The updated tegra_pcie_enable() looks better in this patch, so that part,
Acked-by: Stephen Warren <swarren@nvidia.com>

I'll leave the review of the additional #defines and 
tegra_pcie_enable_rp_features() to Thierry.
