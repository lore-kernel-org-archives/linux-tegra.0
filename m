From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 4/5] ARM: tegra: Device tree changes for v4.18-rc1
Date: Fri, 25 May 2018 05:15:50 -0700
Message-ID: <20180525121550.obwt4br5nqmddy6w@localhost>
References: <20180518142245.20242-1-thierry.reding@gmail.com>
 <20180518142245.20242-4-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180518142245.20242-4-thierry.reding@gmail.com>
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

On Fri, May 18, 2018 at 04:22:44PM +0200, Thierry Reding wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 60cc43fc888428bb2f18f08997432d426a243338:
> 
>   Linux 4.17-rc1 (2018-04-15 18:24:20 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.18-arm-dt
> 
> for you to fetch changes up to dc4ea601be724d7ad37c8c5b1059417126e97e27:
> 
>   ARM: dts: tegra114: Add IOMMU nodes to Host1x and its clients (2018-05-04 17:21:02 +0200)
> 
> Thanks,
> Thierry
> 
> ----------------------------------------------------------------
> ARM: tegra: Device tree changes for v4.18-rc1
> 
> Contains a fix for the high-speed UART on Toradex Apalis TK1 boards as
> well as IOMMU enablement for various devices on Tegra30 and Tegra30.
> 
> ----------------------------------------------------------------
> Dmitry Osipenko (2):
>       ARM: dts: tegra30: Add IOMMU nodes to Host1x and its clients
>       ARM: dts: tegra114: Add IOMMU nodes to Host1x and its clients
> 
> Marcel Ziswiler (1):
>       ARM: tegra: apalis-tk1: Fix high speed UART compatible

Merged, thanks!


-Olof
