From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 6/7] arm64: Default configuration updates for v4.17-rc1
Date: Tue, 27 Mar 2018 15:12:31 +0200
Message-ID: <CAK8P3a0-3SJoWjEC3mGRCsfXQSfsC-wwmpxHuG2fzgGjQ-1fTg@mail.gmail.com>
References: <20180316141850.4876-1-thierry.reding@gmail.com>
 <20180316141850.4876-6-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180316141850.4876-6-thierry.reding@gmail.com>
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

On Fri, Mar 16, 2018 at 3:18 PM, Thierry Reding
<thierry.reding@gmail.com> wrote:
> arm64: Default configuration updates for v4.17-rc1
>
> Enable the BPMP thermal and CPU frequency drivers as well as make sure
> that the Tegra SMMU is enabled by default because there's no fun without
> it. Also enable initial Tegra194 support.

Pulled into next/soc, thanks!

      Arnd
