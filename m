From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] ARM: tegra: only run PL310 init on systems with one
Date: Tue, 18 Feb 2014 20:31:06 -0800
Message-ID: <20140219043106.GA19089@quad.lixom.net>
References: <1392767518-27821-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1392767518-27821-1-git-send-email-swarren@wwwdotorg.org>
Sender: stable-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: arm@kernel.org, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, Stephen Warren <swarren@nvidia.com>, stable@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Feb 18, 2014 at 04:51:58PM -0700, Stephen Warren wrote:
> From: Stephen Warren <swarren@nvidia.com>
> 
> Fix tegra_init_cache() to check whether the system has a PL310 cache
> before touching the PL310 registers. This prevents access to non-existent
> registers on Tegra114 and later.
> 
> Note for stable kernels:
> In <= v3.12, the file to patch is arch/arm/mach-tegra/common.c.
> 
> Cc: <stable@vger.kernel.org> # v3.9+
> Signed-off-by: Stephen Warren <swarren@nvidia.com>
> ---
> Another fix for 3.14

Applied.


-Olof
