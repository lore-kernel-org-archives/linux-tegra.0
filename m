From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 2/6] soc/tegra: Changes for v4.21-rc1
Date: Wed, 12 Dec 2018 13:28:44 -0800
Message-ID: <20181212212844.tbfxhe2xaj3pg5jy@localhost>
References: <20181207141739.9085-1-thierry.reding@gmail.com>
 <20181207141739.9085-2-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20181207141739.9085-2-thierry.reding@gmail.com>
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

On Fri, Dec 07, 2018 at 03:17:35PM +0100, Thierry Reding wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 651022382c7f8da46cb4872a545ee1da6d097d2a:
> 
>   Linux 4.20-rc1 (2018-11-04 15:37:52 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.21-soc
> 
> for you to fetch changes up to e3e403c218cd07b497127a29e604fc26a71e8558:
> 
>   soc/tegra: pmc: Add initial Tegra194 wake events (2018-11-28 17:32:28 +0100)
> 
> Thanks,
> Thierry
> 
> ----------------------------------------------------------------
> soc/tegra: Changes for v4.21-rc1
> 
> These changes are mostly cleanups to the PMC driver, but they also add
> support for wake events on Tegra186 and Tegra194, which can be used to
> wake the system from sleep. With this and the corresponding device
> tree additions suspend/resume is finally working on these SoCs.

Merged into next/drivers.


-Olof
