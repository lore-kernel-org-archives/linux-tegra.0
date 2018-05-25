From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 1/5] dt-bindings: tegra: Changes for v4.18-rc1
Date: Fri, 25 May 2018 05:08:16 -0700
Message-ID: <20180525120816.23cteydu2zfw6enk@localhost>
References: <20180518142245.20242-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180518142245.20242-1-thierry.reding@gmail.com>
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

On Fri, May 18, 2018 at 04:22:41PM +0200, Thierry Reding wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 60cc43fc888428bb2f18f08997432d426a243338:
> 
>   Linux 4.17-rc1 (2018-04-15 18:24:20 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.18-dt-bindings
> 
> for you to fetch changes up to eb8f53b6d3125894e3d825976eb7e03150496362:
> 
>   dt-bindings: Relocate Tegra20 memory controller bindings (2018-04-27 11:15:51 +0200)
> 
> Thanks,
> Thierry
> 
> ----------------------------------------------------------------
> dt-bindings: tegra: Changes for v4.18-rc1
> 
> This contains the device tree bindings updates for the memory controller
> hot resets that are implemented by driver patches in a different branch.
> 
> ----------------------------------------------------------------
> Dmitry Osipenko (3):
>       dt-bindings: arm: tegra: Remove duplicated Tegra30+ MC binding
>       dt-bindings: memory: tegra: Document #reset-cells property of the Tegra30 MC
>       dt-bindings: arm: tegra: Document #reset-cells property of the Tegra20 MC
> 
> Thierry Reding (1):
>       dt-bindings: Relocate Tegra20 memory controller bindings

Merged, thanks!


-Olof
