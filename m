From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL 3/3] cpufreq: tegra: Fixes for v5.5-rc1
Date: Wed,  4 Dec 2019 14:07:53 +0100
Message-ID: <20191204130753.3614278-3-thierry.reding@gmail.com>
References: <20191204130753.3614278-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191204130753.3614278-1-thierry.reding@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: soc@kernel.org, arm@kernel.org
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.5-cpufreq

for you to fetch changes up to 0fb438eed10ca13d212a5675363beb5a5cd721f2:

  cpufreq: tegra124: Add suspend and resume support (2019-10-29 13:25:29 +0100)

I had originally meant for this to go in through the cpufreq tree, but
I might have messed up the messaging, so Viresh ended up not pulling it
into his tree. He did provide an Acked-by, which I've included in the
patch, so he probably was assuming this to go via some other tree all
along.

Unfortunately, it's now causing suspend/resume to fail because the clock
driver changes require the CPU frequency driver to disable the CPU clock
before suspend can be entered, so it'd be great to get this in via late
fixes for ARM SoC.

Thanks,
Thierry

----------------------------------------------------------------
cpufreq: tegra: Changes for v5.5-rc1

Implements support for suspend/resume on Tegra124.

----------------------------------------------------------------
Sowjanya Komatineni (1):
      cpufreq: tegra124: Add suspend and resume support

 drivers/cpufreq/tegra124-cpufreq.c | 59 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)
