From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 4/5] ARM: tegra: Device tree changes for v4.20-rc1
Date: Fri, 28 Sep 2018 17:39:36 +0200
Message-ID: <CAK8P3a1h0Z_ekvy9kQQTsjaVL5DqWNUN8jTXkGXEeAD0p_fHkg@mail.gmail.com>
References: <20180927205942.30878-1-thierry.reding@gmail.com>
 <20180927205942.30878-4-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180927205942.30878-4-thierry.reding@gmail.com>
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
Cc: "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, arm-soc <arm@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Jonathan Hunter <jonathanh@nvidia.com>
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
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.20-arm-dt
>
> for you to fetch changes up to ebea2a43fdafdbce918bd7e200b709d6c33b9f3b:
>
>   ARM: dts: paz00: fix wakeup gpio keycode (2018-09-26 17:29:41 +0200)
> ----------------------------------------------------------------
> ARM: tegra: Device tree changes for v4.20-rc1
>
> This contains a massive amount of changes from Marcel Ziswiler for
> various boards by Toradex.
>

> Marcel Ziswiler (127):
>       ARM: dts: tegra30: fix xcvr-setup-use-fuses
>       ARM: dts: tegra20: restore address order
>       ARM: dts: tegra20/tegra30: add pmu interrupt-affinity
>       ARM: tegra: apalis_t30: fix mmc1 cmd pull-up
>       ARM: tegra: apalis_t30: pull-up sd card detect pins
>       ARM: tegra: apalis_t30: add local-mac-address property
...

Pulled into next/dt

I see nothing wrong with the individual changes,  but should note that
they are overly fine-grained in some cases. There are several
obvious cleanup that only touch one or two lines, in this case
I would prefer them to be combined for easier review.

           Arnd
