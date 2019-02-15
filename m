From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 2/9] cpufreq: tegra: Add support for Tegra210
Date: Fri, 15 Feb 2019 17:28:22 +0100
Message-ID: <CAK8P3a0zEQ3oY8vYBxpnq3wg0pDfag66Y7FxZ1muvxHh+SwHyg@mail.gmail.com>
References: <20190208150935.32108-1-thierry.reding@gmail.com>
 <20190208150935.32108-3-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190208150935.32108-3-thierry.reding@gmail.com>
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
>
> Hi ARM SoC maintainers,
>
> The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee500c:
>
>   Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.1-cpufreq
>
> for you to fetch changes up to 43c36002b86d6027b48f7c68ac32245f73f29f6b:
>
>   cpufreq: dt-platdev: add Tegra210 to blacklist (2019-02-06 14:31:19 +0100)
>
> Thanks,
> Thierry
>
> ----------------------------------------------------------------
> cpufreq: tegra: Add support for Tegra210
>
> This uses the DFLL clock support to enable CPU frequency scaling on
> Tegra210.

I see the Ack from Viresh, but I don't see why you'd like to have them
merged through the soc tree rather than the cpufreq tree.

Could you clarify? It's no problem to do it, I just want to make sure
there is a good reason for it.

      Arnd
