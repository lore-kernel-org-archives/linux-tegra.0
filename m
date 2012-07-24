From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH] ARM: tegra: make tegra_cpu_reset_handler_enable() __init
Date: Tue, 24 Jul 2012 12:06:30 +0300
Message-ID: <20120724090630.GI12034@tbergstrom-lnx.Nvidia.com>
References: <1340053310-20855-1-git-send-email-swarren@wwwdotorg.org>
 <20120718150130.GV9437@tbergstrom-lnx.Nvidia.com>
 <500DAF7A.3000302@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <500DAF7A.3000302@wwwdotorg.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Stephen Warren <swarren@nvidia.com>, Arnd Bergmann <arndb@arndb.de>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "arm@kernel.org" <arm@kernel.org>, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Jul 23, 2012 at 10:09:30PM +0200, Stephen Warren wrote:
> On 07/18/2012 09:01 AM, Peter De Schrijver wrote:
> > On Mon, Jun 18, 2012 at 11:01:50PM +0200, Stephen Warren wrote:
> >> From: Stephen Warren <swarren@nvidia.com>
> >>
> >> This solves a section mismatch warning. I hadn't noticed this before,
> >> because my compiler was inlining tegra_cpu_reset_handler_enable() inside
> >> tegra_cpu_reset_handler_init(), which is already __init, but I switched
> >> compilers and it stopped doing that.
> > 
> > Why does this generate a section mismatch warning? I see why calling a
> > a __init marked function from a non __init marked function is a problem, but
> > the opposite should be ok no?
> 
> The issue is that tegra_cpu_reset_handler_enable() itself (which was not
> __init but the patch made to be __init) was referencing variable
> __tegra_cpu_reset_handler_{start,end}. This wasn't noticed before
> because when tegra_cpu_reset_handler_enable() was inlined into
> tegra_cpu_reset_handler_init(), tegra_cpu_reset_handler_enable() was
> effectively __init. However, when built as a separate function, you
> ended up with a non-__init function referencing other things that were
> __init.
> 
> In other words, this is indeed nothing to do with __init function
> tegra_cpu_reset_handler_init() calling non-__init function
> tegra_cpu_reset_handler_enable().

Ah. That makes sense :) We need to be careful with this when introducing
system suspend support because some of this work needs to be redone on resume.

Cheers,

Peter.
