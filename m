From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 2/9] soc/tegra: Changes for v5.2-rc1
Date: Sun, 28 Apr 2019 23:34:19 -0700
Message-ID: <20190429063419.b2tihej6inebdpu3@localhost>
References: <20190418150721.8828-1-thierry.reding@gmail.com>
 <20190418150721.8828-2-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190418150721.8828-2-thierry.reding@gmail.com>
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

On Thu, Apr 18, 2019 at 05:07:13PM +0200, Thierry Reding wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:
> 
>   Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.2-soc
> 
> for you to fetch changes up to 6ac2a01de1700c1b6d889f02f61c4c9602573a8d:
> 
>   soc/tegra: pmc: Move powergate initialisation to probe (2019-04-17 10:32:33 +0200)
> 
> Note that this pulls in a stable branch from Philipp for the core
> acquire/release protocol changes to the reset framework.
> 
> Thanks,
> Thierry
> 
> ----------------------------------------------------------------
> soc/tegra: Changes for v5.2-rc1
> 
> Besides a couple of fixes to better cope with deferred probing, this set
> of patches also implements the acquire/release protocol for resets used
> during powergate operations. This is necessary to allow these resets to
> be temporarily shared with other devices that may also need to control
> these resets.

Merged, thanks.


-Olof
