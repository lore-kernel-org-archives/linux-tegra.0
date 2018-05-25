From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 5/5] arm64: tegra: Device tree changes for v4.18-rc1
Date: Fri, 25 May 2018 05:16:20 -0700
Message-ID: <20180525121620.wmdlpaqsyaocbkdj@localhost>
References: <20180518142245.20242-1-thierry.reding@gmail.com>
 <20180518142245.20242-5-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180518142245.20242-5-thierry.reding@gmail.com>
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

On Fri, May 18, 2018 at 04:22:45PM +0200, Thierry Reding wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 60cc43fc888428bb2f18f08997432d426a243338:
> 
>   Linux 4.17-rc1 (2018-04-15 18:24:20 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.18-arm64-dt
> 
> for you to fetch changes up to 9df50ba76ac1485b844beffa1f3f5d9659d9cdaf:
> 
>   arm64: tegra: Make BCM89610 PHY interrupt as active low (2018-05-03 11:48:16 +0200)
> 
> I already sent this out as a fix for v4.17, so if you decide to pick
> that up you can ignore this one. I've only included it here in case you
> had objections to take it into v4.17 at this point.

Ok, thanks -- merged the fix so not touching this.


-Olof
