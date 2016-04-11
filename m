From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v4 2/2] PCI: tegra: Support per-lane PHYs
Date: Mon, 11 Apr 2016 11:41:10 -0600
Message-ID: <570BE1B6.5000808@wwwdotorg.org>
References: <1460131994-24493-1-git-send-email-thierry.reding@gmail.com>
 <1460131994-24493-2-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1460131994-24493-2-git-send-email-thierry.reding@gmail.com>
Sender: linux-pci-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Alexandre Courbot <gnurou@gmail.com>, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 04/08/2016 10:13 AM, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>
> The current XUSB pad controller bindings are insufficient to describe
> PHY devices attached to USB controllers. New bindings have been created
> to overcome these restrictions. As a side-effect each root port now is
> assigned a set of PHY devices, one for each lane associated with the
> root port. This has the benefit of allowing fine-grained control of the
> power management for each lane.

Same here.

http://www.spinics.net/lists/devicetree/msg118644.html
