From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 1/5] dt-bindings: Changes for v4.20-rc1
Date: Fri, 28 Sep 2018 17:32:17 +0200
Message-ID: <CAK8P3a1N+kKAA+g+D6TiGDFMG1TdL6oBaY72ppmSrx5GcJ92sQ@mail.gmail.com>
References: <20180927205942.30878-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180927205942.30878-1-thierry.reding@gmail.com>
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
Cc: "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, arm-soc <arm@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Jonathan Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Thu, Sep 27, 2018 at 10:59 PM Thierry Reding
<thierry.reding@gmail.com> wrote:
>
> Hi ARM SoC maintainers,
>
> The following changes since commit 5b394b2ddf0347bef56e50c69a58773c94343ff3:
>
>   Linux 4.19-rc1 (2018-08-26 14:11:59 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.20-dt-bindings
>
> for you to fetch changes up to d9be10edf7d6040468f89824df0dfcfcbf3a693b:
>
>   dt-bindings: Add Tegra PMC pad configuration bindings (2018-08-27 12:21:43 +0200)
>
> Thanks,
> Thierry
>
> ----------------------------------------------------------------
> dt-bindings: Changes for v4.20-rc1
>
> This contains the PMC pad configuration bindings which are used to
> control the voltage of various pads found on Tegra chips. Among other
> things this is required to enable faster modes on SDHCI.
>

Pulled into next/dt, thanks!

     Arnd
