From: Mike Turquette <mturquette@linaro.org>
Subject: Re: pull request for Tegra clock updates for 3.18
Date: Fri, 26 Sep 2014 16:09:59 -0700
Message-ID: <20140926230959.19023.44549@quantum>
References: <20140919123020.GA12341@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140919123020.GA12341@tbergstrom-lnx.Nvidia.com>
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

Quoting Peter De Schrijver (2014-09-19 05:30:20)
> Hi Mike,
> 
> A few fixes to enable PLL_M scaling for Tegra124 and improved error handling
> for clock initialization.

Pulled!

Thanks,
Mike

> 
> Thanks,
> 
> Peter.
> 
> The following changes since commit 9e82bf014195d6f0054982c463575cdce24292be:
> 
>   Linux 3.17-rc5 (2014-09-14 17:50:12 -0700)
> 
> are available in the git repository at:
>   git://nv-tegra.nvidia.com/user/pdeschrijver/linux.git tegra-clk-3.18
> 
> Mikko Perttunen (2):
>       ARM: tegra: Add PLL_M_UD and PLL_C_UD to tegra124-car binding header
>       clk: tegra124: Add PLL_M_UD and PLL_C_UD clocks
> 
> Tomeu Vizoso (1):
>       clk: tegra: Make clock initialization more robust
> 
>  drivers/clk/tegra/clk-tegra124.c         |    8 ++++++++
>  drivers/clk/tegra/clk.c                  |    9 +++++++--
>  include/dt-bindings/clock/tegra124-car.h |    6 +++++-
>  3 files changed, 20 insertions(+), 3 deletions(-)
