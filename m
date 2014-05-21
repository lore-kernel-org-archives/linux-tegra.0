From: Mike Turquette <mturquette@linaro.org>
Subject: Re: pull request for Tegra clock fixes for 3.16
Date: Wed, 21 May 2014 12:20:22 -0700
Message-ID: <20140521192022.9521.44214@quantum>
References: <20140519134049.GA20109@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140519134049.GA20109@tbergstrom-lnx.Nvidia.com>
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

Quoting Peter De Schrijver (2014-05-19 06:40:49)
> Hi Mike,
> 
> A number of fixes which are needed by the upcoming XHCI and SATA drivers.
> 
> Thanks,
> 
> Peter.
> 
> The following changes since commit d6d211db37e75de2ddc3a4f979038c40df7cc79c:
> 
>   Linux 3.15-rc5 (2014-05-09 13:10:52 -0700)
> 
> are available in the git repository at:
>   git://nv-tegra.nvidia.com/user/pdeschrijver/linux.git tegra-clk-v3.16

Pulled.

Regards,
Mike

> 
> Andrew Bresticker (2):
>       clk: tegra: Fix xusb_hs_src clock hierarchy
>       clk: tegra: Initialize xusb clocks
> 
> Jim Lin (2):
>       clk: tegra: Enable hardware control of PLLE
>       clk: tegra: Fix xusb_fs_src mux
> 
>  drivers/clk/tegra/clk-id.h               |    1 +
>  drivers/clk/tegra/clk-pll.c              |   33 +++++++++++++++++++++++++++++-
>  drivers/clk/tegra/clk-tegra-periph.c     |   10 ++++++++-
>  drivers/clk/tegra/clk-tegra114.c         |   22 ++++++++++----------
>  drivers/clk/tegra/clk-tegra124.c         |   21 ++++++++++---------
>  include/dt-bindings/clock/tegra114-car.h |    3 +-
>  include/dt-bindings/clock/tegra124-car.h |    3 +-
>  7 files changed, 68 insertions(+), 25 deletions(-)
