From: Paul Walmsley <pwalmsley@nvidia.com>
Subject: Re: [PATCH 3/3] clk: tegra: T114: add DFLL DVCO reset control
Date: Tue, 11 Jun 2013 09:47:13 +0000 (UTC)
Message-ID: <alpine.DEB.2.02.1306110944130.22645@utopia.booyaka.com>
References: <20130607121505.21868.72360.stgit@dusk.lan> <20130607121901.21868.65416.stgit@dusk.lan> <51B21105.1080301@wwwdotorg.org> <alpine.DEB.2.02.1306071703050.7753@utopia.booyaka.com> <51B6D239.5030905@nvidia.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <51B6D239.5030905@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Prashant Gaikwad <pgaikwad@nvidia.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "mturquette@linaro.org" <mturquette@linaro.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, Aleksandr Frid <afrid@nvidia.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, 11 Jun 2013, Prashant Gaikwad wrote:

> Why not implement these APIs in DFLL clock driver itself and pass RST address
> register to driver?

The DFLL DVCO reset registers are CAR registers, not DFLL registers.  
Functions that operate on registers in one IP block shouldn't be located 
in another IP block's driver.


- Paul
