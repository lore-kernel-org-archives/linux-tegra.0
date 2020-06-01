From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH] [v2] PCI: tegra: Fix runtime PM imbalance on error
Date: Mon, 1 Jun 2020 10:05:36 +0100
Message-ID: <20200601090536.GA4226@e121166-lin.cambridge.arm.com>
References: <20200521024709.2368-1-dinghao.liu@zju.edu.cn>
 <20200529180518.GA3078281@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200529180518.GA3078281@ulmo>
Sender: linux-pci-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Dinghao Liu <dinghao.liu@zju.edu.cn>, kjlu@umn.edu, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Fri, May 29, 2020 at 08:05:18PM +0200, Thierry Reding wrote:
> On Thu, May 21, 2020 at 10:47:09AM +0800, Dinghao Liu wrote:
> > pm_runtime_get_sync() increments the runtime PM usage counter even
> > when it returns an error code. Thus a pairing decrement is needed on
> > the error handling path to keep the counter balanced.
> > 
> > Also, call pm_runtime_disable() when pm_runtime_get_sync() returns
> > an error code.
> > 
> > Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> > ---
> >  drivers/pci/controller/pci-tegra.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> Acked-by: Thierry Reding <treding@nvidia.com>

Applied to pci/tegra, thanks !

Lorenzo
