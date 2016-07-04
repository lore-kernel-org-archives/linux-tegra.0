From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 3/4] bus: tegra-aconnect: make it explicitly non-modular
Date: Mon, 4 Jul 2016 10:17:09 +0100
Message-ID: <577A2995.6020504@nvidia.com>
References: <20160703173040.23612-1-paul.gortmaker@windriver.com>
 <20160703173040.23612-4-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160703173040.23612-4-paul.gortmaker@windriver.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>, linux-kernel@vger.kernel.org
Cc: linux-tegra@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@lists.infradead.org, Stephen Warren <swarren@wwwdotorg.org>
List-Id: linux-tegra@vger.kernel.org

Hi Paul,

On 03/07/16 18:30, Paul Gortmaker wrote:
> The Kconfig currently controlling compilation of this code is:
> 
> drivers/bus/Kconfig:config TEGRA_ACONNECT
> drivers/bus/Kconfig:    bool "Tegra ACONNECT Bus Driver"
> 
> ...meaning that it currently is not being built as a module by anyone.
> 
> Lets remove the modular code that is essentially orphaned, so that
> when reading the driver there is no doubt it is builtin-only.
> 
> We explicitly disallow a driver unbind, since that doesn't have a
> sensible use case anyway, and it allows us to drop the ".remove"
> code for non-modular drivers.
> 
> Since module_platform_driver() uses the same init level priority as
> builtin_platform_driver() the init ordering remains unchanged with
> this commit.
> 
> Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.
> 
> We also delete the MODULE_LICENSE tag etc. since all that information
> was (or is now) contained at the top of the file in the comments.

In version 3 of the aconnect series [0] I had made this a tristate
because we allowed it to be removed and you had submitted a patch to
export the PM_CLK APIs. However, when discussing with Thierry he said
that we were unable to merge with tristate because of the dependency on
your patch. So he suggested we merge with bool for now and then change
it back to tristate for v4.9.

I understand that we should not do this, but we do plan to make this
modular in the future.

Cheers
Jon

[0] http://marc.info/?l=linux-tegra&m=146616753627760&w=2

-- 
nvpublic
