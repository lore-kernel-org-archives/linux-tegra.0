From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH] irqchip: tegra: Add Tegra210 support
Date: Sun, 29 Mar 2015 20:14:29 +0000
Message-ID: <20150329201429.GD25778@io.lakedaemon.net>
References: <1427106379-14037-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1427106379-14037-1-git-send-email-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Paul Walmsley <pwalmsley@nvidia.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Thierry,

On Mon, Mar 23, 2015 at 11:26:19AM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Tegra210 uses the same legacy interrupt controller as older generations
> but it adds a sixth instance.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/irqchip/irq-tegra.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

I've applied this on top of irqchip/stacked-tegra.

thx,

Jason.
