From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 4/5] ARM: tegra: Device tree changes for v4.19-rc1
Date: Sat, 14 Jul 2018 14:21:21 -0700
Message-ID: <20180714212121.plis3ip3pp26jr6f@localhost>
References: <20180712154128.22705-1-thierry.reding@gmail.com>
 <20180712154128.22705-5-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180712154128.22705-5-thierry.reding@gmail.com>
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

On Thu, Jul 12, 2018 at 05:41:27PM +0200, Thierry Reding wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit ce397d215ccd07b8ae3f71db689aedb85d56ab40:
> 
>   Linux 4.18-rc1 (2018-06-17 08:04:49 +0900)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.19-arm-dt
> 
> for you to fetch changes up to 5def854e370ff5c52172fb185932fdbffbf15692:
> 
>   ARM: dts: tegra: enable NAND flash on Colibri T20 (2018-07-09 18:51:01 +0200)
> 
> Thanks,
> Thierry
> 
> ----------------------------------------------------------------
> ARM: tegra: Device tree changes for v4.19-rc1
> 
> This set of changes adds support for the memory client resets on Tegra20
> and Tegra30, fixes a couple of issues on Cardhu and Tegra30 Apalis as
> well as adds a unit-address to the memory node to avoid warnings from
> DTC. To round things of, the NAND flash controller is enabled on the
> Tegra20 Colibri.

Merged, thanks.


-Olof
