From: Mike Turquette <mturquette@linaro.org>
Subject: Re: pull request for Tegra clock updates for 3.17 (update)
Date: Tue, 08 Jul 2014 05:49:10 -0700
Message-ID: <20140708124910.9850.46945@quantum>
References: <20140708105811.GA23132@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140708105811.GA23132@tbergstrom-lnx.Nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

Quoting Peter De Schrijver (2014-07-08 03:58:12)
> Hi Mike,
> 
> A few bug fixes for Tegra124 clocks and some updates for the SATA driver.
> This pull request includes 1 more patch PLLE clocking to make it work for
> both SATA and XUSB.

Pulled.

Thanks,
Mike

> 
> Thanks,
> 
> Peter.
> 
> The following changes since commit a497c3ba1d97fc69c1e78e7b96435ba8c2cb42ee:
> 
>   Linux 3.16-rc2 (2014-06-21 19:02:54 -1000)
> 
> are available in the git repository at:
>   git://nv-tegra.nvidia.com/user/pdeschrijver/linux.git tegra-clk-3.17-1
> 
> Mikko Perttunen (3):
>       clk: tegra: Enable hardware control of SATA PLL
>       clk: tegra: Add SATA clocks to Tegra124 initialization table
>       clk: tegra: Use XUSB-compatible SATA PLL sequence
> 
> Peter De Schrijver (3):
>       clk: tegra: fix vi_sensor clocks on Tegra124
>       clk: tegra124: init table updates
>       clk: tegra: export clock names for debugging
> 
>  drivers/clk/tegra/clk-pll.c          |   19 +++++++++++++++++++
>  drivers/clk/tegra/clk-tegra-periph.c |    4 ++--
>  drivers/clk/tegra/clk-tegra114.c     |   31 ++++++++++++++++++++++++++++++-
>  drivers/clk/tegra/clk-tegra124.c     |   10 +++++++++-
>  drivers/clk/tegra/clk.c              |    6 ++++++
>  5 files changed, 66 insertions(+), 4 deletions(-)
