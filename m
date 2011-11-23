From: Stephen Warren <swarren@nvidia.com>
Subject: Re: [PATCH 07/17] ASoC: Tegra DAS: Use devm_ APIs and
 module_platform_driver
Date: Wed, 23 Nov 2011 09:29:24 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF174F08C6F3@HQMAIL01.nvidia.com>
References: <1322011285-4002-1-git-send-email-swarren@nvidia.com>
	<1322011285-4002-8-git-send-email-swarren@nvidia.com>
	<20111123065808.GB5255@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20111123065808.GB5255@avionic-0098.adnet.avionic-design.de>
Content-Language: en-US
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Sender: alsa-devel-bounces@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
To: Thierry Reding <thierry.reding@avionic-design.de>, "Mark Brown
	(broonie@opensource.wolfsonmicro.com)" <broonie@opensource.wolfsonmicro.com>
Cc: Dimitris Papastamos <dp@opensource.wolfsonmicro.com>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Liam Girdwood <lrg@ti.com>, Olof Johansson <olof@lixom.net>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Colin Cross <ccross@android.com>, Ian Lartey <ian@opensource.wolfsonmicro.com>, Rob Herring <rob.herring@calxeda.com>, Marc Dietrich <marvin24@gmx.de>, Grant Likely <grant.likely@secretlab.ca>, John Bonesio <bones@secretlab.ca>, Leon@alsa-project.org, Mike Rapoport <mike@compulab.co.il>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Romanovsky <leon@leon.nu>
List-Id: linux-tegra@vger.kernel.org

Thierry Reding wrote at Tuesday, November 22, 2011 11:58 PM:
> * Stephen Warren wrote:
> > module_platform_drive saves some boiler-plate code.
> >
> > The devm_ APIs remove the need to manually clean up allocations,
> > thus removing some code.
...
> >  static int __devexit tegra_das_remove(struct platform_device *pdev)
> >  {
> > -	struct resource *res;
> > -
> >  	if (!das)
> >  		return -ENODEV;
> >
> > -	platform_set_drvdata(pdev, NULL);
> > -
> [...]
> 
> Setting the driver data to NULL may still be a good idea.

When Mark Brown reviewed the TrimSlice machine driver, he mentioned that
clearing the drvdata was pointless; nothing should be using it when the
device is not created.

As background, soon after that, I modified the tegra_wm8903.c machine
driver along the same lines, but evidently didn't update tegra_das.c
in a similar way, but would have if I'd been paying attention...

-- 
nvpublic
