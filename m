From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] PCI: tegra: Fix reporting GPIO error value
Date: Thu, 7 May 2020 14:44:49 -0500
Message-ID: <20200507194449.GA26252@bogus>
References: <20200414102512.27506-1-pali@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200414102512.27506-1-pali@kernel.org>
Sender: linux-pci-owner@vger.kernel.org
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Andrew Murray <amurray@thegoodpenguin.co.uk>, Bjorn Helgaas <bhelgaas@google.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, 14 Apr 2020 12:25:12 +0200, =?UTF-8?q?Pali=20Roh=C3=A1r?= wrote:
> Error code is stored in rp->reset_gpio and not in err variable.
> 
> Signed-off-by: Pali Rohár <pali@kernel.org>
> ---
>  drivers/pci/controller/pci-tegra.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
