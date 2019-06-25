From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 4/5] arm64: tegra: Device tree changes for v5.3-rc1
Date: Tue, 25 Jun 2019 04:49:25 -0700
Message-ID: <20190625114925.qqei4zi2gy3p5rpu@localhost>
References: <20190621150206.19037-1-thierry.reding@gmail.com>
 <20190621150206.19037-4-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190621150206.19037-4-thierry.reding@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, arm@kernel.org, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Fri, Jun 21, 2019 at 05:02:05PM +0200, Thierry Reding wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:
> 
>   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.3-arm64-dt
> 
> for you to fetch changes up to a586c88eab65619f3654194dc90d46c98e712af2:
> 
>   arm64: tegra: Enable PCIe slots in P2972-0000 board (2019-06-21 16:06:00 +0200)
> 
> Thanks,
> Thierry
> 
> ----------------------------------------------------------------
> arm64: tegra: Device tree changes for v5.3-rc1
> 
> This contains the bulk of the Tegra changes this cycle. It has a bunch
> of improvements across almost all boards. These are mostly small and not
> too exciting additions.
> 
> Most notably perhaps is the continuation of Jetson Nano support, which
> is now mostly on feature parity with Jetson TX1.
> 
> ----------------------------------------------------------------
> Jon Hunter (3):
>       arm64: tegra: Fix AGIC register range
>       arm64: tegra: Update Jetson TX1 GPU regulator timings
>       arm64: tegra: Fix Jetson Nano GPU regulator
> 
> Joseph Lo (1):
>       arm64: tegra: Add CPU cache topology for Tegra186
> 
> Manikanta Maddireddy (1):
>       arm64: tegra: Add PEX DPD states as pinctrl properties
> 
> Nicolin Chen (1):
>       arm64: tegra: Add INA3221 channel info for Jetson TX2
> 
> Sameer Pujar (2):
>       arm64: tegra: Add ACONNECT, ADMA and AGIC nodes
>       arm64: tegra: Enable ACONNECT, ADMA and AGIC
> 
> Thierry Reding (18):
>       arm64: tegra: Use TEGRA186_ prefix for GPIOs
>       dt-bindings: tegra186-gpio: Remove unused definitions
>       arm64: tegra: Clarify that P2771 is the Jetson TX2 Developer Kit
>       arm64: tegra: Clarify that P3310 is the Jetson TX2
>       arm64: tegra: Clarify that P2888 is the Jetson AGX Xavier

Thanks for this one. The numerical-to-product mapping is quite opaque.

Merged,


-Olof
