From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 3/5] firmware: tegra: Changes for v4.20-rc1
Date: Fri, 28 Sep 2018 22:00:11 +0200
Message-ID: <CAK8P3a0jFjOUQ33hop0cn0HqRra8iRGbKPq_i+RAyZ89BWzSRw@mail.gmail.com>
References: <20180927205942.30878-1-thierry.reding@gmail.com>
 <20180927205942.30878-3-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180927205942.30878-3-thierry.reding@gmail.com>
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

> firmware: tegra: Changes for v4.20-rc1
>
> This contains a fix for suspend/resume support for the BPMP found on
> Tegra186 and Tegra194.
>
> ----------------------------------------------------------------
> Thierry Reding (1):
>       firmware: tegra: bpmp: Implement suspend/resume support
>
>  drivers/firmware/tegra/bpmp.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)

This causes a build warning in randconfig builds:

drivers/firmware/tegra/bpmp.c:847:12: error: 'tegra_bpmp_resume'
defined but not used [-Werror=unused-function]
 static int tegra_bpmp_resume(struct device *dev)
            ^~~~~~~~~~~~~~~~~

Please fix and resubmit. Thanks,

     ARnd
