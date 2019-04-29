From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 3/9] firmware: tegra: Changes for v5.2-rc1
Date: Sun, 28 Apr 2019 23:34:59 -0700
Message-ID: <20190429063459.jeeugziuwejjp5kt@localhost>
References: <20190418150721.8828-1-thierry.reding@gmail.com>
 <20190418150721.8828-3-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190418150721.8828-3-thierry.reding@gmail.com>
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

On Thu, Apr 18, 2019 at 05:07:14PM +0200, Thierry Reding wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:
> 
>   Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.2-firmware
> 
> for you to fetch changes up to 4cb5d9eca143f7fbf8cc457be19a91914f978a00:
> 
>   firmware: Move Trusted Foundations support (2019-04-17 16:43:03 +0200)
> 
> Thanks,
> Thierry
> 
> ----------------------------------------------------------------
> firmware: tegra: Changes for v5.2-rc1
> 
> This set of changes includes improvements for Trusted Foundations and
> also moves the source files for this support into the standard location
> under drivers/firmware.
> 
> ----------------------------------------------------------------
> Dmitry Osipenko (7):
>       ARM: trusted_foundations: Support L2 cache maintenance
>       ARM: trusted_foundations: Make prepare_idle call to take mode argument
>       ARM: trusted_foundations: Provide information about whether firmware is registered
>       ARM: tegra: Set up L2 cache using Trusted Foundations firmware
>       ARM: tegra: Don't apply CPU erratas in insecure mode
>       ARM: tegra: Always boot CPU in ARM-mode
>       ARM: tegra: Add firmware calls required for suspend-resume on Tegra30
> 
> Thierry Reding (2):
>       ARM: tegra: Sort dependencies alphabetically
>       firmware: Move Trusted Foundations support

Merged, thanks.


-Olof
