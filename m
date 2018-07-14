From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 5/5] arm64: tegra: Device tree changes for v4.19-rc1
Date: Sat, 14 Jul 2018 14:22:10 -0700
Message-ID: <20180714212210.at4b2gcpopsznyxx@localhost>
References: <20180712154128.22705-1-thierry.reding@gmail.com>
 <20180712154128.22705-6-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180712154128.22705-6-thierry.reding@gmail.com>
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

On Thu, Jul 12, 2018 at 05:41:28PM +0200, Thierry Reding wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit ce397d215ccd07b8ae3f71db689aedb85d56ab40:
> 
>   Linux 4.18-rc1 (2018-06-17 08:04:49 +0900)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.19-arm64-dt
> 
> for you to fetch changes up to 7780a03495e13cd2bef704bcbf8c727de9f65232:
> 
>   arm64: tegra: Add CPU nodes to Tegra194 device tree (2018-07-02 15:57:39 +0200)
> 
> Thanks,
> Thierry
> 
> ----------------------------------------------------------------
> arm64: tegra: Device tree changes for v4.19-rc1
> 
> These changes enable the GPIO controllers on Tegra194 SoCs, which in
> turn allows the SD card detection and ethernet controllers to be enabled
> as well. The Tegra194 device tree is also extended with the list of CPUs
> and a PSCI node to inform the kernel about the presence of PSCI capable
> firmware.

Merged, thanks. Are you planning on supporting 194 better than 186? That never
really made it to a useful level upstream I think? :(


-Olof
