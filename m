From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 6/6] arm64: tegra: Device tree change for v4.21-rc1
Date: Tue, 11 Dec 2018 08:11:28 -0800
Message-ID: <20181211161128.yprdf7w54o5xx7iu@localhost>
References: <20181207141739.9085-1-thierry.reding@gmail.com>
 <20181207141739.9085-6-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20181207141739.9085-6-thierry.reding@gmail.com>
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

On Fri, Dec 07, 2018 at 03:17:39PM +0100, Thierry Reding wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 651022382c7f8da46cb4872a545ee1da6d097d2a:
> 
>   Linux 4.20-rc1 (2018-11-04 15:37:52 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.21-arm64-dt
> 
> for you to fetch changes up to 611a1c69f8ca85fc656f09d0cd56f5934e2af5fb:
> 
>   arm64: tegra: Set reg property for display-hub on Tegra194 (2018-12-07 12:57:26 +0100)
> 
> Note that this pulls in a subset of the code that is also part of the
> first pull request in this series in order to satisfy some build-time
> dependencies.
> 
> Thanks,
> Thierry
> 
> ----------------------------------------------------------------
> arm64: tegra: Device tree change for v4.21-rc1
> 
> These changes add a bunch of features for Tegra194 and Tegra186, such as
> wake events, on-die RTC, temperature sensors, HDA for audio over HDMI
> and fan support on Jetson Xavier to allow cooling of the device.

Same feedback as for 32-bit, but merged into next/dt now.


-Olof
