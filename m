From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 0/2] ARM: tegra: bring back tegra_timer clock
Date: Tue, 16 Oct 2012 11:30:08 -0600
Message-ID: <507D99A0.1030701@wwwdotorg.org>
References: <1350382116-18024-1-git-send-email-sivaramn@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1350382116-18024-1-git-send-email-sivaramn@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sivaram Nair <sivaramn@nvidia.com>
Cc: linux@arm.linux.org.uk, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 10/16/2012 04:08 AM, Sivaram Nair wrote:
> This patchset fixes a bug introduced by commit
> 20f4665831cec65d6e5d33587bba28ffa536b91d by bringing back the
> tegra_timer clock.  The above commit caused tegra_init_timer() failing
> to get the clk reference.
> 
> The first patch renames the existing tegra_timer object to
> tegra_sys_timer and the second patch adds previously-removed tegra_timer
> clock object.

Thanks. The series applied to Tegra's for-3.7/fixes-for-rc2 branch.
Sorry for the regression.
