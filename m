From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 4/9] soc/tegra: Changes for v5.1-rc1
Date: Fri, 15 Feb 2019 17:25:39 +0100
Message-ID: <CAK8P3a2tSaHsAOarZ8NHO-N4ZcLQL2rD2ti1rAe4meidWbVNEw@mail.gmail.com>
References: <20190208150935.32108-1-thierry.reding@gmail.com>
 <20190208150935.32108-5-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190208150935.32108-5-thierry.reding@gmail.com>
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
Cc: "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, arm-soc <arm@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Fri, Feb 8, 2019 at 4:09 PM Thierry Reding <thierry.reding@gmail.com> wrote:

> ----------------------------------------------------------------
> soc/tegra: Changes for v5.1-rc1
>
> This contains a couple of miscellaneous fixes for minor issues and a
> largish rework of the PMC driver to make it work on systems where the
> PMC has been locked down and can only be accessed from secure firmware.

Pulled into arm/drivers.

> ----------------------------------------------------------------
> Jon Hunter (1):
>       soc/tegra: pmc: Make tegra_powergate_is_powered() a local function
>
> Joseph Lo (1):
>       soc/tegra: fuse: Fix typo in tegra210_init_speedo_data
>
> Mikko Perttunen (1):
>       soc/tegra: pmc: Support systems where PMC is marked secure
>
> Thierry Reding (6):
>       soc/tegra: pmc: Use TEGRA186_ prefix for GPIO names
>       soc/tegra: pmc: Sort includes alphabetically
>       soc/tegra: pmc: Add missing kerneldoc
>       soc/tegra: pmc: Pass struct tegra_pmc * where possible
>       soc/tegra: pmc: Make alignment consistent
>       soc/tegra: pmc: Explicitly initialize all fields
>
> Timo Alho (1):
>       soc/tegra: fuse: Fix illegal free of IO base address

Should that last one have been marked 'Cc:stable' ?

       Arnd
