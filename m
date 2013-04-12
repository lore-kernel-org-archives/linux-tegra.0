From: Jay Agarwal <jagarwal@nvidia.com>
Subject: RE: [PATCH 1/3] ARM: tegra: pcie: Add tegra3 support
Date: Fri, 12 Apr 2013 20:28:30 +0530
Message-ID: <C79B248886DD134989C8FF6B096A91AB91B36FB2FD@BGMAIL01.nvidia.com>
References: <1365435688-4179-1-git-send-email-jagarwal@nvidia.com>
 <51630852.1000107@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <51630852.1000107@wwwdotorg.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: 'Stephen Warren' <swarren@wwwdotorg.org>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, Krishna Thota <kthota@nvidia.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, "thierry.reding@avionic-design.de" <thierry.reding@avionic-design.de>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "olof@lixom.net" <olof@lixom.net>, Laxman Dewangan <ldewangan@nvidia.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "mturquette@linaro.org" <mturquette@linaro.org>, Juha Tukkinen <jtukkinen@nvidia.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Hiroshi Doyu <hdoyu@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

> >  	err = regulator_disable(pcie->pex_clk_supply);
> >  	if (err < 0)
> > -		dev_err(pcie->dev, "failed to disable pex-clk regulator:
> %d\n",
> > +		dev_warn(pcie->dev, "failed to disable pex-clk regulator:
> %d\n",
> >  			err);
> >
> >  	err = regulator_disable(pcie->vdd_supply);
> >  	if (err < 0)
> > -		dev_err(pcie->dev, "failed to disable VDD regulator: %d\n",
> > +		dev_warn(pcie->dev, "failed to disable VDD regulator:
> %d\n",
> >  			err);
> 
> Please explain why that change is correct. If the regulators only exist on
> Tegra20, please represent that fact in the SoC data. Regulators must always
> exist, so enable/disable should never fail due to missing regulators. Actual
> run-time failures seem like something that really is an error.
> 
[>] These regulators are needed for both tegra20 & tegra30. Since we are not returning error here, so changed to dev_warn.
