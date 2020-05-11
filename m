From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH] PCI: tegra: Fix reporting GPIO error value
Date: Mon, 11 May 2020 10:47:27 +0100
Message-ID: <20200511094727.GA24149@e121166-lin.cambridge.arm.com>
References: <20200414102512.27506-1-pali@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200414102512.27506-1-pali@kernel.org>
Sender: linux-pci-owner@vger.kernel.org
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Andrew Murray <amurray@thegoodpenguin.co.uk>, Bjorn Helgaas <bhelgaas@google.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Apr 14, 2020 at 12:25:12PM +0200, Pali Rohár wrote:
> Error code is stored in rp->reset_gpio and not in err variable.
> 
> Signed-off-by: Pali Rohár <pali@kernel.org>
> ---
>  drivers/pci/controller/pci-tegra.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to pci/tegra, thanks.

Lorenzo

> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
> index 0e03cef72840..378d5a8773c7 100644
> --- a/drivers/pci/controller/pci-tegra.c
> +++ b/drivers/pci/controller/pci-tegra.c
> @@ -2314,8 +2314,8 @@ static int tegra_pcie_parse_dt(struct tegra_pcie *pcie)
>  			if (PTR_ERR(rp->reset_gpio) == -ENOENT) {
>  				rp->reset_gpio = NULL;
>  			} else {
> -				dev_err(dev, "failed to get reset GPIO: %d\n",
> -					err);
> +				dev_err(dev, "failed to get reset GPIO: %ld\n",
> +					PTR_ERR(rp->reset_gpio));
>  				return PTR_ERR(rp->reset_gpio);
>  			}
>  		}
> -- 
> 2.20.1
> 
