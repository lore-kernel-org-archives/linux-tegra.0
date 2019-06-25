From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 1/5] firmware: tegra: Changes for v5.3-rc1
Date: Tue, 25 Jun 2019 05:42:00 -0700
Message-ID: <20190625124200.toijgcugdtxheaxd@localhost>
References: <20190621150206.19037-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190621150206.19037-1-thierry.reding@gmail.com>
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

On Fri, Jun 21, 2019 at 05:02:02PM +0200, Thierry Reding wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:
> 
>   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.3-firmware
> 
> for you to fetch changes up to 61ed7ef952fc482ec8d4a966ed0d1e32df276c59:
> 
>   firmware: tegra: Early resume BPMP (2019-06-14 17:45:17 +0200)
> 
> Thanks,
> Thierry
> 
> ----------------------------------------------------------------
> firmware: tegra: Changes for v5.3-rc1
> 
> This contains a single, simple change that resumes the BPMP driver early
> so that it is available when the various consumers want to enable their
> clocks.

Merged, thanks.


-Olof
