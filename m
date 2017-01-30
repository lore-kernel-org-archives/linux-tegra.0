From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 4/4] arm64: tegra: Device tree changes for v4.11-rc1
Date: Sun, 29 Jan 2017 21:00:17 -0800
Message-ID: <20170130050017.GH18943@localhost>
References: <20170127092121.21570-1-thierry.reding@gmail.com>
 <20170127092121.21570-4-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170127092121.21570-4-thierry.reding@gmail.com>
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
Cc: Alexandre Courbot <gnurou@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Jon Hunter <jonathanh@nvidia.com>, arm@kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Jan 27, 2017 at 10:21:21AM +0100, Thierry Reding wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 0c744ea4f77d72b3dcebb7a8f2684633ec79be88:
> 
>   Linux 4.10-rc2 (2017-01-01 14:31:53 -0800)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.11-arm64-dt
> 
> for you to fetch changes up to 7bcf266462da736ae4b42d5c73cd5dc0da540772:
> 
>   arm64: tegra: Use symbolic reset identifiers (2017-01-27 10:13:24 +0100)
> 
> Thanks,
> Thierry
> 
> ----------------------------------------------------------------
> arm64: tegra: Device tree changes for v4.11-rc1
> 
> This contains three patches that reintroduce symbolic identifiers for
> clocks, resets and mailboxes. These had been converted to literals in
> the v4.10 release to avoid complicated dependencies between branches.
> 
> ----------------------------------------------------------------
> Thierry Reding (3):
>       arm64: tegra: Use symbolic HSP identifiers
>       arm64: tegra: Use symbolic clock identifiers
>       arm64: tegra: Use symbolic reset identifiers
> 
>  arch/arm64/boot/dts/nvidia/tegra186.dtsi | 86 +++++++++++++++++---------------
>  1 file changed, 45 insertions(+), 41 deletions(-)

Merged, thanks!

No more t186 material than this for 4.11, though? :(


-Olof
