From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] arm64: tegra: Disable CQE Support for SDMMC4 on Tegra186
Date: Mon, 25 Mar 2019 17:09:31 +0100
Message-ID: <CAK8P3a1S6XycS3d7qfMt-_trVrrX79oEHS2LiYYrSt_fdpipgw@mail.gmail.com>
References: <20190325112807.24474-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190325112807.24474-1-thierry.reding@gmail.com>
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
Cc: "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, arm-soc <arm@kernel.org>, Sowjanya Komatineni <skomatineni@nvidia.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Mon, Mar 25, 2019 at 12:28 PM Thierry Reding
<thierry.reding@gmail.com> wrote:
>
> From: Jonathan Hunter <jonathanh@nvidia.com>
>
> Enabling CQE support on Tegra186 Jetson TX2 has introduced a regression
> that is causing accesses to the file-system on the eMMC to fail. Errors
> such as the following have been observed ...
>
>  mmc2: running CQE recovery
>  mmc2: mmc_select_hs400 failed, error -110
>  print_req_error: I/O error, dev mmcblk2, sector 8 flags 80700
>  mmc2: cqhci: CQE failed to exit halt state
>
> For now disable CQE support for Tegra186 until this issue is resolved.
>
> Fixes: dfd3cb6feb73 arm64: tegra: Add CQE Support for SDMMC4
> Signed-off-by: Jonathan Hunter <jonathanh@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Hi ARM SoC maintainers,
>
> Turned out there was a hardware bug that currently prevents CQE from
> working on Tegra186. Patches for this are being worked on and are on
> track to be merged for v5.2 but they are too involved to make it into
> v5.1, so let's back out CQE support on Tegra186.
>
> Can you please apply this for v5.1-rc3?
>

Applied on arm/fixes

      Arnd
