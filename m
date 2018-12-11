From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 5/6] ARM: tegra: Device tree changes for v4.21-rc1
Date: Tue, 11 Dec 2018 08:07:55 -0800
Message-ID: <20181211160755.ghx5zvunabc6pjad@localhost>
References: <20181207141739.9085-1-thierry.reding@gmail.com>
 <20181207141739.9085-5-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20181207141739.9085-5-thierry.reding@gmail.com>
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

On Fri, Dec 07, 2018 at 03:17:38PM +0100, Thierry Reding wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 651022382c7f8da46cb4872a545ee1da6d097d2a:
> 
>   Linux 4.20-rc1 (2018-11-04 15:37:52 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.21-arm-dt
> 
> for you to fetch changes up to 3dde5a2342cd204df15b6b0b90ee0ed4542225ca:
> 
>   ARM: tegra: Add VIC on Tegra124 (2018-11-29 17:07:31 +0100)
> 
> Thanks,
> Thierry
> 
> ----------------------------------------------------------------
> ARM: tegra: Device tree changes for v4.21-rc1
> 
> These changes add the external memory controller on Tegra20 as well as
> the VIC on Tegra124.
> 
> ----------------------------------------------------------------
> Dmitry Osipenko (2):
>       ARM: dts: tegra20: Add interrupt entry to External Memory Controller
>       ARM: dts: tegra20: Add clock entry to External Memory Controller
> 
> Thierry Reding (1):
>       ARM: tegra: Add VIC on Tegra124

Another small nit about consistent prefixes (ARM: dts: ...).

Merged, thanks!


-Olof
