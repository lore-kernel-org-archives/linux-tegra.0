From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH 2/3] clk: tegra: remove non-existent clocks
Date: Wed, 2 Apr 2014 11:10:33 +0300
Message-ID: <20140402081033.GL2931@tbergstrom-lnx.Nvidia.com>
References: <1396383197-5979-1-git-send-email-swarren@wwwdotorg.org>
 <1396383197-5979-2-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1396383197-5979-2-git-send-email-swarren@wwwdotorg.org>
Sender: stable-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: "arm@kernel.org" <arm@kernel.org>, Mike Turquette <mturquette@linaro.org>, Laxman Dewangan <ldewangan@nvidia.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Stephen Warren <swarren@nvidia.com>, "stable@vger.kernel.org" <stable@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Apr 01, 2014 at 10:13:16PM +0200, Stephen Warren wrote:
> From: Stephen Warren <swarren@nvidia.com>
> 
> The Tegra124 clock driver currently provides 3 clocks that don't actually
> exist; 2 for NAND and one for UART5/UARTE. Delete these.
> 
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Stephen Warren <swarren@nvidia.com>

Acked-By: Peter De Schrijver <pdeschrijver@nvidia.com>

Cheers,

Peter.
